import { CopyPojo } from "../models/copy.model";
import { connect } from "../config/copy.db.config";

export class CopyRepository {
  _db: any = {};
  _copyRepository: any;

  constructor() {
    this._db = connect();
    this._copyRepository = this._db.sequelize.getRepository(CopyPojo);
  }

  async getAllCopysByBook(id : number): Promise<CopyPojo[]> {
    try {
      const copys = await this._copyRepository.findAll({
        where: {
          id_book : id,
          //password: 'passwordDeUsuario'
        },
      });
      console.log("copys:::", copys);
      return copys;
    } catch (error) {
      console.error(error);
      return [];
    }
  }
}
