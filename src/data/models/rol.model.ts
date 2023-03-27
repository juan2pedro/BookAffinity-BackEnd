import { Table, Column, Model } from "sequelize-typescript";
import { STRING, NUMBER } from "sequelize";
import { UserPojo } from "./user.model";
import { HasMany } from "sequelize-typescript";

@Table({
freezeTableName: true,
schema: 'BookAffinity',
tableName: "rol",
})
export class RolPojo extends Model {
@Column({
    primaryKey: true,
    type: NUMBER,
    field: 'id_rol',
    autoIncrement: true
})
id_rol: number

@Column({
    type: STRING,
    field: 'name'
})
name: string

@HasMany(() => UserPojo)
user: UserPojo[]

}
