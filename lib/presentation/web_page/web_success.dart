import 'dart:typed_data';
//import 'dart:html' as html;


import 'package:deeplink_cookbook/core/api/submit_payment.dart';
import 'package:deeplink_cookbook/core/helper/convert_format.dart';
import 'package:deeplink_cookbook/core/models/confirm_response_model.dart';
import 'package:deeplink_cookbook/core/models/models.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class WebSuccess extends StatelessWidget {
  ScreenshotController screenshotController = ScreenshotController();

   ConfirmResponseModel confirmResponseModel;
   NewModelTest newModelTest;
   String myAccount;
  WebSuccess({required this.confirmResponseModel ,required this.newModelTest,required this.myAccount,super.key});


  _buildLeftSideWidget(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "asset/shop.png",
              height: 40,
              width: 40,
            ),
            const SizedBox(
              width: 10,
            ),
             Text(
              newModelTest.data.supplier.name,
              style:const TextStyle(fontSize: 18),
            )
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 15,
            ),
            RichText(
                text: TextSpan(
                    text: '- ${ConvertFormat.convertCurrency(newModelTest.data.balances[0].totalAmount, newModelTest.data.balances[0].currency)}',
                    style: TextStyle(
                        fontSize: 30,
                        color: CONST.fontColor,
                        fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                      text: '  ${newModelTest.data.balances[0].currency}',
                      style: TextStyle(fontSize: 18, color: CONST.fontColor))
                ]))
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
            width: MediaQuery.sizeOf(context).width * 0.3,
            decoration: BoxDecoration(
                color: CONST.backColor, borderRadius: BorderRadius.circular(5)),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Original amount",
                      style: TextStyle(color: CONST.white),
                    ),
                    Text(
                      "${ConvertFormat.convertCurrency(newModelTest.data.balances[0].billAmount, newModelTest.data.balances[0].currency)}  ${newModelTest.data.balances[0].currency}",
                      style: TextStyle(color: CONST.white),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Convinience fee",
                      style: TextStyle(color: CONST.white),
                    ),
                    Text(
                      "${ConvertFormat.convertCurrency(newModelTest.data.balances[0].feeAmount, newModelTest.data.balances[0].currency)}  ${newModelTest.data.balances[0].currency}",
                      style: TextStyle(color: CONST.white),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total amount",
                      style: TextStyle(
                        color: CONST.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                     "${ConvertFormat.convertCurrency(newModelTest.data.balances[0].totalAmount, newModelTest.data.balances[0].currency)}  ${newModelTest.data.balances[0].currency}",
                      style: TextStyle(
                        color: CONST.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            )),
      ],
    );
  }

  _buildRightSideWidget(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "asset/check.png",
          height: 80,
          width: 80,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Success ",
          style: TextStyle(fontSize: 28, color: CONST.fontColor),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Thank you for your payment",
          style: TextStyle(color: CONST.fontColor),
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.3,
          height: 20,
          child: const Divider(),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Transaction Date",
                style: TextStyle(color: CONST.fontColor),
              ),
              SelectableText(
                ConvertFormat.convertDateTimeToString(confirmResponseModel.data.paidDate),
                style: TextStyle(color: CONST.fontColor),
              )
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.3,
          height: 20,
          child: const Divider(),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Reference number",
                style: TextStyle(color: CONST.fontColor),
              ),
              SelectableText(
                confirmResponseModel.data.refNo,
                style: TextStyle(color: CONST.fontColor),
              )
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.3,
          height: 20,
          child: const Divider(),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "From account",
                style: TextStyle(color: CONST.fontColor),
              ),
              SelectableText(
                myAccount,
                style: TextStyle(color: CONST.fontColor),
              )
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.3,
          height: 20,
          child: const Divider(),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Original amount",
                style: TextStyle(color: CONST.fontColor),
              ),
              SelectableText(
                "${ConvertFormat.convertCurrency(confirmResponseModel.data.billAmount, confirmResponseModel.data.currency)}  ${confirmResponseModel.data.currency}",
                style: TextStyle(color: CONST.fontColor),
              )
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.3,
          height: 20,
          child: const Divider(),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Convinience fee",
                style: TextStyle(color: CONST.fontColor),
              ),
              SelectableText(
                "${ConvertFormat.convertCurrency(confirmResponseModel.data.feeAmount, confirmResponseModel.data.currency)}  ${confirmResponseModel.data.currency}",
                style: TextStyle(color: CONST.fontColor),
              )
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.3,
          height: 20,
          child: const Divider(),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Total amount",
                style: TextStyle(
                    color: CONST.fontColor, fontWeight: FontWeight.bold),
              ),
              SelectableText(
                 "${ConvertFormat.convertCurrency(confirmResponseModel.data.totalAmount, confirmResponseModel.data.currency)}  ${confirmResponseModel.data.currency}",
                  style: TextStyle(
                    color: CONST.fontColor, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     IconButton(
        //         onPressed: () {
        //           screenshotController
        //               .captureFromWidget(const ScreenShotWidget())
        //               .then((image) {
        //             saveBytesAsImageFile(image, 'image.png');
        //           });
        //         },
        //         icon: Icon(
        //           Icons.file_download_outlined,
        //           color: CONST.backColor.withOpacity(0.8),
        //         )),
        //     // const SizedBox(
        //     //   width: 20,
        //     // ),
        //     // IconButton(
        //     //     onPressed: () {},
        //     //     icon: Icon(
        //     //       Icons.share_outlined,
        //     //       color: CONST.backColor.withOpacity(0.8),
        //     //     )),
        //   ],
        // ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.sizeOf(context).width * 0.3,
            height: 50,
            decoration: BoxDecoration(color: CONST.backColor),
            child: Text(
              "Done",
              style: TextStyle(color: CONST.white),
            ),
          ),
        )
      ],
    );
  }

  // Future<ConfirmResponseModel> confirmPaymentAsyn() async{
  //   return await SubmitPayment.submitPayment();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: CONST.backColor,
          centerTitle: false,
          title: Text(
            CONST.bankName,
            style: TextStyle(color: CONST.white),
          ),
        ),
        body: Stack(
          children: [
            Container(
              color: CONST.backColor,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 10,
                  bottom: 40,
                  left: MediaQuery.of(context).size.height * 0.15,
                  right: MediaQuery.of(context).size.height * 0.15),
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: CONST.white, borderRadius: BorderRadius.circular(5)),
                child: 
                
                
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildLeftSideWidget(context),
                    
                   
                    const VerticalDivider(
                      thickness: 1,
                    ),
                    //RightSide Widget
                    _buildRightSideWidget(context)
                  ],
                ),
              ),
            )
          ],
        ));
  }

  // save image to download directory
  void saveBytesAsImageFile(Uint8List image, String fileName) {
    // final blob = html.Blob([image]);
    // final url = html.Url.createObjectUrlFromBlob(blob);
    // html.AnchorElement(href: url)
    //   ..target = 'blob'
    //   ..download = fileName
    //   ..click();
    // html.Url.revokeObjectUrl(url);
  }
}