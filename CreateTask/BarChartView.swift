//
//  BarChartView.swift
//  CreateTask
//
//  Created by Gibbs, Dallin on 10/8/21.
//

import SwiftUI

struct BarChartView: View
{
	@State private var barLengths: [String] =
		[
			"  ",
			"  ",
			"  ",
			"  ",
			"  ",
			"  ",
			
			"  ",
			"  ",
			"  ",
			"  ",
			"  ",
			"  ",
			
			"  ",
			"  ",
			"  ",
			"  ",
			"  ",
			"  ",
			
			"  ",
			"  ",
			"  ",
			"  ",
			"  ",
			"  ",
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
	@State private var isButtonColorGreen : Bool = true
	@State private var buttonColorName : String = "Add"
	@State private var buttonColorDescription : String = "YOU ARE NOW ADDING DATA"
	
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
					ForEach(barLengths, id: \.self)
					{
						dataLength in
						Text(dataLength).background(Color.blue)
					}
				}
			}
			Button("\(buttonColorName)", action: changeColor).padding(3.0).background(buttonColor).cornerRadius(5).foregroundColor(Color.black).padding(.top)
			Text("\(buttonColorDescription)").foregroundColor(buttonColor)
		}
    }
	
	func changeLength(number: Int)
	{
		if (isButtonColorGreen == true)
		{
			barLengths[number] = barLengths[number] + "  "
		} else
		{
			barLengths[number] = "  "
		}
		
	}
	
	func changeColor() -> Void
	{
		if (isButtonColorGreen == true)
		{
			buttonColorName = "Remove";
			isButtonColorGreen = false;
			buttonColor = .red;
			buttonColorDescription = "YOU ARE NOW REMOVING DATA"
		} else
		{
			buttonColorName = "Add";
			isButtonColorGreen = true;
			buttonColor = .green;
			buttonColorDescription = "YOU ARE NOW ADDING DATA"
		}
	}
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
