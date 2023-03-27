import { copyController } from "../controllers/copy.controller";
import express from 'express'


const router = express.Router()
router.get('/get/:id', copyController.getAllCopysByBook)


export default router
module.exports = router
