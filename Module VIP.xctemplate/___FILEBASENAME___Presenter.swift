//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ___VARIABLE_productName:identifier___PresenterInput: class {

}

protocol ___VARIABLE_productName:identifier___PresenterOutput: class {
    var presenter: ___VARIABLE_productName:identifier___PresenterInput? { get set }
}

final class ___VARIABLE_productName:identifier___Presenter {

    weak var output: ___VARIABLE_productName:identifier___PresenterOutput?
    
    var interactor: ___VARIABLE_productName:identifier___Interactor?
}

// MARK:- ___VARIABLE_productName:identifier___PresenterInput
extension ___VARIABLE_productName:identifier___Presenter: ___VARIABLE_productName:identifier___PresenterInput {

}
