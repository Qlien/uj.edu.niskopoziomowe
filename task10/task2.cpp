#include <stdio.h>
#include <math.h>

// GRAD(i,j) = sqrt((DATA(i+1,j)-DATA(i-1,j))^2+(DATA(i,j+1)-DATA(i,j-1))^2)
//
// grad[i] = sqrt( (data[i+1] - data[i-1])^2 + (data[i+N] - data[i-N])^2)
// for i=0,1,...,N-2
extern "C" void gradientSSE(float *grad, float *data, int N);
/*void gradientSSE(float *grad, float *data, int N) {
    for (int i = 0; i < N - 2; i++) {
        grad[i] = sqrt(pow(data[i+1] - data[i-1], 2.f) + pow(data[i+N] - data[i-N], 2.f));
    }
}*/

int main() {
    float data[400][400], header[1078];
    float grad[400][400], sq;
    unsigned char ch;
    int N = 400, HL = 1078;

    // read input file

    FILE *inf = fopen("circle.bmp","rb");

    for (int i = 0; i < HL; i++) {
        header[i] = fgetc(inf);
    }

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            data[i][j] = (float) fgetc(inf);
        }
    }

    fclose(inf);

    // apply gradient

    for (int i = 1; i < N - 1; i++) {
        gradientSSE(grad[i] + 1, data[i] + 1, N);
    }

    // write results to a file

    FILE *outf = fopen("dum.bmp", "wb");

    for (int i = 0; i < HL; i++)
        fputc(header[i], outf);

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            fputc((unsigned char) grad[i][j], outf);
        }
    }

    fclose(outf);

    return 0;
}