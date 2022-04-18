//
//  BookTableViewCell.swift
//  FavoriteBooks
//
//  Created by Roman Hural on 21.02.2022.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet var titleField: UILabel!
    @IBOutlet var authorField: UILabel!
    @IBOutlet var genreField: UILabel!
    @IBOutlet var lengthField: UILabel!

    //MARK: - Cell Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Methods
    func update(with book: Book) {
        titleField.text = book.title
        authorField.text = book.author
        genreField.text = book.genre
        lengthField.text = book.length
    }
}
