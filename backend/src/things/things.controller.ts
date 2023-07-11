import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { ThingsService } from './things.service';
import { Prisma } from '@prisma/client';

@Controller('things')
export class ThingsController {
  constructor(private readonly thingsService: ThingsService) {}

  @Post()
  create(@Body() createThingDto: Prisma.ThingCreateInput) {
    return this.thingsService.create(createThingDto);
  }

  @Get()
  findAll() {
    return this.thingsService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.thingsService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateThingDto: Prisma.ThingUpdateInput) {
    return this.thingsService.update(+id, updateThingDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.thingsService.remove(+id);
  }
}
