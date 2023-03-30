import { Table, Column, Model } from "sequelize-typescript";
import { STRING, NUMBER } from "sequelize";
import { BelongsTo, BelongsToMany, ForeignKey, HasMany } from "sequelize-typescript";
import { BookCategoriesPojo } from "./book-categories";
import { AuthorPojo } from './author.model';
import { ImgBookPojo } from './img-book.model';
import { CategoryPojo } from "./category.model";
import { CommentPojo } from './comment.model';


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
  summary: string

  @Column({
    type: NUMBER,
    field: 'isbn'
  })
  isbn: number

  @Column({
    type: NUMBER,
    field: 'language'
  })
  language: number

  @Column({
    type: NUMBER,
    field: 'status'
  })
  status: number

  @BelongsToMany(() => CategoryPojo, () => BookCategoriesPojo)
  categories: CategoryPojo[];

  @HasMany(() => ImgBookPojo)
  imgBook: ImgBookPojo[];

  @HasMany(() => CommentPojo)
  comment: CommentPojo[];

  @ForeignKey(() => AuthorPojo)
  @Column({
    type: NUMBER,
    field: 'id_author'
  })
  id_author: number;

  @BelongsTo(() => AuthorPojo)
  author: AuthorPojo;
}