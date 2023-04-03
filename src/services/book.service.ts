import { BookPojo } from "../data/models/book.model";
import { CategoryPojo } from "../data/models/category.model";
import { CommentPojo } from "../data/models/comment.model";
import { ImgBookPojo } from "../data/models/img-book.model";
import { BookRepository } from "../data/repositories/book.repository";
import { AuthorDTO, BookDTO, CategoryDTO, CommentDTO, ImgBookDTO } from "../types";

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

  async getBookById(id_book: number): Promise<BookDTO | undefined> {
    const bookPromise = await this._bookRepository
      .getBookById(id_book)
      .then((bookAsPojo) => {
        console.log(bookAsPojo);
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
      updateBook(bookPojo).then(id_book => { return id_book })
      .catch(error => {
        console.error(error);
        throw error
      })
    return bookPromise
  }

  parsePojoIntoDTO(bookPojo: BookPojo): BookDTO {
    const authorDTO: AuthorDTO = {
      id_author: bookPojo.dataValues.author?.dataValues.id_author,
      name_author: bookPojo.dataValues.author?.dataValues.name_author,
    }

    const bookDTO: BookDTO = {
      id_book: bookPojo.dataValues.id_book,
      name: bookPojo.dataValues.name,
      summary: bookPojo.dataValues.summary,
      isbn: bookPojo.dataValues.isbn,
      id_author: bookPojo.dataValues.id_author,
      author: authorDTO,
      language: bookPojo.dataValues.language,
      categories: [],
      imgs: [],
      comments: [],
    };

    if (!!bookPojo.dataValues.img && bookPojo.dataValues.img.length > 0) {
      bookPojo.dataValues.img.forEach((img: ImgBookPojo) => {
        const imgBookDTO: ImgBookDTO = {
          id_img_book: img.dataValues.id_img_book,
          rute: img.dataValues.rute,
          id_book: img.dataValues.id_book,
        }
        bookDTO.imgs.push(imgBookDTO)
      })
      return bookDTO;
    }

    if (!!bookPojo.dataValues.comment && bookPojo.dataValues.comment.length > 0) {
      bookPojo.dataValues.comment.forEach((comment: CommentPojo) => {
        const commentDTO: CommentDTO = {
          id_comment: comment.dataValues.id_comment,
          rating: comment.dataValues.rating,
          text: comment.dataValues.text,
          id_book: comment.dataValues.id_book,
          id_user: comment.dataValues.id_user,
        }
        bookDTO.comments.push(commentDTO)
      })
      return bookDTO;
    }

    if (!!bookPojo.dataValues.categories && bookPojo.dataValues.categories.length > 0) {
      bookPojo.dataValues.categories.forEach((category: CategoryPojo) => {
        const categoryDTO: CategoryDTO = {
          id_category: category.dataValues.id_category,
          name_category: category.dataValues.name_category,
        }
        bookDTO.categories.push(categoryDTO)
      })
    }
    return bookDTO;
  }

  parseDTOIntoPojo(bookDTO: BookDTO): BookPojo {
    return bookDTO as unknown as BookPojo;
  }
}