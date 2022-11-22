import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../providers/app_user.dart';
import '../../models/size_config.dart';
import '../../providers/house.dart';

class CreateHouseScreen extends StatefulWidget {
  const CreateHouseScreen({super.key});
  static const routeName = './create_house_screen';

  @override
  State<CreateHouseScreen> createState() => _CreateHouseScreenState();
}

class _CreateHouseScreenState extends State<CreateHouseScreen> {
  String _houseName = '';
  final List<AppUser> _houseUserList = [];

  final formKey = GlobalKey<FormState>();

  void _createHouse() async {
    final user = Provider.of<AppUser>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    formKey.currentState!.save();
    var docSnapshot = await FirebaseFirestore.instance.collection('houses').add(
      {
        'houseName': _houseName,
        'users': [user.getUserId]
      },
    );

    House newHouse = House();

    newHouse.setHouseId(docSnapshot.id);
    newHouse.setHouseName(_houseName);
    newHouse.addUser(user.getUserId, user);

    user.setCurrentHouse(newHouse);
    user.addHouse(newHouse.getHouseId, newHouse);

    if (!mounted) return;
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    _houseUserList.add(Provider.of<AppUser>(context, listen: false));
    _houseUserList.add(Provider.of<AppUser>(context, listen: false));
    _houseUserList.add(Provider.of<AppUser>(context, listen: false));
    _houseUserList.add(Provider.of<AppUser>(context, listen: false));
    _houseUserList.add(Provider.of<AppUser>(context, listen: false));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context, listen: false);
    SizeConfig().init(context);
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(249, 160, 63, 1),
        onPressed: () {
          _createHouse();
        },
        child: const Icon(
          Icons.check_rounded,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: deviceSize.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(249, 160, 63, 1),
                    Color.fromARGB(255, 251, 203, 152),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Container(
                height: deviceSize.height * 0.65,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7EB),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 8,
                      blurRadius: 20,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(top: 12.0, right: 12.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.close_rounded,
                    size: 36,
                    color: Color.fromRGBO(249, 160, 63, 1),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
              child: SizedBox(
                height: deviceSize.height * 0.37,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: deviceSize.height * 0.03),
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'New House',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Gotham',
                            fontSize: 3 * SizeConfig.blockSizeVertical,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: deviceSize.height * 0.14,
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: deviceSize.height * 0.045,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                color: const Color.fromRGBO(249, 160, 63, 1),
                                onPressed: () {},
                                icon: const Icon(size: 30, Icons.home_rounded),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: deviceSize.height * 0.11,
                              height: deviceSize.height * 0.11,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(
                                    (deviceSize.height * 0.045) /
                                        (deviceSize.width / 2) *
                                        0.8,
                                    1 * 0.045 / 0.055) *
                                0.8,
                            child: Container(
                              width: deviceSize.height * 0.036,
                              height: deviceSize.height * 0.036,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromRGBO(249, 160, 63, 1),
                                  width: 1.5,
                                ),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: Color.fromRGBO(249, 160, 63, 1),
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: deviceSize.width * 0.7,
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              onSaved: (newName) =>
                                  _houseName = newName as String,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Gotham',
                                  color: Colors.white,
                                  fontSize: 3.3 * SizeConfig.blockSizeVertical),
                              decoration: InputDecoration(
                                label: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 30),
                                        child: const Text('House Name'),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                ),
                                labelStyle: TextStyle(
                                  fontSize: 3.3 * SizeConfig.blockSizeVertical,
                                  color: Colors.white,
                                  fontFamily: 'Gotham',
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: deviceSize.height * 0.001,
                                  horizontal: deviceSize.width * 0.001,
                                ),
                                border: InputBorder.none,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.center,
                                isCollapsed: true,
                              ),
                              cursorColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: deviceSize.height * 0.65,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(
                      left: deviceSize.width * 0.05,
                      top: deviceSize.height * 0.03,
                      bottom: deviceSize.height * 0.03,
                    ),
                    child: Text(
                      'Roommates',
                      style: TextStyle(
                        fontFamily: 'Gotham',
                        fontSize: 3 * SizeConfig.blockSizeVertical,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8A6094),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: deviceSize.width * 0.8,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xFF8dbaf1),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16.0),
                        labelText: 'Search User Codes...',
                        labelStyle: TextStyle(
                          fontSize: SizeConfig.blockSizeVertical * 2,
                          color: const Color.fromRGBO(206, 209, 216, 1),
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(237, 240, 247, 0.7),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      style: TextStyle(
                        fontSize: SizeConfig.blockSizeVertical * 2,
                        color: Colors.black54,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                    ),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.38,
                    width: deviceSize.width * 0.8,
                    child: SingleChildScrollView(
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: deviceSize.height * 0.02,
                          mainAxisExtent: deviceSize.height * 0.1,
                          crossAxisCount: 4,
                        ),
                        itemCount: _houseUserList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: deviceSize.width * 0.07,
                                backgroundColor: const Color(0xFF8dbaf1),
                                child: Center(
                                  child: Text(
                                    _houseUserList[index]
                                        .getUsername
                                        .substring(0, 1)
                                        .toUpperCase(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: deviceSize.height * 0.005,
                              ),
                              Text(
                                _houseUserList[index].getDisplayName,
                                style: const TextStyle(
                                  fontFamily: 'Gotham',
                                  color: Color(0xFF8dbaf1),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
