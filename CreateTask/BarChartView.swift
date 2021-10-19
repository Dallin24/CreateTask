//
//  BarChartView.swift
//  CreateTask
//
//  Created by Gibbs, Dallin on 10/8/21.
//

import SwiftUI

struct BarChartView: View
{
	@State private var barLengths: [Int] =
		[
			0,
			2,
			4,
			6,
			8,
			10,
			12,
			14,
			16,
			18,
			20,
			22,
			24,
			26,
			28,
			30,
			32,
			34,
			36,
			38,
			40,
			42,
			44,
			46,
			48
		]
	
	let barTimes: [String] =
		[
			"12AM",
			"1AM",
			"2AM",
			"3AM",
			"4AM",
			"5AM",
			
			"6AM",
			"7AM",
			"8AM",
			"9AM",
			"10AM",
			"11AM",
			
			"12PM",
			"1PM",
			"2PM",
			"3PM",
			"4PM",
			"5PM",
			
			"6PM",
			"7PM",
			"8PM",
			"9PM",
			"10PM",
			"11PM",
		]
	
	@State private var buttonColor : Color = .green
	@State private var buttonColorBool : Bool = true
	@State private var buttonColorName : String = "Add"
	
	var body: some View
	{
		VStack
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
				
				VStack(alignment: .leading, spacing: 1.0)
				{
				}
			}
			Button("\(buttonColorName)", action: changeColor).padding(3.0).background(buttonColor).cornerRadius(5).foregroundColor(Color.black).padding()
		}
		/*HStack
		{
			Button("Add")
			Button("Remove", action: )
		}*/
    }
	
	func changeLength(number: Int)
	{
		barLengths[number] += 2
	}
	
	func changeColor() -> Void
	{
		if (buttonColorBool == true)
		{
			buttonColorName = "Remove";
			buttonColorBool = false;
			buttonColor = .red;
		} else
		{
			buttonColorName = "Add";
			buttonColorBool = true;
			buttonColor = .green;
		}
	}
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
