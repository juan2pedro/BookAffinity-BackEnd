import { Sequelize } from "sequelize-typescript";
import { AuthorPojo } from "../models/author.model";
import { BookPojo } from "../models/book.model";
import { BookCategoriesPojo } from "../models/book-categories";
import { CategoryPojo } from "../models/category.model";
import { ImgBookPojo } from "../models/img-book.model";
import { CommentPojo } from "../models/comment.model";
import { ImgCommentPojo } from "../models/img-comment.model";

export const connect = () => {
    
    const HOST = !(process.env.DB_HOST == null) ? process.env.DB_HOST : 'localhost'
    const PORT = !(process.env.DB_PORT == null) ? process.env.DB_PORT : 5432
    const DB_USERNAME = 'postgres'
    const DB_PASSWORD = 'postgres'
    const DB_NAME = !(process.env.DB_NAME == null) ? process.env.DB_NAME : 'postgres'
    const DB_SCHEMA = 'BookAffinity'
    const DB_DIALECT : any = 'postgres'

    const sequelize = new Sequelize(DB_NAME, DB_USERNAME, DB_PASSWORD, {
        host: HOST,
        dialect: DB_DIALECT,
        schema: DB_SCHEMA,
        port: +PORT,
        repositoryMode: true,
        pool: {
            max: 10,
            min: 0,
            acquire: 20000,
            idle: 5000
        }
    })

    sequelize.addModels([AuthorPojo, BookPojo, BookCategoriesPojo, CategoryPojo, ImgBookPojo, CommentPojo, ImgCommentPojo])
    const db : any = {}
    db.Sequelize = Sequelize
    db.sequelize = sequelize

    return db
}