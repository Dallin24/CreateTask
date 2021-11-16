//
//  SortingAlgorithimsView.swift
//  CreateTask
//
//  Created by Gibbs, Dallin on 11/9/21.
//

import SwiftUI

struct SortingAlgorithimsView: View
{
	struct BarDataInfo
	{
		var sizeVisual : String
		var sizeNumerical : Int
		var color : Color
	}
	
	@State private var barData : [BarDataInfo] =
	[
		BarDataInfo(sizeVisual: "  ", sizeNumerical: 0, color: .blue),
		BarDataInfo(sizeVisual: "  ", sizeNumerical: 0, color: .blue),
		BarDataInfo(sizeVisual: "  ", sizeNumerical: 0, color: .blue)
	]
	@State private var freezeButtons : Bool = false
	@State private var buttonOpacity : Double = 1.0
	
    var body: some View
	{
		VStack
		{
			HStack(spacing: 2.0)
			{
				Button(action: { bubbleSort() }, label: { Text("Bubble Sort") })
					.frame(width: 105, height: 25)
					.background(Color(.systemGray3))
					.foregroundColor(.black)
					.font(.system(size: 18.0))
					.cornerRadius(5)
			}
			
			HStack(spacing: 2.0)
			{
				Button(action: { changeBarDataInfo(id: -1, action: "addBar") }, label: { Image(systemName: "plus") })
					.frame(width: 25, height: 25)
					.background(Color(.systemGray3))
					.foregroundColor(.black)
					.font(.system(size: 22.0))
					.cornerRadius(5)
					.padding(.leading, 10.0)
					.opacity(buttonOpacity)
				
				Button(action: { changeBarDataInfo(id: -1, action: "removeBar") }, label: { Image(systemName: "minus") })
					.frame(width: 25, height: 25)
					.background(Color(.systemGray3))
					.foregroundColor(.black)
					.font(.system(size: 22.0))
					.cornerRadius(5)
					.opacity(buttonOpacity)
				Button(action: { changeBarDataInfo(id: -1, action: "random") }, label: { Text("Generate Random Data") })
					.frame(width: 200, height: 25)
					.background(Color(.systemGray3))
					.foregroundColor(.black)
					.font(.system(size: 18.0))
					.cornerRadius(5)
					.opacity(buttonOpacity)
				
			}.frame(minWidth: 0, maxWidth: .infinity)
			
			HStack
			{
				VStack(alignment: .leading, spacing: 3.0)
				{
					ForEach(barData.indices, id: \.self)
					{
						index in
						HStack(spacing: 2.0)
						{
							Button(action: { changeBarDataInfo(id: index, action: "addData") }, label: { Image(systemName: "plus") })
								.frame(width: 20, height: 20)
								.background(Color(.systemGray3))
								.foregroundColor(.black)
								.cornerRadius(5)
								.padding(.leading, 10.0)
								.opacity(buttonOpacity)
							
							Button(action: { changeBarDataInfo(id: index, action: "removeData") }, label: { Image(systemName: "minus") })
								.frame(width: 20, height: 20)
								.background(Color(.systemGray3))
								.foregroundColor(.black)
								.cornerRadius(5)
								.opacity(buttonOpacity)
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
	
	func changeBarDataInfo(id : Int, action : String) -> Void
	{
		if freezeButtons { return }
		
		if (action == "addData")
		{
			barData[id].sizeVisual += "  "
			barData[id].sizeNumerical += 1
		}
		else if (action == "removeData")
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
		else if (action == "addBar")
		{
			barData.append(BarDataInfo(sizeVisual: "  ", sizeNumerical: 0, color: .blue))
		}
		else if (action == "removeBar" && barData.count > 1)
		{
			barData.remove(at: barData.count - 1)
		}
		else if (action == "random")
		{
			barData.removeAll()
			let randomRowCount = Int.random(in: 5..<25)
			var counter = 0
			while (counter < randomRowCount)
			{
				barData.append(BarDataInfo(sizeVisual: "  ", sizeNumerical: 0, color: .blue))
				counter += 1
			}
			
			for index in 0...(barData.count - 1)
			{
				barData[index].sizeNumerical = Int.random(in: 0..<31)
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
	
	func bubbleSort() -> Void
	{
		freezeButtons = true
		buttonOpacity = 0.5
		
		for _ in barData
		{
			var index : Int = 0
			while (index < barData.count - 2)
			{
				if (barData[index].sizeNumerical > barData[index + 1].sizeNumerical)
				{
					DispatchQueue.main.sync
					{
						let temp = barData[index]
						barData[index] = barData[index + 1]
						barData[index + 1] = temp
					}
					//sleep(1)
				}
				index += 1
			}
		}
		
		freezeButtons = false
		buttonOpacity = 1.0
	}
	
	func test() -> Void
	{
		barData[0].color = .orange
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			barData[0].color = .green
		}
	}
}

struct SortingAlgorithimsView_Previews: PreviewProvider
{
    static var previews: some View
	{
        SortingAlgorithimsView()
    }
}
