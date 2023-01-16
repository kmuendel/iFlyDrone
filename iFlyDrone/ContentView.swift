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
    @ObservedObject var vm : MainVM
    @State var connection: NWConnection?
    @State private var activated = false
    var host: NWEndpoint.Host = "192.168.10.1"
    var port: NWEndpoint.Port = 8890
    
    var body: some View {
        HStack{
            VStack {
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
                Button("takeoff") {
                        NSLog("takeoff")
                        vm.takeOff()
                    }
                Button("land"){
                        NSLog("land")
                        vm.land()
                    }
                Spacer()
                }.padding()
                VStack{
                Text("Gravity XYZ")
                Text(vm.showGravX())
                Text(vm.showGravY())
                Text(vm.showGravZ())
                }
            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(vm:MainVM())
        }
    }

