import { CopyPojo } from './copy.model';
import { Table, Column, Model } from "sequelize-typescript";
import { STRING, NUMBER } from "sequelize";
import { HasMany } from "sequelize-typescript";

@Table({
  freezeTableName: true,
  schema: 'BookAffinity',
  tableName: "author",
  createdAt: false,
  updatedAt: false
})
export class AuthorPojo extends Model {
  @Column({
    primaryKey: true,
    type: NUMBER,
    field: 'id_author',
    autoIncrement: true
  })
  id_author: number

  @Column({
    type: STRING,
    field: 'name_author'
  })
  name_author: string

  @HasMany(() => BookPojo)
  books: BookPojo[]

}
