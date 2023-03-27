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
}
