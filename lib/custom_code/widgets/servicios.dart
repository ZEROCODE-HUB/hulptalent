// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Modelos de datos
class Categoria {
  final String id;
  final String nombre;
  List<Subcategoria> subcategorias = [];
  bool isSelected = false;
  bool isExpanded = false;

  Categoria({
    required this.id,
    required this.nombre,
  });
}

class Subcategoria {
  final String id;
  final String nombre;
  final String? descripcion;
  final String categoriaId;
  List<Servicio> servicios = [];
  bool isSelected = false;
  bool isExpanded = false;

  Subcategoria({
    required this.id,
    required this.nombre,
    this.descripcion,
    required this.categoriaId,
  });
}

class Servicio {
  final String id;
  final String nombre;
  final String? descripcion;
  final double? precio;
  final String subcategoriaId;
  bool isSelected = false;

  Servicio({
    required this.id,
    required this.nombre,
    this.descripcion,
    this.precio,
    required this.subcategoriaId,
  });
}

class Servicios extends StatefulWidget {
  const Servicios({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;
  @override
  State<Servicios> createState() => _ServiciosState();
}

class _ServiciosState extends State<Servicios> {
  List<Categoria> categorias = [];
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      setState(() {
        isLoading = true;
        error = null;
      });

      // Usar la consulta SQL directamente
      final response = await SupaFlow.client.from('categorias').select('''
            id,
            nombre,
            subcategorias:subcategorias(
              id,
              nombre,
              descripcion,
              categoria_id,
              servicios:servicios(
                id,
                nombre,
                descripcion,
                precio,
                subcategoria_id
              )
            )
          ''');

      if (response == null) {
        throw Exception('No se pudieron cargar los datos');
      }

      _processData(response);
    } catch (e) {
      setState(() {
        error = 'Error al cargar datos: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _processData(dynamic data) {
    List<Categoria> categoriasTemp = [];

    for (var categoriaData in data) {
      Categoria categoria = Categoria(
        id: categoriaData['id'],
        nombre: categoriaData['nombre'],
      );

      // Procesar subcategorías si existen
      if (categoriaData['subcategorias'] != null) {
        for (var subcategoriaData in categoriaData['subcategorias']) {
          Subcategoria subcategoria = Subcategoria(
            id: subcategoriaData['id'],
            nombre: subcategoriaData['nombre'],
            descripcion: subcategoriaData['descripcion'],
            categoriaId: categoriaData['id'],
          );

          // Procesar servicios si existen
          if (subcategoriaData['servicios'] != null) {
            for (var servicioData in subcategoriaData['servicios']) {
              Servicio servicio = Servicio(
                id: servicioData['id'],
                nombre: servicioData['nombre'],
                descripcion: servicioData['descripcion'],
                precio: servicioData['precio'] != null
                    ? double.tryParse(servicioData['precio'].toString())
                    : null,
                subcategoriaId: subcategoriaData['id'],
              );
              subcategoria.servicios.add(servicio);
            }
          }

          categoria.subcategorias.add(subcategoria);
        }
      }

      categoriasTemp.add(categoria);
    }

    setState(() {
      categorias = categoriasTemp;
    });
  }

  void _onCategoriaChanged(Categoria categoria, bool? value) {
    setState(() {
      categoria.isSelected = value ?? false;

      // Seleccionar/deseleccionar todas las subcategorías y servicios
      for (var subcategoria in categoria.subcategorias) {
        subcategoria.isSelected = categoria.isSelected;
        for (var servicio in subcategoria.servicios) {
          servicio.isSelected = categoria.isSelected;
        }
      }

      // Actualizar AppState
      _updateAppState();
    });
  }

  void _onSubcategoriaChanged(Subcategoria subcategoria, bool? value) {
    setState(() {
      subcategoria.isSelected = value ?? false;

      // Seleccionar/deseleccionar todos los servicios de la subcategoría
      for (var servicio in subcategoria.servicios) {
        servicio.isSelected = subcategoria.isSelected;
      }

      // Actualizar estado de la categoría padre
      _updateCategoriaState(subcategoria.categoriaId);

      // Actualizar AppState
      _updateAppState();
    });
  }

  void _onServicioChanged(Servicio servicio, bool? value) {
    setState(() {
      servicio.isSelected = value ?? false;

      // Actualizar estado de la subcategoría y categoría padre
      _updateSubcategoriaState(servicio.subcategoriaId);

      // Actualizar AppState
      _updateAppState();
    });
  }

  void _updateCategoriaState(String categoriaId) {
    Categoria categoria = categorias.firstWhere((cat) => cat.id == categoriaId);

    bool allSubcategoriasSelected = categoria.subcategorias.isNotEmpty &&
        categoria.subcategorias.every((sub) => sub.isSelected);

    categoria.isSelected = allSubcategoriasSelected;
  }

  void _updateSubcategoriaState(String subcategoriaId) {
    Subcategoria? subcategoria;
    String categoriaId = '';

    for (var categoria in categorias) {
      for (var sub in categoria.subcategorias) {
        if (sub.id == subcategoriaId) {
          subcategoria = sub;
          categoriaId = categoria.id;
          break;
        }
      }
      if (subcategoria != null) break;
    }

    if (subcategoria != null) {
      bool allServiciosSelected = subcategoria.servicios.isNotEmpty &&
          subcategoria.servicios.every((serv) => serv.isSelected);

      subcategoria.isSelected = allServiciosSelected;
      _updateCategoriaState(categoriaId);
    }
  }

  List<Map<String, dynamic>> getSelectedItems() {
    List<Map<String, dynamic>> selected = [];

    for (var categoria in categorias) {
      if (categoria.isSelected) {
        selected.add({
          'tipo': 'categoria',
          'id': categoria.id,
          'nombre': categoria.nombre,
        });
      }

      for (var subcategoria in categoria.subcategorias) {
        if (subcategoria.isSelected && !categoria.isSelected) {
          selected.add({
            'tipo': 'subcategoria',
            'id': subcategoria.id,
            'nombre': subcategoria.nombre,
            'categoria_id': categoria.id,
          });
        }

        for (var servicio in subcategoria.servicios) {
          if (servicio.isSelected && !subcategoria.isSelected) {
            selected.add({
              'tipo': 'servicio',
              'id': servicio.id,
              'nombre': servicio.nombre,
              'subcategoria_id': subcategoria.id,
              'precio': servicio.precio,
            });
          }
        }
      }
    }

    return selected;
  }

  // Nuevo método para actualizar AppState con IDs de servicios seleccionados
  void _updateAppState() {
    List<String> serviciosSeleccionados = [];

    for (var categoria in categorias) {
      for (var subcategoria in categoria.subcategorias) {
        for (var servicio in subcategoria.servicios) {
          if (servicio.isSelected) {
            serviciosSeleccionados.add(servicio.id);
          }
        }
      }
    }

    // Actualizar AppState
    FFAppState().update(() {
      FFAppState().idServiciosList = serviciosSeleccionados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Se adapta al contenido
        children: [
          // Content
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (isLoading) {
      return Container(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
              const SizedBox(height: 16),
              Text(
                'Cargando servicios...',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
              ),
            ],
          ),
        ),
      );
    }

    if (error != null) {
      return Container(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                size: 48,
                color: FlutterFlowTheme.of(context).error,
              ),
              const SizedBox(height: 16),
              Text(
                error!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).error,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadData,
                child: Text('Reintentar'),
              ),
            ],
          ),
        ),
      );
    }

    if (categorias.isEmpty) {
      return Container(
        height: 150,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.category_outlined,
                size: 48,
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
              const SizedBox(height: 16),
              Text(
                'No hay categorías disponibles',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
              ),
            ],
          ),
        ),
      );
    }

    // Lista que se adapta al contenido sin altura fija
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: categorias
          .map((categoria) => _buildCategoriaCard(categoria))
          .toList(),
    );
  }

  Widget _buildCategoriaCard(Categoria categoria) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 0,
      child: Column(
        children: [
          // Header de la categoría
          ListTile(
            leading: Checkbox(
              value: categoria.isSelected,
              onChanged: (value) => _onCategoriaChanged(categoria, value),
              activeColor: FlutterFlowTheme.of(context).primary,
            ),
            title: Text(
              categoria.nombre,
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.w500,
                  ),
            ),
            trailing: categoria.subcategorias.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      categoria.isExpanded
                          ? Icons.expand_less
                          : Icons.expand_more,
                    ),
                    onPressed: () {
                      setState(() {
                        categoria.isExpanded = !categoria.isExpanded;
                      });
                    },
                  )
                : null,
          ),

          // Subcategorías expandibles
          if (categoria.isExpanded && categoria.subcategorias.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
              child: Column(
                children: categoria.subcategorias
                    .map((subcategoria) => _buildSubcategoriaCard(subcategoria))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSubcategoriaCard(Subcategoria subcategoria) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      color: FlutterFlowTheme.of(context).secondaryBackground,
      child: Column(
        children: [
          ListTile(
            leading: Checkbox(
              value: subcategoria.isSelected,
              onChanged: (value) => _onSubcategoriaChanged(subcategoria, value),
              activeColor: FlutterFlowTheme.of(context).primary,
            ),
            title: Text(
              subcategoria.nombre,
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.w500,
                  ),
            ),
            trailing: subcategoria.servicios.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      subcategoria.isExpanded
                          ? Icons.expand_less
                          : Icons.expand_more,
                    ),
                    onPressed: () {
                      setState(() {
                        subcategoria.isExpanded = !subcategoria.isExpanded;
                      });
                    },
                  )
                : null,
          ),

          // Servicios expandibles
          if (subcategoria.isExpanded && subcategoria.servicios.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
              child: Column(
                children: subcategoria.servicios
                    .map((servicio) => _buildServicioCard(servicio))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildServicioCard(Servicio servicio) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 4),
      child: ListTile(
        leading: Checkbox(
          value: servicio.isSelected,
          onChanged: (value) => _onServicioChanged(servicio, value),
          activeColor: FlutterFlowTheme.of(context).primary,
        ),
        title: Text(
          servicio.nombre,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
