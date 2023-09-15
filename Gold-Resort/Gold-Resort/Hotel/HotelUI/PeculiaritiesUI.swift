//
//  PeculiaritiesUI.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 13.09.2023.
//

import SwiftUI

struct PeculiaritiesUI: View {
    @State var about: [String]
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(createLines(from: about), id: \.self) { line in
                    HStack {
                        ForEach(line, id: \.self) { item in
                            Text(item)
                                .fixedSize(horizontal: false, vertical: true)
                                .lineLimit(1)
                                .truncationMode(.tail)
                                .foregroundStyle(.secondary)
                                .padding(6)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    func createLines(from texts: [String]) -> [[String]] {
        var lines = [[String]]()
        var line: [String] = [String]()
        var lineWidth: CGFloat = 0
        
        for text in texts {
            let textWidth = text.widthOfString(usingFont: .systemFont(ofSize: 17))
            
            if lineWidth + textWidth < UIScreen.main.bounds.width - 40 {
                line.append(text)
                lineWidth += textWidth
            } else {
                lines.append(line)
                line = [text]
                lineWidth = textWidth
            }
        }
        
        lines.append(line)
        
        return lines
    }
}

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}

struct PeculiaritiesUI_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PeculiaritiesUI(about: ["Бесплатный Wifi на всей территории отеля", "1 км до пляжа", "Бесплатный фитнес-клуб", "20 км до аэропорта"])
        }
    }
}

