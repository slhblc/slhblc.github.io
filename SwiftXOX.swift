import SwiftUI


struct ContentView: View {
    var body: some View {
        ZStack{
            
            Rectangle()
            
                .fill(Color.red)
            
                .frame(width:120, height:120)
        
                .offset(x:150)
            
            Text("X")
            
                .foregroundStyle(.white)
            
                .font(.largeTitle)
                .bold()
                .offset(x:150)
            
            Rectangle()
                .fill(Color.blue)
                .frame(width:120, height:120)
                .offset(x:150,y:150)
            Text("O")
                .foregroundStyle(.white)
                .font(.largeTitle)
                .bold()
                .offset(x:150,y:150)
            
            Rectangle()
                .fill(Color.yellow)
                .frame(width:120, height:120)
                .offset()
            Text("O")
                .foregroundStyle(.white)
                .font(.largeTitle)
                .bold()
                .offset()
            Rectangle()
                .fill(Color.red)
                .frame(width:120, height:120)
                .offset(y:150)
            Text("X")
                .foregroundStyle(.white)
                .font(.largeTitle)
                .bold()
                .offset(y:150)
            Rectangle()
                .fill(Color.red)
                .frame(width:120, height:120)
                .offset(x:-150)
            Text("X")
                .foregroundStyle(.white)
                .font(.largeTitle)
                .bold()
                .offset(x:-150)
            
            Rectangle()
                .fill(Color.blue)
                .frame(width:120, height:120)
                .offset(x:-150,y:150)
            Text("O")
                .foregroundStyle(.white)
                .font(.largeTitle)
                .bold()
                .offset(x:-150,y:150)
            Rectangle()
                .fill(Color.red)
                .frame(width:120, height:120)
                .offset(y:-150)
            Text("X")
                .foregroundStyle(.white)
                .font(.largeTitle)
                .bold()
                .offset(y:-150)
            Rectangle()
                .fill(Color.blue)
                .frame(width:120, height:120)
                .offset(x:150, y:-150)
            Text("O")
                .foregroundStyle(.white)
                .font(.largeTitle)
                .bold()
                .offset(x:150,y:-150)
            
            Rectangle()
                .fill(Color.blue)      .frame(width:120, height:120)
                .offset(x:-150,y:-150)
            Text("O")
                .foregroundStyle(.white)
                .font(.largeTitle)
                .bold()
                .offset(x:-150,y:-150)
        }
    }
}
