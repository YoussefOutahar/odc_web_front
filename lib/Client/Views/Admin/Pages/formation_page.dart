import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../DataBase/Controllers/formation_controller.dart';
import '../../../../DataBase/Models/formations.dart';

class FormationsPage extends StatefulWidget {
  const FormationsPage({super.key});

  @override
  State<FormationsPage> createState() => _FormationsPageState();
}

class _FormationsPageState extends State<FormationsPage> {
  Widget? currentView;

  @override
  void initState() {
    currentView = _buildFormationListView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "in Devellopement",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );

    //return currentView ?? const Center(child: CircularProgressIndicator());
  }

  Widget _buildFormationListView() => Stack(
        children: [
          StreamBuilder(
            stream: FormationController.getFormations(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          title: Text(snapshot.data![index].title),
                          subtitle: Text(snapshot.data![index].category),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.mode_edit),
                                onPressed: () async {
                                  setState(() {
                                    currentView = _buildEditFormationView(
                                        snapshot.data![index]);
                                  });
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () async {
                                  // await FormationController.deleteFormation(
                                  //     snapshot.data![index].uid);
                                  Get.snackbar(
                                    'Formation deleted',
                                    'Formation deleted successfully',
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return const Text('Error');
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    currentView = _buildAddFormationView();
                  });
                },
              ),
            ),
          ),
        ],
      );

  Widget _buildAddFormationView() => Stack(
        children: [
          FormationData(
              formation: Formation(
                uid: "",
                title: "",
                category: "",
                image: "",
              ),
              onCanceled: () => setState(() {
                    currentView = _buildFormationListView();
                  })),
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    currentView = _buildFormationListView();
                  });
                },
              ),
            ),
          ),
        ],
      );

  Widget _buildEditFormationView(Formation formation) => Stack(
        children: [
          FormationData(
              formation: formation,
              onCanceled: () => setState(() {
                    currentView = _buildFormationListView();
                  })),
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    currentView = _buildFormationListView();
                  });
                },
              ),
            ),
          ),
        ],
      );
}

class FormationData extends StatefulWidget {
  const FormationData(
      {super.key, required this.formation, required this.onCanceled});

  final Formation formation;
  final VoidCallback onCanceled;
  @override
  State<FormationData> createState() => _FormationDataState();
}

class _FormationDataState extends State<FormationData> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  @override
  void initState() {
    _titleController.text = widget.formation.title;
    _categoryController.text = widget.formation.category;
    _imageController.text = widget.formation.image;
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _categoryController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 40, right: 40),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                controller: _categoryController,
                decoration: const InputDecoration(
                  labelText: 'Category',
                ),
              ),
              TextField(
                controller: _imageController,
                decoration: const InputDecoration(
                  labelText: 'Image',
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: widget.onCanceled,
                  child: const Text('Cancel'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    // await EventsController.updateEvent();
                  },
                  child: const Text('Done'),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
