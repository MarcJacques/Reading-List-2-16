//
//  BookController.swift
//  Reading List
//
//  Created by Marc Jacques on 2/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
class BookController {
    
    var books: [Book] = []
    
    
    
    var readingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("ReadingList.plist")
    }
    
    
    
    func saveToPersistentStore() {
        guard let url = readingListURL else { return }
        let encoder = PropertyListEncoder()
        do {
            let booksData = try encoder.encode(books)
            try booksData.write(to: url)
        } catch {
            print("Error while saving the boook data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = readingListURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let bookData = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedBooks = try decoder.decode([Book].self, from: bookData)
            books = decodedBooks
        } catch {
            print("Error loading book data: \(error)")
        }
    }
    
    @discardableResult func createBookEntry(title: String, reasonToRead: String, hasBeenRead: Bool) -> Book {
        
        let book = Book(title: title, reasonToRead: reasonToRead, hasbeenRead: hasBeenRead)
        books.append(book)
        saveToPersistentStore()
        return book
        
    }
    
    func deleteBookEntry(book: Book) {
//        guard let index = books.firstIndex(of: book) else { return }
//        books.remove(at: index)
        books.removeAll { $0 == book }
        saveToPersistentStore()
    }
    
    func updateHasBeenRead(book: Book) {
//        guard let index = books.firstIndex(of: book) else { return }
//        books[index].hasbeenRead.toggle()
        var updateBook = book
        var readStatus: String
        if updateBook.hasbeenRead == false {
            updateBook.hasbeenRead.toggle()
            readStatus = "You have not read \(book.title). "
        } else {
            updateBook.hasbeenRead.toggle()
            readStatus = "You already read \(book.title). "
        }
        print(readStatus)
        saveToPersistentStore()
    }
    
    func editTitleAndReason(book: Book, newTitle: String, newReasonToRead: String) {
        guard let index = books.firstIndex(of: book) else { return }
        var updateBook = book
        updateBook.title = newTitle
        updateBook.reasonToRead = newReasonToRead
        books.remove(at: index)
        books.insert(updateBook, at: index)
        saveToPersistentStore()
    }
    
    
}
