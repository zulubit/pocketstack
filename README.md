# Getting Started

create react app 

```bash
npx create-react-app frontend
```

create dotenv and copy it to frontend.

```bash
cp .env.example .env
cp .env ./frontend/.env
```

start pocketbase

```bash
docker compose up
```

in another terminal 

```bash
cd frontend
npm install
npm run start
```

## NOTES

### If you want to reset pocketbase you need to:

1. Delete the data folder
2. Run:

```bash
docker compose up --rebuild
```

### Pocketbase API preview adjustment

wherever you see this line:

```js
const pb = new PocketBase('http://0.0.0.0:8080');
```

you should probably use:

```js
const pb = new PocketBase(process.env.POCKETBASE_URL);
```


