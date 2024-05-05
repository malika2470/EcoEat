//
//  TinderView.swift
//  ecoeat
//
//  Created by Malika Sharma on 2024-05-05.
//

import SwiftUI

struct TinderView: View {
    @State private var index = 0
    @State private var savedRecipes: [String] = []
    @State private var skippedRecipes: [String] = []
    private var images = ["pasta-img", "pasta2-img", "salad-img", "salad2-img", "salad3-img"]
    @State private var done_today = false
    
    var currImg: String {
        images[index]
    }
    
    var body: some View {
        
        NavigationView{
            
            ZStack {
                Image("kitchen")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
                

                ZStack{
                    
                    Color.white.blur(radius:70)
                    .frame(width:400, height:400)
                    
                VStack {
                    Spacer()
                        
                    Text ("Chef's Specials for Today")
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white.blur(radius: 50))
                        .cornerRadius(10)
                        .font(.title.bold())
                        .shadow(color: .red, radius: 10)
                        .padding()
                        
                        // when there are elements in the list to display
                    if done_today == false {
                        Image(currImg)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 280)
                            
                        Spacer()
                            
                    HStack {
                                
                                
                        Button(action: {self.skip()}){
                            Text("skip")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color(red: 0.224, green: 0.243, blue: 0.275))
                                .cornerRadius(10)
                                }
                                .padding()
                                
                                
                                Spacer()
                                
                                Button(action: {self.save()}){
                                    Text("save")
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(Color(red: 1.0, green: 0.3, blue: 0.1))
                                        .cornerRadius(10)
                                }
                                .padding()
                                
                            }
                            
                            
                        }
                        
                        
                        // when the list of images done for today
                        else {
                            Image("done-img")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 280)
                            Spacer()
                        }
                        
                    }
                    
                }
                
            }
            .navigationBarHidden(true)

        }
    }
        
        func save() {
            savedRecipes.append(currImg)
            nextImg()
        }
        
        func skip() {
            skippedRecipes.append(currImg)
            nextImg()
        }
        
        func nextImg() {
            if (index < images.count - 1) {
                index += 1
            } else {
                index = 0  // try removing this
                done_today = true
            }
        }
    

    // func renewListing()
    // this will help us renew the list of recipes every 24h
    // not implemented yet
    // use: UserDefault , let 24h_ago = Calendar.current.date(byAdding: .hour, value: -24, to: Date())!

}

struct TinderView_Previews: PreviewProvider {
    static var previews: some View {
        TinderView()
    }
}
