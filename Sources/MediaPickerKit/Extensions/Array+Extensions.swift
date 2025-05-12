//
//  Array+Extensions.swift
//  MediaPickerKit
//
//  Created by Faraz Karimi on 5/12/25.
//


import Foundation


extension Array where Element: Equatable {
    
    public mutating func toggleElement(_ element: Element) {
        
        if let index = self.firstIndex(of: element) {
            self.remove(at: index)
        } else {
            self.append(element)
        }
    }
}
