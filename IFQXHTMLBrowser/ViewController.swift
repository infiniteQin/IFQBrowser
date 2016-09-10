//
//  ViewController.swift
//  IFQXHTMLBrowser
//
//  Created by taizi on 16/9/10.
//  Copyright © 2016年 ouer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let parser = XHTMLParser()
        let xml = "<xhtml><head></head><body><img src='xxxxxx'/></body></xhtml>"
        let document = parser.documentFrom(xmlStr: xml)
        print("======All Elements========")
        self.printEleTag(document.rootElement!)
        
        let imgEles = document.elements(tagName: EleTagName.Img.rawValue)
        for imgEle in imgEles {
            print("======Find With Tag========")
            print("\(imgEle.tagName!)")
            print("\(imgEle.attributes)")
        }
    }

    private func printEleTag(ele:Element) {
        print("\(ele.tagName!)")
        for subEle in ele.children {
            self.printEleTag(subEle)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

