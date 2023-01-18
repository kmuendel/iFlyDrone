//
//  ContentView.swift
//  iFlyDrone
//
//  Created by Kevin Mündel on 02.12.22.
//

import SwiftUI
import CoreMotion
import Network


struct ContentView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @ObservedObject var vm : MainVM
    var host: NWEndpoint.Host = "192.168.10.1"
    var port: NWEndpoint.Port = 8890
    
    var body: some View {
        ZStack{
            
            VStack{
                Text("Please connect to the Drone using Wifi")
            }
            HStack{
                Spacer()
                VStack{
                    Spacer()
                    Button("Connect") {
                        NSLog("Connect pressed")
                        vm.connToDrone()
                    }
                    Spacer()
                    Button("Send Command") {
                        NSLog("Send pressed")
                        vm.sendCommand()
                    }
                    Spacer()
                    Button("battery") {
                        NSLog("battery")
                        vm.showBattery()
                    }
                    Spacer()
                    Button("Rotor Stop!"){
                        NSLog("rotor stop")
                        vm.stopRotor()
                    }
                    Spacer()
                }
                Spacer()
                VStack {
                    Spacer()
                    Button("takeoff") {
                        NSLog("takeoff")
                        vm.takeOff()
                    }
                    Spacer()
                    Button("land"){
                        NSLog("land")
                        vm.land()
                    }
                    Spacer()
                    Button("Flymode On"){
                        vm.mode = true
                    }
                    Spacer()
                    Button("Flymode Off"){
                        vm.mode = false
                    }
                    Spacer()
                }
                Spacer()
                VStack {
                    Spacer()
                    Button("connVideo") {
                        NSLog("Connection to Video")
                        vm.connDroneVideo()
                    }
                    Spacer()
                    Button("Stream Start") {
                        NSLog("start Stream")
                        vm.streamOn()
                    }
                    Spacer()
                    Button("Stream End") {
                        NSLog("end Stream")
                        vm.streamOff()
                    }
                    Spacer()
                }
                Spacer()
            }.padding()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm:MainVM())
    }
}

