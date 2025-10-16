# Ejemplo de lógica incremental
with open("checkpoints/last_run.json") as f:
    last_run = json.load(f)["last_run"]

query = f"SELECT * FROM listings WHERE updated_at > '{last_run}'"
df_new = pd.read_sql(query, engine)

# Evita duplicados al cargar
df_new.to_sql("silver_listings", engine, if_exists="append", index=False)
engine.execute("""
    MERGE INTO gold_listings t
    USING silver_listings s
    ON t.id = s.id
    WHEN MATCHED THEN UPDATE SET price = s.price
    WHEN NOT MATCHED THEN INSERT (id, price, neighbourhood, room_type)
    VALUES (s.id, s.price, s.neighbourhood, s.room_type);
""")

# Actualiza checkpoint
json.dump({"last_run": datetime.now().strftime("%Y-%m-%d %H:%M:%S")}, open("checkpoints/last_run.json","w"))
