//
//  DemoView.swift
//  CreateTask
//
//  Created by Gibbs, Dallin on 10/18/21.
//

import SwiftUI

struct DemoView: View {
	@State private var buttonNumberArray:[Int] = [98,99,100]
	@State private var colorNumberArray:[Int] = [0,0,0]
	
	var body: some View {
		
		VStack {
			ForEach(0..<colorNumberArray.count ) { forNumber in
				
				Text("\(colorNumberArray[forNumber])")
				Text("\(forNumber)")
				Button(action: {
					changeNumber(number: forNumber)
				}, label: {
					Text("Button number\(buttonNumberArray[forNumber])")
				})
				.buttonStyle(ChangeColorButton(numberForBackground: colorNumberArray[forNumber]))
				.padding()
			}
			
			VStack {
				Text("colorNumberArray 0  \(colorNumberArray[0])")
				Text("colorNumberArray 1  \(colorNumberArray[1])")
				Text("colorNumberArray 2 \(colorNumberArray[2])")
			}
		}
		
	}
	struct ChangeColorButton: ButtonStyle {
		let colors: [Color] = [.gray, .green, .red]
		let numberForBackground: Int
		
		func makeBody(configuration: Configuration) -> some View {
			
			configuration.label
				.frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
				.padding()
				.background(colors[numberForBackground])
		}
		
	}
	
	func changeNumber(number:Int){
		
		if colorNumberArray[number] == 2 {
			colorNumberArray[number] = 0
		}else {
			colorNumberArray[number] += 1
		}
	}
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
