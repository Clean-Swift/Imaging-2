//
//  HomePresenter.swift
//  Imaging
//
//  Created by Raymond Law on 7/7/18.
//  Copyright (c) 2018 Clean Swift LLC. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomePresentationLogic
{
  func presentSetIcon(response: Home.SetIcon.Response)
  func presentFetchEntries(response: Home.FetchEntries.Response)
}

class HomePresenter: HomePresentationLogic
{
  weak var viewController: HomeDisplayLogic?
  
  // MARK: Fetch entries
  
  func presentFetchEntries(response: Home.FetchEntries.Response)
  {
    let displayedEntries = response.entries.map { convert(entry: $0) }
    
    let viewModel = Home.FetchEntries.ViewModel(displayedEntries: displayedEntries)
    viewController?.displayFetchEntries(viewModel: viewModel)
  }
  
  // MARK: Set icon
  
  func presentSetIcon(response: Home.SetIcon.Response)
  {
    let displayedEntry = convert(entry: response.entry)
    let viewModel = Home.SetIcon.ViewModel(displayedEntry: displayedEntry, indexPath: response.indexPath)
    viewController?.displaySetIcon(viewModel: viewModel)
  }
  
  // MARK: Format entry to displayed entry
  
  private func convert(entry: Entry) -> Home.DisplayedEntry
  {
    let text = entry.text
    let icon = entry.icon
    return Home.DisplayedEntry(text: text, icon: icon)
  }
}
