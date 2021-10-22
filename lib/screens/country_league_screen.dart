import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_teamwave/model/league_model.dart';
import 'package:sports_teamwave/model/sports_model.dart';
import 'package:sports_teamwave/repository/league_repo.dart';
import 'package:sports_teamwave/utils/image_utils.dart';
import 'package:sports_teamwave/widgets/collection.dart';
import 'package:sports_teamwave/widgets/loading.dart';
import 'package:url_launcher/url_launcher.dart';

class CountryLeagueScreen extends StatefulWidget {
  String countryName;
  SportsModel sportsDataList = SportsModel();

  CountryLeagueScreen({this.countryName, this.sportsDataList});

  @override
  State<CountryLeagueScreen> createState() => _CountryLeagueScreenState();
}

class _CountryLeagueScreenState extends State<CountryLeagueScreen> {
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  LeaguesRepo leagueRepo = LeaguesRepo();
  bool isSearch = false;

  @override
  void initState() {
    // TODO: implement initState
    scrollController = ScrollController();
    leagueRepo.fetchInitialData(
        isSearch: false, searchString: "", countryName: widget.countryName);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            ImageUtils.backwardArrow,
            height: 20,
            width: 25,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.countryName,
          style: GoogleFonts.roboto(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Textfield(
            usercontroller: controller,
            onSaved: (value) async {},
            sufficIcon: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                isSearch ? InkWell(
                  onTap: () async {
                     if (isSearch) {
                      setState(() {
                        isSearch = false;
                      });
                      controller.clear();
                      await leagueRepo.fetchInitialData(
                          countryName: widget.countryName,
                          searchString: "",
                          isSearch: false);
                    }
                  },
                  child:  Icon(Icons.close),
                ):Container(),
                InkWell(
                  onTap: () async {
                    if (controller.text.toString().length > 2) {
                      setState(() {
                        isSearch = true;
                      });
                      Loading.showLoadingDialog(context);
                      await leagueRepo.fetchInitialData(
                          countryName: widget.countryName,
                          searchString: controller.text.toString(),
                          isSearch: true);
                      Loading.hideLoadingDialog(context);
                    } else if (controller.text.toString().length < 2) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Search with atleast 3 letters")));
                    }
                  },
                  child:  Icon(Icons.search),
                ),
              ],
            ),
            validator: (value) {},
            hintText: "Search Leagues...",
          ),
          Expanded(
            child: StreamBuilder(
                stream: leagueRepo.leagueStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    LeagueModel leagues = snapshot.data;
                    return leagues.countrys.length == 0
                        ? Center(
                            child: Text(
                              "No Data",
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        : ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 20,
                              );
                            },
                            controller: scrollController,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: leagues.countrys.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(widget
                                              .sportsDataList.sports
                                              .firstWhere((element) =>
                                                  element.strSport ==
                                                  leagues.countrys[index]
                                                      .strSport).strSportThumb)),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: FractionalOffset.topLeft,
                                          child: Text(
                                            leagues.countrys[index].strLeague,
                                            style: GoogleFonts.roboto(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        leagues.countrys[index].strLogo == "" ||
                                                leagues.countrys[index]
                                                        .strLogo ==
                                                    null
                                            ? Container()
                                            : Container(
                                                alignment: FractionalOffset
                                                    .centerRight,
                                                child: CachedNetworkImage(
                                                  imageUrl: leagues
                                                      .countrys[index].strLogo,
                                                  height: 30,
                                                  width: 100,
                                                )),
                                        Container(
                                          alignment: FractionalOffset.topLeft,
                                          child: Row(
                                            children: [
                                              leagues.countrys[index]
                                                          .strTwitter ==
                                                      ""
                                                  ? Container()
                                                  : InkWell(
                                                      onTap: () {
                                                        launch("http://" +
                                                            leagues
                                                                .countrys[index]
                                                                .strTwitter);
                                                      },
                                                      child: SvgPicture.asset(
                                                        ImageUtils.twitterImage,
                                                        height: 30,
                                                        width: 25,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                              leagues.countrys[index]
                                                          .strTwitter ==
                                                      ""
                                                  ? Container()
                                                  : SizedBox(width: 10),
                                              leagues.countrys[index]
                                                          .strFacebook ==
                                                      ""
                                                  ? Container()
                                                  : InkWell(
                                                      onTap: () {
                                                        launch("http://" +
                                                            leagues
                                                                .countrys[index]
                                                                .strFacebook);
                                                      },
                                                      child: SvgPicture.asset(
                                                        ImageUtils
                                                            .facebookImage,
                                                        height: 30,
                                                        width: 25,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ),
                                      ],
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
        ],
      ),
    );
  }
}
