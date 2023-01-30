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
        TabView{
            EntryView().tabItem{Text("Entry")}
            ConnectionView(vm: vm).tabItem{Text("Connection")}
            ControlView(vm: vm).tabItem{Text("Control")}
        }
    }
}

struct EntryView: View {
    var body : some View{
        VStack{
            Text("Please connect to the Drone using Wifi")
        }
    }
}

struct ConnectionView: View{
    @ObservedObject var vm : MainVM
    var body: some View{
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
        }
    }
}

struct ControlView: View {
    @ObservedObject var vm : MainVM
    var body: some View{
        VStack{
            Spacer()
            Button("Takeoff") {
                NSLog("takeoff")
                vm.takeOff()}
            Button("Landing"){
                NSLog("land")
                vm.land()}
            Spacer()
            Button("Battery Status") {
                    NSLog("battery")
                    vm.showBattery()}
            Button("Rotor Stop!"){
                    NSLog("rotor stop")
                    vm.stopRotor()}
            Spacer()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm:MainVM())
    }
}

