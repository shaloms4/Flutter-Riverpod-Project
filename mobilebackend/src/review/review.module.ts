import { Module } from '@nestjs/common';
import { ReviewService } from './review.service';
import { ReviewController } from './review.controller';
import { PrismaService } from 'src/prisma/prisma.service';
import { ConfigService } from '@nestjs/config';

@Module({
  controllers: [ReviewController],
  providers: [ReviewService,PrismaService, ConfigService],
})
export class ReviewModule {}

