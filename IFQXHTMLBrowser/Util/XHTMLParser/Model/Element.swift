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
    case XHTML = "xhtml"
    case Header = "header"
    case Body = "body"
    case Img  = "img"
}

public enum EleAttributeName : String {
    case Value = "value"
}

class Element : NSObject {
    
    var document : Document?
    
    var parent : Element?
    
    var children = [Element]()
    
    var attributes = [String:AnyObject]()
    
    var tagName : String?
    
    convenience init(tagName:String,document:Document) {
        self.init(tagName: tagName,document: document,parent: nil)
    }
    
    init(tagName:String,document:Document,parent:Element?) {
        self.tagName = tagName;
        self.document = document;
        self.parent = parent;
    }
    
    func subElements(tagName tagName:String) -> [Element] {
        var rsArr = [Element]()
        for subEle in self.children {
            if (subEle.tagName == tagName) {
                rsArr .append(subEle)
            }
            if (subEle.children.count > 0) {
                let innerArr = subEle.subElements(tagName: tagName)
                rsArr += innerArr
            }
        }
        return rsArr
    }
    
}
