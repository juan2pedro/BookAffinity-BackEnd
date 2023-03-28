import { BookService } from "../services/book.service";
const bookService: BookService = new BookService();

export const BookController = {
  getAllBooks: (_req: any, res: any) => {
    bookService
      .getAllBooks()
      .then((result) => {
        res.json(result);
      })
      .catch((excepcion) => {
        console.error(excepcion);
        res.send(500);
      });
  },

  getBookById: (req: any, res: any) => {
    try {
      const id_book = req.params.id;
      bookService.getBookById(id_book).then(result => {
        res.json(result);
      });
    } catch (excepcion) {
      console.log(excepcion);
      res.sendStatus(500);
    }
  },

  addBook: (req: any, res: any) => {
    try {
      const newBook = req.body;
      bookService.addBook(newBook).then((result) => {
        res.json(result);
      });
    } catch (excepcion) {
      console.log(excepcion);
      res.sendStatus(500);
    }
  },

  updateBook: (req: any, res: any) => {
    try {
      const newBook = req.body;
      bookService.updateBook(newBook).then((result) => {
        res.json(result);
      });
    } catch (excepcion) {
      console.log(excepcion);
      res.sendStatus(500);
    }
  },
  changeStatusBook: (req: any, res: any) => {
    try {
      const newBook = req.body;
      bookService.updateBook(newBook).then((result) => {
        res.json(result);
      });
    } catch (excepcion) {
      console.log(excepcion);
      res.sendStatus(500);
    }
  },
  deleteBook :(req : any, res : any)=>{
    try {
      const id_book = req.params.id;
      bookService.deleteBook(id_book).then((result) => {
        res.json(result);
      });
    } catch (excepcion) {
      console.log(excepcion);
      res.sendStatus(500);
    }
  }
  
};
