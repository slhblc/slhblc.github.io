import SwiftUI

struct ContentView: View {
    @State var hour = 0
    @State var minute = 0
    
    var minuteAngle: Angle { .degrees(Double(minute) * 6) }
    var hourAngle: Angle {
        let base = Double(hour % 12) * 30.0
        let quarter = Double(minute) / 2.0
        return .degrees(base + quarter)
    }
    var AMPM: String { hour < 12 ? "AM" : "PM" }
    var displayHour: Int {
        let h = hour % 12
        return h == 0 ? 12 : h
    }
    
    var body: some View {
        ZStack {
            (hour < 12 ? Color.orange : Color.blue)
                .clipShape(Circle())
                .frame(width: 380, height: 380)
            
            Rectangle()
                .frame(width: 5, height: 150)
                .foregroundColor(.white)
                .offset(y: -75)
                .rotationEffect(minuteAngle)
            
            Rectangle()
                .frame(width: 10, height: 100)
                .foregroundColor(.white)
                .offset(y: -50)
                .rotationEffect(hourAngle)
            
            Circle()
                .frame(width: 18, height: 18)
                .foregroundColor(.black)
        }
        
        VStack(spacing: 20) {
            Text(String(format: "%02d:%02d %@", displayHour, minute, AMPM))
                .font(.title2)
                .bold()
                .foregroundColor(.primary)
            
            HStack(spacing: 22) {
                Button("Hour -") {
                    hour = hour == 0 ? 23 : hour - 1
                }
                .tint(.blue)
                .buttonStyle(.borderedProminent)
                
                Button("Hour +") {
                    hour = hour == 24 ? 0 : hour + 1
                }
                .tint(.green)
                .buttonStyle(.borderedProminent)
            }
            
            HStack(spacing: 22) {
                Button("Minute -") {
                    if minute == 0 {
                        hour = hour == 0 ? 23 : hour - 1
                        minute = 59
                    } else {
                        minute -= 1
                    }
                }
                .tint(.blue)
                .buttonStyle(.borderedProminent)
                
                Button("Minute +") {
                    if minute == 59 {
                        minute = 0
                        hour += 1
                    } else {
                        minute += 1
                    }
                }
                .tint(.green)
                .buttonStyle(.borderedProminent)
            }
        }
        .animation(.easeInOut(duration: 0.5), value: hourAngle)
        .animation(.easeInOut(duration: 0.5), value: minuteAngle)
    }
}

#Preview {
    ContentView()
}
