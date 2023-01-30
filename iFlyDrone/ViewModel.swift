//
//  ViewModel.swift
//  iFlyDrone
//
//  Created by Kevin Mündel on 02.12.22.
//

import Foundation
import CoreMotion


class MainVM : ObservableObject{
    var sensor : Sensor? = nil
    var connection : Connection? = nil
    var mode : Bool = false
    
    ///ruft alle relevanten Clerks auf
    init(){
    connection = Connection()
    sensor = Sensor(vm:self)
    startFlying()
    }
    
    ///beginnt den Aufruf des Motionmanagers
    func startFlying(){
        sensor!.interval()
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
        if sensor!.forward() == true
        {
            connection!.send("rc 0 10 0 0".data(using: .utf8)!)
        }
    }
    ///Sendet einen Bewegungsbefehl nach hinten ab, wenn sich das Gerät nach hinten neigt
    func flyBackward(){
        if sensor!.backward() == true
        {
            connection!.send("rc 0 -10 0 0".data(using: .utf8)!)
        }
    }
    ///Sendet einen Bewegungsbefehl nach links ab, wenn sich das Gerät nach links neigt
    func flyLeft(){
        if sensor!.left() == true
        {
            connection!.send("rc -10 0 0 0".data(using: .utf8)!)
        }
    }
    ///Sendet einen Bewegungsbefehl nach rechts ab, wenn sich das Gerät nach rechts neigt
    func flyRight(){
        if sensor!.right() == true
        {
            connection!.send("rc 10 0 0 0".data(using: .utf8)!)
        }
    }
     
    ///Stellt eine Verbindung mit der Drohne her
    func connToDrone(){
        connection!.connect()
    }
    ///Startet den Modus, in dem die Drohne Befehle empfangen kann
    func sendCommand(){
        connection!.send("command".data(using: .utf8)!)
    }
    ///Drohne startet und fliegt einen Meter in die Luft
    func takeOff(){
        connection!.send("takeoff".data(using: .utf8)!)
    }
    ///Drohne landet automatisch
    func land(){
        connection!.send("land".data(using: .utf8)!)
    }
    func showBattery(){
        connection!.send("battery?".data(using: .utf8)!)
    }
    func stopRotor(){
        connection!.send("emergency".data(using: .utf8)!)
    }
}

