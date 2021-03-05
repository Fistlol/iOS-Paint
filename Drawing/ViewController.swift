//
//  ViewController.swift
//  Drawing
//
//  Created by Абзал Арстанов on 2/19/21.
//

import UIKit

class ViewController: UIViewController {
    
    let custom = CustomView()
    
    let undoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func handleUndo() {
        custom.undo()
    }
    
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clear", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func handleClear() {
        custom.clear()
    }
    
    override func loadView() {
        self.view = custom
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        custom.backgroundColor = .white
        
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        let stackView = UIStackView(arrangedSubviews: [
            undoButton,
            clearButton
        ])
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}

