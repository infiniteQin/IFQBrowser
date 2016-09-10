//
//  XHTMLParser.swift
//  Pods
//
//  Created by taizi on 16/9/10.
//
//

import UIKit

class XHTMLParser: NSObject,NSXMLParserDelegate {

//    lazy var checkedSwitch: UISwitch = {
//        let s = UISwitch()
//        s.addTarget(self, action: #selector(ActionSheetSwitchCell.toggleSwitch(_:)), forControlEvents: .ValueChanged)
//        return s
//    }()
    private var count = 0
    private var tempElement : Element?
    private var doc : Document?

    
    func documentFrom(xmlStr xml:String) -> Document {
        let xmlData = xml.dataUsingEncoding(NSUTF8StringEncoding)
        return self.documentFrom(xmlData: xmlData)
    }
    
    func documentFrom(xmlData xmlData:NSData?) -> Document {
        doc = Document()
        if (xmlData != nil) {
            let xmlParser = NSXMLParser(data: xmlData!)
            xmlParser.delegate = self;
            xmlParser.parse()
        }
        return doc!
    }
    
    //MARK: XMLParserDelegate
    func parserDidStartDocument(parser: NSXMLParser) {
        
    }
    
    func parserDidEndDocument(parser: NSXMLParser) {
        count = 0
        tempElement = nil
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        // 文本转化
        let textElement = Element(tagName: EleTagName.Label.rawValue, document: tempElement!.document!)
        
        textElement.attributes[EleAttributeName.Value.rawValue] = string;
        tempElement?.children .append(textElement)
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        //对属性中的值进行转义
        let attrKeys = attributeDict.keys
        for key in attrKeys {
            var value = attributeDict[key]
            value = value?.stringByReplacingOccurrencesOfString("&lt;", withString: "<")
            value = value?.stringByReplacingOccurrencesOfString("&gt;", withString: ">")
            value = value?.stringByReplacingOccurrencesOfString("&quot;", withString: "\"")
        }
        let parentEle = self.tempElement
        self.tempElement = Element(tagName: elementName, document: self.doc!, parent: parentEle)
        if (self.doc!.rootElement == nil) {
            self.doc!.rootElement = self.tempElement
        }
        self.count += 1
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        let parentEle = self.tempElement?.parent
        self.count -= 1
        parentEle?.children.append(self.tempElement!)
        self.tempElement = parentEle
    }
    
    
}
