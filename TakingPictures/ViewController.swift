import UIKit
import AVKit
import Vision

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    let instructionLabel = UILabel()
    let startButton = UIButton()
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupCamera()
        setupUI()
    }

    func setupCamera() {
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo
        captureSession.addInput(input)
        captureSession.startRunning()
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer?.frame = view.bounds
        previewLayer?.videoGravity = .resizeAspectFill
        view.layer.insertSublayer(previewLayer!, at: 0)
    }

    func setupUI() {
        // Instruction Label
        instructionLabel.text = "Please place your Ingredient in view of the camera."
        instructionLabel.textColor = .white
        instructionLabel.textAlignment = .center
        instructionLabel.numberOfLines = 0
        instructionLabel.frame = CGRect(x: 20, y: view.frame.height - 150, width: view.frame.width - 40, height: 50)
        view.addSubview(instructionLabel)
        
        // Start Scanning Button
        startButton.setTitle("Start Scanning", for: .normal)
        startButton.backgroundColor = .orange
        startButton.layer.cornerRadius = 25
        startButton.addTarget(self, action: #selector(startScanningPressed), for: .touchUpInside)
        view.addSubview(startButton)
        setupButtonConstraints()
    }

    private func setupButtonConstraints() {
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            startButton.widthAnchor.constraint(equalToConstant: 200),
            startButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func startScanningPressed() {
        DispatchQueue.main.async {  // Ensure UI updates are on the main thread
            let resultsVC = ResultsViewController()
            resultsVC.modalPresentationStyle = .fullScreen
            resultsVC.previewLayer = self.previewLayer  // Pass the preview layer if needed in ResultsViewController
            self.present(resultsVC, animated: true, completion: nil)
        }
    }
}


