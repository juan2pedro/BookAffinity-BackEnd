import { ChatPojo } from './../models/chat.model';
import { UserPojo } from "../models/user.model";
import { connect } from "../config/user.db.config";

export class ChatRepository {
_db: any = {};
_userRepository: any;
_chatRepository: any;

    constructor() {
        this._db = connect();
        this._userRepository = this._db.sequelize.getRepository(UserPojo);
        this._chatRepository = this._db.sequelize.getRepository(ChatPojo);
    }

    async getChatByUserId(id : string) : Promise<ChatPojo[] | undefined>{
        try {
            return await this._chatRepository.findByPk(id)
        } catch (error) {
            console.error(error)
            return undefined
        }
    }

}