import express from "express";
<<<<<<< HEAD
import copyRouter from "./routes/copy.routes";
=======
import userRoutes from "./routes/user.routes";
>>>>>>> origin/dev

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

app.use('/api/user', userRoutes)
app.use('/api/chat', userRoutes)

app.listen(PORT, () => {
  console.log(`Servidor escuchando en el puerto ${PORT}`)
});

app.use('/api/copies', copyRouter);