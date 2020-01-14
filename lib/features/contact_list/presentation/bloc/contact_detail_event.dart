abstract class ContactDetailEvent {}

class FetchContactDetail extends ContactDetailEvent{
  final String contactId;

  FetchContactDetail(
    this.contactId
  );
}

class PostContactDetail extends ContactDetailEvent{
  final String firstName;
  final String lastName;
  final int age;
  final String photo;

  PostContactDetail({
    this.firstName,
    this.lastName,
    this.age,
    this.photo
  });
}