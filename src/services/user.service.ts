import { RolDTO, ChatUserDTO, NewMessageDTO, NewChatDTO, NewUserDTO, ChatDTO, MessageDTO } from './../types';
import { UserRepository } from "../data/repositories/user.repository";
import { ChatRepository } from "../data/repositories/chat.repository";
import { MessageRepository } from "../data/repositories/message.repository";
import { UserPojo } from "../data/models/user.model";
import { ChatPojo } from "../data/models/chat.model";

import { UserDTO } from "../types";
import { MessagePojo } from '../data/models/message.model';
export class UserService {
  _userRepository: UserRepository;
  _chatRepository: ChatRepository;
  _messageRepository: MessageRepository;

  constructor() {
    this._userRepository = new UserRepository();
    this._chatRepository = new ChatRepository();
    this._messageRepository = new MessageRepository();
  }

  async getUserbyEmailAndPassword(email:string, pass:string): Promise<UserDTO[]> {
    const usersPromise = await this._userRepository
      .getUserbyEmailAndPassword(email, pass)
      .then((usersAsPojo) => {
        let usersAsDTO: UserDTO[] = [];
        usersAsPojo.forEach((userAsPojo) => {
          let userAsDTO = this.parsePojoIntoDTO(userAsPojo);
          usersAsDTO.push(userAsDTO);
        });
        return usersAsDTO;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return usersPromise;
  }
  async getAllUsers() : Promise<UserDTO[]>{
    const userPromise = await this._userRepository.getAllUsers().then(usersAsPojo =>{
        let usersAsDto : UserDTO[] = []
        usersAsPojo.forEach(userAsPojo => {
            let userAsDto = this.parsePojoIntoDTO(userAsPojo)
            usersAsDto.push(userAsDto)
        })
        return usersAsDto
    }) .catch(error=>{
        console.log(error)
        throw error
    })
    return userPromise
}

// GET USER CHATS!!!!
// DESPUÉS, GET USER BY ID LIST
// (CLICK) => GET CHAT MESSAGES BY CHAT ID



  async addUser(user: UserDTO): Promise<number> {
    const userPojo: UserPojo = this.parseDTOIntoPojo(user);
    const userPromise = await this._userRepository
      .addUser(userPojo)
      .then((user_id) => {
        return user_id;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return userPromise;
  }
  async addMessage(message: NewMessageDTO): Promise<number> {
    const messagePojo: MessagePojo = this.parseDTOIntoMessagePojo(message);
    const messagePromise = await this._messageRepository
      .addMessage(messagePojo)
      .then((message_id) => {
        return message_id;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return messagePromise;
  }
  async getUserbyId (id:number) : Promise<UserDTO | undefined>{
    const userPromise = await this._userRepository.getUserbyId(id).then(userAsPojo =>{
        if(!!userAsPojo) {
          console.log(userAsPojo)
          return this.parsePojoIntoDTO(userAsPojo)
        }
        else
            return undefined 
        }) .catch(error=>{
            console.log(error)
            throw error
    })
    return userPromise
  }
  async getMessagebyChatId(id_chat:number): Promise<MessageDTO[]> {
    const messagesPromise = await this._messageRepository
      .getMessagebyChatId(id_chat)
      .then((messagesAsPojo) => {
        let messagesAsDTO: MessageDTO[] = [];
        messagesAsPojo.forEach((messageAsPojo) => {
          let messageAsDTO = this.parsePojoIntoMessageDtos(messageAsPojo);
          messagesAsDTO.push(messageAsDTO);
        });
        return messagesAsDTO;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return messagesPromise;
  }

  async getChatbyUserId (id:number) : Promise<ChatDTO[]>{
    const chatPromise = await this._chatRepository.getChatbyUserId(id).then(chatsAsPojo =>{
        if(!!chatsAsPojo && chatsAsPojo.length > 0) {
          console.log(chatsAsPojo)
          let chatsAsDTO : ChatDTO[]
          chatsAsPojo.forEach(chatAsPojo => {
            let chatAsDTO = this.parsePojoIntoChatDtos(chatAsPojo)
            let user1AsDTO = this.parseUserPojoFromChatPojoToUserDto(chatAsPojo.dataValues.user1)
            chatAsDTO.user1 = user1AsDTO
            let user2AsDTO = this.parseUserPojoFromChatPojoToUserDto(chatAsPojo.dataValues.user2)
            chatAsDTO.user2 = user2AsDTO
            chatsAsDTO.push(chatAsDTO)
          })
          return chatsAsDTO
        }
        else
            return [] 
      }) .catch(error=>{
          console.log(error)
          throw error
    })
    return chatPromise
  }
  async updateUser(user: UserDTO): Promise<number> {
    const userPojo: UserPojo = this.parseDTOIntoPojo(user);
    const userPromise = await this._userRepository
      .updateUser(userPojo)
      .then((id_copy) => {
        return id_copy;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return userPromise;
  }

  async getUserByChatIdList (ids_chat : number[] ) : Promise<UserDTO[]> {
    const userPromise = await this._userRepository.getUserByChatIdList(ids_chat).then(usersAsPojo =>{
      if(!!usersAsPojo) {
        let userList : UserDTO[]
        console.log(usersAsPojo)
        usersAsPojo.forEach(userAsPojo => {
          userList.push(this.parsePojoIntoDTO(userAsPojo))
          })        
        return userList
      }
      else
          return undefined 
      }) .catch(error=>{
          console.log(error)
          throw error
    })
    return userPromise
  }

  parsePojoIntoDTO(userPojo: UserPojo): UserDTO {
    const rolDTO: RolDTO = {
      id_rol: userPojo.dataValues.rol?.dataValues.id_rol,
      name: userPojo.dataValues.rol?.dataValues.name
    }
    const userDTO: UserDTO = {
      id_user: userPojo.dataValues.user_id,
      name: userPojo.dataValues.name,
      pass: userPojo.dataValues.pass,
      picture: userPojo.dataValues.picture,
      email: userPojo.dataValues.email,
      status: userPojo.dataValues.status,
      id_rol: userPojo.dataValues.id_rol,
      createdAt: userPojo.dataValues.createdAt,
      updatedAt: userPojo.dataValues.updatedAt,
      rol: rolDTO
    };

    return userDTO;
  }

  parsePojoIntoChatDtos(chatPojo: ChatPojo): ChatDTO {
    let chatDto : ChatDTO = {
      id_chat: chatPojo.dataValues.id_chat,
      id_user1: chatPojo.dataValues.id_user1,
      id_user2: chatPojo.dataValues.id_user2
    }

    return chatDto
  }

  parseUserPojoFromChatPojoToUserDto(userPojo: UserPojo) : ChatUserDTO {
    let userDto : ChatUserDTO = {
      id_user: userPojo.dataValues.user_id,
      name: userPojo.dataValues.name,
      picture: userPojo.dataValues.picture,
      email: userPojo.dataValues.email,
      status: userPojo.dataValues.status,
      id_rol: userPojo.dataValues.id_rol,
      createdAt: userPojo.dataValues.createdAt,
      updatedAt: userPojo.dataValues.updatedAt
    }

    return userDto
  }

  parsePojoIntoMessageDtos(messagePojo: MessagePojo): MessageDTO {
    let messageDto : MessageDTO = {
      id_message: messagePojo.dataValues.id_message,
      text: messagePojo.dataValues.text,
      date: messagePojo.dataValues.date,
      id_chat: messagePojo.dataValues.id_chat,

    }

    return messageDto
  }
  

  parseDTOIntoPojo(userDTO: NewUserDTO): UserPojo {

    return userDTO as unknown as UserPojo;
  }

  parseChatDTOIntoPojo(chatDTO: NewChatDTO): ChatPojo {

    return chatDTO as unknown as ChatPojo;
  }

  parseDTOIntoMessagePojo(meesageDTO: MessageDTO): MessagePojo {

    return meesageDTO as unknown as MessagePojo;
  }
}

