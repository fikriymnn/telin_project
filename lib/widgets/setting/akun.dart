class Akun {
  final String no, name, username, password, role;
  final Function detail, delete;

  const Akun(
      {required this.no,
      required this.name,
      required this.username,
      required this.password,
      required this.role,
      required this.detail,
      required this.delete});

  static List<Akun> getAkun() {
    return <Akun>[
      Akun(
          no: "1",
          name: "Gudang",
          username: "Gudang1",
          password: "XXXXXXXXXX",
          role: "Super Admin",
          detail: () {},
          delete: () {}),
      Akun(
          no: "2",
          name: "Gudang",
          username: "Gudang1",
          password: "XXXXXXXXXX",
          role: "Admin",
          detail: () {},
          delete: () {}),
      Akun(
          no: "3",
          name: "Gudang",
          username: "Gudang1",
          password: "XXXXXXXXXX",
          role: "Admin",
          detail: () {},
          delete: () {}),
      Akun(
          no: "4",
          name: "Gudang",
          username: "Gudang1",
          password: "XXXXXXXXXX",
          role: "Admin",
          detail: () {},
          delete: () {}),
      Akun(
          no: "5",
          name: "Gudang",
          username: "Gudang1",
          password: "XXXXXXXXXX",
          role: "Admin",
          detail: () {},
          delete: () {})
    ];
  }
}
