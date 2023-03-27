import { Table, Column, Model } from "sequelize-typescript";
import { STRING, NUMBER, DATE } from "sequelize";

@Table({
  freezeTableName: true,
  schema: 'public',
  tableName: "users",
  createdAt: false,
  updatedAt: false
})
export class UserPojo extends Model {
  @Column({
    primaryKey: true,
    type: STRING,
    field: 'user_id'
  })
  user_id: string

  @Column({
    type: STRING,
    field: 'username'
  })
  username: string

  @Column({
    type: STRING,
    field: 'password'
  })
  password: string

  @Column({
    type: STRING,
    field: 'email'
  })
  email: string

  @Column({
    type: STRING,
    field: 'name'
  })
  name: string

  @Column({
    type: STRING,
    field: 'surname1'
  })
  surname1: string

  @Column({
    type: STRING,
    field: 'surname2'
  })
  surname2: string

  @Column({
    type: DATE,
    field: 'birthdate'
  })
  birthdate: Date

  @Column({
    type: NUMBER,
    field: 'funds'
  })
  funds: number
}