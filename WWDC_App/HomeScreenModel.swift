//
//  HomeScreenModel.swift
//  WWDC_App
//
//  Created by Romi Phadte on 4/25/15.
//  Copyright (c) 2015 Romi Phadte. All rights reserved.
//

import Foundation


@objc class HomeScreenModel{
    private var appNames: Array<String>
    private var dockNames: Array<String>
    var appNames0=["Messages","Robotics","UC_Berkeley","Yahoo","Nest","Pinterest", "Machine_Learning"]
    var appNames1=["Background","Contacts","Youtube"]

    class func `new`()->HomeScreenModel{
        return HomeScreenModel()
    }
//
//    init(index: Int) {
//        if (index==0){
//            appNames=appNames0
//        }
//        else{
//            appNames=appNames1
//        }
//       dockNames=["Phone","Mail","Safari","Music"]
//    }
//    
    init(){
        appNames=[]//["Messages","Robotics","UC_Berkeley","Yahoo","Nest","Pinterest", "Machine_Learning","Background","Contacts"]
        dockNames=["Phone","Mail","Safari","Music"]
    }
    
    func setPage(page: Int)->Void{
        if page==0{
            appNames=appNames0;
        }
        else{
            appNames=appNames1;
        }
    }

    func appNameForIndex(index: Int)->String{
        if index>=appNames.count{
           return ""//appNames[0]
        }
        return appNames[index]
    }
    func dockAppNameForIndex(index: Int)->String{
        if index<0{
            return dockNames[-1*(index+1)]
        }
        
        if index>=dockNames.count{
           return ""//appNames[0]
        }
     
        return dockNames[index]
    }
}