import { Table, Column, Model } from "sequelize-typescript";
import { STRING, NUMBER } from "sequelize";
import { BelongsTo, ForeignKey, HasMany } from "sequelize-typescript";
import { BookPojo } from "./book.model";
import { ImgCommentPojo } from "./img-comment.model";
import { UserPojo } from "./user.model";

@Table({
  freezeTableName: true,
  schema: 'BookAffinity',
  tableName: "comment",
  createdAt: false,
  updatedAt: false
})
export class CommentPojo extends Model {
  @Column({
    primaryKey: true,
    type: NUMBER,
    field: 'id_comment',
    autoIncrement: true
  })
  id_comment: number

  @Column({
    type: NUMBER,
    field: 'rating'
  })
  rating: number

  @Column({
    type: STRING,
    field: 'text'
  })
  text: string

  @ForeignKey(() => BookPojo)
  @Column
  id_book: number;

  @ForeignKey(() => UserPojo)
  @Column
  id_user: number;

  @BelongsTo(() => BookPojo)
  book: BookPojo;


  @HasMany(() => ImgCommentPojo)
  imgComment: ImgCommentPojo[]
}
