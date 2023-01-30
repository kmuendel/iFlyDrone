//
//  Papierkorb.swift
//  iFlyDrone
//
//  Created by Kevin Mündel on 16.01.23.
//

import Foundation

//View
/*var motionManager = CMMotionManager()
@State private var gravityX : Double = 0
@State private var gravityY : Double = 0
@State private var gravityZ : Double = 0
@State private var Position : String = "Move Me"

    Text(Position)
}.onReceive(timer) { input in
    print(motionManager.isDeviceMotionAvailable)
    if motionManager.isDeviceMotionAvailable {
        motionManager.deviceMotionUpdateInterval = 0.3
        
        motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { data,error in
            //print("Gravity XYZ")
            gravityX = data?.gravity.x ?? 0
            gravityY = data?.gravity.y ?? 0
            gravityZ = data?.gravity.z ?? 0
            
            
            
        }
    }
}
VStack{
    Spacer()
    Button("connVideo") {
        NSLog("Connection to Video")
        vm.connDroneVideo()}
    Spacer()
    Button("Stream Start") {
        NSLog("start Stream")
        vm.streamOn()}
    Spacer()
    Button("Stream End") {
        NSLog("end Stream")
        vm.streamOff()}
    Spacer()
}//.tabItem{Text("Video")}
}.padding()
 
 
//Viewmodel

//Sensor

 
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
///Gibt die Werte der Bewegungsänderung wieder entlang der x-Achse
func showGravX() -> String{
   var gravX = "\(sensor.showGravityX())"
    return gravX
}
///Gibt die Werte der Bewegungsänderung wieder entlang der y-Achse
func showGravY() -> String{
   var gravY = "\(sensor.showGravityY())"
    return gravY
}
///Gibt die Werte der Bewegungsänderung wieder entlang der z-Achse
func showGravZ() -> String{
   var gravZ = "\(sensor.showGravityZ())"
    return gravZ
/
let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
 (timer) { input in
 print(motionManager.isDeviceMotionAvailable)
 if motionManager.isDeviceMotionAvailable {
 motionManager.deviceMotionUpdateInterval = 0.3

//Connection

  */
