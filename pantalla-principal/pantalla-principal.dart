import 'package:flutter/material.dart';
import 'settings_menu.dart';

const Color mainColor = Color(0xFF7BA238);

void main() {
  runApp(const EZBarApp());
}

class EZBarApp extends StatelessWidget {
  const EZBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EZ BAR',
      home: const MainMenu(),
    );
  }
}

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _showAddZoneField = false;
  final TextEditingController _zoneController = TextEditingController();
  List<Zone> zones = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      // === aquí cargamos el menú desde otro archivo ===
      drawer: const SettingsMenu(),

      backgroundColor: const Color(0xFFECF0D5),

      body: Column(
        children: [
          // === barra superior ===
          Container(
            height: 55,
            color: mainColor,
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black, size: 28),
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showAddZoneField = !_showAddZoneField;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black54),
                      ),
                      child: const Text(
                        "Agregar Zona",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  if (_showAddZoneField)
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _zoneController,
                            decoration: const InputDecoration(
                              labelText: "Nombre de la zona",
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.check),
                          onPressed: () {
                            if (_zoneController.text.isNotEmpty) {
                              setState(() {
                                zones.add(Zone(name: _zoneController.text));
                                _zoneController.clear();
                              });
                            }
                          },
                        ),
                      ],
                    ),

                  const SizedBox(height: 10),

                  Expanded(
                    child: ListView(
                      children: zones.map((z) => ZoneWidget(zone: z)).toList(),
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

// === MODELO DE ZONA ===
class Zone {
  String name;
  bool isOpen = false;
  List<String> tables = [];

  Zone({required this.name});
}

// === WIDGET ZONA ===
class ZoneWidget extends StatefulWidget {
  final Zone zone;

  const ZoneWidget({super.key, required this.zone});

  @override
  State<ZoneWidget> createState() => _ZoneWidgetState();
}

class _ZoneWidgetState extends State<ZoneWidget> {
  final TextEditingController _tableController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black54),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(widget.zone.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            trailing: Icon(widget.zone.isOpen ? Icons.expand_less : Icons.expand_more),
            onTap: () {
              setState(() {
                widget.zone.isOpen = !widget.zone.isOpen;
              });
            },
          ),

          if (widget.zone.isOpen)
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  for (var table in widget.zone.tables)
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.black45),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(table),
                          IconButton(
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () {
                              setState(() {
                                widget.zone.tables.remove(table);
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _tableController,
                          decoration: const InputDecoration(
                            labelText: "Nombre de la mesa",
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          if (_tableController.text.isNotEmpty) {
                            setState(() {
                              widget.zone.tables.add(_tableController.text);
                              _tableController.clear();
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
