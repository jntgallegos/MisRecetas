//
//  SingleViewController.swift
//  iosMisRecetas
//
//  Created by Johnatan Gallegos Díaz on 4/18/17.
//  Copyright © 2017 Johnatan Gallegos Díaz. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var recipes : [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var recipe = Recipe(name: "Tortilla de patatas",
                            image: #imageLiteral(resourceName: "tortilla"),
                            time: 20,
                            ingredients: ["Patatas", "Huevos", "Cebolla"],
                            steps: ["Pelar las patatas y la cebolla",
                                    "Cortar las patatas y la cebolla y sofreir",
                                    "Batir los huevos y echarlos durante 1 minuto a la sartén con el resto"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Pizza margarita",
                        image: #imageLiteral(resourceName: "pizza"),
                        time: 60,
                        ingredients: ["Harina", "Levadura", "Aceite", "Sal", "Salsa de Tomate", "Queso"],
                        steps: ["Hacemos la masa con harina, levadura, aceite y sal",
                                "Dejamos reposar la masa 30 minutos",
                                "Extendemos la masa encima de una bandeja y añadimos el resto de ingredientes",
                                "Hornear durante 12 minutos"])

        recipes.append(recipe)
        
        recipe = Recipe(name: "Hamburguesa con queso",
                        image: #imageLiteral(resourceName: "hamburguesa"),
                        time: 10,
                        ingredients: ["Pan de hamburguesa", "Lechuga", "Tomate", "Queso", "Carne de hamburguesa"],
                        steps: ["Poner al fuego la carne al gusto",
                                "Montar la hamburguesa con sus ingredientes entre los panes"])
        
        recipes.append(recipe)
        
        recipe = Recipe(name: "Ensalada césar",
                        image: #imageLiteral(resourceName: "ensalada"),
                        time: 15,
                        ingredients: ["Lechuga", "Tomate", "Cebolla", "Pimiento", "Salsa César", "Pollo"],
                        steps: ["Limpiar todas la verduras y trocearlas",
                                "Cocer el pollo al gusto",
                                "Juntar todos los ingredientes en una ensaladera y servir con salsa César por encima"]);
        recipes.append(recipe)
        
        recipe = Recipe(name: "Caldo de papas",
                        image: #imageLiteral(resourceName: "caldo de papas"),
                        time: 30,
                        ingredients: ["Cebolla", "Tomate", "Chile Jalapeño", "Sal", "Pimienta", "Papas"],
                        steps: ["Pelar las papas, cortarlas en cuadritos y lavarlas",
                                "Picar tomate, cebolla y el chile jalapeño",
                                "En un sartén poner el chile, tomate y cebolla acitronar",
                                "Poner las papas picadas en el sarten darle vueltas",
                                "Agregar sal y pimienta, dejar un rato a fuego lento",
                                "Agregar agua y dejar cocer durante media hora"]);
        recipes.append(recipe)
        
        recipe = Recipe(name: "Spaguetti",
                        image: #imageLiteral(resourceName: "spaguetti"),
                        time: 40,
                        ingredients: ["Pasta", "Pure de tomate", "Queso", "Sal", "Pimienta", "Mantequilla"],
                        steps: ["Poner a cocer pasta en un sarten con agua hirviendo",
                                "Colar spaghetti, poner de nuevo en sarten agregar mantequilla",
                                "Agregar pure de tomate, sal y pimienta y un poco de agua, dejar a fuego lento"]);
        recipes.append(recipe)
        
        recipe = Recipe(name: "Entomatadas",
                        image: #imageLiteral(resourceName: "entomatadas"),
                        time: 15,
                        ingredients: ["Tomates", "Sal", "Cebolla", "Tortillas", "Queso"],
                        steps: ["Poner a cocer tomates con un poco de cebolla",
                                "Licuar tomates agregar sal",
                                "Guisar tortillas, bañarlas en el tomate, agregar queso"]);
        recipes.append(recipe)
        
        
        self.tableView.dataSource = self
        
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension SingleViewController : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return recipes.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let recipe = recipes[indexPath.row]
        
        let cellID = "FullRecipe2Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! FullRecipe2Cell
        
        cell.thumbnailImageView.image = recipe.image
        cell.label.text = recipe.name
        //cell.timeLabel.text = "\(recipe.time!) min"
        //cell.ingredientsLabel.text = "Ingredientes: \(recipe.ingredients.count)"
        
        cell.thumbnailImageView.layer.cornerRadius = 60.0
        cell.thumbnailImageView.clipsToBounds = true
        
        return cell
        
    }

    
}
