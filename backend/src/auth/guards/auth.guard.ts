import { CanActivate, ExecutionContext, ForbiddenException, Injectable, UnauthorizedException } from '@nestjs/common';
import { Request } from 'express';
import { FirebaseService } from '../firebase/firebase.service';

// Criar uma conta firebase
// Instalar o Firebase Admin


@Injectable()
export class AuthGuard implements CanActivate {

  constructor(private readonly firebase: FirebaseService) {}

  canActivate(context: ExecutionContext): Promise<boolean> {
    const request = context.switchToHttp().getRequest<Request>();
    const [prefix, token] = request.headers.authorization?.split(' ');
    if (!token) {
      throw new UnauthorizedException()
    }

    return this.firebase.verifyToken(token);
  }
}
