import { Sequelize } from "sequelize-typescript";
import { CategoryPojo } from "../models/category.model";
import propertiesreader from 'properties-reader'

export const connect = () => {
    
    var properties = propertiesreader('./src/db_config.properties');

    const USERNAME = properties.get('username');
    const PASSWORD = properties.get('password');

    const DB_HOSTNAME = 'localhost'
    const DB_PORT = 5432
    const DB_NAME = 'BookAffinity_db'
    const DB_USERNAME = USERNAME
    const DB_PASSWORD = PASSWORD
    const DB_SCHEMA = 'BookAffinity'
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

    sequelize.addModels([CategoryPojo])
    const db : any = {}
    db.Sequelize = Sequelize
    db.sequelize = sequelize

    return db
}