import { CommentPojo } from "../models/comment.model";
import { connect } from "../config/author.db.config";

export class CommentRepository {
  _db: any = {};
  _commentRepository: any;

  constructor() {
    this._db = connect();
    this._commentRepository = this._db.sequelize.getRepository(CommentPojo);
  }

  async getAllComments(): Promise<CommentPojo[]> {
    try {
      const comment = await this._commentRepository.findAll();
      console.log("comment:::", comment);
      return comment;
    } catch (error) {
      console.error(error);
      return [];
    }
  }

  async addComment(newComment: CommentPojo): Promise<number> {
    try {
      newComment = await this._commentRepository.create(newComment);
      return newComment.id;
    } catch (error) {
      console.log(error);
      return -1;
    }
  }
}
