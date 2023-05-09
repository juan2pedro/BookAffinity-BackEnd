import { RolPojo } from "./../models/rol.model";
import { UserPojo } from "../models/user.model";
import { connect } from "../config/user.db.config";
import { Op } from 'sequelize';
// ↑ alternativa -> const { Op } = require("sequelize");

export class UserRepository {
  _db: any = {};
  _userRepository: any;
  _rolRepository: any;

  constructor() {
    this._db = connect();
    this._userRepository = this._db.sequelize.getRepository(UserPojo);
    this._rolRepository = this._db.sequelize.getRepository(RolPojo);
  }

    async getUserbyEmailAndPassword(email:string, pass:string): Promise<UserPojo> {
        try {
            const user = await this._userRepository.findOne({
                where: {
                    email: email,
                    pass: pass
                }
            });
            console.log("user:::", user);
            return user;
        } catch (error) {
            console.error(error);
        return error;
        }
    }
    async getAllUsers(): Promise <UserPojo[]>{
        try {
            return await this._userRepository.findAll({ include : [this._rolRepository] })
        } catch (error){
            console.error(error)
            return []
        }
    }
    async updateUser(newUser: UserPojo): Promise<number> {
        try {
        await this._userRepository.update({
            name: newUser.name,
            pass: newUser.pass,
            picture: newUser.picture,
            email: newUser.email,
            status: newUser.status,
            id_rol : newUser.id_rol,
            createdAt : newUser.createdAt,
            updatedAt : newUser.updatedAt,

        }, {
            where: {
            id_user: newUser.id_user
            },
        });
        return newUser.id_user;
        } catch (error) {
        console.error(error);
        return error.toString();
        }
    }
    async getUserbyId(id:number) : Promise<UserPojo | undefined>{
        try{
            return await this._userRepository.findByPk(id)
        }catch (error) {
            console.error(error)
            return undefined
        }
    }

    async addUser (newUser: UserPojo) : Promise<number>{
        try{
            newUser = await this._userRepository.create(newUser)
            console.log("%%%%%%%%%" + newUser.id_user)
            return newUser.id_user
        } catch (error) {
            console.log(error)
            return -1
        }
    }
    async getUserByChatIdList(id_chats : number[]) : Promise<UserPojo[] | undefined>{
        try {
            return await this._userRepository.findOne({
                where: {
                    id_chat: {
                    [Op.or]: id_chats
                    }
                }
            })
        } catch (error) {
            console.error(error)
            return undefined
        }
    }
}
