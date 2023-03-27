import { userController } from '../controllers/user.controller'
import express from 'express'

const router = express.Router()

router.get('/all', userController.getAllUsers)
router.get('/get/:id', userController.getUserById)
router.post('/add', userController.addUser)
router.put('/update', userController.updateUser)

export default router
module.exports = router
