//
//  RecipesView.swift
//  ecoeat
//
//  Created by Malika Sharma on 2024-05-05.
//

import SwiftUI

struct Recipe: Identifiable {
    var id = UUID()
    var name: String
    var img_name: String
    var ingredients: [String]
    var inst: String
}

class Recipes: ObservableObject {
    @Published var recipes: [Recipe] = [
        Recipe(name: "Chicken Salad", img_name: "salad-img", ingredients: ["orange", "onion", "tomato"], inst: "\nIngredients\n\n24 ounces dry fettuccine pasta\n1 cup butter\n¾ pint heavy cream\nsalt and pepper to taste\n1 dash garlic salt\n¾ cup grated Romano cheese\n½ cup grated Parmesan cheese\n\nDirections\n -Bring a large pot of lightly salted water to a boil.\n-Add fettuccine and cook for 8 to 10 minutes or until al dente; drain.\n-Melt butter into cream in a large sauce pan over low heat; add salt, pepper, and garlic salt.\n-Increase the heat to medium; stir in grated Romano and Parmesan cheese until melted and sauce has thickened.\n-Add cooked pasta to sauce and toss until thoroughly coated; serve immediately."),
        
        Recipe(name: "Avocado Salad", img_name: "salad2-img", ingredients: ["rice", "water", "milk"], inst: "Ingredients and Recipe\n\n-Avocados – big and ripe!\n-Cucumbers – I’m using regular cucumbers here (we call them Lebanese cucumbers), that are around 17cm/7″ long. If using the long telegraph / English cucumbers ~30cm/12″ long, use 1 1/2.\n-Red pepper flakes (chilli flakes) – Adds the tiniest hum of warmth which goes so well with the cooling cucumber. It’s my “secret ingredient”! But feel free to leave it out.\n-Red onion – Just a quarter, finely sliced, for freshness.\n-Fresh herbs – Dill and coriander/cilantro works so well here. One of my favourite herb combinations. Makes this salad even better, but I happily make it without. Put it this way – I wouldn’t make a special trip to the shops to get them unless I was making this for company!\n-Lime juice and extra virgin olive oil – For the dressing. No need to shake it up today, just pour it over and toss! Lemon can be used instead of lime."),
        Recipe(name: "Alfredo Pasta", img_name: "pasta-img", ingredients: ["egg", "oil", "pepper"], inst: "do that and this...")
        // will add more recipes here
        // instructions not set yet
    ]
}

struct RecipesView: View {
    @ObservedObject var recipeManager = Recipes()
    
    var body: some View {
        NavigationView {
            
            ZStack{
                Image("kitchen")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
        
                ScrollView {
                    Color(.black)
                    ForEach(recipeManager.recipes) { recipe in
                        VStack {
                            Text(recipe.name)
                                .font(.title)
                                .foregroundColor(.black).bold()
                                .padding(.top, 20)
                                .shadow(color: .orange, radius:10)
                            
                            // padding test
                            Image(recipe.img_name)
                                .resizable()
                                .frame(width: 150, height: 150)
                                .aspectRatio(contentMode: .fill)
                            // frame test
                                .cornerRadius(10)
                            Text(recipe.inst)
                                .padding(.horizontal, 20)
                                .foregroundColor(.black)
                                
                            
                            // padding test
                        }
                        .padding()
                    }
                }
                .navigationTitle("Recipes")
                .navigationBarTitleDisplayMode(.inline).toolbar {
                    
                    ToolbarItem(placement: .principal) {
                        Text("Recipes").foregroundColor(.black).bold()
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            
                    }
            
                
            
                }
                
                        .background(Color.white.blur(radius: 50))
                        .clipShape(RoundedRectangle(cornerRadius: 10))


            }
        }
    }
}



#Preview {
    RecipesView()
}
