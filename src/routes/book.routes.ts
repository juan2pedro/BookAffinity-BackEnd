import { bookController } from './../controllers/book.controller';

import express from 'express'

const router = express.Router()

router.get('/all', bookController.getAllBooks)

export default router
module.exports = router
