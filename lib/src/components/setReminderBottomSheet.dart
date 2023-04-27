import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import '../res/colors.dart';

class SetReminder extends StatefulWidget {
  const SetReminder({super.key, required this.darkMode});
  final bool darkMode;
  @override
  State<SetReminder> createState() => _SetReminderState();
}

class _SetReminderState extends State<SetReminder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450.h,
      //color: Color(0xff232930),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0.h, right: 20.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Set Reminder',
                    style: GoogleFonts.lato(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 335.w,
                height: 180.h,
                decoration: BoxDecoration(
                  color: widget.darkMode
                      ? const Color(0xff393E44)
                      : const Color(0xffF5F6FA),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                //time picker
                child: timePicker(),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Text('Repeat',
                      style: GoogleFonts.lato(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xff979797)),
                    ),
                    child: Text(
                      'Do not repeat',
                      style: GoogleFonts.lato(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      foregroundColor: widget.darkMode
                          ? MaterialStateProperty.all<Color>(darkTextColor)
                          : MaterialStateProperty.all<Color>(lightTextColor),
                      backgroundColor: widget.darkMode
                          ? MaterialStateProperty.all<Color>(
                              const Color(0xff393E44))
                          : MaterialStateProperty.all<Color>(
                              const Color(0xffF5F6FA)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      )),
                    ),
                    child: Text(
                      'Every 10min',
                      style: GoogleFonts.lato(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      foregroundColor: widget.darkMode
                          ? MaterialStateProperty.all<Color>(darkTextColor)
                          : MaterialStateProperty.all<Color>(lightTextColor),
                      backgroundColor: widget.darkMode
                          ? MaterialStateProperty.all<Color>(
                              const Color(0xff393E44))
                          : MaterialStateProperty.all<Color>(
                              const Color(0xffF5F6FA)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      )),
                    ),
                    child: Text(
                      'Every 20min',
                      style: GoogleFonts.lato(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 35.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 155.w,
                      height: 43.h,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xffBB86FC),
                            side: const BorderSide(
                                color: Color(0xffBB86FC), width: 1.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r))),
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Back'),
                      ),
                    ),
                    SizedBox(
                      width: 155.w,
                      height: 43.h,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xffBB86FC),
                            foregroundColor: darkTextColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r))),
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Done'),
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
  }

  DateTime _dateTime = DateTime.now();
  Widget timePicker() {
    return TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: TextStyle(
          fontSize: 28,
          color: widget.darkMode
              ? const Color(0xff606060)
              : const Color(0xffD9D9D9)),
      highlightedTextStyle: TextStyle(
          fontSize: 35,
          color: widget.darkMode ? darkTextColor : lightTextColor),
      spacing: 50,
      itemHeight: 50,
      alignment: Alignment.center,
      isForce2Digits: true,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }
}
