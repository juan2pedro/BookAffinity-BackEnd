import { ImgCommentPojo } from "../models/img-comment.model";
import { connect } from "../config/img-comment.db.config";

export class ImgCommentRepository {
  _db: any = {};
  _imgcommentRepository: any;

  constructor() {
    this._db = connect();
    this._imgcommentRepository =
      this._db.sequelize.getRepository(ImgCommentPojo);
  }

  async getAllImgComments(): Promise<ImgCommentPojo[]> {
    try {
      const imgcomment = await this._imgcommentRepository.findAll();
      console.log("imgcomment:::", imgcomment);
      return imgcomment;
    } catch (error) {
      console.error(error);
      return [];
    }
  }

  async addImgComment(newImgComment: ImgCommentPojo): Promise<number> {
    try {
      newImgComment = await this._imgcommentRepository.create(newImgComment);
      return newImgComment.id;
    } catch (error) {
      console.log(error);
      return -1;
    }
  }
}
