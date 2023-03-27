export class BookDTO {
    id_book: number
    name: string
    summary?: string
    isbn: number
    id_author?: number
    language?: number
}

export class UserDTO {
    id_user: number
    name: string
    pass: string
    picture: string
    email: string
    status: number
    id_rol: string
    createAt: Date
    updateAt: Date
}
