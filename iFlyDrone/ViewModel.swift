//
//  ViewModel.swift
//  iFlyDrone
//
//  Created by Kevin Mündel on 02.12.22.
//

import Foundation
import CoreMotion


class MainVM : ObservableObject{
    var sensor : Sensor
    var connection : Connection
    
    init(){
    sensor = Sensor()
    connection = Connection()
    update()
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
    }
    ///startet die Flugbefehle
    func update(){
        flyForward()
        flyBackward()
        flyLeft()
        flyRight()
    }
    ///Sendet einen Bewegungsbefehl nach vorne ab, wenn sich das Gerät nach vorne neigt
    func flyForward(){
        if sensor.forward() == true
        {
            connection.send("rc 0 5 0 0".data(using: .utf8)!)
        }
    }
    ///Sendet einen Bewegungsbefehl nach hinten ab, wenn sich das Gerät nach hinten neigt
    func flyBackward(){
        if sensor.backward() == true
        {
            connection.send("rc 0 -5 0 0".data(using: .utf8)!)
        }
    }
    ///Sendet einen Bewegungsbefehl nach links ab, wenn sich das Gerät nach links neigt
    func flyLeft(){
        if sensor.left() == true
        {
            connection.send("rc -5 0 0 0".data(using: .utf8)!)
        }
    }
    ///Sendet einen Bewegungsbefehl nach rechts ab, wenn sich das Gerät nach rechts neigt
    func flyRight(){
        if sensor.right() == true
        {
            connection.send("rc 5 0 0 0".data(using: .utf8)!)
        }
    }
    ///Stellt eine Verbindung mit der Drohne her
    func connToDrone(){
        connection.connect()
    }
    ///Startet den Modus, in dem die Drohne Befehle empfangen kann
    func sendCommand(){
        connection.send("command".data(using: .utf8)!)
    }
    ///Drohne startet und fliegt einen Meter in die Luft
    func takeOff(){
        connection.send("takeoff".data(using: .utf8)!)
    }
    ///Drohne landet automatisch
    func land(){
        connection.send("land".data(using: .utf8)!)
    }
}

