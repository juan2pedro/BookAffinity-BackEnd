import { Table, Column, Model } from "sequelize-typescript";
import { STRING, NUMBER } from "sequelize";
import { AuthorPojo } from "./author.model";
import { ForeignKey, BelongsTo } from "sequelize-typescript";

@Table({
  freezeTableName: true,
  schema: 'BookAffinity',
  tableName: "book",
  createdAt: false,
  updatedAt: false
})
export class BookPojo extends Model {
  @Column({
    primaryKey: true,
    type: NUMBER,
    field: 'id_book',
    autoIncrement: true
  })
  id_book: number

  @Column({
    type: STRING,
    field: 'name'
  })
  name: string

  @Column({
    type: STRING,
    field: 'summary'
  })
  value: string

  @Column({
    type: NUMBER,
    field: 'isbn'
  })
  isbn: number

  @ForeignKey(() => AuthorPojo)
  @Column({
    type: NUMBER,
    field: 'id_author'
  })
  id_author: number

  @BelongsTo(() => AuthorPojo)
  author: AuthorPojo

  @Column({
    type: NUMBER,
    field: 'language'
  })
  language: number
  
}
