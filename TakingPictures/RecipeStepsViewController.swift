//
//  RecipeStepsViewController.swift
//  TakingPictures
//
//  Created by Malika Sharma on 2024-05-04.
//
import UIKit

class RecipeStepsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "kitchen") // Ensure the image "kitchen" is in your assets
        backgroundImage.contentMode = .scaleAspectFill // Adjust the content mode as needed
        view.insertSubview(backgroundImage, at: 0) // Inserts the background image at the back of all views
        // Create a scroll view
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        // Constraints for the scroll view
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        // Content view inside the scroll view
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)

        // Constraints for the content view
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)  // Important for vertical scrolling
        ])

        // Adding an ImageView to display the recipe image
        let recipeImageView = UIImageView(image: UIImage(named: "food0"))
        recipeImageView.translatesAutoresizingMaskIntoConstraints = false
        recipeImageView.contentMode = .scaleAspectFill
        recipeImageView.clipsToBounds = true
        contentView.addSubview(recipeImageView)

        // Constraints for the ImageView
        NSLayoutConstraint.activate([
            recipeImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            recipeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            recipeImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            recipeImageView.heightAnchor.constraint(equalToConstant: 200)  // Adjust height as needed
        ])

        // Adding a label for the recipe summary
        let summaryLabel = UILabel()
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryLabel.numberOfLines = 0  // Allows multiple lines
        summaryLabel.backgroundColor = .white
        summaryLabel.textColor = .black
        summaryLabel.textAlignment = .left
        summaryLabel.layer.cornerRadius = 10
        summaryLabel.layer.masksToBounds = true
        summaryLabel.font = UIFont.systemFont(ofSize: 20)
        summaryLabel.text = """
        **Recipe Summary:**
        
         Peel if desired, then chop or dice the raw or \n
        roasted sweet potato. Combine all \n
        ingredients in a medium pot, and bring to a \n
        boil.
        
        Once boiling, turn the heat to medium low,\n 
        and cook uncovered for around fifteen\n 
        minutes. The sweet potato and zucchini or\n
        carrots should be soft.

        Add salt and optional pepper to taste. Serve\n 
        the sweet potato recipe immediately, or let it\n
        cool before dividing into meal\n
        prep containers.
        
        """
        contentView.addSubview(summaryLabel)

        // Constraints for the summary label
        NSLayoutConstraint.activate([
            summaryLabel.topAnchor.constraint(equalTo: recipeImageView.bottomAnchor, constant: 20),
            summaryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            summaryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            summaryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
}
