import express from "express";
import cryptoRouter from './routes/crypto.routes'
import userRouter from './routes/user.routes'
import userscryptosRouter from './routes/userscryptos.routes'

const app = express()
const cors = require('cors')

app.use(express.json())

const PORT = 5000

const whiteList = ['http://localhost:4200']

app.use(cors({origin: whiteList}))

app.get("/ping", (_req, res) => {
  console.log("Se ha hecho un ping")
  res.send("Pong")
});

app.use('/api/crypto', cryptoRouter)
app.use('/api/user', userRouter)
app.use('/api/userscryptos', userscryptosRouter)

app.listen(PORT, () => {
  console.log(`Servidor escuchando en el puerto ${PORT}`)
});