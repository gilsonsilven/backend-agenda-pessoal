import express from 'express'
import { PORT } from './config.js' 

const api = express()

api.get('/', (req, res) => {
    res.json({message: "Bem-vindo a API"})
})

api.listen(PORT, () => {
    console.log(`Servidor rodando na porta http://localhost:${PORT}`)
})