//
//  ListViewController.swift
//  TakingPictures
//
//  Created by Malika Sharma on 2024-05-04.
//
import UIKit

class ListController: UIViewController {
    var ingredients: [String] = []  // This will store the ingredients list

    let ingredientsLabel = UILabel()
    let rescanButton = UIButton()
    let confirmButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateIngredientsDisplay()
    }

    private func setupUI() {
        view.backgroundColor = .black  // Setting background color to black

        // Setup ingredients label
        ingredientsLabel.frame = CGRect(x: 20, y: 80, width: view.frame.width - 40, height: 400)
        ingredientsLabel.numberOfLines = 0
        ingredientsLabel.backgroundColor = .orange
        ingredientsLabel.textColor = .black
        ingredientsLabel.textAlignment = .left
        ingredientsLabel.layer.cornerRadius = 10
        ingredientsLabel.layer.masksToBounds = true
        ingredientsLabel.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(ingredientsLabel)

        // Setup Rescan and Confirm buttons
        setupButton(button: rescanButton, title: "Rescan", y: view.frame.height - 100, buttonWidth: (view.frame.width / 2) - 25)
        setupButton(button: confirmButton, title: "Confirm", y: view.frame.height - 100, buttonWidth: (view.frame.width / 2) - 25)
        confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
    }

    @objc func confirmButtonTapped() {
        let recipeStepsVC = RecipeStepsViewController()
        self.navigationController?.pushViewController(recipeStepsVC, animated: true)
        recipeStepsVC.modalPresentationStyle = .fullScreen
            present(recipeStepsVC, animated: true, completion: nil)
    }

    private func setupButton(button: UIButton, title: String, y: CGFloat, buttonWidth: CGFloat) {
        let buttonBackgroundView = UIView(frame: CGRect(x: button == rescanButton ? 20 : view.frame.width / 2 + 5, y: y, width: buttonWidth, height: 50))
        buttonBackgroundView.backgroundColor = .orange
        buttonBackgroundView.layer.cornerRadius = 25
        view.addSubview(buttonBackgroundView)

        button.setTitle(title, for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: buttonWidth, height: 50)
        button.layer.cornerRadius = 25
        buttonBackgroundView.addSubview(button)
    }

    private func updateIngredientsDisplay() {
        let formattedIngredients = ingredients.map { " • \($0)" }.joined(separator: " \n\n")  // Double-spaced ingredients list
        ingredientsLabel.text = "Ingredients Scanned:\n\n" + formattedIngredients
    }
}




