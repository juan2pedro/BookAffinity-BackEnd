import { BookController } from './../controllers/book.controller';
import express from 'express'

const router = express.Router()

router.get('/all', BookController.getAllBooks)
router.get('/id/:id_book',BookController.getBookById)
router.post('/add',BookController.addBook)
router.put('/update',BookController.updateBook)
router.delete('/delete/:id_book',BookController.deleteBook)
router.get('/category/all',BookController.getAllCategory)
export default router
module.exports = router
