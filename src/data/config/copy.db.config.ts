import { Sequelize } from "sequelize-typescript";
import { ChatPojo } from "../models/chat.model";
import { CopyPojo } from "../models/copy.model";
import { InvoicePojo } from "../models/invoice.model";
import { RolPojo } from "../models/rol.model";
import { UserPojo } from "../models/user.model";

export const connect = () => {
    const DB_HOSTNAME = 'localhost'
    const DB_PORT = 5432
    const DB_NAME = 'BookAffinity_db'
    const DB_USERNAME = 'Admin'
    const DB_PASSWORD = 'admin'
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

    sequelize.addModels([CopyPojo, InvoicePojo, UserPojo, RolPojo, ChatPojo])
    const db : any = {}
    db.Sequelize = Sequelize
    db.sequelize = sequelize

    return db
}