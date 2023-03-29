import { userController } from '../controllers/user.controller'
import express from 'express'

const router = express.Router()

router.get('/get/:email/:pass', userController.getUserbyEmailAndPassword)
router.post('/add', userController.addUser)
router.post('/add', userController.addMessage)
router.get('/all', userController.getAllUsers)
router.get('/get/:id', userController.getUserById)
router.post('/get/by-list', userController.getUserByChatIdList)
router.get('/get/:id', userController.getMessagebyChatId)
router.get('/get/:id', userController.getChatbyUserId)



export default router
module.exports = router
