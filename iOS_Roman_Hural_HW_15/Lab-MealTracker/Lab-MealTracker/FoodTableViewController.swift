//
//  FoodTableViewController.swift
//  Lab-MealTracker
//
//  Created by Roman Hural on 20.02.2022.
//

import UIKit

class FoodTableViewController: UITableViewController {

    //MARK: - Properties
    var meals: [Meal] {
        let firstBreakfastFood = Food(name: "Scrambled eggs", description: "With cheese")
        let secondBreakfastFood = Food(name: "Cereal", description: "With milk")
        let thirdBreakfastFood = Food(name: "Cottage cheese", description: "With jam")
        let breakfast = Meal(name: "Breakfast", food: [firstBreakfastFood, secondBreakfastFood, thirdBreakfastFood])
        
        let firstLunchFood = Food(name: "Sandwich", description: "With cheese and sausage")
        let secondLunchFood = Food(name: "Smoothie", description: "With fresh fruits")
        let thirdLunchFood = Food(name: "Salat", description: "With vegetables")
        let lunch = Meal(name: "Lunch", food: [firstLunchFood, secondLunchFood, thirdLunchFood])
        
        let firstDinnerFood = Food(name: "Pasta", description: "With cheese and meat")
        let secondDinnerFood = Food(name: "Potatoes", description: "With cream")
        let thirdDinnerFood = Food(name: "Rice", description: "With vegetables and meat")
        let dinner = Meal(name: "Dinner", food: [firstDinnerFood, secondDinnerFood, thirdDinnerFood])
        
        return [breakfast, lunch, dinner]
    }
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - Table View Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals[section].food.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)
        let meal = meals[indexPath.section]
        let food = meal.food[indexPath.row]
        
        cell.textLabel?.text = food.name
        cell.detailTextLabel?.text = food.description

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
    
}
