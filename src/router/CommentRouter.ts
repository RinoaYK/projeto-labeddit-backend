import express from 'express'
import { IdGenerator } from '../services/IdGenerator'
import { TokenManager } from '../services/TokenManager'
import { CommentDatabase } from '../database/CommentDatabase'
import { CommentBusiness } from '../business/CommentBusiness'
import { CommentController } from '../controller/CommentController'

export const CommentRouter = express.Router()

const commentController = new CommentController(
    new CommentBusiness(
        new CommentDatabase(),
        new IdGenerator(),
        new TokenManager()
    )
)
