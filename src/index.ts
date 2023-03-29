import express from "express";
import bookRouter from './routes/book.router'
import userRoutes from './routes/user.routes'

const app = express()
const cors = require('cors')
const PORT = 5000
const whiteList = ['http://localhost:4200']

app.use(express.json())
app.use(cors({origin: whiteList}))

app.get("/ping", (_req, res) => {
  console.log("Se ha hecho un ping")
  res.send("Pong")
});

app.use('/api/book',bookRouter)
app.use('/api/user', userRoutes)
app.use('/api/chat', userRoutes)

app.listen(PORT, () => {
  console.log(`Servidor escuchando en el puerto ${PORT}`)
});