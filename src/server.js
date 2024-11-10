import express from 'express'
import { PORT } from './config.js' 
import userRouter from '../src/routers/userRouter.js'

const api = express()

api.get('/', (req, res) => {
    res.json({message: "Bem-vindo a API"})
})

//////////////////////////////////////////

// middle que converte o request body json para objeto
api.use(express.json())

api.use('/user', userRouter)
/////////////////////////////////
api.listen(PORT, () => {
    console.log(`Servidor rodando na porta http://localhost:${PORT}`)
})