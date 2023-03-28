import { BookPojo } from "../models/book.model";
import { connect } from "../config/book.db.config";

export class BookRepository {
  _db: any = {};
  _bookRepository: any;

  constructor() {
    this._db = connect();
    this._bookRepository = this._db.sequelize.getRepository(BookPojo);
  }

  async getAllBooks(): Promise<BookPojo[]> {
    try {
      const books = await this._bookRepository.findAll();
      console.log("books:::", books);
      return books;
    } catch (error) {
      console.error(error);
      return [];
    }
  }
  async getBookById(id_book:number): Promise<BookPojo | undefined> {
    try {
      return this._bookRepository.findOne({
        where: {
          id_book : id_book
        }
      });
     
    } catch (error) {
      console.error(error);
      return error;
    }
  }
  async addBook(newBook: BookPojo): Promise<number> {
    try {
      newBook =  this._bookRepository.create(newBook);
      return newBook.id_book;
    } catch (error) {
      console.error(error);
      return error
    }
  }
  async updateBook(): Promise<BookPojo[]> {
    try {
      const books = await this._bookRepository.findAll();
      console.log("books:::", books);
      return books;
    } catch (error) {
      console.error(error);
      return [];
    }
  }
  async changeStatusBook(): Promise<BookPojo[]> {
    try {
      const books = await this._bookRepository.findAll();
      console.log("books:::", books);
      return books;
    } catch (error) {
      console.error(error);
      return [];
    }
  }
  async deleteBook(): Promise<BookPojo[]> {
    try {
      const books = await this._bookRepository.findAll();
      console.log("books:::", books);
      return books;
    } catch (error) {
      console.error(error);
      return [];
    }
  }
}
