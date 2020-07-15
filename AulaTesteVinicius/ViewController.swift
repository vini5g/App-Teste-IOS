//
//  ViewController.swift
//  AulaTesteVinicius
//
//  Created by COTEMIG on 01/07/20.
//  Copyright © 2020 Vincius. All rights reserved.
//

import UIKit

struct Planeta {
    let imagem: String
    let nome: String
    let descricao: String
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let listaPlanetas: [Planeta] = [
        Planeta(imagem: "earth", nome: "Earth", descricao: "Earth is the third planet from the Sun, and the only astronomical object known to harbor life. According to radiometric dating and other sources of evidence, Earth formed over 4.5 billion years ago. Earth's gravity interacts with other objects in space, especially the Sun and the Moon, Earth's only natural satellite. Earth orbits around the Sun in 365.26 days, a period known as an Earth year. During this time, Earth rotates about its axis about 366.26 times."),
        Planeta(imagem: "Jupiter", nome: "Jupiter", descricao: "Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a giant planet with a mass one-thousandth that of the Sun, but two-and-a-half times that of all the other planets in the Solar System combined. Jupiter and Saturn are gas giants; the other two giant planets, Uranus and Neptune, are ice giants. Jupiter has been known to astronomers since antiquity. It is named after the Roman god Jupiter. When viewed from Earth, Jupiter can reach an apparent magnitude of −2.94, bright enough for its reflected light to cast shadows, and making it on average the third-brightest natural object in the night sky after the Moon and Venus."),
        Planeta(imagem: "Mars", nome: "Mars", descricao: "Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System after Mercury. In English, Mars carries a name of the Roman god of war, and is often referred to as the Red Planet because the iron oxide prevalent on its surface gives it a reddish appearance that is distinctive among the astronomical bodies visible to the naked eye. Mars is a terrestrial planet with a thin atmosphere, having surface features reminiscent both of the impact craters of the Moon and the valleys, deserts, and polar ice caps of Earth.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! DetailViewController
        let planeta = sender as! Planeta
        
        viewController.nome = planeta.nome
        viewController.imagem = UIImage(named: planeta.imagem)
        viewController.desc = planeta.descricao
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaPlanetas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PlanetaCell
        
        cell.nomePlaneta.text = listaPlanetas[indexPath.row].nome
        cell.descricaoPlaneta.text = listaPlanetas[indexPath.row].descricao
        
        cell.imagemPlaneta.image = UIImage(named: listaPlanetas[indexPath.row].imagem)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let planeta = listaPlanetas[indexPath.row]
        performSegue(withIdentifier: "Segue", sender: planeta)
    }
}

