class Contact {
  String name;
  String imgUrl;
  int bankNumber;

  Contact({required this.name, required this.imgUrl, required this.bankNumber});
}

List<Contact> contactList = [
  Contact(
      name: "Adam Walker", imgUrl: "adam_pp.jpg", bankNumber: 1234456778964568),
  Contact(
      name: "Abigale White",
      imgUrl: "abigale_pp.jpg",
      bankNumber: 1234154265347851),
  Contact(
      name: "John Tails", imgUrl: "john_pp.jpg", bankNumber: 1234456778964578),
  Contact(
      name: "Jeremy Dungeon",
      imgUrl: "jeremy_pp.jpg",
      bankNumber: 1234456745678521),
  Contact(
      name: "Marta Holland",
      imgUrl: "marta_pp.jpg",
      bankNumber: 1234456789564563),
];
