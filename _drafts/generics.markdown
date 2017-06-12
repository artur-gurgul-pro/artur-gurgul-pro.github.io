---
layout: post
title:  "[Draft] Generics"
date:   2016-10-19 12:09:07 +0200
categories: swift
---



    required init(response: JSON) {
        
        switch response {
            
        case let array as Array<Dictionary<String, Any>>:
            object = nil
            objects = array.map{dict in
                
                
                return ApiResponse.mappedObject(withEntity: dict)
                
            }
        case let dict as Dictionary<String, Any>:
            objects = nil
            
            object = ApiResponse.mappedObject(withEntity: dict)
            
        default:
            object = nil
            objects = nil
        }
    }
	
	
	
	https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html