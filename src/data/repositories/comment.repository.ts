import { CommentPojo } from "../models/comment.model";
import { connect } from "../config/comment.db.config";

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

  async getCommentById(id_comment: number): Promise<CommentPojo | undefined> {
    try {
      return this._commentRepository.findByPk(id_comment);

    } catch (error) {
      console.error(error);
      return error;
    }
  }
  
  async getAllCommentsByBookId(id: number): Promise<CommentPojo[]> {
    try {
      const comments = await this._commentRepository.findAll({
        where: {
          id_comment: id,
        },
      });
      console.log("comments:::", comments);
      return comments;
    } catch (error) {
      console.error(error);
      return [];
    }
  }
}
