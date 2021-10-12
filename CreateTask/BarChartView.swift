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
			VStack(alignment: .trailing, spacing: 1.0)
			{
				ForEach(barData)
				{
					data in
					Button("Boom Boom", action: nothing)
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
	
	func nothing() -> Void
	{
		
	}
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
