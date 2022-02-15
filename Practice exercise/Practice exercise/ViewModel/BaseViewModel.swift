//
//  BaseViewModel.swift
//  Practice exercise
//
//  Created by Itiel Luque on 13/2/22.
//

import Foundation
import SENetworking

protocol BaseViewModelProtocol {}

protocol BaseViewModelApiConfigurationProtocol {
    func baseURL() -> String
    func dataTransferService() -> DataTransferService
}

class BaseViewModel: BaseViewModelProtocol, BaseViewModelApiConfigurationProtocol {
    
    lazy var apiDataTransferService: DataTransferService = {
        let config = ApiDataNetworkConfig(baseURL: URL(string: baseURL())!,
                                          queryParameters: [:])

        let apiDataNetwork = DefaultNetworkService(config: config)
        return DefaultDataTransferService(with: apiDataNetwork)
    }()
    
    lazy var apiRepository = APIRepository.shared
    
    func baseURL() -> String {
        return ""
    }
    
    func dataTransferService() -> DataTransferService {
        return apiDataTransferService
    }
}
