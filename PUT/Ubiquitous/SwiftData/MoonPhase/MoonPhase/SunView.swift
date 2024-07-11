//
//  SunView.swift
//  MoonPhase
//
//  Created by student on 27/05/2024.
//

import SwiftUI

import SwiftUI
import CoreLocation
import SwiftAA
struct SunView: View {
    
    @State var date = Date()
    @State var sunRise = Date()
    @State var sunSet = Date()
    @State var dayLength = String()
    
    @Binding var location:CLLocationCoordinate2D
    
    init(location: Binding<CLLocationCoordinate2D>) {
        _location = location
    }

    func calculateHours(){
        let jd=JulianDay(date)
        let sun = Sun(julianDay: jd)
        let coordinates=GeographicCoordinates(CLLocation(location)!)
        let times=sun.riseTransitSetTimes(for: coordinates)
        let sunRise = times.riseTime
        let sunSet = times.setTime
        let sunTransit = times.transitTime
        
        let delta = sunSet.timeIntervalSince(sunRise)
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute, .second]
        dayLength = formatter.string(from: delta) ?? "00:00.00"
        
    }
    
    var body: some View {
        VStack {
            HStack {
                DatePicker(selection: $date, displayedComponents: .date) {
                    Text("Select date")
                }
                Spacer()
                Button("Today") {
                    date = Date()
                }
            }
            Spacer()
            
            Spacer()
            HStack {
                Text("Sunrise")
                Spacer()
                Text(sunRise)
            }
            HStack {
                Text("Transit")
                Spacer()
                Text(sunTransit)
            }
            
            HStack {
                Text("Sunset")
                Spacer()
                Text(sunSet)
            }
            HStack {
                Text("Day length")
                Spacer()
                Text(dayLength)
            }
        }
    }
}

/*#Preview {
    SunView()
}*/
