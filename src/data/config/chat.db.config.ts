import { UserPojo } from './../models/user.model';
import { Sequelize } from "sequelize-typescript";
import { ChatPojo } from "../models/chat.model";

export const connect = () => {
    const DB_HOSTNAME = 'localhost'
    const DB_PORT = 5432
    const DB_NAME = 'BookAffinity_db'
    const DB_USERNAME = 'cami'
    const DB_PASSWORD = 'Caracola3!'
    const DB_SCHEMA = 'Bookaffinity'
    const DB_DIALECT : any = 'postgres'

    const sequelize = new Sequelize(DB_NAME, DB_USERNAME, DB_PASSWORD, {
        host: DB_HOSTNAME,
        dialect: DB_DIALECT,
        schema: DB_SCHEMA,
        port: DB_PORT,
        repositoryMode: true,
        pool: {
            max: 10,
            min: 0,
            acquire: 20000,
            idle: 5000
        }
    })

    sequelize.addModels([ChatPojo, UserPojo])
    const db : any = {}
    db.Sequelize = sequelize
    db.sequelize = sequelize

    return db
}