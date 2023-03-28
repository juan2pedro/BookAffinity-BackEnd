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
        booksAsPojo.forEach((booksAsPojo) => {
          let bookAsDTO = this.parsePojoIntoDTO(booksAsPojo);
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

  parsePojoIntoDTO(booksPojo: BookPojo): BookDTO {
    const booksDTO: BookDTO = {
      id_book: booksPojo.dataValues.id_book,
      name: booksPojo.dataValues.name,
      summary: booksPojo.dataValues.summary,
      isbn: booksPojo.dataValues.isbn,
      id_author: booksPojo.dataValues.id_author,
      language: booksPojo.dataValues.language,
    };

    return booksDTO;
  }

  parseDTOIntoPojo(booksDTO: BookDTO): BookPojo {

    return booksDTO as BookPojo;
  }
}