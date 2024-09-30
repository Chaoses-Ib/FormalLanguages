use schemars::{schema_for, JsonSchema, JsonSchema_repr};

#[derive(JsonSchema)]
pub struct MyStruct {
    /// My int desc
    pub my_int: i32,
    pub my_bool: bool,
    /// My enum desc
    pub my_nullable_enum: Option<MyEnum>,
}

#[derive(JsonSchema)]
pub enum MyEnum {
    /// Desc 1
    StringNewType(String),
    /// Desc 2
    StructVariant { floats: Vec<f32> },
}

/// Enum desc
#[derive(JsonSchema)]
#[repr(i32)]
pub enum MyIntEnum {
    /// Desc 1
    A = 1,
    /// Desc 2
    B = 2,
}

#[derive(JsonSchema)]
pub struct MyIntStruct {
    /// My int desc
    pub my_int: i32,
    pub my_bool: bool,
    /// My enum desc
    pub my_enum: MyIntEnum,
}

/// Enum desc
// #[derive(JsonSchema_repr, struct_metadata::Described)]
#[derive(JsonSchema_repr, bevy_reflect::Reflect)]
#[repr(i32)]
pub enum MyIntEnum2 {
    /// Desc 1
    A = 1,
    /// Desc 2
    B = 2,
}

fn f() {
    // use struct_metadata::Described;

    // let data = MyIntEnum2::metadata();
    // println!("{:?}", data);

    // let descs = match data.kind {
    //     struct_metadata::Kind::Enum { name, variants } => variants
    //         .into_iter()
    //         .map(|v| v.docs.unwrap().join(""))
    //         .collect(),
    //     _ => todo!(),
    // };

    use bevy_reflect::Typed;

    let descs = match MyIntEnum2::type_info() {
        bevy_reflect::TypeInfo::Enum(enum_info) => enum_info
            .iter()
            .map(|v| v.docs().unwrap().to_string())
            .collect(),
        _ => todo!(),
    };

    let schema = schema_for!(MyIntEnum2);
    let mut value = serde_json::to_value(schema).unwrap();
    value["enumDescriptions"] = descs;
    println!("{}", serde_json::to_string_pretty(&value).unwrap());
}

fn main() {
    // let schema = schema_for!(MyStruct);
    // println!("{}", serde_json::to_string_pretty(&schema).unwrap());

    // let schema = schema_for!(MyIntEnum);
    // println!("{}", serde_json::to_string_pretty(&schema).unwrap());

    // let schema = schema_for!(MyIntStruct);
    // println!("{}", serde_json::to_string_pretty(&schema).unwrap());

    f();
}
