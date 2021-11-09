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
		let sizeVisual: String
		let sizeNumerical: Int
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
						buttonDataline in
						Button(action: { changeBarDataInfo() }, label: { Image(systemName: "plus") })
							.frame(width: 25.0, height: 20)
							.background(Color(.systemGray3))
							.foregroundColor(.black)
							.cornerRadius(5)
							.padding(.leading)
					}
				}
				
				VStack(alignment: .leading, spacing: 3.0)
				{
					ForEach(barData)
					{
						visualDataLine in
						Text(visualDataLine.sizeVisual)
							.frame(height: 20)
							.background(Color(.blue))
					}
				}.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
				
				VStack(spacing: 3.0)
				{
					ForEach(barData)
					{
						numericalDataLine in
						Text(String(numericalDataLine.sizeNumerical))
							.frame(height: 20)
							.padding(.trailing)
					}
				}
			}
		}
    }
	
	func changeBarDataInfo() -> Void
	{
		
	}
}

struct SortingAlgorithimsView_Previews: PreviewProvider
{
    static var previews: some View
	{
        SortingAlgorithimsView()
    }
}
