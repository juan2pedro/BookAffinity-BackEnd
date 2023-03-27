import { UserPojo } from "../models/user.model";
import { connect } from "../config/user.db.config";
import { v4 as uuid } from 'uuid'

export class UserRepository {
_db: any = {};
_userRepository: any;

constructor() {
    this._db = connect();
    this._userRepository = this._db.sequelize.getRepository(UserPojo);
}

async getUserbyEmailAndPassword(email:string, password:string): Promise<UserPojo[]> {
    try {
        const user = await this._userRepository.findOne({
            where: {
                email: email,
                password: password
            }
        });
        console.log("user:::", user);
        return user;
    } catch (error) {
        console.error(error);
    return [];
    }
}
async getAllUsers(): Promise <UserPojo[]>{
    try {
        return await this._userRepository.findAll()
    } catch (error){
        console.error(error)
        return []
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
        newUser.user_id = uuid()
        newUser= await this._userRepository.create(newUser)
        return newUser.id
    } catch (error) {
        console.log(error)
        return -1
    }
}
}