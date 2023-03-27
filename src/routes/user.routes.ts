import { userController } from '../controllers/user.controller'
import express from 'express'

const router = express.Router()

router.get('/get/:email/:pass', userController.getUserbyEmailAndPassword)
router.post('/add', userController.addUser)
router.get('/get/:id', userController.getUserById)


export default router
module.exports = router
