
short xPos;
short yPos;
short xVel;
short yVel;
char ang;

void test(short a) {
	xPos += a;
	yPos += a;
	if (xPos > 0) {
		ang -= a;
	} else {
		yPos = xPos * 2;
		ang += xPos;
	}
}

int main() {
	test(20);
	return 123;
}
