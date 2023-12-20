import 'package:flutter/material.dart';
import 'package:justice_link/common/app_bar.dart';

class LegalRights extends StatelessWidget {
  const LegalRights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfun("legal rights"),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bulletPointRow('Right to Legal Representation:',
                  'Every individual has the right to legal representation during legal proceedings.\nYou are entitled to hire a lawyer or, if unable to afford one, you may request legal aid.'),
              _divider(),
              _bulletPointRow('Presumption of Innocence',
                  'Everyone is presumed innocent until proven guilty in a court of law.\nThe burden of proof rests on the prosecution.'),
              _divider(),
              _bulletPointRow('Right to a Fair Trial:',
                  'You have the right to a fair and public trial by an impartial tribunal.\nAll proceedings should be conducted in a language you understand.'),
              _divider(),
              _bulletPointRow('Protection Against Self-Incrimination:',
                  'You have the right to remain silent and cannot be compelled to testify against yourself.'),
              _divider(),
              _bulletPointRow(
                  'Protection Against Unreasonable Searches and Seizures:',
                  'Your person, home, and possessions are protected from unreasonable searches and seizures.'),
              _divider(),
              _bulletPointRow('Right to Privacy',
                  'Your privacy, family, home, and correspondence are protected by law.'),
              _divider(),
              _bulletPointRow('Freedom from Cruel and Unusual Punishment:',
                  'Protection against cruel, inhuman, or degrading treatment or punishment.'),
              _divider(),
              _bulletPointRow('Right to Speedy Trial:',
                  'You are entitled to a timely trial without unnecessary delays.'),
              _divider(),
              _bulletPointRow('Right to Appeal:',
                  'If convicted, you have the right to appeal the decision to a higher court.'),
              _divider(),
              _bulletPointRow('Right to Information:',
                  'You have the right to be informed of the charges against you and the evidence presented.'),
              _divider(),
              _bulletPointRow('Right to Humane Treatment:',
                  'Every person deprived of liberty is entitled to humane treatment and dignity.'),
              _divider(),
              _bulletPointRow('Right to Access Medical Care:',
                  'Undertrial prisoners have the right to access medical care and regular health checkups.'),
              _divider(),
              _bulletPointRow('Right to Communicate:',
                  'The right to communicate with family, legal representatives, and authorities.'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bulletPointRow(String heading, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/images/bullet.png'),
       const  SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading,
                style:const  TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
             const  SizedBox(height: 5),
              Text(content),
            ],
          ),
        ),
      ],
    );
  }

  Widget _divider() {
    return const Divider(
      color: Color(0xFFCCCCCC),
      height: 20,
      thickness: 0.5,
    );
  }
}
