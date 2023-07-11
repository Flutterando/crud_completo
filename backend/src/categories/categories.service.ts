import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/common/prisma/prisma.service';


@Injectable()
export class CategoriesService {

  constructor(private readonly prisma: PrismaService) {}

  create(createCategoryDto: Prisma.CategoryCreateInput) {
    return this.prisma.category.create({
      data: createCategoryDto
    });
  }

  update(id: number, updateCategoryDto: Prisma.CategoryUpdateInput) {
    return this.prisma.category.update({
      data: updateCategoryDto,
      where: {
        id: id
      }
    });
  }

  findAll() {
    return this.prisma.category.findMany();
  }

  findOne(id: number) {
    return this.prisma.category.findUnique({
      where: {
        id: id
      }
    });
  }


  remove(id: number) {
    return this.prisma.category.delete({
      where: {
        id: id
      }
    });
  }
}
