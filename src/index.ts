import express from "express";
import copyRouter from "./routes/copy.routes";

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

app.listen(PORT, () => {
  console.log(`Servidor escuchando en el puerto ${PORT}`)
});

app.use('/api/copies', copyRouter);