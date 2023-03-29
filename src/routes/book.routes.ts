import { BookController } from './../controllers/book.controller';

import express from 'express'

const router = express.Router()

router.get('/all', BookController.getAllBooks)

export default router
module.exports = router
