//
//  SettingSence.swift
//  VDWeather
//
//  Created by Vu Doan on 6/12/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import UIKit

class SettingSence: BaseViewController {
    
    @IBOutlet weak var fButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var kButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var dayCountLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    lazy var viewModel: SettingViewModel? = VDContainer.shared.resolve(SettingViewModel.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        bindViewModel()
        pastData()
    }
    
    private func configView() {
        title = "setting_title".localized
        borderColorButton(fButton)
        borderColorButton(cButton)
        borderColorButton(kButton)
        borderColorButton(subButton)
        borderColorButton(plusButton)
    }
    
    private func pastData() {
        guard let viewModel = viewModel else { return }
        dayLabel.text = "\(viewModel.results.dayCount ?? 0)"
        setTemperature(viewModel.results.temperatureType ?? .Kelvin)
    }
    
    private func setTemperature(_ type: TemperatureType) {
        switch type {
        case .Celsius:
            hightLightButon(kButton, isHighLight: false)
            hightLightButon(cButton, isHighLight: true)
            hightLightButon(fButton, isHighLight: false)
            break
        case .Fahrenheit:
            hightLightButon(kButton, isHighLight: false)
            hightLightButon(cButton, isHighLight: false)
            hightLightButon(fButton, isHighLight: true)
            break
        default:
            hightLightButon(kButton, isHighLight: true)
            hightLightButon(cButton, isHighLight: false)
            hightLightButon(fButton, isHighLight: false)
            break
        }
    }
    
    private func bindViewModel() {
        guard let viewModel = viewModel else { return }
        viewModel.delegate = self
    }
    
    private func borderColorButton(_ botton: UIButton) {
        botton.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    private func hightLightButon(_ button: UIButton, isHighLight: Bool) {
        button.backgroundColor = isHighLight ? .systemBlue:.white
        button.setTitleColor(isHighLight ? .white:.systemBlue, for: .normal)
    }
    
    @IBAction func kAction(_ sender: Any) {
        guard let viewModel = viewModel else { return }
        viewModel.selectTemperature(.Kelvin)
    }
    
    @IBAction func cAction(_ sender: Any) {
        guard let viewModel = viewModel else { return }
        viewModel.selectTemperature(.Celsius)
    }
    
    @IBAction func fAction(_ sender: Any) {
        guard let viewModel = viewModel else { return }
        viewModel.selectTemperature(.Fahrenheit)
    }
    
    @IBAction func subAction(_ sender: Any) {
        guard let viewModel = viewModel else { return }
        viewModel.dayCount(false)
    }
    
    @IBAction func plusAction(_ sender: Any) {
        guard let viewModel = viewModel else { return }
        viewModel.dayCount(true)
    }
    
    @IBAction func saveAction(_ sender: Any) {
        guard let viewModel = viewModel else { return }
        viewModel.save()
    }
}

// ViewModel Delegate
extension SettingSence: SettingViewModelDelegate {
   
    func save() {
        self.showMessage(title: "pu_title_well_done".localized, message: "pu_title_well_done_message".localized) {
            VDRouter.backToRoot()
            NotificationCenter.default.post(name: VDNOTIFICATION_NAME.retryAPI, object: nil)
        }
    }
    
    func dayCount() {
        guard let viewModel = viewModel else { return }
        dayLabel.text = "\(viewModel.results.dayCount ?? 0)"
    }
    
    func temperature() {
        guard let viewModel = viewModel else { return }
        self.setTemperature(viewModel.results.temperatureType ?? .Kelvin)
    }
    
    func failed(_ error: Error) {
        VDQueueAlert.shared.showMessageError(error.localizedDescription.localized)
    }
    
    func ativityLoading(_ isShow: Bool) {
        LoadingActivity.shared.showLoading(isShow)
    }
}


// New Instance
extension SettingSence {
    static func newInstance() -> SettingSence {
        let vc = SettingSence(nibName: "SettingSence", bundle: nil)
        return vc
    }
}
