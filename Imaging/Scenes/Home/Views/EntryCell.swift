//
//  EntryCell.swift
//  Imaging
//
//  Created by Raymond Law on 7/7/18.
//  Copyright © 2018 Clean Swift LLC. All rights reserved.
//

import UIKit

protocol EntryCellDelegate
{
  func entryCellButtonTapped(entryCell: EntryCell)
}

class EntryCell: UITableViewCell
{
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var button: UIButton!
  
  var delegate: EntryCellDelegate?
  
  var displayedEntry: Home.DisplayedEntry?
  {
    didSet
    {
      label.text = displayedEntry?.text
      button.setBackgroundImage(displayedEntry?.icon, for: .normal)
    }
  }
  
  @IBAction func buttonTapped(_ sender: Any)
  {
    delegate?.entryCellButtonTapped(entryCell: self)
  }
}
