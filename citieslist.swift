import SwiftUI

struct ContentView: View {
    
    let cities = ["London","Istanbul","Warsaw","Moscow"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Clock/List")
                .font(.title2)
            ForEach(cities, id:\.self){city in
            Text(city)}
        }
    }
}

