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

  async addBook(newBook: BookPojo): Promise<number> {
    try {
      newBook = await this._bookRepository.create(newBook);
      return newBook.id;
    } catch (error) {
      console.log(error);
      return -1;
    }
  }

  async getBookById(id: number): Promise<BookPojo | undefined> {
    try {
      return await this._bookRepository.findByPk(id);
    } catch (error) {
      console.error(error);
      return undefined;
    }
  }

  async updateBook(newBookToUpdate: BookPojo): Promise<number> {
    try {
      newBookToUpdate = await this._bookRepository.update(newBookToUpdate, {
        where: {
          userId: newBookToUpdate.id_book,
        },
      });
      return newBookToUpdate.id_book;
    } catch (error) {
      console.error(error);
      return error.toString();
    }
  }
}
