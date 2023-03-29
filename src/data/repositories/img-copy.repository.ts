import { ImgCopyPojo } from "../models/img-copy.model";
import { connect } from "../config/copy.db.config";

export class ImgCopyRepository {
  _db: any = {};
  _imgCopyRepository: any;

  constructor() {
    this._db = connect();
    this._imgCopyRepository = this._db.sequelize.getRepository(ImgCopyPojo);
  }

  async getAllImgCopiesByBook(id: number): Promise<ImgCopyPojo[]> {
    try {
      const imgCopies = await this._imgCopyRepository.findAll({
        where: {
          id_img_copy: id,
        },
      });
      console.log("imgCopies:::", imgCopies);
      return imgCopies;
    } catch (error) {
      console.error(error);
      return [];
    }
  }

  async createImgCopy(newImgCopy: ImgCopyPojo): Promise<number> {
    try {
      newImgCopy = await this._imgCopyRepository.create(newImgCopy);
      return newImgCopy.id_img_copy;
    } catch (error) {
      console.error(error);
      return -1;
    }
  }

}
