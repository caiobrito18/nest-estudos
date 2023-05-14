import {
  Controller,
  Get,
  Param,
  Post,
  Body,
  Put,
  Delete,
} from '@nestjs/common';
import { Teachers } from '@prisma/client';
import { TeacherService } from './teacher.service';

@Controller('teacher')
export class TeacherController {
  constructor(private readonly teacherService: TeacherService) {}

  @Get('/:id')
  async getTeacherById(@Param('id') id: number): Promise<Teachers> {
    return this.teacherService.teacher({ id: Number(id) });
  }

  @Post('/signin')
  async signInTeacher(
    @Body()
    teacherData: {
      user: string;
      name: string;
      password: string;
      field: string;
      content: Array<any | null>;
    },
  ) {
    return this.teacherService.createTeacher(teacherData);
  }
}
