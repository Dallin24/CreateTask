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
	
	@State private var barSize: [Int] =
		[
			0,
			0,
			0,
			0,
			0,
			0,
			
			0,
			0,
			0,
			0,
			0,
			0,
			
			0,
			0,
			0,
			0,
			0,
			0,
			
			0,
			0,
			0,
			0,
			0,
			0
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
			"11PM"
		]
	
	@State private var buttonColor : Color = .green
	@State private var isButtonColorGreen : Bool = true
	@State private var isLabelsEditable : Bool = false
	@State private var buttonColorName : String = "Add"
	@State private var labelsEditableName : String = "Edit Labels"
	@State private var labelsOutline : Color = .clear
	@State private var rightAppOpacity : Double = 1.0
	@State private var labelTextEditOpacity : Double = 0.0
	@State private var buttonColorDescription : String = "YOU ARE NOW ADDING DATA"
	@State private var tempLabelName : String = ""
	
	var body: some View
	{
		VStack
		{
			HStack(alignment: .top)
			{
				
				Button(action:
						{
							changeButtonLabels()
						}, label:
						{
							Text("\(labelsEditableName)")
						}).frame(width: 110.0).background(Color(.systemGray3)).foregroundColor(.black).cornerRadius(5).padding(.bottom)
				
				Button("Add Row", action: addRow).frame(width: 110.0).background(Color(.systemGray3)).foregroundColor(.black).cornerRadius(5).padding(.bottom)
				
				Button("Remove Row", action: remRow).frame(width: 110.0).background(Color(.systemGray3)).foregroundColor(.black).cornerRadius(5).padding(.bottom)
			
			}
			TextField("Enter Graph Title", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
				.frame(width: 375.0)
			ZStack
			{
				HStack
				{
					VStack(spacing: 1.0)
					{
						ForEach(0..<barTimes.underestimatedCount)
						{
							timeSlot in
							Button(action:
							{
								changeLength(number: timeSlot)
							}, label:
							{
								Text("\(barTimes[timeSlot])")
							})
								.padding(0.0).frame(width: 75.0).background(Color(.systemGray3)).foregroundColor(.black).cornerRadius(5).border(labelsOutline, width: 1.5)
							
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
					
						
				}.frame(width: 400, height: 510, alignment: .leading)
				VStack
				{
					ForEach(barSize, id: \.self)
					{
						barNum in
						Text("\(barNum)").frame(height: 21.5)
					}
				}.frame(width: 400, height: 510, alignment: .trailing)
			}
			HStack
			{
				VStack
				{
					Button("\(buttonColorName)", action: changeColor).padding(3.0).background(buttonColor).cornerRadius(5).foregroundColor(Color.black).padding(.top)
					Text("\(buttonColorDescription)").foregroundColor(buttonColor).frame(width: 375.0)
					
				}
			}.opacity(rightAppOpacity)
			HStack
			{
				TextField("Enter New Label Name", text: $tempLabelName)
					.frame(width: 375.0).padding(4).border(Color.blue, width: 2)
			}.opacity(labelTextEditOpacity)
		}
    }
	
	func changeLength(number: Int)
	{
		if (isLabelsEditable == false)
		{
			
			if (isButtonColorGreen == true)
			{
				barLengths[number] = barLengths[number] + "  "
				barSize[number] += 1
				if (barSize[number] > 32)
				{
					barSize[number] = 32
					barLengths[number] = "                                                                "
				}
			} else
			{
				if let range = barLengths[number].range(of: "  ")
				{
					let convertedString = barLengths[number].replacingCharacters(in: range, with: "")
					barLengths[number] = convertedString
					barSize[number] -= 1
					if (barLengths[number] == "")
					{
						barLengths[number] = "  "
						barSize[number] = 0
					}
				}
			}
		}
		else
		{
			if (tempLabelName == "")
			{
				barTimes[number] = "Label"
			}
			else
			{
				barTimes[number] = tempLabelName
			}
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
			labelsOutline = .blue
			rightAppOpacity = 0.35
			labelTextEditOpacity = 1.0
		}
		else
		{
			labelsEditableName = "Edit Labels"
			isLabelsEditable = false
			labelsOutline = .clear
			rightAppOpacity = 1.0
			labelTextEditOpacity = 0.0
			tempLabelName = ""
		}
	}
	
	func addRow() -> Void
	{
		barLengths.append("  ")
		barTimes.append("Label")
		barSize.append(0)
	}
	
	func remRow() -> Void
	{
		barLengths.remove(at: barLengths.count - 1)
		barTimes.remove(at: barTimes.count - 1)
		barSize.remove(at: barTimes.count - 1)
	}
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
