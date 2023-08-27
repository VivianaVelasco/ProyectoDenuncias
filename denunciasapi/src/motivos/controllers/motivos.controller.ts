import { Body, Controller, Get, HttpCode, Post } from '@nestjs/common';
import { MotivosService } from '../services/motivos.service';
import { MotivosDto } from '../motivos.dto';
import { ApiTags } from '@nestjs/swagger';

@ApiTags("motivos")
@Controller('api/motivos')
export class MotivosController {

    constructor(private motivosService: MotivosService){}

    @Get("/")
    @HttpCode(200)
    async getAllMotivos() {
        return await this.motivosService.getAll();
    }

    @Post("/")
    @HttpCode(200)
    async createMotivo(@Body() motivo: MotivosDto) {
        return await this.motivosService.create(motivo);
    }
}
