//
//  ViewController.swift
//  iosMisRecetas
//
//  Created by Johnatan Gallegos Díaz on 4/12/17.
//  Copyright © 2017 Johnatan Gallegos Díaz. All rights reserved.
//

import UIKit

class ViewController: UITableViewController /*UIViewController, UITableViewDataSource, UITableViewDelegate*/ {

    var recipes : [Recipe] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        

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
        
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.75)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
        
    }

    override var prefersStatusBarHidden: Bool{
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return recipes.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let recipe = recipes[indexPath.row]
        
        let cellID = "RecipeCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        cell.textLabel?.text = recipe.name
        cell.imageView?.image = recipe.image
        
        /*if recipe.isFavorite {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }*/
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            self.recipes.remove(at: indexPath.row)
            
        }
        
        //self.tableView.reloadData()
        
        self.tableView.deleteRows(at: [indexPath], with: .fade)
        
        for recipe in self.recipes{
            print(recipe)
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Compartir
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            
            
            let shareDefaulText = "Estoy mirando la receta de \(self.recipes[indexPath.row].name) en la App del curso de iOS 10 con Juan Gabriel"

            let activityController = UIActivityViewController(activityItems: [shareDefaulText], applicationActivities: nil)
            
            self.present(activityController, animated: true, completion: nil)
            
        }
        
        shareAction.backgroundColor = UIColor.blue
        
        //Borrar
        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar") { (action, indexPath) in
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 202/255.0, alpha: 1.0)
        
        return [shareAction, deleteAction]
        
        
    }
    
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        /*print("He seleccionado la fila \(indexPath.row)")
        
        let recipe = self.recipes[indexPath.row]
        
        let alertController = UIAlertController(title: recipe.name, message: "Valora este plato", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        var favouriteActionTitle = "Favorito"
        var favouriteActionStyle = UIAlertActionStyle.default
        
        if recipe.isFavorite {
            favouriteActionTitle = "No favorito"
            favouriteActionStyle = UIAlertActionStyle.destructive
        }
        
        let favouriteAction = UIAlertAction(title: favouriteActionTitle, style: favouriteActionStyle) { (action) in
            
            let recipe = self.recipes[indexPath.row]
            
            recipe.isFavorite = !recipe.isFavorite
            
            
            self.tableView.reloadData()
            
        }
        
        alertController.addAction(favouriteAction)
        
        self.present(alertController, animated: true, completion: nil)*/
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showRecipeDetail" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                let selectedRecipe = self.recipes[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                
                destinationViewController.recipe = selectedRecipe
                
            }
            
        }
        
    }
    
}

