# Dev_Container

<p> By using this repo we can start a basic dev environment based on docker. It have python3 and sublime text preinstalled. You can use this to setup quick dev setup.</p>

## Requirements

<p>Just a browser and running docker environment.</p>

## Usage

To run this In container we need to run following commands

```bash
git clone https://github.com/asabhi6776/dev-container.git
cd dev_container
docker network create --subnet=172.31.0.0/16 dev-container
docker-compose up -d
firefox http://localhost:6901
```

## Contributing

<p>Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.</p>

## License

[MIT](https://mit-license.org/)

## Thanks

<a href="https://www.buymeacoffee.com/asabhi6776"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" width="200" /></a>
