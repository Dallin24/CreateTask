//
//  SortingAlgorithimsView.swift
//  CreateTask
//
//  Created by Gibbs, Dallin on 11/9/21.
//

import SwiftUI

struct SortingAlgorithimsView: View
{
	
	struct BarDataInfo: Identifiable
	{
		let id: Int
		var sizeVisual: String
		var sizeNumerical: Int
	}
	
	@State private var barData: [BarDataInfo] =
	[
		BarDataInfo(id: 0, sizeVisual: "  ", sizeNumerical: 0),
		BarDataInfo(id: 1, sizeVisual: "  ", sizeNumerical: 0),
		BarDataInfo(id: 2, sizeVisual: "  ", sizeNumerical: 0)
	]
	
    var body: some View
	{
		VStack
		{
			HStack
			{
				VStack(alignment: .leading, spacing: 3.0)
				{
					ForEach(barData)
					{
						dataline in
						HStack(spacing: 2.0)
						{
							Button(action: { changeBarDataInfo(id: dataline.id, action: "add") }, label: { Image(systemName: "plus") })
								.frame(width: 20.0, height: 20)
								.background(Color(.systemGray3))
								.foregroundColor(.black)
								.cornerRadius(5)
								.padding(.leading, 10.0)
							
							Button(action: { changeBarDataInfo(id: dataline.id, action: "remove") }, label: { Image(systemName: "minus") })
								.frame(width: 20.0, height: 20)
								.background(Color(.systemGray3))
								.foregroundColor(.black)
								.cornerRadius(5)
						}
					}
				}
				
				VStack(alignment: .leading, spacing: 3.0)
				{
					ForEach(barData)
					{
						dataline in
						Text(dataline.sizeVisual)
							.frame(height: 20)
							.background(Color(.blue))
					}
				}.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
				
				VStack(spacing: 3.0)
				{
					ForEach(barData)
					{
						dataline in
						Text(String(dataline.sizeNumerical))
							.frame(height: 20)
							.padding(.trailing, 10.0)
					}
				}.frame(width: 35.0, alignment: .center)
			}
		}
    }
	
	func changeBarDataInfo(id : Int, action : String) -> Void
	{
		if (action == "add")
		{
			barData[id].sizeVisual += "  "
			barData[id].sizeNumerical += 1
		}
		else if (action == "remove")
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
}

struct SortingAlgorithimsView_Previews: PreviewProvider
{
    static var previews: some View
	{
        SortingAlgorithimsView()
    }
}
