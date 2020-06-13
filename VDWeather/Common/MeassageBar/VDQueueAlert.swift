//
//  TkQueueAlert.swift
//  TikiProject
//
//  Created by Vu Doan on 8/26/19.
//  Copyright © 2019 Tiki.vn. All rights reserved.
//

import Foundation

class VDQueueAlert {
    static let shared = VDQueueAlert()
    let globalQueue = DispatchQueue(label: "com.vd.VDAlertQueue")
    
    private func doForCart(message: String, completion: @escaping ()->Void) {
        DispatchQueue.main.async {
            switch type {
            case .snaskBar:
                if let controller = controller {
                    controller.showSnackBarError(error: message, buttonName: "Huỷ", action: {
                        completion()
                    })
                } else if let useCase = useCase {
                    useCase.showSnackBarError(error: message, buttonName: "Huỷ", action: {
                        completion()
                    })
                }
                break
            case .toast:
                if let controller = controller {
                    controller.view.makeToast(message)
                } else if let useCase = useCase {
                    useCase.makeToast(message)
                }
                break
            default:
                if controller != nil {
                    
                } else if let useCase = useCase, let product = product {
                    useCase.showUndoViewOP.onNext(product)
                }
                break
            }
        }
    }
    
    func addForCart(_ useCase: SnackBarProtocol? = nil, product: UndoProduct? = nil, controller: VirtualCheckoutCheckoutOptionViewController? = nil, type: TkAlertType, message: String, completion: @escaping ()->Void) {
        globalQueue.async {
            self.doForCart(useCase, product: product, controller: controller, type: type, message: message) {
                completion()
            }
            switch type {
            case .snaskBar:
                sleep(3)
                break
            case .toast:
                sleep(3)
                break
            default:
                sleep(3)
                break
            }
        }
    }
}
