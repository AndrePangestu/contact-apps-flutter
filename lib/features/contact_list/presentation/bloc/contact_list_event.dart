import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ContactListEvent {}

class FetchContactList extends ContactListEvent{}