//
//  ContentView.swift
//  CreateTask
//
//  Created by Gibbs, Dallin on 10/8/21.
//

import SwiftUI

struct HomeView: View {
	var body: some View {
		Button("Clicky Clicky", action: nothing)
	}
	
	func nothing() -> Void
	{
		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
