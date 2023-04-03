import { ChatPojo } from './../models/chat.model';
import { UserPojo } from "../models/user.model";
import { connect } from "../config/chat.db.config";
import { Op } from 'sequelize';


export class ChatRepository {
_db: any = {};
_userRepository: any;
_chatRepository: any;

constructor() {
    this._db = connect();
    this._userRepository = this._db.sequelize.getRepository(UserPojo);
    this._chatRepository = this._db.sequelize.getRepository(ChatPojo);
}

async getChatbyUserId(id:number) : Promise<ChatPojo[] | undefined>{
    try{
        return await this._chatRepository.findAll({
            where : {
                [Op.or] : [
                    {
                        id_user1 : id
                    },{
                        id_user2 : id
                    }
                ]
            }
        },{ include : this._userRepository })
    }catch (error) {
        console.error(error)
        return undefined
    }

}




}