import { RolDTO } from './../types';
import { UserRepository } from "../data/repositories/user.repository";
import { ChatRepository } from "../data/repositories/chat.repository";
import { UserPojo } from "../data/models/user.model";
import { ChatPojo } from "../data/models/chat.model";

import { UserDTO } from "../types";
import { ChatDTO } from "../types";
export class UserService {
  _userRepository: UserRepository;
  _chatRepository: ChatRepository;


  constructor() {
    this._userRepository = new UserRepository();
    this._chatRepository = new ChatRepository();


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

// async getAllChats() : Promise<ChatDTO[]>{
//   const messagePromise = await this._chatRepository.getAllMessage().then(chatsAsPojo =>{
//       let chatsAsDto : ChatDTO[] = []
//       chatsAsPojo.forEach(chatAsPojo => {
//           let chatAsDto = this.parsePojoIntoDTO(chatAsPojo)
//           chatsAsDto.push(chatAsDto)
//       })
//       return chatsAsDTO
//   }) .catch(error=>{
//       console.log(error)
//       throw error
//   })
//   return messagePromise
// }


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

  // async getUserByIdList (ids : number[] ) : Promise<UserDTO[]> {
    
  // }

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

  parsePojoIntoChatDtos(userPojo: UserPojo): ChatDTO[] {
    const chats : ChatPojo[] = userPojo.dataValues.chats
    let chatDtos : ChatDTO[] = []
    if(!!chats && chats.length > 0) {
      chats.forEach(chatPojo => {
        const chatDto : ChatDTO = {
          id_chat: chatPojo.dataValues.id_chat,
          id_user1: chatPojo.dataValues.id_user1,
          id_user2: chatPojo.dataValues.id_user2
        }
        chatDtos.push(chatDto)
      })
    } 

    return chatDtos
  }
  

  parseDTOIntoPojo(userDTO: UserDTO): UserPojo {

    return userDTO as unknown as UserPojo;
  }
}

