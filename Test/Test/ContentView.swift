import SwiftUI
struct Meals : Decodable{
    let meals: [Meal]?
}
struct Meal : Decodable, Identifiable{
    let id = UUID()
    let idMeal: String
    let strMeal: String
    //var strTags: String
    //var strDrinkAlternate: String?
    //var strYoutube: String?
    let strMealThumb: String
    let strCategory: String
    let strArea: String
    let strInstructions: String
    //var strIngredient: String?
}

struct ContentView: View {
    @State private var date = Date()
    @State private var text1: String = ""
    @State private var instructions: String = ""
    @State private var categoryAndArea: String = ""
    @State private var buttonText: String = ""
    @State private var fieldInput: String = ""
    @State private var image: String = ""
    @State private var imageDivider: Bool = false
    @State private var sectionField: Int = 0
    @State private var mailsPost: Meals = Meals(meals: nil)
    @State private var opasityImage: Double = 0
    
    var body: some View {
        VStack {
            Section{
                HStack{
                    
                    Button("OK"){
                        var request = URLRequest(url: URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=" + fieldInput)!)
                        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                            let JSON: String = String(decoding: data!, as: UTF8.self)
                            let jsonData = JSON.data(using: .utf8)!
                            mailsPost = Meals(meals: nil)
                            mailsPost = try! JSONDecoder().decode(Meals.self, from: jsonData)
                            
                            if mailsPost.meals != nil{
                                text1 = mailsPost.meals![sectionField].strMeal
                                buttonText = mailsPost.meals![sectionField].strInstructions
                                categoryAndArea = "\(mailsPost.meals![sectionField].strArea): \(mailsPost.meals![sectionField].strCategory)"
                                image = mailsPost.meals![sectionField].strMealThumb
                                imageDivider = true
                                opasityImage = 100
                            }
                            else {
                                text1 = ""
                                buttonText = "Das Gericht wurde nicht gefunden"
                                categoryAndArea = ""
                                image = ""
                                imageDivider = false
                                opasityImage = 0
                            }
                        }
                        task.resume()
                        
                    }.contentShape(Rectangle())
                    TextField("Search", text: $fieldInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                    Button("Random") {
                        var request = URLRequest(url: URL(string: "https://www.themealdb.com/api/json/v1/1/random.php")!)
                        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                            let JSON: String = String(decoding: data!, as: UTF8.self)
                            let jsonData = JSON.data(using: .utf8)!
                            mailsPost = Meals(meals: nil)
                            mailsPost = try! JSONDecoder().decode(Meals.self, from: jsonData)
                            
                            if mailsPost.meals != nil{
                                text1 = mailsPost.meals![sectionField].strMeal
                                buttonText = mailsPost.meals![sectionField].strInstructions
                                categoryAndArea = "\(mailsPost.meals![sectionField].strArea): \(mailsPost.meals![sectionField].strCategory)"
                                image = mailsPost.meals![sectionField].strMealThumb
                                imageDivider = true
                                opasityImage = 100
                            }
                            else {
                                text1 = ""
                                buttonText = "Das Gericht wurde nicht gefunden"
                                categoryAndArea = ""
                                image = ""
                                imageDivider = false
                                opasityImage = 0
                            }
                        }
                        task.resume()
                    }.contentShape(Rectangle())
                }
            }
            ScrollView{
            HStack {
                Text(text1)
                    .font(.title)
                    .colorMultiply(.blue)
                    .fontWeight(.black)
            }
            AsyncImage(url: URL(string: image), scale: 5)
                .frame(width: 125, height: 125)
                .padding(.top, 3)
                .clipShape(Circle())
                .foregroundColor(.white)
                .overlay {
                                Circle().stroke(.white, lineWidth: 3)
                            }
                .opacity(opasityImage)
                .shadow(radius: 7)
            if imageDivider{
                Divider()
            }
            
                
                Text(buttonText)
                    .font(.subheadline)
                    .padding(.top, 5)
            }.backgroundStyle(.white)
            
                    Section{
                        if mailsPost.meals != nil {
                            Picker(selection: $sectionField, label: Text("Meals"), content: {
                                ForEach(0 ..< mailsPost.meals!.count) { index in
                                    
                                        Text(self.mailsPost.meals![index].strMeal).tag(index)
                                    
                                }

                            })
                        }
                    }

                        
                        Divider()
                        
                        Text(categoryAndArea)
                            .foregroundColor(.gray)
                            .padding(.top, 3)
                    
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
