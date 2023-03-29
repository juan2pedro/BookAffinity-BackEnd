import { RolPojo } from "./../models/rol.model";
import { UserPojo } from "../models/user.model";
import { connect } from "../config/user.db.config";

export class UserRepository {
  _db: any = {};
  _userRepository: any;
  _rolRepository: any;

  constructor() {
    this._db = connect();
    this._userRepository = this._db.sequelize.getRepository(UserPojo);
    this._rolRepository = this._db.sequelize.getRepository(RolPojo);
  }

  async getUserbyEmailAndPassword(
    email: string,
    password: string
  ): Promise<UserPojo[]> {
    try {
      const user = await this._userRepository.findOne({
        where: {
          email: email,
          password: password,
        },
      });
      console.log("user:::", user);
      return user;
    } catch (error) {
      console.error(error);
      return [];
    }
  }
  async getAllUsers(): Promise<UserPojo[]> {
    try {
      return await this._userRepository.findAll();
    } catch (error) {
      console.error(error);
      return [];
    }
  }
  async getUserbyId(id: number): Promise<UserPojo | undefined> {
    try {
      return await this._userRepository.findByPk(id, {
        include: [this._rolRepository],
      });
    } catch (error) {
      console.error(error);
      return undefined;
    }
  }

  async addUser(newUser: UserPojo): Promise<number> {
    try {
      newUser = await this._userRepository.create(newUser);
      return newUser.id;
    } catch (error) {
      console.log(error);
      return -1;
    }
  }
}
