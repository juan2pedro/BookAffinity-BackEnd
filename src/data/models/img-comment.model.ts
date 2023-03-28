import { Table, Column, Model } from "sequelize-typescript";
import { STRING, NUMBER } from "sequelize";
import { ForeignKey, BelongsTo } from 'sequelize-typescript';
import { CommentPojo } from './comment.model';

@Table({
  freezeTableName: true,
  schema: 'BookAffinity',
  tableName: "img_comment",
  createdAt: false,
  updatedAt: false
})
export class ImgCommentPojo extends Model {
  @Column({
    primaryKey: true,
    type: NUMBER,
    field: 'id_img_comment',
    autoIncrement: true
  })
  id_img_comment: number

  @Column({
    type: STRING,
    field: 'rute'
  })
  rute: string

  @ForeignKey(() => CommentPojo)
  @Column
  id_comment: number;

  @BelongsTo(() => CommentPojo)
  comment: CommentPojo;
}
