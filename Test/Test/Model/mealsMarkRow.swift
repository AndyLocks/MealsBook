//
//  mealsMarkRow.swift
//  Test
//
//  Created by Galina Makarova on 17.03.23.
//

import SwiftUI

struct mealsMarkRow: View {
    var mealsMark: Mealsmark
    
    var body: some View {
        HStack {
            
            AsyncImage(url: URL(string: mealsMark.strMealThumb))
                .clipShape(Circle())
                .foregroundColor(.white)
                .overlay {
                                Circle().stroke(.white, lineWidth: 3)
                            }
                .shadow(radius: 7)
            
            Text(mealsMark.strMeal)
            
            Spacer()
        }
    }
}

struct mealsMarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            mealsMarkRow(mealsMark: mealsMarks[0])
            mealsMarkRow(mealsMark: mealMarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
