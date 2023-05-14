import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma.service';
import { Teachers, Prisma } from '@prisma/client';
@Injectable()
export class TeacherService {
  constructor(private prisma: PrismaService) {}

  async teacher(
    teacherWhereUniqueInput: Prisma.TeachersWhereUniqueInput,
  ): Promise<Teachers | null> {
    return this.prisma.teachers.findUnique({
      where: teacherWhereUniqueInput,
    });
  }

  async createTeacher(data: Prisma.TeachersCreateInput): Promise<Teachers> {
    return this.prisma.teachers.create({
      data,
    });
  }
}
