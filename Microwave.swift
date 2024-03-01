//
//  Einstein.swift
//
//  Created by Tamer Zreg
//  Created on 2024-02-29
//  Version 1.0
//  Copyright (c) Tamer Zreg. All rights reserved.
//
//  This program calculates the amount of time to microwave an item.

// Import
import Foundation

// Output to Console
print("This program calculates the amount of time it will take to microwave a food item.")

// Time Constants
let PIZZA_TIME: Float = 45.0
let SUB_TIME: Float = 60.0
let SOUP_TIME: Float = 105.0

// Declaring Variables
var totalTimeSeconds: Float = 0
var totalTimeMinutes: Int = 0
var remainingTimeSeconds: Float = 0

// Output to Console
print("You will Pick from 1-3 \n1) Pizza\n2) Soup\n3) Sub\nPlease Choose your number: ")

// Do Catch For Error Checking
do {
    // Tries to convert input item Type to integer
    guard let itemTypeString = readLine(), let itemType = Int(itemTypeString) else {
        throw SomeError.invalidItemType
    }

    // Output to Console
    print("How many items do you have (1, 2, or 3): ")

    // If the item is 1, 2, or 3
    if (itemType == 1 || itemType == 2 || itemType == 3){
        // Gets how many items the user has
        if let numItemsString = readLine(), let numItems = Int(numItemsString), (numItems == 1 || numItems == 2 || numItems == 3) {
            switch itemType {
            // 1 item
            case 1:
                totalTimeSeconds = PIZZA_TIME * (1.0 + ((Float(numItems) - 1.0) / 2.0))
                break
            // 2 items
            case 2:
                totalTimeSeconds = SOUP_TIME * (1.0 + ((Float(numItems) - 1.0) / 2.0))
                break
            case 3:
            // 3 items
                totalTimeSeconds = SUB_TIME * (1.0 + ((Float(numItems) - 1.0) / 2.0))
                break
            // Other Value
            default:
                print("Invalid input. Please enter a number between 1 and 3.")
            }
            // Convert time to minutes
            totalTimeMinutes = Int(totalTimeSeconds) / 60
            // Finds remaining seconds
            remainingTimeSeconds = totalTimeSeconds.truncatingRemainder(dividingBy: 60)
            // Display time
            print("Your total required time is \(totalTimeMinutes) Minutes and \(remainingTimeSeconds) Seconds.")
        } else {
            // Output to Console
            print("Invalid input for number of items.")
        }
    }
    else{
        print("Error Must be 1, 2, or 3")
    }
}
// Error Checking
catch SomeError.invalidItemType {
    print("Invalid input for item type.")
}

// Declaring Error
enum SomeError: Error {
    case invalidItemType
}
