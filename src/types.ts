export class BookDTO {
    id_book: number
    name: string
    summary?: string
    isbn: number
    id_author?: number
    language?: number
}

export class UserDTO {
    user_id: string
    username: string
    password: string
    email: string
    name: string
    surname1: string
    surname2?: string
    birthdate: Date
    funds: number
}

export class CopyDTO {
    id_copy: number
    visible: number
    price: number
    status: string
    id_user : number
    id_book : number
}
