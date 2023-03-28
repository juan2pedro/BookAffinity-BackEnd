import { UserRepository } from "../data/repositories/user.repository";
import { UserPojo } from "../data/models/user.model";
import { UserDTO } from "../types";

export class UserService {
  _userRepository: UserRepository;

  constructor() {
    this._userRepository = new UserRepository();
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
        if(!!userAsPojo)
            return this.parsePojoIntoDTO(userAsPojo)
        else
            return undefined 
        }) .catch(error=>{
            console.log(error)
            throw error
    })
    return userPromise
}

  // async updateUser(user: UserDTO): Promise<any> {
  //   const cryptoPojo: UserPojo = this.parseDTOIntoPojo(user);
  //   const cryptoPromise = await this._userRepository
  //     .updateUser(cryptoPojo)
  //     .then((user_id) => {
  //       return user_id;
  //     })
  //     .catch((error) => {
  //       console.error(error);
  //       throw error;
  //     });
  //   return cryptoPromise;
  // }

  parsePojoIntoDTO(userPojo: UserPojo): UserDTO {
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
    };

    return userDTO;
  }

  parseDTOIntoPojo(userDTO: UserDTO): UserPojo {

    return userDTO as unknown as UserPojo;
  }
}