//
//  BarChartView.swift
//  CreateTask
//
//  Created by Gibbs, Dallin on 10/8/21.
//

import SwiftUI

struct BarChartView: View
{
	
	var body: some View
	{
		HStack
		{
			VStack(alignment: .leading, spacing: 1.0)
			{
				ForEach(barData)
				{
					data in
					Button(data.time, action: addCount).padding(0.0).frame(width: 50.0).background(Color(.systemGray3)).foregroundColor(.black).cornerRadius(5)
				}
			}
			
			VStack(alignment: .leading, spacing: 1.0)
			{
				ForEach(barData)
				{
					data in
					Text(data.length).background(Color(.blue))
				}
			}
		}
		
    }
	
	func addCount() -> Void
	{
		var dataPoints : [String] = []
		
		for data in barData
		{
			
			dataPoints.append(data.length)
		}
		
		
	}
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
