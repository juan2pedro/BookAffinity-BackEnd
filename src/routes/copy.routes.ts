import { copyController } from "../controllers/copy.controller";
import express from 'express'

const router = express.Router()

router.get('/get/copy/:id', copyController.getAllCopiesByBook) // Funciona
router.get('/get/user/:id', copyController.getAllCopiesByUser) // Funciona
router.post('/add/create', copyController.createCopy)          // No funciona
router.put('/update', copyController.updateCopy)               // Funciona

export default router
module.exports = router
