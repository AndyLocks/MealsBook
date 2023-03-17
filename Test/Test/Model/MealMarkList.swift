//
//  MealMarkList.swift
//  Test
//
//  Created by Galina Makarova on 17.03.23.
//

import SwiftUI

struct MealMarkList: View {
    var body: some View {
        List(mealMarks, id: \.id) { mealmark in
                    mealsMarkRow(mealsMark: mealmark)
        }

    }
}

struct MealMarkList_Previews: PreviewProvider {
    static var previews: some View {
        MealMarkList()
    }
}
