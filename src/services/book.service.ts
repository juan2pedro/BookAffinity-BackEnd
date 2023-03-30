import { BookRepository } from "../data/repositories/book.repository";
import { BookPojo } from "../data/models/book.model";
import { BookDTO} from "../types";
import { AuthorRepository } from "../data/repositories/author.repository";
import { AuthorPojo } from "../data/models/author.model";
import { AuthorDTO } from "../types";

export class BookService {
  _bookRepository: BookRepository;
  _authorRepository: AuthorRepository;

  constructor() {
    this._bookRepository = new BookRepository();
    this._authorRepository = new AuthorRepository();
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

  async getBookById(id_book: number): Promise<BookDTO | undefined> {
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

  async deleteBook(id_book: number): Promise<any> {
    const bookPromise = await this._bookRepository
      .deleteBook(id_book)
      .then((book_id) => {
        return book_id;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return bookPromise;
  }
  async updateBook(bookUpdated: BookDTO): Promise<number> {
    const bookPojo: BookPojo = this.parseDTOIntoPojo(bookUpdated)
    const bookPromise = await this._bookRepository.
      updateBook(bookPojo).then(bookId => { return bookId })
      .catch(error => {
        console.error(error);
        throw error
      })
    return bookPromise
  }

  async getAllAuthors(): Promise<AuthorDTO[]> {
    const authorsPromise = await this._authorRepository
      .getAllAuthors()
      .then((authorsAsPojo) => {
        let authorsAsDTO: AuthorDTO[] = [];
        authorsAsPojo.forEach((authorAsPojo) => {
          let authorAsDTO = this.parseAuthorPojoIntoDTO(authorAsPojo);
          authorsAsDTO.push(authorAsDTO);
        });
        return authorsAsDTO;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return authorsPromise;
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

  parseAuthorPojoIntoDTO(authorPojo: AuthorPojo): AuthorDTO {
    const authorDTO: AuthorDTO = {
      id_author: authorPojo.dataValues.id_author,
      name_author: authorPojo.dataValues.name_author,
    };

    return authorDTO;
  }

  parseAuthorDTOIntoPojo(authorDTO: AuthorDTO): AuthorPojo {

    return authorDTO as AuthorPojo;
  }
}