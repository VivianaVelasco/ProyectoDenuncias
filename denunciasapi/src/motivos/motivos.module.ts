import { Module } from '@nestjs/common';
import { MotivosService } from './services/motivos.service';
import { MotivosController } from './controllers/motivos.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Motivos } from './motivos.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Motivos])],
  providers: [MotivosService],
  controllers: [MotivosController],
  exports: [MotivosService],
})
export class MotivosModule {}
