import express from 'express'
import { PORT } from './config.js' 
import userRouter from '../src/routers/userRouter.js'
import cors from 'cors'

const app = express()

app.use(cors())
app.get('/', (req, res) => {
    res.json({message: "Bem-vindo a API"})
})

//////////////////////////////////////////

// middle que converte o request body json para objeto
app.use(express.json())

app.use('/user', userRouter)
/////////////////////////////////
app.listen(PORT, () => {
    console.log(`Servidor rodando na porta http://localhost:${PORT}`)
})