//
//  SensorModel.swift
//  iFlyDrone
//
//  Created by Kevin Mündel on 02.12.22.
//

import Foundation
import CoreMotion
import SwiftUI

///Clerk, welcher verantwortlich für die Sensordaten des Geräts ist
public class Sensor{
    var vm : MainVM
    var motionManager : CMMotionManager!
    private var gravityX : Double = 0
    private var gravityY : Double = 0
    private var gravityZ : Double = 0
    
    ///ruft einen Motionmanager auf
    init(vm: MainVM) {
        motionManager = CMMotionManager()
        self.vm = vm
    }
    
    ///Erstellen des Motionmanagers, welcher Sensordaten empfängt, und ruft dann eine weitere Funktion auf
    func interval() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 1
           
            
            motionManager.startDeviceMotionUpdates( to: OperationQueue.main) { data,error in
                NSLog("Gravity XYZ")
                self.gravityX = data?.gravity.x ?? 0
                self.gravityY = data?.gravity.y ?? 0
                self.gravityZ = data?.gravity.z ?? 0
                self.vm.update()
            }
        }
    }
    
    
    
    
    ///Gibt an, wenn sich das Gerät nach vorne neigt
    func forward() -> Bool{
        return gravityX > 0.3
    }
    ///Gibt an, wenn sich das Gerät nach hintent neigt
    func backward() -> Bool{
        return gravityX < -0.3
    }
    ///Gibt an, wen sich das Gerät nach links neigt
    func left() -> Bool{
        return gravityY > 0.3
    }
    ///Gibt an, wen sich das Gerät nach rechts neigt
    func right() -> Bool{
        return gravityY < -0.3
    }
}


