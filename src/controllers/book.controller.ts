import { BookService } from "../services/book.service";
const bookService: BookService = new BookService();

export const bookController = {
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
};
