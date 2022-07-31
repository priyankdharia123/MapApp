//
//  LocationPreviewView.swift
//  MapApp
//
//  Created by Priyank Dharia on 7/28/22.
//

import SwiftUI

struct LocationPreviewView: View {
    
    let location: Location
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 16) {
                locationImage
                titleSection
            }
            
            VStack(spacing: 8){
                makeButton(for: "Learn More").buttonStyle(.borderedProminent)
                makeButton(for: "Next").buttonStyle(.bordered)
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .cornerRadius(10)
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            Color.green.ignoresSafeArea()
            LocationPreviewView(location: LocationsDataService.locations.first!)
                .padding()
        }
        .environmentObject(LocationsViewModel())
    }
}


extension LocationPreviewView {
    
    
    private var locationImage : some View {
        ZStack{
            if let imageName = location.imageNames.first!{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(.white)
        .cornerRadius(10)
    }
    
    private var titleSection : some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    
    func makeButton(for text : String) -> some View {
        Button {
            if text == "Learn More" {
                vm.showSheetLocation = location
            }
            else {
                vm.nextButtonPressed()
            }
        }
        label: {
            Text(text)
                .font(.headline)
                .frame(width: 125, height: 35)
        }
    }

}
