import { BookController } from './../controllers/book.controller';
import express from 'express'

const router = express.Router()

router.get('/get/book/all',BookController.getAllBooks)                   // Funciona
router.get('/get/comment/:id',BookController.getCommentById)           
router.get('/get/comment/all/:id',BookController.getAllCommentsByBookId)
router.get('/get/author/all',BookController.getAllAuthors)               // Funciona
router.post('/add',BookController.addBook)                               // Fallo de ejecución
router.get('/get/:id_book',BookController.getBookById)                   // Fallo de ejecución
router.put('/update/:id_book',BookController.updateBook)                 // Fallo de ejecución
router.post('/status/:id_book',BookController.changeStatusBook)          // No comprobado
router.delete('/delete/:id_book',BookController.deleteBook)              // Necesita verificarse que está como no visible para poder borrarlo

export default router
module.exports = router