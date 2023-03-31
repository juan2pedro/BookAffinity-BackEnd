import { BookController } from "../controllers/book.controller";
// import { CommentsController} from "../controllers/comment.controller.ts"
// import { AuthorController} from "../controllers/author.controller.ts"
// import {CategoryController} from "../controllers/category.controller.ts"
import express from "express"

const router = express.Router()

//Books
router.get('/all',BookController.getAllBooks)
router.post('/add',BookController.addBook)
router.get('/id/:id_book',BookController.getBookById)
router.put('/update/:id_book',BookController.updateBook)
//router.post('/status/:id_book',BookController.changeStatusBook)
router.delete('/delete/:id_book',BookController.deleteBook) // Necesita verificarse que está como no visible para poder borrarlo
//Comments
// router.get('/all',CommentsController.getAllComments)
// router.get('/id/:id_comment', CommentsController.getCommentById)
// router.post('/add',CommentsController.addComment)
// //Author
// router.get('/all', AuthorController.getAllAuthor)
// router.get('/id/:id_author', AuthorController.getAuthorById)
// //Category
// router.get('/all', CategoryController.getAllCategories )



export default router
module.exports = router