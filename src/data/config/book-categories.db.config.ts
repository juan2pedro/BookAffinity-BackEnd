import { Sequelize } from "sequelize-typescript";
import { BookCategoriesPojo } from "../models/book-categories";
import { CategoryPojo } from "../models/category.model";
export const connect = () => {
    
    const HOST = !(process.env.DB_HOST == null) ? process.env.DB_HOST : 'localhost'
    const PORT = !(process.env.DB_PORT == null) ? process.env.DB_PORT : 5432
    const DB_USERNAME = !(process.env.DB_USER == null) ? process.env.DB_USER : 'postgres'
    const DB_PASSWORD = !(process.env.DB_PASSWORD == null) ? process.env.DB_PASSWORD : 'postgres'
    const DB_NAME = 'BookAffinity_db'
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

    sequelize.addModels([BookCategoriesPojo, CategoryPojo])
    const db : any = {}
    db.Sequelize = Sequelize
    db.sequelize = sequelize

    return db
}