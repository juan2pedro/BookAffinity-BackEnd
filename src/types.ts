export class AuthorDTO {
  id_author: number;
  name_author: string;
}
export class BookDTO {
  id_book: number;
  name: string;
  summary?: string;
  isbn: number;
  id_author?: number;
  author?: AuthorDTO;
  language?: number;
  categories?: CategoryDTO[];
  category?: CategoryDTO;
  comments?: CommentDTO[];
  picture?: string;

}
export class BookCategoriesDTO {
  id_book_categories: number;
  id_category: number;
  category? : CategoryDTO;
  id_book: number;
}
export class CategoryDTO {
  id_category: number;
  name_category: number;
}

export class ChatDTO {
    id_chat: number
    id_user1:number
    id_user2:number
    user1? : ChatUserDTO
    user2? : ChatUserDTO
}

export class CommentDTO {
  id_comment: number;
  rating: number;
  text?: string;
  id_book: number;
  id_user: number;
}
export class CopyDTO {
  id_copy: number;
  price: number;
  visible: number;
  status: string;
  id_user: number;
  id_book: number;
  imgs : ImgCopyDTO[];
  user?: UserDTO
}
export class InvoiceDTO {
  id_invoice: number;
  id_copy: number;
  id_user: number;
}
export class ImgBookDTO {
  id_img_book: number;
  rute: string;
  id_book?: number;
}
export class ImgCommentDTO {
  id_img_comment: number;
  rute: string;
  id_comment?: number;
}
export class ImgCopyDTO {
  id_img_copy: number;
  rute: string;
  id_copy?: number;
}
export class MessageDTO {
  id_message: number;
  text: string;
  date: Date;
  id_chat: number;
}
export class RolDTO {
  id_rol: number;
  name: string;
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
  createdAt?: Date
  updatedAt?: Date
}



export type NewUserDTO = Omit<UserDTO, 'id_user'>
export type NewBookDTO = Omit<BookDTO, 'id_book'>
export type NewChatDTO = Omit<ChatDTO, 'id_chat'>
export type NewCommentDTO = Omit<CommentDTO, 'id_comment'>
export type NewCopyDTO = Omit<CopyDTO, 'id_copy'>
export type NewInvoiceDTO = Omit<InvoiceDTO, 'id_invoice'>
export type NewMessageDTO = Omit<MessageDTO, 'userid'>
export type ChatUserDTO = Omit<UserDTO, 'pass'>
