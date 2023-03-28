import { BookRepository } from "../data/repositories/book.repository";
import { BookPojo } from "../data/models/book.model";
import { BookDTO } from "../types";

export class BookService {
  _bookRepository: BookRepository;

  constructor() {
    this._bookRepository = new BookRepository();
  }

  async getAllBooks(): Promise<BookDTO[]> {
    const booksPromise = await this._bookRepository
      .getAllBooks()
      .then((booksAsPojo) => {
        let booksAsDTO: BookDTO[] = [];
        booksAsPojo.forEach((bookAsPojo) => {
          let bookAsDTO = this.parsePojoIntoDTO(bookAsPojo);
          booksAsDTO.push(bookAsDTO);
        });
        return booksAsDTO;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return booksPromise;
  }

  async getBookById(id_book:number): Promise<BookDTO | undefined> {
    const bookPromise = await this._bookRepository
      .getBookById(id_book)
      .then((bookAsPojo) => {
        if (!!bookAsPojo) {
          return this.parsePojoIntoDTO(bookAsPojo);
        } else return undefined;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return bookPromise;
  }

  async addBook(book: BookDTO): Promise<number> {
    const bookPojo: BookPojo = this.parseDTOIntoPojo(book);
    const bookPromise = await this._bookRepository
      .addBook(bookPojo)
      .then((book_id) => {
        return book_id;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return bookPromise;
  }

  async updateBook(book: BookDTO): Promise<any> {
    const updateBook = async updateBook.update({
      title: title,

    },{
      where:{
        id_book: id_book
      }
    })
  }

  async deleteBook(book: BookDTO): Promise<any> {
    const bookPojo: BookPojo = this.parseDTOIntoPojo(book);
    const bookPromise = await this._bookRepository
      .deleteBook(bookPojo)
      .then((book_id) => {
        return book_id;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return bookPromise;
  }

  parsePojoIntoDTO(bookPojo: BookPojo): BookDTO {
    const bookDTO: BookDTO = {
      id_book: bookPojo.dataValues.id_book,
      name: bookPojo.dataValues.name,
      summary: bookPojo.dataValues.summary,
      isbn: bookPojo.dataValues.isbn,
      id_author: bookPojo.dataValues.id_author,
      language: bookPojo.dataValues.language,
    };

    return bookDTO;
  }

  parseDTOIntoPojo(bookDTO: BookDTO): BookPojo {
    let bookPojo = new BookPojo()
    bookPojo.setDataValue("id_book", null)
    bookPojo.setDataValue("name", bookDTO.name)
    bookPojo.setDataValue("summary", bookDTO.summary)
    bookPojo.setDataValue("isbn", bookDTO.isbn)
    bookPojo.setDataValue("id_author", bookDTO.id_author)
    bookPojo.setDataValue("language", bookDTO.language)
    return bookDTO as BookPojo;
  }
}