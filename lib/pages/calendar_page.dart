import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ti_maromba/res/colors.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 40),

              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Status', textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  ]
              ),

              SizedBox(height: 20),

              // Calendário
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(8),

                child: TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: DateTime.now(),

                  calendarStyle: CalendarStyle(
                    outsideTextStyle: TextStyle(color: Colors.grey[700]),
                    weekendTextStyle: TextStyle(color: Colors.grey[400]),
                    defaultTextStyle: TextStyle(color: Colors.white),

                    todayDecoration: BoxDecoration(
                      color: null,
                      shape: BoxShape.circle,
                    ),

                    todayTextStyle: TextStyle(
                      color: AppColors.primary,  // Cor do número
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  headerStyle: HeaderStyle(
                    titleTextStyle: TextStyle(color: Colors.white),
                    titleCentered: true,
                    formatButtonVisible: false,
                    leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
                    rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
                  ),

                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekendStyle: TextStyle(color: Colors.grey[400]),
                    weekdayStyle: TextStyle(color: Colors.grey[300]),
                  ),
                )
                ,
              ),

              SizedBox(height: 30),

              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Resultados', textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  ]
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  // Calorias
                  Container(
                    height: 200,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(8),

                    // Textos
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.local_fire_department_outlined, size: 40, color: AppColors.primary),
                        SizedBox(height: 5),
                        Text('2100', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold)),
                        Text('Calorias', textAlign: TextAlign.center, style: TextStyle(color: Colors.white30, fontSize: 20))
                      ]
                    ),
                  ),

                  SizedBox(width: 15),

                  Column(
                    children: [
                      // tempo de exercício
                      Container(
                        height: 92.5,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.all(8),

                        // Textos
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.hourglass_empty, size: 25, color: AppColors.primary),
                            SizedBox(width: 5),
                            Text('44', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5),
                            Text('Min', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
                          ]
                        ),
                      ),

                      SizedBox(height: 15),

                      // Grupo muscular em foco
                      Container(
                        height: 92.5,
                        width: 160,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(20),
                        ),

                        // Textos
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Zona de foco', textAlign: TextAlign.left, style: TextStyle(color: Colors.white30, fontSize: 15)),
                            SizedBox(height: 2),
                            Text('Full Body', textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold))
                          ]
                        ),
                      )
                    ],
                  )
                ],

              ),
            ],
          ),
        )
    );
  }
}