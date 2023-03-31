import { Table, Column, Model, ForeignKey, BelongsTo
 } from "sequelize-typescript";
import { NUMBER, STRING } from "sequelize";
import { ChatPojo } from "./chat.model";


@Table({
freezeTableName: true,
schema: 'BookAffinity',
tableName: "message",
})
export class MessagePojo extends Model {
@Column({
    primaryKey: true,
    type: NUMBER,
    field: 'id_message',
    autoIncrement: true
})
id_message: number

@Column({
    type: STRING,
    field: 'text'
})
text: string


@Column({
    type: STRING,
    field: 'date'
})
date: string

@ForeignKey(()=> ChatPojo)
@Column({
    type: STRING,
    field: 'id_chat'
})
id_chat: string

@BelongsTo(() => ChatPojo)
chat: ChatPojo[]

}
