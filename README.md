# Getting Started

## Using pocketstack as a starting point

Clone this repository, rename the folder and remove teh .git folder

```bash
git clone https://github.com/zanfridau/pocketstack.git
```

```bash
mv pocketstack [desired name]
```

```bash
cd [desired name]
rm -rf .git
```

initialize your own repository

```bash
git init
```

## Local development quickstart

If you followed the steps above you should already be in `[desired name]` folder.

From this point you should generally follow the steps below:

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

If the step above was successfull you should see an output directing you to the admin dashbord. **If you set a different local port in .env file you will need to use that port instead of 8080 to access the dashboard.**

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
docker compose up --build
```

### Pocketbase API preview adjustment

wherever you see this line:

```js
const pb = new PocketBase('http://0.0.0.0:8080');
```

you should probably use:

```js
const isDev = process.env.ENVIRONMENT === "dev";
const pb = new PocketBase(
    isDev
        ? `${process.env.POCKETBASE_URL}:${process.env.PB_LOCAL_PORT}`
        : process.env.POCKETBASE_URL
);
```

