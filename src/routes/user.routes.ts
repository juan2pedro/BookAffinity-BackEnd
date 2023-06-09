import { userController } from '../controllers/user.controller'
import express from 'express'

const router = express.Router()

router.post('/login', userController.getUserbyEmailAndPassword)
router.post('/add/user', userController.addUser)
router.post('/add/message', userController.addMessage)
router.post('/create/chat', userController.addChat)// <------ TODO: implementar
router.get('/get/all', userController.getAllUsers)                          // Funciona
router.get('/get/user/:id', userController.getUserById)                     // Funciona
router.post('/get/user/by-list', userController.getUserByChatIdList)        // No comprobado
router.get('/get/message/:id', userController.getMessagebyChatId)
router.get('/get/chat/:id', userController.getChatbyUserId)

export default router
module.exports = router
