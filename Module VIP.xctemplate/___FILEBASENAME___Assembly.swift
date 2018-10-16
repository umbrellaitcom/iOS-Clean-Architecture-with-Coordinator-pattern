//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ___VARIABLE_productName:identifier___Assemblable: ___VARIABLE_productName:identifier___ViewProtocol, ___VARIABLE_productName:identifier___PresenterOutput {}

final class ___VARIABLE_productName:identifier___Assembly {
    static func assembly(with output: ___VARIABLE_productName:identifier___PresenterOutput) {
        let interactor = ___VARIABLE_productName:identifier___Interactor()
        let presenter  = ___VARIABLE_productName:identifier___Presenter()
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.output     = output
        output.presenter     = presenter
    }
}
