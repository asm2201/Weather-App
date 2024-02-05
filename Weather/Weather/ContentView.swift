//
//  ContentView.swift
//  Weather
//
//  Created by Anushka Mathur on 05/02/24.
//

import SwiftUI

struct AQIBarView: View{
    var aqi: Int
    var body: some View{
        RoundedRectangle(cornerRadius: 8)
            .frame(width: 300, height: 5)
            .foregroundColor(aqiColor(aqi: aqi))
    }
    private func aqiColor(aqi: Int) -> Color{
        switch aqi{
        case 0...50:
            return .green
        case 51...100:
            return .yellow
        case 101...200:
            return .orange
        case 201...300:
            return .red
        default:
            return .purple
        }
    }
}


struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundGradientView(topColor: isNight ? .black : .blue, bottomColor: isNight ? Color("lightGray") : Color("lightBlue"))
            
            VStack(spacing: 5){
                Text("New Delhi")
                    .font(.system(size: 45, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    //.padding(.top, 30)
                Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 160, height: 160)
                Text("15°")
                    .font(.system(size: 70, weight: .light, design: .default))
                    .foregroundColor(.white)
                Text("Mostly Cloudy")
                    .font(.system(size: 20, weight: .medium, design: .default))
                    .foregroundColor(.white)
                HStack{
                    Text("H: 21°")
                        .font(.system(size: 20, weight: .medium, design: .default))
                        .foregroundColor(.white)
                    Text("L: 12°")
                        .font(.system(size: 20, weight: .medium, design: .default))
                        .foregroundColor(.white)
                }
                VStack{
                    VStack(spacing: 10){
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .fill(isNight ? Color("WeatherBoxGray"): Color("WeatherBoxBlue"))
                                .frame(width: 350, height:125)
                            VStack(alignment: .leading, spacing: 10){
                                Text("217 - Poor")
                                    .font(.system(size: 20, weight: .bold, design: .default))
                                    .foregroundColor(.white)
                                AQIBarView(aqi: 217)

                                Text("Air Quality Index is 217, which is better than yesterday at about this time")
                                    .font(.system(size: 17, weight: .medium, design: .default))
                                    .foregroundColor(.white)
                            }
                            //.padding(.top, )
                            .padding(.trailing, 30)
                            .padding(.leading, 30)
    
                        }
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .fill(isNight ? Color("WeatherBoxGray"): Color("WeatherBoxBlue"))
                                .frame(width: 350, height:125)
                            HStack{
                                Image(systemName: "clock")
                                    .foregroundColor(.gray)
                                    .padding(.leading, -140)
                                    .padding(.top, -50)
                                
                                Text("Hourly Forecast")
                                    .font(.system(size: 16, weight: .medium, design: .default))
                                    .foregroundColor(.gray)
                                    .padding(.leading, -125)
                                    .padding(.top, -50)
                            }
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing: 20){
                                    WeatherTimeView(time: "Now", imageName: "sun.max.fill", temp: 15)
                                    WeatherTimeView(time: "1PM", imageName: "cloud.sun.fill", temp: 16)
                                    WeatherTimeView(time: "2PM", imageName: "cloud.sun.fill", temp: 14)
                                    WeatherTimeView(time: "3PM", imageName: "sun.max.fill", temp: 13)
                                    WeatherTimeView(time: "4PM", imageName: "cloud.sun.fill", temp: 13)
                                    WeatherTimeView(time: "5PM", imageName: "sun.max.fill", temp: 12)
                                    WeatherTimeView(time: "6PM", imageName: "sunset.fill", temp: 11)
                                }
                                .padding(.horizontal, 35)
                            }
                            .padding(.trailing, 20)
                            .padding(.leading, 20)
                        }
                    }
                    .padding(.top, 50)
                    
                    Spacer()
                    
                    
                }
                Button{
                    isNight.toggle()
                }label: {
                    Text("Change Day Time")
                        .font(.system(size:20, weight: .bold, design: .default))
                }
                .padding(.bottom, 20)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherTimeView: View {
    
    var time: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack(spacing:5){
            Text(time)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding(.top)
            Image(systemName: imageName)
                .renderingMode(.original)
            Text("\(temp)°")
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundGradientView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
