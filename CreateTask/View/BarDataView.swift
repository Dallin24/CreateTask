//
//  BarDataView.swift
//  CreateTask
//
//  Created by [REDACTED] on [REDACTED].
//

import SwiftUI

struct BarDataInfo
{
	var sizeVisual : String
	var sizeNumerical : Int
	var color : Color
	var sorted : Bool
}

struct BarDataView: View
{
	@State private var barData : [BarDataInfo] =
	[
		BarDataInfo(sizeVisual: "  ", sizeNumerical: 0, color: .blue, sorted: false),
		BarDataInfo(sizeVisual: "  ", sizeNumerical: 0, color: .blue, sorted: false),
		BarDataInfo(sizeVisual: "  ", sizeNumerical: 0, color: .blue, sorted: false)
	]
	@State private var hasSortedBeenClicked : Bool = false
	
    var body: some View
	{

		VStack
		{
			Button(action: { sortData() }, label: { Text("Sort Data") })
				.frame(width: 90, height: 25)
				.background(Color(.systemGray3))
				.foregroundColor(.black)
				.font(.system(size: 18.0))
				.cornerRadius(5)
			
			HStack(spacing: 2.0)
			{
				Button(action: { changeOverallBarDataInfo(operation: "addBar") }, label: { Image(systemName: "plus") })
					.frame(width: 25, height: 25)
					.background(Color(.systemGray3))
					.foregroundColor(.black)
					.font(.system(size: 22.0))
					.cornerRadius(5)
					.padding(.leading, 10.0)
				
				Button(action: { changeOverallBarDataInfo(operation: "removeBar") }, label: { Image(systemName: "minus") })
					.frame(width: 25, height: 25)
					.background(Color(.systemGray3))
					.foregroundColor(.black)
					.font(.system(size: 22.0))
					.cornerRadius(5)
				
				Button(action: { changeOverallBarDataInfo(operation: "randomData") }, label: { Text("Generate Random Data") })
					.frame(width: 200, height: 25)
					.background(Color(.systemGray3))
					.foregroundColor(.black)
					.font(.system(size: 18.0))
					.cornerRadius(5)
				
			}.frame(minWidth: 0, maxWidth: .infinity)
			
			VStack(alignment: .center)
			{
				TextField("Enter Title Here", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).multilineTextAlignment(.center)
			}
				HStack
				{
					VStack(alignment: .leading, spacing: 3.0)
					{
						ForEach(barData.indices, id: \.self)
						{
							index in
							HStack(spacing: 2.0)
							{
								Button(action: { changeIndividualBarDataInfo(id: index, operation: "changeColor") }, label: { Text("ℂ") })
									.frame(width: 20, height: 20)
									.background(Color(.systemGray3))
									.foregroundColor(.black)
									.cornerRadius(5)
									.padding(.leading, 10.0)
								
								Button(action: { changeIndividualBarDataInfo(id: index, operation: "addDataPoint") }, label: { Image(systemName: "plus") })
									.frame(width: 20, height: 20)
									.background(Color(.systemGray3))
									.foregroundColor(.black)
									.cornerRadius(5)
								
								Button(action: { changeIndividualBarDataInfo(id: index, operation: "removeDataPoint") }, label: { Image(systemName: "minus") })
									.frame(width: 20, height: 20)
									.background(Color(.systemGray3))
									.foregroundColor(.black)
									.cornerRadius(5)
							}
						}
					}
					
					VStack(alignment: .leading, spacing: 3.0)
					{
						ForEach(barData.indices, id: \.self)
						{
							index in
							Text(barData[index].sizeVisual)
								.frame(height: 20)
								.background(barData[index].color)
						}
					}.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
					
					VStack(spacing: 3.0)
					{
						ForEach(barData.indices, id: \.self)
						{
							index in
							Text(String(barData[index].sizeNumerical))
								.frame(height: 20)
								.padding(.trailing, 5.0)
						}
					}.frame(width: 35.0, alignment: .center)
				}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
		}
    }
	
	func changeIndividualBarDataInfo(id : Int, operation : String) -> Void
	{
		if (operation == "addDataPoint")
		{
			barData[id].sizeVisual += "  "
			barData[id].sizeNumerical += 1
		}
		else if (operation == "removeDataPoint")
		{
			if let range = barData[id].sizeVisual.range(of: "  ")
			{
				let convertedString = barData[id].sizeVisual.replacingCharacters(in: range, with: "")
				
				if (convertedString == "")
				{
				barData[id].sizeVisual = "  "
				barData[id].sizeNumerical = 0
				}
				else
				{
				barData[id].sizeVisual = convertedString
				barData[id].sizeNumerical -= 1
				}
			}
		}
	}
	
	func changeOverallBarDataInfo(operation : String) -> Void
	{
		if (operation == "addBar" && barData.count < 25)
		{
			barData.append(BarDataInfo(sizeVisual: "  ", sizeNumerical: 0, color: .blue, sorted: false))
		}
		else if (operation == "removeBar" && barData.count > 1)
		{
			barData.remove(at: barData.count - 1)
		}
		else if (operation == "randomData")
		{
			barData.removeAll()
			
			let randomRowCount = Int.random(in: 5..<25)
			var counter = 0
			while (counter < randomRowCount)
			{
				barData.append(BarDataInfo(sizeVisual: "  ", sizeNumerical: 0, color: .blue, sorted: false))
				counter += 1
			}
			
			for index in 0...(barData.count - 1)
			{
				barData[index].sizeNumerical = Int.random(in: 0..<29)
			}
			updateSizeVisual()
		}
	}
	
	func updateSizeVisual() -> Void
	{
		for index in 0...(barData.count - 1)
		{
			barData[index].sizeVisual = "  "
			
			var segments = 0
			while (segments < barData[index].sizeNumerical)
			{
			barData[index].sizeVisual += "  "
			segments += 1
			}
		}
	}
	
	func sortData() -> Void
	{
		if (hasSortedBeenClicked)
		{
			var end = 0
			for _ in barData
			{
				
				for index in 0..<(barData.count - 1 - end)
				{
					if (barData[index].sizeNumerical < barData[index + 1].sizeNumerical)
					{
						let temp = barData[index]
						barData[index] = barData[index + 1]
						barData[index + 1] = temp
					}
				}
				end += 1
			}
			hasSortedBeenClicked = false
		}
		else
		{
			var end = 0
			for _ in barData
			{
				
				for index in 0..<(barData.count - 1 - end)
				{
					if (barData[index].sizeNumerical > barData[index + 1].sizeNumerical)
					{
						let temp = barData[index]
						barData[index] = barData[index + 1]
						barData[index + 1] = temp
					}
				}
				end += 1
			}
			hasSortedBeenClicked = true
		}
	}
}

struct BarDataView_Previews: PreviewProvider
{
    static var previews: some View
	{
        BarDataView()
    }
}
