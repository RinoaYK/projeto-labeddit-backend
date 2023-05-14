import express from 'express'
import { IdGenerator } from '../services/IdGenerator'
import { TokenManager } from '../services/TokenManager'
import { CommentDatabase } from '../database/CommentDatabase'
import { CommentBusiness } from '../business/CommentBusiness'
import { CommentController } from '../controller/CommentController'

export const commentRouter = express.Router()

const commentController = new CommentController(
    new CommentBusiness(
        new CommentDatabase(),
        new IdGenerator(),
        new TokenManager()
    )
)

commentRouter.post("/:id", commentController.createComment);

commentRouter.get("/", commentController.getComments);
commentRouter.get("/post/:id", commentController.getCommentsByPost);
commentRouter.get("/:nickname", commentController.getCommentsByUserNickname);

commentRouter.put("/:id", commentController.editComment);
commentRouter.delete("/:id", commentController.deleteComment);

commentRouter.put("/:id/like", commentController.likeOrDislikeComment);
