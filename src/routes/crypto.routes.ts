import { cryptoController } from '../controllers/crypto.controller';
import express from 'express'

const router = express.Router()

router.get('/all', cryptoController.getAllCryptos)
router.get('/get/:id', cryptoController.getCryptoById)
router.post('/add', cryptoController.addCrypto)
router.put('/update', cryptoController.updateCrypto)

export default router
module.exports = router
