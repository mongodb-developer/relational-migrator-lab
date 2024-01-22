# Docusaurus Template Workshop

This website is built using [Docusaurus 2](https://docusaurus.io/), a modern static website generator. It's available on https://mongodb-developer.github.io/docusaurus-workshop/.

This is a template to create new Workshop documentation sites. Contains info on how to use Docusaurus and is a good starting point.

### Installation

```
npx create-docusaurus@latest name-of-my-new-awesome-workshop https://github.com/mongodb-developer/docusaurus-workshop
cd name-of-my-new-awesome-workshop
npm start
```

As you don't want to get the changes of these sample pages, just delete the `.git` folder and then `git init`.

Open `docusaurus.config.js` and change at least the `workshopName`

### Local Development

```
$ npm start
```

This command starts a local development server and opens up a browser window. Most changes are reflected live without having to restart the server.

### Build

```
$ npm build
```

This command generates static content into the `build` directory and can be served using any static contents hosting service.

### Deployment

Use the provided Github Action, or deploy manually after building

### Disclaimer

Use at your own risk; not a supported MongoDB product
