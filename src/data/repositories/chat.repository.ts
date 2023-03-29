import { ChatPojo } from './../models/chat.model';
import { UserPojo } from "../models/user.model";
import { connect } from "../config/chat.db.config";

export class ChatRepository {
_db: any = {};
_userRepository: any;
_chatRepository: any;

constructor() {
    this._db = connect();
    this._userRepository = this._db.sequelize.getRepository(UserPojo);
    this._chatRepository = this._db.sequelize.getRepository(ChatPojo);
}


async getAllMessage(): Promise <ChatPojo[]>{
    try {
        return await this._chatRepository.findAll()
    } catch (error){
        console.error(error)
        return []
    }
}


async addMessage (newMessage: ChatPojo) : Promise<string>{
    try{
        newMessage= await this._chatRepository.create(newMessage)
        return newMessage.id
    } catch (error) {
        console.log(error)
        return 'ok'
    }
}
}