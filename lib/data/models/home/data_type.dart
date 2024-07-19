enum Layout {
  LIST,
  GRID;

  static Layout valueOf(String type) => switch (type) {
        "GRID" => Layout.GRID,
        "LIST" => Layout.LIST,
        String() => Layout.LIST,
      };
}
