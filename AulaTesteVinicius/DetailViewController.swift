//
//  DetailViewController.swift
//  AulaTesteVinicius
//
//  Created by COTEMIG on 15/07/20.
//  Copyright © 2020 Vincius. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var imagem: UIImage?
    var nome: String?
    var desc: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = imagem
        nomeLabel.text = nome
        descLabel.text = desc
    }

}
