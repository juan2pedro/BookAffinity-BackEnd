import { BookPojo } from "../data/models/book.model";
import { AuthorRepository } from "../data/repositories/author.repository";
import { AuthorPojo } from "../data/models/author.model";
import { CategoryPojo } from "../data/models/category.model";
import { BookRepository } from "../data/repositories/book.repository";
import { CommentRepository } from "../data/repositories/comment.repository";
import { AuthorDTO, BookDTO, CategoryDTO, CommentDTO, ImgBookDTO } from "../types";
import { CommentPojo } from "../data/models/comment.model";
import { ImgBookRepository } from "../data/repositories/img-book.repository";
import { ImgBookPojo } from "../data/models/img-book.model";

export class BookService {
  _bookRepository: BookRepository;
  _authorRepository: AuthorRepository;
  _imgBookRepository: ImgBookRepository;
  _commentRepository: CommentRepository;

  constructor() {
    this._bookRepository = new BookRepository();
    this._authorRepository = new AuthorRepository();
    this._imgBookRepository = new ImgBookRepository();
    this._commentRepository = new CommentRepository();
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

  async getcommentById(id_comment: number): Promise<CommentDTO | undefined> {
    const commentPromise = await this._commentRepository
      .getCommentById(id_comment)
      .then((commentAsPojo) => {
        console.log(commentAsPojo);
        if (!!commentAsPojo) {
          return this.parseCommentPojoIntoDTO(commentAsPojo);
        } else return undefined;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return commentPromise;
  }

  async getAllCommentsByBookId(id : number): Promise<CommentDTO[]> {
    const commentPromise = await this._commentRepository
      .getAllCommentsByBookId(id)
      .then((commentsAsPojo) => {
        let commentsAsDto: CommentDTO[] = [];
        commentsAsPojo.forEach((commentAsPojo) => {
          let commentAsDto = this.parseCommentPojoIntoDTO(commentAsPojo);
          commentsAsDto.push(commentAsDto);
        });
        return commentsAsDto;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });

    return commentPromise;
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
      updateBook(bookPojo).then(id_book=> { return id_book })
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
    const authorDTO : AuthorDTO ={
      id_author: bookPojo.dataValues.author?.dataValues.id_author,
      name_author: bookPojo.dataValues.author?.dataValues.name_author,
    }
    
    const bookDTO: BookDTO = {
      id_book: bookPojo.dataValues.id_book,
      name: bookPojo.dataValues.name,
      summary: bookPojo.dataValues.summary,
      isbn: bookPojo.dataValues.isbn,
      id_author: bookPojo.dataValues.id_author,
      author :authorDTO,
      language: bookPojo.dataValues.language,
      categories: [],
      picture: bookPojo.dataValues.imgBook[0]?.dataValues.rute
    };

    if(!!bookPojo.dataValues.categories && bookPojo.dataValues.categories.length > 0){
      bookPojo.dataValues.categories.forEach((category: CategoryPojo) => {  
        const categoryDTO : CategoryDTO ={
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

  parseImgBookPojoIntoDTO(imgBookPojo: ImgBookPojo): ImgBookDTO {
    const imgBookDTO : ImgBookDTO ={
      id_img_book: imgBookPojo.dataValues.id_img_book,
      rute: imgBookPojo.dataValues.id_img_book
    };
    return imgBookDTO
  }

  parseCommentPojoIntoDTO(commentPojo: CommentPojo): CommentDTO {
    const commentDTO: CommentDTO = {
      id_comment: commentPojo.dataValues.id_comment,
      rating: commentPojo.dataValues.rating,
      text: commentPojo.dataValues.text,
      id_book: commentPojo.dataValues.id_book,
      id_user: commentPojo.dataValues.id_user,
    };

    return commentDTO;
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