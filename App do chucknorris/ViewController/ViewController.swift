//
//  ViewController.swift
//  App do chucknorris
//
//  Created by Wesley Camilo on 25/10/22.
//

import UIKit
import Alamofire
class ViewController: UIViewController {
    lazy var chucknorrisView: ChucknorrisView = {
       let view = ChucknorrisView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var viewModel: ChucknorrisViewModel? = ChucknorrisViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureSubView()
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let menuButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(self.chuckResult))
        navigationItem.rightBarButtonItem = menuButton
    }
    
    func configureSubView() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.chucknorrisView)
        NSLayoutConstraint.activate([
            self.chucknorrisView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.chucknorrisView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.chucknorrisView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.chucknorrisView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
    
    @objc public func chuckResult() {
        self.viewModel?.getChuckNorrisDetalhe({ [weak self] in
            self?.chucknorrisView.phrase = self?.viewModel?.model?.value
        })
        self.viewModel?.getChucknorrisImage({ [weak self] image in
            self?.chucknorrisView.icon = image
        })
    }
}

