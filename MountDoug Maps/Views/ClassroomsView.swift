//
//  ContentView.swift
//  MountDoug Maps
//
//  Created by Arda Berktin on 2023-05-01.
//

import SwiftUI

struct ClassroomsView: View {
    @State var visibleItem: Set<Int> = Set()
    @State private var searchRooms = ""
    @State var rooms = Array(0...228)
    var isTextOn: Bool {
        if visibleItem.contains(1){
            return true
        }else{
            return false
        }
    }

    var body: some View {
        NavigationStack {
            //ScrollViewReader { proxy in
            VStack{
                
                ScrollViewReader { proxy in
                        
                   // if  isTextOn {
                        Text("Please click on the room you would like to find.")
                            .padding(.leading, 21)
                            .padding(.top, 10)
                            .frame(maxWidth: .infinity,maxHeight:30, alignment: .leading)
                            .foregroundColor(.white)
                            .backgroundStyle(.purple) //doesn't work
                            //.opacity(isTextOn ? 0 : 1)
                    //}
   
                        
                        ZStack (alignment: .bottomTrailing)
                        {
                            //ScrollView{
                            List {
                                
                                ForEach(searchResults, id: \.self) { room in
                                    if room == 1 {
                                        NavigationLink("Map of the First Floor", value: 1)
                                            .padding(6)
                                            .id(1)
                                            .onAppear(){
                                                visibleItem.insert(1)
                                                
                                            }.onDisappear(){
                                                visibleItem.remove(1)
                                                
                                            }
                                    }//if 1
                                    
                                    if room == 2 {
                                        NavigationLink("Map of the Second Floor", value: 1)
                                            .padding(6)
                                            .id(1)
                                            .onAppear(){
                                                visibleItem.insert(1)
                                                
                                            }.onDisappear(){
                                                visibleItem.remove(1)
                                                
                                            }
                                    }// if 2
                                    
                                    if room >= 101 && room < 124 && room != 115 {
                                        NavigationLink("Room: \(room)", value: room)
                                            .padding(6)
                                            .id(room)
                                            .onAppear(){
                                                visibleItem.insert(room)
                                            }.onDisappear(){
                                                visibleItem.remove(room)
                                            }
                                    }// if first floor
                                    
                                    if room >= 201 && room < 228 && room != 204 && room != 213 && room != 215 && room != 224 {
                                        NavigationLink("Room: \(room)", value: room)
                                            .padding(6)
                                            .id(room)
                                            .onAppear(){
                                                visibleItem.insert(room)
                                            }.onDisappear(){
                                                visibleItem.remove(room)
                                            }
                                    }
                                    
                                    
                                }//ForEach
                                
                            }//list
                            .listRowBackground(Color.purple)
                            .background(Color.white) // Set the overall background color of the list
                            
                          
                            if visibleItem.contains(1){
                                
                                Button {
                                    withAnimation(){
                                        proxy.scrollTo(227)
                                    }
                                }label: {
                                    Image(systemName: "chevron.down")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 12.0 , height: 12)
                                    .padding(30)
                                    .background(.black.opacity(0.5))
                                    .frame(width: 40.0 , height: 40)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    
                                    
                                    
                                }//label for button
                                .padding(5)
                                   

                            }//if
                            
                            if !visibleItem.contains(1){
                                Button {
                                    withAnimation(){
                                        proxy.scrollTo(1)
                                    }
                                }label: {
                                    Image(systemName: "chevron.up")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 12.0 , height: 12)
                                        .padding(30)
                                        .background(.black.opacity(0.5))
                                        .frame(width: 40.0 , height: 40)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                    
                                }//label for button
                                .padding(5)
                                
                                
                            }// if visible item for chevron.down
                        }//ZStack
                        .navigationDestination(for: Int.self) { num in
                            MapView(number: num)
                        }

                }//ScrollViewReader
                //Spacer() //adds a bottom notch to the list
                    
                
            }//VStack
            .navigationTitle("MountDoug Maps")
            .background(.purple)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.purple,for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink{
                        InfoView()
                    } label: {
                        HStack {
                            Image(systemName: "info.circle")
                            Text("About")
                                .offset(x: -5)
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        TutorialView()
                    } label: {
                        HStack {
                            Image(systemName: "questionmark.circle")
                                .offset(x: 5)
                            Text("Tutorial")
                            
                        }
                    }
                }
            }
                
        }//NavigationStack
        .padding(0)
        .searchable(text: $searchRooms)
    }//body
    
    var searchResults: [Int] {
            if searchRooms.isEmpty {
                return rooms
            } else {
                return rooms.filter { "\($0)".contains(searchRooms) }
            }
        }
}//struct view
        
    
struct ClassroomsView_Previews: PreviewProvider {
    
    static var previews: some View {
        ClassroomsView()
            .environmentObject(Favourites())
    }
}



