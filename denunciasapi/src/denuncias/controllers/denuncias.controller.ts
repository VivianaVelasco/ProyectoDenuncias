import {
  Controller,
  Get,
  HttpCode,
  Post,
  Put,
  Delete,
  Body,
  Param,
  HttpException,
  HttpStatus,
  Query,
} from '@nestjs/common';
import { DenunciasService } from '../services/denuncias.service';
import { DenunciasDto } from '../denuncias.dto';
import { ApiTags } from '@nestjs/swagger';

@ApiTags('denuncias')
@Controller('denuncias')
export class DenunciasController {
  constructor(private denunciasService: DenunciasService) {}

  // David Terreros
  @Get('/recents')
  // @HttpCode(200)
  async getRecentDenuncias() {
    console.log('XD');
    const res = await this.denunciasService.findFiveRecent();
    return res;
  }

  @Post('')
  @HttpCode(200)
  async createDenuncia(@Body() denuncia: DenunciasDto) {
    const res = await this.denunciasService.create(denuncia);
    return res;
  }

  @Put(':id')
  @HttpCode(200)
  async editDenuncia(@Param('id') id: number, @Body() denuncia: DenunciasDto) {
    const res = await this.denunciasService.update(id, denuncia);
    return res;
  }

  // Fin

// Viviana Velasco
@Get('usuario/:id')
async getDenunciasByUser(@Param('id') id: number) {
  const response = await this.denunciasService.getByUsuario(id);
  return response;
}

@Get('/filter')
async getDenunciasByFilter(
  @Query('parroquia') parroquia: number,
  @Query('motivo') motivo: number,
) {
  console.log(parroquia, motivo);
  const response = await this.denunciasService.getByFilter(parroquia, motivo);
  return response;
}

@Delete(':id')
@HttpCode(200)
async deleteDenuncia(@Param('id') id: number) {
  const response = await this.denunciasService.delete(id);
  return response;
}

@Get('/:id')
async getDenunciaById(@Param('id') id: number) {
  try {
    const response = await this.denunciasService.findOne(id);
    return response;
  } catch (error) {
    return new HttpException(
      'No encontro la denuncia o fue eliminada',
      HttpStatus.NOT_FOUND,
    );
  }
}
//Fin
}
