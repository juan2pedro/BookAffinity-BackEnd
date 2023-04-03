import { CategoryController } from '../controllers/category.controller';
import express from 'express'

const router = express.Router()


router.get('/all',CategoryController.getAllCategorys)

export default router
module.exports = router
