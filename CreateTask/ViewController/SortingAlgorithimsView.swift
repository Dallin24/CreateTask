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
		var sizeVisual: String
		var sizeNumerical: Int
	}
	
	@State private var barData: [BarDataInfo] =
	[
		BarDataInfo(sizeVisual: "  ", sizeNumerical: 0),
		BarDataInfo(sizeVisual: "  ", sizeNumerical: 0),
		BarDataInfo(sizeVisual: "  ", sizeNumerical: 0)
	]
	
    var body: some View
	{
		VStack
		{
			HStack(spacing: 2.0)
			{
				Button(action: { changeBarDataInfo(id: -1, action: "addBar") }, label: { Image(systemName: "plus") })
					.frame(width: 20.0, height: 20)
					.background(Color(.systemGray3))
					.foregroundColor(.black)
					.cornerRadius(5)
					.padding(.leading, 10.0)
				
				Button(action: { changeBarDataInfo(id: -1, action: "removeBar") }, label: { Image(systemName: "minus") })
					.frame(width: 20.0, height: 20)
					.background(Color(.systemGray3))
					.foregroundColor(.black)
					.cornerRadius(5)
				
			}.frame(maxWidth: .infinity, alignment: .leading)
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
								.frame(width: 20.0, height: 20)
								.background(Color(.systemGray3))
								.foregroundColor(.black)
								.cornerRadius(5)
								.padding(.leading, 10.0)
							
							Button(action: { changeBarDataInfo(id: index, action: "removeData") }, label: { Image(systemName: "minus") })
								.frame(width: 20.0, height: 20)
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
							.background(Color(.blue))
					}
				}.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
				
				VStack(spacing: 3.0)
				{
					ForEach(barData.indices, id: \.self)
					{
						index in
						Text(String(barData[index].sizeNumerical))
							.frame(height: 20)
							.padding(.trailing, 10.0)
					}
				}.frame(width: 35.0, alignment: .center)
			}
		}
    }
	
	func changeBarDataInfo(id : Int, action : String) -> Void
	{
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
			barData.append(BarDataInfo(sizeVisual: "  ", sizeNumerical: 0))
		}
		else if (action == "removeBar" && barData.count > 1)
		{
			barData.remove(at: barData.count - 1)
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
