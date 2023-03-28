import express from "express";
import bookRouter from './routes/book.router'

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

app.use('/api/book',bookRouter)
app.listen(PORT, () => {
  console.log(`Servidor escuchando en el puerto ${PORT}`)
});