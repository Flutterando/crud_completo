import { Module } from '@nestjs/common';
import { PrismaService } from './prisma/prisma.service';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  providers: [PrismaService],
  exports: [PrismaService]
})
export class CommonModule {}
