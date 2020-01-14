abstract class ContactDetailEvent {}

class FetchContactDetail extends ContactDetailEvent{
  final String contactId;

  FetchContactDetail(
    this.contactId
  );
}