import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_app/components/info_intestazione.dart';
import 'package:social_app/components/modifica_utente.dart';
import 'package:social_app/models/user.dart';

class IntestazioneProfilo extends StatefulWidget {
  final User user;
  final VoidCallback callback;
  const IntestazioneProfilo(this.user, this.callback, {Key? key})
      : super(key: key);

  @override
  State<IntestazioneProfilo> createState() => _IntestazioneProfiloState();
}

class _IntestazioneProfiloState extends State<IntestazioneProfilo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: CircleAvatar(
            radius: 115,
            backgroundColor: Colors.purple,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                widget.user.picture ?? 'https://via.placeholder.com/150',
                scale: 0.35,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '${widget.user.firstName} ${widget.user.lastName}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Divider(
            thickness: 3,
            color: Colors.purple,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.purple),
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.user.dateOfBirth != null)
                Row(
                  children: [
                    const Icon(
                      Icons.date_range,
                      color: Colors.purple,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      DateFormat('d/M/y').format(
                        DateTime.parse(widget.user.dateOfBirth!),
                      ),
                    ),
                  ],
                ),
              if (widget.user.location != null &&
                  widget.user.location!.city != null)
                InfoIntestazione(
                  icon: Icons.place,
                  testo: widget.user.location!.city!,
                ),
              const SizedBox(
                height: 5,
              ),
              if (widget.user.email != null)
                InfoIntestazione(
                  icon: Icons.email,
                  testo: widget.user.email!,
                ),
              const SizedBox(
                height: 5,
              ),
              if (widget.user.gender != null)
                Row(
                  children: [
                    Icon(
                      widget.user.gender == 'male'
                          ? (Icons.male)
                          : (Icons.female),
                      color: Colors.purple,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(widget.user.gender!),
                  ],
                ),
              const SizedBox(
                height: 5,
              ),
              if (widget.user.phone != null)
                TextButton.icon(
                    icon: const Icon(
                      Icons.smartphone,
                      color: Colors.purple,
                    ),
                    label: Text(
                      widget.user.phone!,
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                    onPressed: () async {
                      var edited = await showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => ModificaUtente(
                                user: widget.user,
                              ));
                      if (edited == true) {
                        widget.callback();
                      }
                    }),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8, top: 8),
          child: Text(
            'Posts',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
