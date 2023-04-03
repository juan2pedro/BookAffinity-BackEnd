import { BookPojo } from "../data/models/book.model";
import { AuthorRepository } from "../data/repositories/author.repository";
import { AuthorPojo } from "../data/models/author.model";
import { CategoryPojo } from "../data/models/category.model";
import { CommentPojo } from "../data/models/comment.model";
import { ImgBookPojo } from "../data/models/img-book.model";
import { BookRepository } from "../data/repositories/book.repository";
<<<<<<< HEAD
import { AuthorDTO, BookDTO, CategoryDTO, CommentDTO, ImgBookDTO } from "../types";
=======
import { AuthorDTO, BookDTO, CategoryDTO, ImgBookDTO } from "../types";
import { ImgBookRepository } from "../data/repositories/img-book.repository";
import { ImgBookPojo } from "../data/models/img-book.model";
>>>>>>> origin/dev

export class BookService {

  _bookRepository: BookRepository;
  _authorRepository: AuthorRepository;
  _imgBookRepository: ImgBookRepository;

  constructor() {
    this._bookRepository = new BookRepository();
    this._authorRepository = new AuthorRepository();
    this._imgBookRepository = new ImgBookRepository();
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
  async getImgByIdBook(id_img_book: number): Promise<ImgBookDTO | undefined> {
    const imgBookPromise = await this._imgBookRepository
      .getImgByIdBook(id_img_book)
      .then((imgBookAsPojo) => {
        console.log(imgBookAsPojo);
        if (!!imgBookAsPojo) {
          return this.parseImgBookPojoIntoDTO(imgBookAsPojo);
        } else return undefined;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return imgBookPromise;
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
      comments: [],
      picture: bookPojo.dataValues.imgBook[0]?.dataValues.rute
    };
    // Array de imagenes de libros
    // if (!!bookPojo.dataValues.img && bookPojo.dataValues.img.length > 0) {
    //   bookPojo.dataValues.img.forEach((img: ImgBookPojo) => {
    //     const imgBookDTO: ImgBookDTO = {
    //       id_img_book: img.dataValues.id_img_book,
    //       rute: img.dataValues.rute,
    //       id_book: img.dataValues.id_book,
    //     }
    //     bookDTO.imgs.push(imgBookDTO)
    //   })
    //   return bookDTO;
    // }

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

  parseImgBookPojoIntoDTO(imgBookPojo: ImgBookPojo): ImgBookDTO {
    const imgBookDTO : ImgBookDTO ={
      id_img_book: imgBookPojo.dataValues.id_img_book,
      rute: imgBookPojo.dataValues.id_img_book
    };
    return imgBookDTO
  }

  parseDTOIntoPojo(bookDTO: BookDTO): BookPojo {
    return bookDTO as unknown as BookPojo;
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