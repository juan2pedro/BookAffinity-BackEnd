import { ChatPojo } from './chat.model';
import { Table, Column, Model, HasMany } from "sequelize-typescript";
import { STRING, NUMBER, DATE } from "sequelize";
import { RolPojo } from './rol.model';
import { ForeignKey, BelongsTo } from "sequelize-typescript";
import { CopyPojo } from './copy.model';

@Table({
freezeTableName: true,
schema: "BookAffinity",
tableName: "user",
createdAt: true,
updatedAt: true,
})
export class UserPojo extends Model {
@Column({
    primaryKey: true,
    type: NUMBER,
    field: "id_user",
    autoIncrement: true,
})
id_user: number;

@Column({
    type: STRING,
    field: "name",
})
name: string;

@Column({
    type: STRING,
    field: "pass",
})
pass: string;

@Column({
    type: STRING,
    field: "picture",
})
picture: string;

@Column({
    type: STRING,
    field: "email",
})
email: string;

@Column({
    type: NUMBER,
    field: "status",
})
status: number;

@ForeignKey(() => RolPojo)
@Column({
    type: NUMBER,
    field: "id_rol",
})
id_rol: number;

@BelongsTo(() => RolPojo)
rol: RolPojo;

@HasMany(() => CopyPojo)
copy: CopyPojo[]

@HasMany(()=>ChatPojo)
chats: ChatPojo[]

@Column({
    type: DATE,
    field: "createdAt",
})
createdAt: Date;

@Column({
    type: DATE,
    field: "updatedAt",
})
updatedAt: Date;
    user_id: any;
}
