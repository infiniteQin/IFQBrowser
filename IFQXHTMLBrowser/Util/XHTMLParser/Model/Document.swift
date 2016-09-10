//
//  Document.swift
//  Pods
//
//  Created by taizi on 16/9/10.
//
//

import UIKit

class Document : NSObject {
    
    var rootElement : Element?
    
    func elements(tagName tagName:String) -> [Element] {
        return (self.rootElement?.subElements(tagName: tagName))!
    }
}
