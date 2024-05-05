//
//  HomeView.swift
//  ecoeat
//
//  Created by Malika Sharma on 2024-05-05.
//


import SwiftUI

struct HomeView: View {
    var body: some View {
            
        GeometryReader{ geometry in
            NavigationView{
                
                ZStack{
                    Image("kitchen")
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        
                        Text("\n\nWelcome to SoulChef!")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white.blur(radius: 50))
                            .cornerRadius(10)
                            .font(.title.bold())
                        
                        
                        ZStack{
                            Color.gray.opacity(0)
                                .ignoresSafeArea()
                            Button{
                                // code action
                            } label: {
                                
                                Circle()
                                    .scale(0.5)
                                    .foregroundColor(.orange.opacity(0.5))
                            }
                            
                            Button {
                                
                            } label: {
                                Circle()
                                    .scale(0.3)
                                    .foregroundColor(.orange.opacity(1))
                            }
                            
                            Text("START!")
                                .padding()
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .bold))
                            
                            
                        }
                        
                        Text("~Scan to Pan, Waste to Taste ~")
                        
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white.blur(radius: 10))
                            .cornerRadius(10)
                            .font(.title.bold())
                            
                        
                        
                    }
                    
                    
                    
                }
                
                
            }
            
        }
        .navigationBarHidden(true)
        
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
