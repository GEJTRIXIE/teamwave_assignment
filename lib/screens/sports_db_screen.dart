import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_teamwave/model/country_model.dart';
import 'package:sports_teamwave/model/sports_model.dart';
import 'package:sports_teamwave/repository/country_repo.dart';
import 'package:sports_teamwave/screens/country_league_screen.dart';
import 'package:sports_teamwave/services/api_service.dart';
import 'package:sports_teamwave/utils/image_utils.dart';
import 'package:sports_teamwave/utils/string_utils.dart';
import 'package:sports_teamwave/widgets/loading.dart';

class SportsDbScreen extends StatefulWidget {
  @override
  State<SportsDbScreen> createState() => _SportsDbScreenState();
}

class _SportsDbScreenState extends State<SportsDbScreen> {
  ApiService apiFetch = ApiService();
  SportsModel sportsData = SportsModel();
  ScrollController scrollController = ScrollController();
  CountryRepo countryRepo = CountryRepo();

  @override
  void initState() {
    // TODO: implement initState
    scrollController = ScrollController();
    Future.delayed(Duration(seconds: 1), fetchSportsData);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  fetchSportsData() async {
    try {
      Loading.showLoadingDialog(context);
      await apiFetch.getSportsList().then((value) {
        countryRepo.fetchInitialData();
        setState(() {
          sportsData = value;
        });
        print(sportsData.sports.length);
        Loading.hideLoadingDialog(context);
      });
    } catch (e) {
      Loading.hideLoadingDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 70, bottom: 50),
          child: Container(
            alignment: FractionalOffset.center,
            child: Text(
              StringUtils.theSportsDb,
              style: GoogleFonts.roboto(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Expanded(
          child: StreamBuilder(
              stream: countryRepo.countryStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  Countryodel country = snapshot.data;
                  return ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                    controller: scrollController,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: country.countries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFF8C2C1),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CountryLeagueScreen(
                                            countryName:
                                                country.countries[index].nameEn,
                                            sportsDataList: sportsData,
                                          )));
                            },
                            child: ListTile(
                              leading: Text(
                                country.countries[index].nameEn,
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              trailing: SvgPicture.asset(
                                ImageUtils.forwardArrow,
                                height: 20,
                                width: 25,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Container();
                }
              }),
        )
      ]),
    );
  }
}
