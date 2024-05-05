//
//  MenuView.swift
//  ecoeat
//
//  Created by Malika Sharma on 2024-05-05.
//

import SwiftUI
struct MenuView: View {
    
    
    var body: some View{
        NavigationView{
            
            ZStack{
                
                Image("kitchen")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
                // main block
                VStack{
                    
                    //fist option
                    // scanning part
                    NavigationLink(destination: ViewControllerRepresentable()){
                        
                        VStack(spacing:20){
                            
                            HStack{
                                Text("Scan")
                                    .font(Font.system(size: 30).weight(.bold))
                                Image(systemName:"lightbulb")
                                    .font(Font.system(size: 30).weight(.bold))
                            }
                            Text("I have the ingredients and would like\n some recommendations.")
                
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(.orange)
                        .font(.system(size: 20, weight: .semibold))
                        .cornerRadius(15)
                        .frame(width:500, height:200)
                    }
                    
                    
                    // Second option
                    // all receipes search up
                    
                    NavigationLink(destination:RecipesView()){
                        
                        VStack(spacing:20){
                            
                            HStack{
                                Text("Browse")
                                    .font(Font.system(size: 30).weight(.bold))
                                Image(systemName:"questionmark")
                                    .font(Font.system(size: 30).weight(.bold))
                            }
                            
                            Text("I dont't have the ingredients but would\n like some suggestions.")
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(.orange)
                        .font(.system(size: 20, weight: .semibold))
                        .cornerRadius(15)
                        .frame(width:500, height:200)
                    }
                    
                    //Third Option
                    // explore
                    NavigationLink(destination:TinderView()){
                        VStack(spacing:20){
                            
                            HStack{
                                Text("TinderFood")
                                    .font(Font.system(size: 30).weight(.bold))
                                Image(systemName:"magnifyingglass")
                                    .font(Font.system(size: 30).weight(.bold))
                            }
                            Text("I would like to explore some recipes.")
                                .font(.system(size: 20, weight: .semibold))
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(.orange)
                        .font(.system(size: 20, weight: .semibold))
                        .cornerRadius(15)
                        .frame(width:500, height:200)
                    }
                    
                    
                }
                //main abckground color
                
                .background(Color.white.blur(radius: 350))
                
                
            }
        }
        .navigationBarHidden(true)
    }
    
}
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
    
}
