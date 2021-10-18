//
//  BarChartView.swift
//  CreateTask
//
//  Created by Gibbs, Dallin on 10/8/21.
//

import SwiftUI

struct BarChartView: View
{
	@State public var barLengths: [Int] = [0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48]
	var body: some View
	{
		HStack
		{
			VStack(alignment: .leading, spacing: 1.0)
			{
				ForEach(0..<barTimes.count)
				{
					timeSlot in
					Button(action:
					{
						changeLength(number: timeSlot)
					}, label:
					{
						Text("\(barTimes[timeSlot])")
					})
					.padding(0.0).frame(width: 50.0).background(Color(.systemGray3)).foregroundColor(.black).cornerRadius(5)
					
				}
			}
			/*
			VStack(alignment: .leading, spacing: 1.0)
			{
				ForEach(barLengths, id: \.self)
				{
					length in
					Text(length).background(Color(.blue))
				}
			}*/
		}
    }
	
	func changeLength(number: Int) -> Void
	{
		
	}
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
