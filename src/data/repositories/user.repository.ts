import { UserPojo } from "../models/user.model";
import { connect } from "../config/user.db.config";

export class UserRepository {
    _db: any = {}
    _userRepository: any

    constructor(){
        this._db = connect()
        this._userRepository = this._db.sequelize.getRepository(UserPojo)
    }

    async getAllUsers() : Promise<UserPojo[]> {
        try {
            const users = await this._userRepository.findAll()
            console.log('users:::', users)
            return users
        } catch (error) {
            console.error(error)
            return []
        }
    }

    async getUserById(id : number) : Promise<UserPojo | undefined> {
        try {
            return await this._userRepository.findByPk(id)
        } catch (error) {
            console.error(error)
            return undefined
        }
    }

    async addUser(newUser : UserPojo) : Promise<number> {
        try {
            newUser = await this._userRepository.create(newUser)
            return newUser.id
        } catch (error) {
            console.log(error)
            return -1
        }
    }

    async updateUser(newUser: UserPojo): Promise<string> {
        try {
            newUser = await this._userRepository.update(newUser, {
            where: {
              user_id: newUser.user_id,
            },
          });
          return newUser.id;
        } catch (error) {
          console.error(error);
          return error.toString();
        }
      }
}