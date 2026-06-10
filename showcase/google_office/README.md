# Starter Project Guidance

Ini adalah starter project submission untuk kelas Belajar Membuat Aplikasi Flutter untuk Pemula.

Untuk menyelesaikan kelas ini, Anda perlu mengerjakan Submission sebagai bentuk evaluasi pemahaman Anda. Submission ini terdiri dari 3 kriteria yang harus Anda selesaikan.

- Kritaria 1: Membuat Halaman Daftar Kantor Google
- Kriteria 2: Membuat Halaman Detail Kantor Google
- Kriteria 3: Menerapkan Navigasi & Pengiriman Data

Ada pun informasi penting yang berguna ketika mengerjakan submission ini.

1. Anda tidak perlu mengubah susunan folder yang ada di starter project ini.
2. Untuk menyelesaikan submisison ini, Anda cukup mengubah kode yang ada di berkas [home_page.dart](lib/view/home_page.dart) dan [detail_page.dart](lib/view/detail_page.dart). Fokuslah pada kode yang sudah ditandai sebagai `TODO`.
3. Ketika sedang mengembangkan fitur halaman detail, Anda tidak perlu mengubah  properties `googleOffice` dan `googleOfficeId` serta constructor `DetailPage`. Ini menjadi tantangan Anda untuk menyelesaikan submission kelas.

    ```dart
    class DetailPage extends StatelessWidget {
        // tidak perlu mengubah properties ini.
        final GoogleOffice googleOffice;
        final String? googleOfficeId;

        DetailPage({super.key, GoogleOffice? googleOffice, this.googleOfficeId})
            : ...;

        ...
    }
    ```

    Namun, kamu boleh mengubah [initializer list](https://dart.dev/language/constructors#use-an-initializer-list) kelas `DetailPage` agar mendapatkan *grading* tinggi sesuai kriteria.

    ```dart
    class DetailPage extends StatelessWidget {
        ...

        DetailPage({...})
            // silakan edit initializer list ini agar dapat nilai tinggi.
            : googleOffice = googleOffice ?? listOfGoogleOffice.first;

        ...
    }
    ```

    > **Catatan:**
    >
    > Kode `googleOffice = googleOffice ?? listOfGoogleOffice.first;` di atas hanyalah **contoh** implementasi dan **bukanlah solusi yang tepat** untuk lulus dari semua *grading* kriteria.
