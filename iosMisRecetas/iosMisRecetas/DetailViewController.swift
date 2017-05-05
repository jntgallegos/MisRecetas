//
//  DetailViewController.swift
//  iosMisRecetas
//
//  Created by Johnatan Gallegos Díaz on 4/20/17.
//  Copyright © 2017 Johnatan Gallegos Díaz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var recipeImageView: UIImageView!
    @IBOutlet var recipeTableView: UITableView!
    @IBOutlet var ratingButton: UIButton!
    
    var recipe : Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = self.recipe.name
        
        self.recipeImageView.image = self.recipe.image
       // self.nameLabel.text = self.recipe.name
       // self.timeLabel.text = "Tiempo: " + String(self.recipe.time)
        
        self.recipeTableView.delegate = self
        self.recipeTableView.dataSource = self
        
        self.recipeTableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
        self.recipeTableView.tableFooterView = UIView(frame: CGRect.zero)
        //self.recipeTableView.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.75)
        
        self.recipeTableView.estimatedRowHeight = 44.0
        self.recipeTableView .rowHeight = UITableViewAutomaticDimension
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 3
        case 1:
            return self.recipe.ingredients.count
        case 2:
            return self.recipe.steps.count
        default:
            return 0
        }
    
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeDetailViewCell", for: indexPath) as! RecipeDetailViewCell
        
        cell.backgroundColor = UIColor.clear
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                
                cell.keyLabel.text = "Nombre: "
                cell.valueLabel.text = self.recipe.name
                
            case 1:
                
                cell.keyLabel.text = "Tiempo: "
                cell.valueLabel.text = String(self.recipe.time) + " min"
                
            /*case 2:
                
                cell.keyLabel.text = "Favorita"
                if self.recipe.isFavorite {
                    cell.valueLabel.text = "Sí"
                }else{
                    cell.valueLabel.text = "No"
                }
                */
            default:
                break
                
            }
            
        case 1:
            
            if indexPath.row == 0{
                
                cell.keyLabel.text = "Ingredientes:"
                
            }else{
                
                cell.keyLabel.text = ""
            
            }
            
            cell.valueLabel.text = self.recipe.ingredients[indexPath.row]
            
        case 2:
            
            if indexPath.row == 0{
                
                cell.keyLabel.text = "Pasos:"
                
            }else{
                
                cell.keyLabel.text = ""
                
            }
            
            cell.valueLabel.text = self.recipe.steps[indexPath.row]
            
        default:
            break
        }
        

        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var title = ""
        
        switch section {
        case 1:
            title = "Ingredientes"
        case 2:
            title = "Pasos"
        
        default:
            break
        }
        
        return title
        
    }
    
    
    @IBAction func close(segue:UIStoryboardSegue){
        
        if let reviewVC = segue.source as? ReviewViewController {
            
            if let rating = reviewVC.ratingSelected {
                
                print(rating)
                
                self.recipe.rating = rating
                
                let image = UIImage(named: self.recipe.rating)
                self.ratingButton.setImage(image, for: .normal)
                
            }
            
        }
        
    }
  
}


extension DetailViewController : UITableViewDelegate{
    
    
}
