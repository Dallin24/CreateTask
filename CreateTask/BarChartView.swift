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
			VStack(alignment: .leading)
			{
				ForEach(barData, id: \.id)
				{
					data in
					Text(data.length).background(Color(.blue))
				}
			}
		}
		
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
