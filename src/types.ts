export class BookDTO {
    id_book: number
    name: string
    summary?: string
    isbn: number
    id_author?: number
    language?: number
}
export class AuthorDTO {
    id_author: number
    name_author: string
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