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
    var motionManager = CMMotionManager()
    private var gravityX : Double = 0
    private var gravityY : Double = 0
    private var gravityZ : Double = 0
    
    init() {
        interval()
    }
    
    ///Erstellen des Motionmanagers, welcher Sensordaten empfängt
    func interval(){
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.3
            
            motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { data,error in
                //print("Gravity XYZ")
                self.gravityX = data?.gravity.x ?? 0
                self.gravityY = data?.gravity.y ?? 0
                self.gravityZ = data?.gravity.z ?? 0
            }
        }
    }
    ///Zeigt die Bewegung entlang der x-Achse des Geräts an
    func showGravityX() -> Double{
        return gravityX
    }
    ///Zeigt die Bewegung entlang der y-Achse des Geräts an
    func showGravityY() -> Double{
        return gravityY
    }
    ///Zeigt die Bewegung entlang der z-Achse des Geräts an
    func showGravityZ() -> Double{
        return gravityZ
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

        
