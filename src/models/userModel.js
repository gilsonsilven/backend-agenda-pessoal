import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient()

export const create = async (user) => {
    const result = await prisma.users.create({
        data: user
    })
}

/// arrumar depois
export const getById = async (id) => {
    const user = await prisma.users.findUnique({
        where: {
           id_user:1 
        }
    })
    return user
}