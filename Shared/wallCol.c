
#define wallTile 4
unsigned short xPos;
unsigned short yPos;
unsigned short xPosC;
unsigned short yPosC;
short xVel;
short yVel;


char getTileCollisionType();
short mult(short a, short b);
short div(short a, short b);


void wallCol() {
	xPosC = xPos;
	yPosC = yPos;
	char tile = getTileCollisionType();
	if (tile == wallTile) {
		char xCol = 0;
		unsigned char xLo = *((unsigned char*)(&xPos));
		unsigned char yLo = *((unsigned char*)(&yPos));
		xPos = xPos & 0xFF00;
		yPos = yPos & 0xFF00;
		
		short xIntA = 0;
		short yIntA = 0;
		short xIntB = 0;
		short yIntB = 0;
		if (xVel != 0) {
			short slope = div(yVel, xVel);
			if (xVel >= 0) {
				xIntA = 0;
				yIntA = (-slope * xLo) + yLo;
				xPosC = xPos + xIntA;
			} else {
				xIntA = 256;
				yIntA = slope + (-slope * xLo) + yLo;
				xPosC = xPos + xIntA - 256;
			}
			yPosC = yPos + yIntA;
			if (getTileCollisionType() == wallTile) {
				xCol = 1;
			}
		}
		if (yVel != 0) {
			short slope = div(xVel, yVel);
			if (yVel >= 0) {
				yIntB = 0;
				xIntB = mult(-slope, yLo) + xLo;
				//yPosC = yPos + yIntB;
			} else {
				yIntB = 256;
				xIntB = slope - mult(-slope, yLo) + xLo;
				//yPosC = yPos + yIntB - 256;
			}
			//xPosC = xPos + xIntB;
			//if (getTileCollisionType() != wallTile) {
			//	xIntB = 1024;
			//}
		}
		
		if ((xCol == 0) || ((xIntB >= 256 || xIntB < 0) && (xIntB < 512 && xIntB >= -256))) {
			xIntA = xIntB;
			yIntA = yIntB;
		}
		xPos += xIntA;
		yPos += yIntA;
		
	}
	return;
	
}

