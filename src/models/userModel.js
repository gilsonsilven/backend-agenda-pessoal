import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient()

export const create = async (user) => {
    const result = await prisma.users.create({
        data: user
    })
}


export const getById = async (id) => {
    const user = await prisma.users.findUnique({
        where: {
           id_user:id
        },
        select: {
            id_user: true,
            name: true,
            emailprim: true,
            birth_date: true,
            phone: true,
            address: true
        }
    })
    return user
}


export const remove = async (id) => {
    const user = await prisma.users.delete({
        where: {
           id_user:id 
        }
    })
    return user
}

export const update = async (user) => {
    const result = await prisma.users.update({
        where: {
            id_user: user.id
        },
        data: user,
        select: {
            id: true,
            name: true,
            email: true,
            emailprim: true,
            phone: true,
            address: true
        }
    })
    return result
}
