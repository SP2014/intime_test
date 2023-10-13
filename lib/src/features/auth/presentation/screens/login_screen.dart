import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intime_test/src/features/auth/presentation/presentation.dart';
import 'package:intime_test/src/utils/extensions.dart';

const userList = [
  {'name': 'Doctor', 'email': 'doctor@gmail.com'},
  {'name': 'Patient 1', 'email': 'patient1@gmail.com'},
  {'name': 'Patient2', 'email': 'patient2@gmail.com'},
  {'name': 'Patient3', 'email': 'patient3@gmail.com'}
];

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedUser = useState('doctor@gmail.com');
    final isLoading = useState(false);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(
          24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login to access Chat',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            16.hgap(),
            DropdownButtonFormField2<String>(
              isExpanded: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                // Add more decoration..
              ),
              hint: const Text(
                'Select User',
                style: TextStyle(fontSize: 14),
              ),
              items: userList
                  .map((item) => DropdownMenuItem<String>(
                        value: item['email'],
                        child: Text(
                          item['name'] ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please select user';
                }
                return null;
              },
              onChanged: (value) {
                selectedUser.value = value!;
              },
              onSaved: (value) {
                selectedUser.value = value!;
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.only(right: 8),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 24,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            16.hgap(),
            ElevatedButton(
              onPressed: () {
                final data = userList.firstWhere(
                  (element) => element['email'] == selectedUser.value,
                  orElse: () => {},
                );
                if (data.isNotEmpty) {
                  isLoading.value = true;
                  ref.read(authControllerProvider).authenticateUser(
                      data['email']!, 'abcd1234', data['name']!, context);
                }
              },
              child: isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const Text('Login'),
            )
          ],
        ),
      )),
    );
  }
}
