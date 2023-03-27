import { Table, Column, Model, ForeignKey, BelongsTo } from "sequelize-typescript";
import { NUMBER } from "sequelize";
import { UserPojo } from "./user.model";


@Table({
freezeTableName: true,
schema: 'BookAffinity',
tableName: "chat",
})
export class ChatPojo extends Model {
@Column({
    primaryKey: true,
    type: NUMBER,
    field: 'id_chat',
    autoIncrement: true
})
id_chat: number

@ForeignKey(()=> UserPojo)
@Column({
    type: NUMBER,
    field: 'id_user1'
})
id_user1: Number

@BelongsTo(()=>UserPojo)
user1: UserPojo

@ForeignKey(()=> UserPojo)
@Column({
    type: NUMBER,
    field: 'id_user2'
})
id_user2: Number

@BelongsTo(()=>UserPojo)
user2: UserPojo

}
