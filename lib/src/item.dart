import 'package:flutter/material.dart';
import 'package:tuanis_sidebar/src/core/ext.dart';

/// Represents an item in the sidebar
/// [id] The item identifier. Used to know if this is the active item
/// [tile] A ListTile component. The properties of this component will override any global property
/// [expandIcon] The icon to show when the item has subitems. The default value is `arrow_forward_ios`
/// [isSelected] If true, then the item is shown as selected
/// [items] The sub-items
class TuanisSidebarItem extends StatefulWidget {
  final String id;
  final ListTile tile;
  final Icon? expandIcon;
  final bool isSelected;
  final List<TuanisSidebarItem> items;

  const TuanisSidebarItem({
    super.key,
    required this.id,
    required this.tile,
    // required this.label,
    this.expandIcon = const Icon(
      Icons.arrow_forward_ios,
      size: 16,
    ),
    this.isSelected = false,
    this.items = const [],
  });

  @override
  State<StatefulWidget> createState() => _TuanisSidebarItem();

  TuanisSidebarItem copyWith({required ListTile extTile, required bool extIsSelected}) {
    return TuanisSidebarItem(
      id: id,
      tile: extTile,
      expandIcon: expandIcon,
      isSelected: extIsSelected,
      items: items,
    );
  }
}

class _TuanisSidebarItem extends State<TuanisSidebarItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// copyWith is an extension (see core/ext.dart)
    return widget.tile.setDefaults(
      defaultSelected: widget.isSelected,
      defaultTrailing: widget.items.isNotEmpty ? const Icon(Icons.arrow_forward_ios) : null,
    );
  }
}
