import { Module } from '@nestjs/common';
import { PrismaService } from 'src/prisma.service';
import { TeacherController } from 'src/teacher/teacher.controller';
import { TeacherModule } from 'src/teacher/teacher.module';
import { TeacherService } from 'src/teacher/teacher.service';
import { AppController } from '../app/app.controller';
import { AppService } from '../app/app.service';

@Module({
  imports: [],
  controllers: [AppController, TeacherController],
  providers: [AppService, TeacherService, PrismaService],
})
export class AppModule {}
