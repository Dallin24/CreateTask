//
//  BarChartView.swift
//  CreateTask
//
//  Created by Gibbs, Dallin on 10/8/21.
//

import SwiftUI

struct BarChartView: View
{
	@State private var barLabels: [BarLabelNameID] =
		[
			BarLabelNameID(id: 0, name: "Label"),
			BarLabelNameID(id: 1, name: "Label"),
			BarLabelNameID(id: 2, name: "Label"),
			BarLabelNameID(id: 3, name: "Label"),
			BarLabelNameID(id: 4, name: "Label")
		]
	@State private var barLengths: [String] = ["  ", "  ", "  ", "  ", "  "]
	@State private var barSize: [Int] = [ 0, 0, 0, 0, 0 ]
	
	@State private var buttonColorName : String = "Add"
	@State private var buttonColorDescription : String = "YOU ARE NOW ADDING DATA"
	@State private var buttonColor : Color = .green
	@State private var isButtonColorGreen : Bool = true
	
	@State private var graphTitle : String = ""
	@State private var isLabelsEditable : Bool = false
	@State private var tempLabelName : String = ""
	@State private var labelsEditableName : String = "Edit Labels"
	@State private var labelsOutline : Color = .clear
	
	@State private var rightAppOpacity : Double = 1.0
	@State private var labelTextEditOpacity : Double = 0.0
	
	var body: some View
	{
		VStack
		{
			HStack
			{
				Button(action: { changeButtonLabels() }, label: { Text(labelsEditableName) })
					.frame(width: 110.0)
					.background(Color(.systemGray3))
					.foregroundColor(.black)
					.cornerRadius(5)
					.padding(.bottom)
				
				Button("Add Row", action: addRow)
					.frame(width: 110.0)
					.background(Color(.systemGray3))
					.foregroundColor(.black)
					.cornerRadius(5)
					.padding(.bottom)
				
				Button("Remove Row", action: remRow)
					.frame(width: 110.0)
					.background(Color(.systemGray3))
					.foregroundColor(.black)
					.cornerRadius(5)
					.padding(.bottom)
			
			}
			
			TextField("Enter Graph Title", text: $graphTitle)
				.frame(width: .infinity)
				.padding()
			
			HStack
			{
				VStack(spacing: 1.0)
				{
					ForEach(barLabels)
					{
						barLabel in
						Button(action: { changeLength(number: barLabel.id) }, label: { Text(barLabel.name) })
							.frame(width: 75.0)
							.background(Color(.systemGray3))
							.foregroundColor(.black)
							.cornerRadius(5)
							.border(labelsOutline, width: 1.5)
					}
				}.padding(.leading, 8.0)
				
				ZStack(alignment: .leading)
				{
					VStack(alignment: .leading, spacing: 1.0)
					{
						ForEach(barLengths, id: \.self)
						{
							dataLength in
							Text(dataLength)
								.background(Color.blue)
						}
					}
					
					VStack(spacing: 1.0)
					{
						ForEach(barSize, id: \.self)
						{
							barNum in
							Text("\(barNum)")
								.frame(width: 30, height: 20.5)
						}
					}.frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
				}
			}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
			
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
					barLengths[number] = "                                                                  "
				}
			}
			else
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
				barLabels[number] = BarLabelNameID(id: number, name: "Label")
			}
			else
			{
				barLabels[number] = BarLabelNameID(id: number, name: "\(tempLabelName)")
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
			}
			else
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
		if (barSize.count > 28)
		{
		
		}
		else
		{
		barLengths.append("  ")
		barLabels.append(BarLabelNameID(id: barLabels.count, name: "Label"))
		barSize.append(0)
		}
		
	}
	
	func remRow() -> Void
	{
		if (barSize.count == 1)
		{
		
		}
		else
		{
		barLengths.remove(at: barLengths.count - 1)
		barLabels.remove(at: barLabels.count - 1)
		barSize.remove(at: barSize.count - 1)
		}
	}
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
