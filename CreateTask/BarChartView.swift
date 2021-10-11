//
//  BarChartView.swift
//  CreateTask
//
//  Created by Gibbs, Dallin on 10/8/21.
//

import SwiftUI

struct BarChartView: View {
	
	let barData: Identifiable = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
	
    var body: some View {
		
		VStack {
			ForEach(barData)
			{
				time in
				
				Text(time)
			}
			
		}
    }
	
	func loadBarData() -> Void
	{
		
	}
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
