import { Module } from '@nestjs/common';
import { ParroquiasService } from './services/parroquias.service';
import { ParroquiasController } from './controllers/parroquias.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Parroquias } from './parroquias.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Parroquias])],
  providers: [ParroquiasService],
  controllers: [ParroquiasController],
  exports: [ParroquiasService, TypeOrmModule.forFeature([Parroquias])],
})
export class ParroquiasModule {}
