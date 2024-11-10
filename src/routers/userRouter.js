import express from 'express'
import createUser from '../controllers/user/createUser.js'
import getUserById from '../controllers/user/getUserById.js'


const router = express.Router()

router.post('/', createUser)
router.get('/', getUserById)


export default router