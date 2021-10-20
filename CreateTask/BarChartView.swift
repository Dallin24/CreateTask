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
	
	@State private var barTimes: [String] =
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
	@State private var isLabelsEditable : Bool = false
	@State private var buttonColorName : String = "Add"
	@State private var labelsEditableName : String = "Edit Labels"
	@State private var buttonColorDescription : String = "YOU ARE NOW ADDING DATA"
	
	var body: some View
	{
		VStack(alignment: .leading)
		{
			HStack
			{
				Button(action:
						{
							changeButtonLabels()
						}, label:
						{
							Text("\(labelsEditableName)")
						}).padding(0.0).frame(width: 100.0).background(Color(.systemGray3)).foregroundColor(.black).cornerRadius(5).padding(.bottom)
			}
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
			HStack
			{
				VStack
				{
					Button("\(buttonColorName)", action: changeColor).padding(3.0).background(buttonColor).cornerRadius(5).foregroundColor(Color.black).padding(.top)
					Text("\(buttonColorDescription)").foregroundColor(buttonColor).frame(width: 375.0)
					
				}
			}
		}
    }
	
	func changeLength(number: Int)
	{
		if (isLabelsEditable == false)
		{
			if (isButtonColorGreen == true)
			{
				barLengths[number] = barLengths[number] + "  "
			} else
			{
				if let range = barLengths[number].range(of: "  ")
				{
					let convertedString = barLengths[number].replacingCharacters(in: range, with: "")
					barLengths[number] = convertedString
					
					if (barLengths[number] == "")
					{
						barLengths[number] = "  "
					}
				}
			}
		}
		else
		{
			
		}
		
	}
	
	func changeColor() -> Void
	{
		if (isLabelsEditable == false)
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
		else
		{
			
		}
	}
	
	func changeButtonLabels()
	{
		if (isLabelsEditable == false)
		{
			labelsEditableName = "Done"
			isLabelsEditable = true
		}
		else
		{
			labelsEditableName = "Edit Labels"
			isLabelsEditable = false
		}
	}
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
