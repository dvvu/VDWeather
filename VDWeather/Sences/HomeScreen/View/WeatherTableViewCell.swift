//
//  WeatherTableViewCell.swift
//  VDWeather
//
//  Created by Vu Doan on 6/11/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLable: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configUI(_ model: PredictionDayModel?) {
        guard  let model = model else {
            return
        }
        if let weathers = model.weathers {
            descriptionLabel.text = weathers[0].description
        }
        
        if let humidity = model.humidity {
            humidityLabel.text = "\(humidity)%"
        }
        
        if let pressure = model.pressure {
            pressureLabel.text = "\(pressure)"
        }
        
        if let temp = model.temp {
            temperatureLable.text = temp.getAvegaeTemp()
        }
        
        if let dt = model.dt, let dayString = Date(timeIntervalSince1970: dt).daytoString() {
            dateLabel.text = dayString
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

