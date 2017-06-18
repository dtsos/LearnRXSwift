//
//  LoginViewModel.swift
//  TryRXSwift
//
//  Created by David Trivian S on 5/30/17.
//  Copyright © 2017 David Trivian S. All rights reserved.
//

import RxSwift
import RxCocoa
import Alamofire
protocol Transitionable: class {
    weak var navigationCoordinator: CoordinatorType? { get }
}

protocol CoordinatorType: class {
    
    var baseController: UIViewController { get }
    
    func performTransition(transition: Transition)
}

enum Transition {
    
    case showRepository(User)
}

class MainCoordinator: CoordinatorType {
    var baseController: UIViewController
    
    init() {
        let viewModel = LoginViewModel()
        let storyboard:UIStoryboard =  UIStoryboard(name: "Main", bundle: nil)
        let loginViewC:LoginViewController = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        loginViewC.viewModel =  viewModel
        self.baseController = UINavigationController(rootViewController: loginViewC)
        
        viewModel.navigationCoordinator = self
    }
    
    func performTransition(transition: Transition) {
//        switch transition {
//        case .showRepository(let repository):
//            UIApplication.shared.open(URL(string: repository.url)!, options: [:], completionHandler: nil)
//        }
    }
}

protocol RepositoryViewModelType: Transitionable {
    
    var repositorySubject: PublishSubject<User> { get }
    
//    func fetchRepositories(for observableText: Observable<String>) -> Driver<Result<[User]>>
}
class LoginViewModel: RepositoryViewModelType {
    
    let validatedUsername: Driver<ValidationResult>
    let validatedPassword: Driver<ValidationResult>
//    
//    weak var navigationCoordinator: CoordinatorType?
//
//    fileprivate let disposeBag = DisposeBag()
////    func fetchRepositories(for observableText: Observable<String>) -> SharedSequence<DriverSharingStrategy, Result<[User]>> {
////        return RepositoryNetworking
////            .fetchRepositories(for: observableText)
////
////    }
////    
//    init() {
//        
//        repositorySubject
//            .asObservable()
//            .subscribe(onNext: { [unowned self] in
//                self.navigationCoordinator?.performTransition(transition: .showRepository($0))
//            })
//            .addDisposableTo(disposeBag)
//    }
//
//
//    var repositorySubject = PublishSubject<User>()
// 
//    
//    var username = Variable<String>("")
//    var password = Variable<String>("")
//    
//    var isValid : Observable<Bool>{
//        
//        return Observable.combineLatest(username.asObservable(),password.asObservable())  { (username, password) in
//            return username.characters.count > 0
//                && password.characters.count > 0
//        }
//    }
}

enum CommonError : Error {
    
    case parsingError
    case networkError
}

struct RepositoryNetworking {
    
//    static func fetchRepositories(for repositoryName: Observable<String>) -> Driver<Result<[User]>> {
//        return repositoryName
//            .subscribeOn(MainScheduler.instance) // Make sure we are on MainScheduler
//            .do(onNext: { _ in
//                UIApplication.shared.isNetworkActivityIndicatorVisible = true
//            })
//           
////            .observeOn(ConcurrentDispatchQueueScheduler(qos: .background)) // we don’t really know from the code above that requestJSON will return data on the same thread it started. So we’re gonna make sure it is again on the background thread for mapping.
////            .map { (response, json) -> Result<[User]> in
////                if response.statusCode == 200 {
////                    
////                    guard let json = json as? [[String : Any]] else { return .failure(CommonError.parsingError) }
////                    
////                    if let repos = Mapper<Repository>().mapArray(JSONArray: json) {
////                        return .success(repos)
////                    } else {
////                        return .failure(CommonError.parsingError)
////                    }
////                } else {
////                    return .failure(CommonError.networkError)
////                }
////            }
////            .observeOn(MainScheduler.instance) // switch to MainScheduler, UI updates
////            .do(onNext: { _ in
////                UIApplication.shared.isNetworkActivityIndicatorVisible = false
////            })
////            .asDriver(onErrorJustReturn: .failure(CommonError.parsingError)) // This also makes sure that we are on MainScheduler
//    }
}
