import { ChatPojo } from './../models/chat.model';
import { UserPojo } from "../models/user.model";
import { MessagePojo } from '../models/message.model';
import { connect } from "../config/user.db.config"; 

export class ChatRepository {
_db: any = {};
_userRepository: any;
_chatRepository: any;
_messageRepository: any;

    constructor() {
        this._db = connect();
        this._userRepository = this._db.sequelize.getRepository(UserPojo);
        this._chatRepository = this._db.sequelize.getRepository(ChatPojo);
        this._messageRepository = this._db.sequelize.getRepository(MessagePojo);
    }


    async addMessage (newMessage: MessagePojo) : Promise<string>{
        try{
            newMessage= await this._messageRepository.create(newMessage)
            return newMessage.id
        } catch (error) {
            console.log(error)
            return 'ok'
        }
    }

    async getMessageByChatId(id : string) : Promise<MessagePojo[] | undefined>{
        try {
            return await this._messageRepository.findByPk(id)
        } catch (error) {
            console.error(error)
            return undefined
        }
    }
}