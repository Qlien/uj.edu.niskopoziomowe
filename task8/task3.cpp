#include <iostream>
#include <string.h>

// http://www.nasm.us/doc/nasmdoc9.html
// http://forum.codecall.net/topic/65232-assembly-local-variables-and-functions-win32-nasm/

#define max(a, b) (a > b) ? a : b

// kopiuje n liczb typu int z zrodla do celu
void kopiuj(int *cel, int *zrodlo, unsigned int n);

// zeruje tablice liczb typu int o rozmiarze n
void zeruj(int *cel, unsigned int n);

class BigInt {
private:
    unsigned int rozmiar;
    int *dane;

public:
    explicit BigInt(unsigned int rozmiar) : rozmiar(rozmiar), dane(new int[rozmiar]) {
        zeruj(dane, rozmiar);
    }

    BigInt(const BigInt& x) : rozmiar(x.rozmiar), dane(new int[x.rozmiar]) {
        kopiuj(dane, x.dane, x.rozmiar);
    }

    BigInt(const char* str) {
        fromString(str);
    }

    BigInt& operator=(const BigInt& x) {
        if (rozmiar != x.rozmiar) {
            int *tmp = new int[x.rozmiar];
            delete[] dane;
            rozmiar = x.rozmiar;
            dane = tmp;
        }

        kopiuj(dane, x.dane, x.rozmiar);

        return *this;
    }

    ~BigInt() {
        delete[] dane;
    }

    // do zaimplementowania w zadaniu 3
    BigInt dodaj(int n) const;
    BigInt pomnoz(int n) const;
    BigInt podzielZReszta(int n) const;

    BigInt operator=(const char* liczba) {
        return fromString(liczba);
    }

    friend std::ostream& operator<<(std::ostream& str, const BigInt& x);

    // do zaimplementowania w zadaniu 4
    friend BigInt operator+(const BigInt& a, const BigInt& b);
    friend BigInt operator-(const BigInt& a, const BigInt& b);

private:
    BigInt fromString(const char* liczba) {
        int len = strlen(liczba);

        dane = new int[len];
        rozmiar = len;
        dane[0] = 0;

        for (int i = 0; i < len; i++) {
            dane[i] = liczba[i] - '0';
        }

        return *this;
    }
};

BigInt BigInt::dodaj(int n) const {
    return *this;
}

BigInt BigInt::pomnoz(int n) const {
    return *this;
}

BigInt BigInt::podzielZReszta(int n) const {
    return *this;
}

std::ostream& operator<<(std::ostream& str, const BigInt& x) {
    for (int i = 0; i < x.rozmiar; i++) {
        str << (char) (x.dane[i] + '0');
    }

    str << '\n';

    return str;
}

BigInt operator+(const BigInt& a, const BigInt& b) {
    int a_len = a.rozmiar, b_len = b.rozmiar, c_len = max(a_len, b_len);
    int *a_data = a.dane, *b_data = b.dane, *c_data = new int[c_len * 2];
    int tmp = 0;

    for (int i = 0; i < c_len; i++) {
        int x, y, z;

        if (i > a_len) {
            x = 0;
        } else {
            x = a_data[i];
        }

        if (i > b_len) {
            y = 0;
        } else {
            y = b_data[i];
        }

        z = (tmp + x + y);
        tmp = z / 10;
        c_data[i] = z % 10;
    }

    while (tmp > 0) {
        c_data[c_len++] = tmp % 10;
        tmp /= 10;
    }

    BigInt result = BigInt(c_len);
    kopiuj(result.dane, c_data, c_len);
    delete[] c_data;

    return result;
}

BigInt operator-(const BigInt& a, const BigInt& b) {
    return a + (b.pomnoz(-1));
}

int main() {
    BigInt a = "12345", b = "7654231";
    std::cout << a + b << std::endl;
    std::cout << a - b << std::endl;
    std::cout << a.dodaj(999) << std::endl;
    std::cout << a.pomnoz(3) << std::endl;
    std::cout << a.podzielZReszta(3) << std::endl;

    return 0;
}