//
//  ChucknorrisView.swift
//  App do chucknorris
//
//  Created by Wesley Camilo on 26/10/22.
//

import Foundation
import UIKit

class ChucknorrisView: UIView {
    private lazy var iconImageView: UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    private lazy var phraseLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()
    
    var icon: UIImage? {
        get {
            return self.iconImageView.image
        }
        set {
            self.iconImageView.image = newValue
        }
    }
    
    var phrase: String? {
        get {
            return self.phraseLabel.text
        }
        set {
            self.phraseLabel.text = newValue
        }
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    func initialize() {
        self.configureSubView()
    }
    
   private func configureSubView() {
       self.addSubview(self.iconImageView)
       self.addSubview(self.phraseLabel)
       
       NSLayoutConstraint.activate([
        self.iconImageView.bottomAnchor.constraint(equalTo: self.centerYAnchor),
        self.iconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        self.iconImageView.widthAnchor.constraint(equalToConstant: 300),
        self.iconImageView.heightAnchor.constraint(equalToConstant: 200)
       ])
       
       NSLayoutConstraint.activate([
        self.phraseLabel.topAnchor.constraint(equalTo: self.iconImageView.bottomAnchor, constant: 10),
        self.phraseLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30),
        self.phraseLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30)
       ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initialize()
    }
}
