import { userscryptosController } from './../controllers/userscryptos.controller';
import express from 'express'

const router = express.Router()

router.get('/all', userscryptosController.getAllUsersCryptos)
router.get('/get/:id', userscryptosController.getUsersCryptosById)
router.post('/add', userscryptosController.addUsersCryptos)
router.put('/update', userscryptosController.updateUsersCryptos)

export default router
module.exports = router
