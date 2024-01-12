// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $RecipeTable extends Recipe with TableInfo<$RecipeTable, RecipeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idRecipeMeta =
      const VerificationMeta('idRecipe');
  @override
  late final GeneratedColumn<int> idRecipe = GeneratedColumn<int>(
      'id_recipe', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'Title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'Description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'Duration', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idRecipe, title, description, duration];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe';
  @override
  VerificationContext validateIntegrity(Insertable<RecipeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_recipe')) {
      context.handle(_idRecipeMeta,
          idRecipe.isAcceptableOrUnknown(data['id_recipe']!, _idRecipeMeta));
    }
    if (data.containsKey('Title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['Title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('Description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['Description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('Duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['Duration']!, _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idRecipe};
  @override
  RecipeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeData(
      idRecipe: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_recipe'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}Title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}Description'])!,
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}Duration'])!,
    );
  }

  @override
  $RecipeTable createAlias(String alias) {
    return $RecipeTable(attachedDatabase, alias);
  }
}

class RecipeData extends DataClass implements Insertable<RecipeData> {
  final int idRecipe;
  final String title;
  final String description;
  final int duration;
  const RecipeData(
      {required this.idRecipe,
      required this.title,
      required this.description,
      required this.duration});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_recipe'] = Variable<int>(idRecipe);
    map['Title'] = Variable<String>(title);
    map['Description'] = Variable<String>(description);
    map['Duration'] = Variable<int>(duration);
    return map;
  }

  RecipeCompanion toCompanion(bool nullToAbsent) {
    return RecipeCompanion(
      idRecipe: Value(idRecipe),
      title: Value(title),
      description: Value(description),
      duration: Value(duration),
    );
  }

  factory RecipeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeData(
      idRecipe: serializer.fromJson<int>(json['idRecipe']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      duration: serializer.fromJson<int>(json['duration']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idRecipe': serializer.toJson<int>(idRecipe),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'duration': serializer.toJson<int>(duration),
    };
  }

  RecipeData copyWith(
          {int? idRecipe, String? title, String? description, int? duration}) =>
      RecipeData(
        idRecipe: idRecipe ?? this.idRecipe,
        title: title ?? this.title,
        description: description ?? this.description,
        duration: duration ?? this.duration,
      );
  @override
  String toString() {
    return (StringBuffer('RecipeData(')
          ..write('idRecipe: $idRecipe, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('duration: $duration')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idRecipe, title, description, duration);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeData &&
          other.idRecipe == this.idRecipe &&
          other.title == this.title &&
          other.description == this.description &&
          other.duration == this.duration);
}

class RecipeCompanion extends UpdateCompanion<RecipeData> {
  final Value<int> idRecipe;
  final Value<String> title;
  final Value<String> description;
  final Value<int> duration;
  const RecipeCompanion({
    this.idRecipe = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.duration = const Value.absent(),
  });
  RecipeCompanion.insert({
    this.idRecipe = const Value.absent(),
    required String title,
    required String description,
    required int duration,
  })  : title = Value(title),
        description = Value(description),
        duration = Value(duration);
  static Insertable<RecipeData> custom({
    Expression<int>? idRecipe,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? duration,
  }) {
    return RawValuesInsertable({
      if (idRecipe != null) 'id_recipe': idRecipe,
      if (title != null) 'Title': title,
      if (description != null) 'Description': description,
      if (duration != null) 'Duration': duration,
    });
  }

  RecipeCompanion copyWith(
      {Value<int>? idRecipe,
      Value<String>? title,
      Value<String>? description,
      Value<int>? duration}) {
    return RecipeCompanion(
      idRecipe: idRecipe ?? this.idRecipe,
      title: title ?? this.title,
      description: description ?? this.description,
      duration: duration ?? this.duration,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idRecipe.present) {
      map['id_recipe'] = Variable<int>(idRecipe.value);
    }
    if (title.present) {
      map['Title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['Description'] = Variable<String>(description.value);
    }
    if (duration.present) {
      map['Duration'] = Variable<int>(duration.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeCompanion(')
          ..write('idRecipe: $idRecipe, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('duration: $duration')
          ..write(')'))
        .toString();
  }
}

class $IngredientTable extends Ingredient
    with TableInfo<$IngredientTable, IngredientData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IngredientTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idIngredientMeta =
      const VerificationMeta('idIngredient');
  @override
  late final GeneratedColumn<int> idIngredient = GeneratedColumn<int>(
      'id_ingredient', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'Name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [idIngredient, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ingredient';
  @override
  VerificationContext validateIntegrity(Insertable<IngredientData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_ingredient')) {
      context.handle(
          _idIngredientMeta,
          idIngredient.isAcceptableOrUnknown(
              data['id_ingredient']!, _idIngredientMeta));
    }
    if (data.containsKey('Name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['Name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idIngredient};
  @override
  IngredientData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IngredientData(
      idIngredient: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_ingredient'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}Name'])!,
    );
  }

  @override
  $IngredientTable createAlias(String alias) {
    return $IngredientTable(attachedDatabase, alias);
  }
}

class IngredientData extends DataClass implements Insertable<IngredientData> {
  final int idIngredient;
  final String name;
  const IngredientData({required this.idIngredient, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_ingredient'] = Variable<int>(idIngredient);
    map['Name'] = Variable<String>(name);
    return map;
  }

  IngredientCompanion toCompanion(bool nullToAbsent) {
    return IngredientCompanion(
      idIngredient: Value(idIngredient),
      name: Value(name),
    );
  }

  factory IngredientData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IngredientData(
      idIngredient: serializer.fromJson<int>(json['idIngredient']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idIngredient': serializer.toJson<int>(idIngredient),
      'name': serializer.toJson<String>(name),
    };
  }

  IngredientData copyWith({int? idIngredient, String? name}) => IngredientData(
        idIngredient: idIngredient ?? this.idIngredient,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('IngredientData(')
          ..write('idIngredient: $idIngredient, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idIngredient, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IngredientData &&
          other.idIngredient == this.idIngredient &&
          other.name == this.name);
}

class IngredientCompanion extends UpdateCompanion<IngredientData> {
  final Value<int> idIngredient;
  final Value<String> name;
  const IngredientCompanion({
    this.idIngredient = const Value.absent(),
    this.name = const Value.absent(),
  });
  IngredientCompanion.insert({
    this.idIngredient = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<IngredientData> custom({
    Expression<int>? idIngredient,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (idIngredient != null) 'id_ingredient': idIngredient,
      if (name != null) 'Name': name,
    });
  }

  IngredientCompanion copyWith(
      {Value<int>? idIngredient, Value<String>? name}) {
    return IngredientCompanion(
      idIngredient: idIngredient ?? this.idIngredient,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idIngredient.present) {
      map['id_ingredient'] = Variable<int>(idIngredient.value);
    }
    if (name.present) {
      map['Name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IngredientCompanion(')
          ..write('idIngredient: $idIngredient, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $RecipeIngredientTable extends RecipeIngredient
    with TableInfo<$RecipeIngredientTable, RecipeIngredientData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeIngredientTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idRecipeIngredientMeta =
      const VerificationMeta('idRecipeIngredient');
  @override
  late final GeneratedColumn<int> idRecipeIngredient = GeneratedColumn<int>(
      'id_recipe_ingredient', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idRecipeMeta =
      const VerificationMeta('idRecipe');
  @override
  late final GeneratedColumn<int> idRecipe = GeneratedColumn<int>(
      'id_recipe', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES recipe (id_recipe)'));
  static const VerificationMeta _idIngredientMeta =
      const VerificationMeta('idIngredient');
  @override
  late final GeneratedColumn<int> idIngredient = GeneratedColumn<int>(
      'id_ingredient', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES ingredient (id_ingredient)'));
  @override
  List<GeneratedColumn> get $columns =>
      [idRecipeIngredient, idRecipe, idIngredient];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_ingredient';
  @override
  VerificationContext validateIntegrity(
      Insertable<RecipeIngredientData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_recipe_ingredient')) {
      context.handle(
          _idRecipeIngredientMeta,
          idRecipeIngredient.isAcceptableOrUnknown(
              data['id_recipe_ingredient']!, _idRecipeIngredientMeta));
    }
    if (data.containsKey('id_recipe')) {
      context.handle(_idRecipeMeta,
          idRecipe.isAcceptableOrUnknown(data['id_recipe']!, _idRecipeMeta));
    }
    if (data.containsKey('id_ingredient')) {
      context.handle(
          _idIngredientMeta,
          idIngredient.isAcceptableOrUnknown(
              data['id_ingredient']!, _idIngredientMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idRecipeIngredient};
  @override
  RecipeIngredientData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeIngredientData(
      idRecipeIngredient: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}id_recipe_ingredient'])!,
      idRecipe: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_recipe']),
      idIngredient: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_ingredient']),
    );
  }

  @override
  $RecipeIngredientTable createAlias(String alias) {
    return $RecipeIngredientTable(attachedDatabase, alias);
  }
}

class RecipeIngredientData extends DataClass
    implements Insertable<RecipeIngredientData> {
  final int idRecipeIngredient;
  final int? idRecipe;
  final int? idIngredient;
  const RecipeIngredientData(
      {required this.idRecipeIngredient, this.idRecipe, this.idIngredient});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_recipe_ingredient'] = Variable<int>(idRecipeIngredient);
    if (!nullToAbsent || idRecipe != null) {
      map['id_recipe'] = Variable<int>(idRecipe);
    }
    if (!nullToAbsent || idIngredient != null) {
      map['id_ingredient'] = Variable<int>(idIngredient);
    }
    return map;
  }

  RecipeIngredientCompanion toCompanion(bool nullToAbsent) {
    return RecipeIngredientCompanion(
      idRecipeIngredient: Value(idRecipeIngredient),
      idRecipe: idRecipe == null && nullToAbsent
          ? const Value.absent()
          : Value(idRecipe),
      idIngredient: idIngredient == null && nullToAbsent
          ? const Value.absent()
          : Value(idIngredient),
    );
  }

  factory RecipeIngredientData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeIngredientData(
      idRecipeIngredient: serializer.fromJson<int>(json['idRecipeIngredient']),
      idRecipe: serializer.fromJson<int?>(json['idRecipe']),
      idIngredient: serializer.fromJson<int?>(json['idIngredient']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idRecipeIngredient': serializer.toJson<int>(idRecipeIngredient),
      'idRecipe': serializer.toJson<int?>(idRecipe),
      'idIngredient': serializer.toJson<int?>(idIngredient),
    };
  }

  RecipeIngredientData copyWith(
          {int? idRecipeIngredient,
          Value<int?> idRecipe = const Value.absent(),
          Value<int?> idIngredient = const Value.absent()}) =>
      RecipeIngredientData(
        idRecipeIngredient: idRecipeIngredient ?? this.idRecipeIngredient,
        idRecipe: idRecipe.present ? idRecipe.value : this.idRecipe,
        idIngredient:
            idIngredient.present ? idIngredient.value : this.idIngredient,
      );
  @override
  String toString() {
    return (StringBuffer('RecipeIngredientData(')
          ..write('idRecipeIngredient: $idRecipeIngredient, ')
          ..write('idRecipe: $idRecipe, ')
          ..write('idIngredient: $idIngredient')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idRecipeIngredient, idRecipe, idIngredient);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeIngredientData &&
          other.idRecipeIngredient == this.idRecipeIngredient &&
          other.idRecipe == this.idRecipe &&
          other.idIngredient == this.idIngredient);
}

class RecipeIngredientCompanion extends UpdateCompanion<RecipeIngredientData> {
  final Value<int> idRecipeIngredient;
  final Value<int?> idRecipe;
  final Value<int?> idIngredient;
  const RecipeIngredientCompanion({
    this.idRecipeIngredient = const Value.absent(),
    this.idRecipe = const Value.absent(),
    this.idIngredient = const Value.absent(),
  });
  RecipeIngredientCompanion.insert({
    this.idRecipeIngredient = const Value.absent(),
    this.idRecipe = const Value.absent(),
    this.idIngredient = const Value.absent(),
  });
  static Insertable<RecipeIngredientData> custom({
    Expression<int>? idRecipeIngredient,
    Expression<int>? idRecipe,
    Expression<int>? idIngredient,
  }) {
    return RawValuesInsertable({
      if (idRecipeIngredient != null)
        'id_recipe_ingredient': idRecipeIngredient,
      if (idRecipe != null) 'id_recipe': idRecipe,
      if (idIngredient != null) 'id_ingredient': idIngredient,
    });
  }

  RecipeIngredientCompanion copyWith(
      {Value<int>? idRecipeIngredient,
      Value<int?>? idRecipe,
      Value<int?>? idIngredient}) {
    return RecipeIngredientCompanion(
      idRecipeIngredient: idRecipeIngredient ?? this.idRecipeIngredient,
      idRecipe: idRecipe ?? this.idRecipe,
      idIngredient: idIngredient ?? this.idIngredient,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idRecipeIngredient.present) {
      map['id_recipe_ingredient'] = Variable<int>(idRecipeIngredient.value);
    }
    if (idRecipe.present) {
      map['id_recipe'] = Variable<int>(idRecipe.value);
    }
    if (idIngredient.present) {
      map['id_ingredient'] = Variable<int>(idIngredient.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeIngredientCompanion(')
          ..write('idRecipeIngredient: $idRecipeIngredient, ')
          ..write('idRecipe: $idRecipe, ')
          ..write('idIngredient: $idIngredient')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $RecipeTable recipe = $RecipeTable(this);
  late final $IngredientTable ingredient = $IngredientTable(this);
  late final $RecipeIngredientTable recipeIngredient =
      $RecipeIngredientTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [recipe, ingredient, recipeIngredient];
}
