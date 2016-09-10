//
//  Element.swift
//  Pods
//
//  Created by taizi on 16/9/10.
//
//

import UIKit

public enum EleTagName: String {
    case Label = "label"
}

public enum EleAttributeName : String {
    case Value = "value"
}

class Element : NSObject {
    
    var document : Document?
    
    var parent : Element?
    
    var children : [Element] = []
    
    var attributes = [String:NSObject]()
    
    var tagName : String?
    
    convenience init(tagName:String,document:Document) {
        self.init(tagName: tagName,document: document,parent: nil)
    }
    
    init(tagName:String,document:Document,parent:Element?) {
        self.tagName = tagName;
        self.document = document;
        self.parent = parent;
        
    }
    
}
