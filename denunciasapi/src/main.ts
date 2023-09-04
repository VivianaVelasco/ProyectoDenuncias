import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ConfigService } from '@nestjs/config';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const config = new DocumentBuilder()
    .setTitle('Denuncias API')
    .setDescription('Documentacion de la api de denuncias ec')
    .setVersion('1.0')
    .addTag('denuncias')
    .build();
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('document', app, document);
  const configService = app.get(ConfigService);
  app.enableCors();
  await app.listen(configService.get('PORT'));
}
bootstrap();
