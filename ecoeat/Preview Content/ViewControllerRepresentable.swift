//
//  ViewControllerRepresentable.swift
//  ecoeat
//
//  Created by Malika Sharma on 2024-05-05.
//

import SwiftUI
import UIKit

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}
