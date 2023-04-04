import { BookPojo } from "../models/book.model";
import { connect } from "../config/book.db.config";
import { CategoryPojo } from "../models/category.model";
import { AuthorPojo } from "../models/author.model";
import { BookCategoriesPojo } from "../models/book-categories";
import { ImgBookPojo } from "../models/img-book.model";
import { CommentPojo } from "../models/comment.model";

export class BookRepository {
  _db: any = {};
  _bookRepository: any;
  _categoryRepository: any;
  _bookCategoryRepository: any;
  _authorRepository: any;
  _imgBookRepository: any;
  _commentRepository: any;

  constructor() {
    this._db = connect();
    this._bookRepository = this._db.sequelize.getRepository(BookPojo);
    this._categoryRepository = this._db.sequelize.getRepository(CategoryPojo);
    this._bookCategoryRepository = this._db.sequelize.getRepository(BookCategoriesPojo);
    this._authorRepository = this._db.sequelize.getRepository(AuthorPojo);
    this._imgBookRepository = this._db.sequelize.getRepository(ImgBookPojo);
    this._commentRepository = this._db.sequelize.getRepository(CommentPojo);
  }

  async getAllBooks(): Promise<BookPojo[]> {
    try {
      const books = await this._bookRepository.findAll({ include: [this._categoryRepository, this._imgBookRepository] });
      console.log("books:::", books);
      return books;
    } catch (error) {
      console.error(error);
      return [];
    }
  }
  async getBookById(id_book: number): Promise<BookPojo | undefined> {
    try {
      return this._bookRepository.findByPk(id_book, {include : [this._authorRepository , this._categoryRepository, this._imgBookRepository]});

    } catch (error) {
      console.error(error);
      return error;
    }
  }
  async addBook(newBook: BookPojo): Promise<number> {
    try {
      newBook = this._bookRepository.create(newBook);
      return newBook.id_book;
    } catch (error) {
      console.error(error);
      return error
    }
  }
  async updateBook(newBookToUpdate: BookPojo): Promise<number> {
    try {
      newBookToUpdate = await this._bookRepository
        .update({
          name: newBookToUpdate.name,
          summary: newBookToUpdate.summary,
          isbn: newBookToUpdate.isbn,
          id_author: newBookToUpdate.id_author,
          language: newBookToUpdate.language
        },
          {
            where: { id_book: newBookToUpdate.id_book },
          });
      return newBookToUpdate.id_book
    }
    catch (error) {
      console.error(error)
      return error.toString()
    }
  }

  async deleteBook(id_book: number): Promise<BookPojo[]> {
    try {
      const books = await this._bookRepository.destroy({
        where: {
          id_book: id_book
        }
      });
      console.log("books:::", books);
      return books;
    } catch (error) {
      console.error(error);
      return [];
    }
  }
}
