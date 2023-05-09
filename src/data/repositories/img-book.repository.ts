import { ImgBookPojo } from "../models/img-book.model";
import { connect } from "../config/img-book.db.config";

export class ImgBookRepository {
  _db: any = {};
  _imgbookRepository: any;

  constructor() {
    this._db = connect();
    this._imgbookRepository = this._db.sequelize.getRepository(ImgBookPojo);
  }

  async getAllImgs(): Promise<ImgBookPojo[]> {
    try {
      const img = await this._imgbookRepository.findAll();
      console.log("img:::", img);
      return img;
    } catch (error) {
      console.error(error);
      return [];
    }
  }

  async addImg(newImg: ImgBookPojo): Promise<number> {
    try {
      newImg = await this._imgbookRepository.create(newImg);
      return newImg.id;
    } catch (error) {
      console.log(error);
      return -1;
    }
  }
  async getImgByIdBook(id_img_book: number): Promise<ImgBookPojo | undefined> {
    try {
      return this._imgbookRepository.findByPk(id_img_book);

    } catch (error) {
      console.error(error);
      return error;
    }
  }
}
