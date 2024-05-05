//
//  ResultsViewController.swift
//  TakingPictures
//
//  Created by Malika Sharma on 2024-05-02.
//
import UIKit
import AVFoundation
import Vision

class ResultsViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    var previewLayer: AVCaptureVideoPreviewLayer?
    var captureSession: AVCaptureSession?
    let resultsLabel = UILabel()
    var totalCaptures = 0
    var lastDetectedIngredient: String?
    var emptyDoubles: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        checkCameraPermissions()
        setupUI()
    }

    func checkCameraPermissions() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setupCamera()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    DispatchQueue.main.async {
                        self.setupCamera()
                    }
                }
            }
        default:
            break // Handle denied access appropriately
        }
    }

    func setupCamera() {
        guard let captureDevice = AVCaptureDevice.default(for: .video),
              let input = try? AVCaptureDeviceInput(device: captureDevice) else {
            return
        }

        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = .photo
        captureSession?.addInput(input)
        captureSession?.startRunning()

        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
        previewLayer?.frame = view.bounds
        view.layer.addSublayer(previewLayer!)

        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession?.addOutput(dataOutput)
    }

    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer),
              let model = try? VNCoreMLModel(for: ObjectDetector().model) else {
            return
        }
        let request = VNCoreMLRequest(model: model) { [weak self] (finishedReq, err) in
            DispatchQueue.main.async {
                if let results = finishedReq.results as? [VNClassificationObservation],
                   let firstResult = results.first {
                    self?.resultsLabel.text = "\(firstResult.identifier):"
                    self?.lastDetectedIngredient = firstResult.identifier
                }
            }
        }
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }

    private func setupUI() {
        resultsLabel.frame = CGRect(x: 20, y: 80, width: view.frame.width - 40, height: 60)
        resultsLabel.numberOfLines = 1
        resultsLabel.textColor = .black
        resultsLabel.backgroundColor = .orange
        resultsLabel.textAlignment = .center
        resultsLabel.font = UIFont.boldSystemFont(ofSize: 24)
        resultsLabel.layer.cornerRadius = 10
        resultsLabel.layer.masksToBounds = true
        view.addSubview(resultsLabel)

        setupButton(title: "Cancel", action: #selector(cancelScanning), isLeftAligned: true)
        setupButton(title: "Capture", action: #selector(handleCapture), isLeftAligned: false)
    }

    private func setupButton(title: String, action: Selector, isLeftAligned: Bool) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = .orange
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)

        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5, constant: -30),
            isLeftAligned ? button.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20) : button.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20)
        ])
    }

    @objc func handleCapture() {
        guard let ingredient = lastDetectedIngredient else { return }
        let alertController = UIAlertController(title: "Confirm Ingredient", message: "Detected Ingredient: \(ingredient). Is this correct?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            self.totalCaptures += 1
            self.emptyDoubles.append(ingredient)
            if self.totalCaptures >= 6 { // Assuming 6 captures is the limit
                self.transitionToListViewController()
            } else {
                self.restartCaptureProcess()
            }
        }))
        alertController.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }


    @objc func cancelScanning() {
        dismiss(animated: true, completion: nil)
    }

    func restartCaptureProcess() {
        captureSession?.startRunning()
    }
    
    @objc func transitionToListViewController() {
        let listViewController = ListController()
        listViewController.modalPresentationStyle = .fullScreen
        listViewController.ingredients = self.emptyDoubles  // Pass the ingredients list
        present(listViewController, animated: true, completion: nil)
        
    }
}
