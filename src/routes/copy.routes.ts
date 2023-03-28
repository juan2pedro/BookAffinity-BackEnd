import { copyController } from "../controllers/copy.controller";
import express from 'express'


const router = express.Router()
router.get('/get/book/:id', copyController.getAllCopiesByBook)
router.get('/get/user/:id', copyController.getAllCopiesByUser)
router.post('/create', copyController.createCopy)
router.put('/update', copyController.updateCopy)


export default router
module.exports = router
