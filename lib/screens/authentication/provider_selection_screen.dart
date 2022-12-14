
import 'package:estore/data/models/auth_provider_model.dart';
import 'package:estore/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'email/email_password_screen.dart';

class ProviderSelectionScreen extends StatelessWidget {
  const ProviderSelectionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _providerItem(AuthProviderModel providerModel) {
      return GestureDetector(
        onTap: () => Utils.navigateTo(providerModel.landingScreen),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: .5,
              color: Colors.black45,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Image.network(
                providerModel.image,
                height: 35,
                width: 35,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(providerModel.name),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to estore ",
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children:
                  availableProviders.map((e) => _providerItem(e)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
