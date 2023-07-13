import { Module } from '@nestjs/common';
import { ThingsService } from './things.service';
import { ThingsController } from './things.controller';
import { CommonModule } from 'src/common/common.module';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  imports: [CommonModule, AuthModule],
  controllers: [ThingsController],
  providers: [ThingsService]
})
export class ThingsModule {}
