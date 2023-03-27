import { UserRepository } from "../data/repositories/user.repository";
import { UserPojo } from "../data/models/user.model";
import { UserDTO } from "../types";

export class UserService {
  _userRepository: UserRepository;

  constructor() {
    this._userRepository = new UserRepository();
  }

  async getAllUsers(): Promise<UserDTO[]> {
    const usersPromise = await this._userRepository
      .getAllUsers()
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

  async getUserById(id: any): Promise<UserDTO | undefined> {
    const userPromise = await this._userRepository
      .getUserById(id)
      .then((userAsPojo) => {
        if (!!userAsPojo) {
          return this.parsePojoIntoDTO(userAsPojo);
        } else return undefined;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return userPromise;
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

  async updateUser(user: UserDTO): Promise<any> {
    const cryptoPojo: UserPojo = this.parseDTOIntoPojo(user);
    const cryptoPromise = await this._userRepository
      .updateUser(cryptoPojo)
      .then((user_id) => {
        return user_id;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return cryptoPromise;
  }

  parsePojoIntoDTO(userPojo: UserPojo): UserDTO {
    const userDTO: UserDTO = {
      user_id: userPojo.dataValues.user_id,
      username: userPojo.dataValues.username,
      password: userPojo.dataValues.password,
      email: userPojo.dataValues.email,
      name: userPojo.dataValues.name,
      surname1: userPojo.dataValues.surname1,
      surname2: userPojo.dataValues.surname2,
      birthdate: userPojo.dataValues.birthdate,
      funds: userPojo.dataValues.funds,
    };

    return userDTO;
  }

  parseDTOIntoPojo(userDTO: UserDTO): UserPojo {

    return userDTO as UserPojo;
  }
}