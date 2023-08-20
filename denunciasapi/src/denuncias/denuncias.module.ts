import { Module } from '@nestjs/common';
import { DenunciasController } from './controllers/denuncias.controller';
import { DenunciasService } from './services/denuncias.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Denuncias } from './denuncias.entity';
import { ParroquiasModule } from '../parroquias/parroquias.module';
import { MotivosModule } from '../motivos/motivos.module';
import { UsersModule } from '../users/users.module';
import { ParroquiasService } from '../parroquias/services/parroquias.service';
import { UsersService } from '../users/services/users.service';
import { MotivosService } from '../motivos/services/motivos.service';

@Module({
  imports: [TypeOrmModule.forFeature([Denuncias]), ParroquiasModule, MotivosModule, UsersModule],
  controllers: [DenunciasController],
  providers: [DenunciasService],
})
export class DenunciasModule {}
