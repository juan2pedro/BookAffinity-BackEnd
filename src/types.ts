export class BookDTO {
    id_book: number
    name: string
    summary?: string
    isbn: number
    id_author?: number
    language?: number
}

export class RolDTO{
id_rol: number
name: string
}

export class UserDTO {
    id_user: number
    name: string
    pass: string
    picture: string
    email: string
    status: number
    id_rol: string
    rol?: RolDTO
    chats?: ChatDTO[]
    createdAt: Date
    updatedAt: Date
}

export type NewUserDTO = Omit<UserDTO, 'user_id'>

export class ChatDTO {
    id_chat: number
    id_user1:number
    id_user2:number
}

export type newMessage = Omit<ChatDTO, 'id_chat'>
