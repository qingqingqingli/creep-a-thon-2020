# creep-a-thon-2020

![Alt text](img/leo.jpg?raw=true "Title")

## Table of Contents

- [Background](#background)
- [Install](#install)
- [Usage](#usage)
- [Related Efforts](#related-efforts)
- [Maintainers](#maintainers)
- [Contributing](#contributing)
- [License](#license)

## Background


## Install

The dataset used is provided by researcher @sa7mon from his [venmo-data repository](https://github.com/sa7mon/venmo-data). To automatically have
the compressed dataset file copied into the container, you'll have to 
download the *venmo.tar.xz* file from the [google drive](https://drive.google.com/drive/folders/1m59TMADiwk3gArT-teUUOBlSKokq51ZL?usp=sharing)

For the whole system to work, some tools have to be installed. Make sure
*docker-compose* is installed with docker and *pip* is installed with python.
* Python3.6: https://www.python.org/downloads/
* Docker:	 https://docs.docker.com/get-docker/

To install the necessary python packages, run the following command.
```bash
> python3 -m pip install pandas jupyterlab pymongo
```

We use MongoDB as a main database because the dataset is provided in the
form of a .bson restore file. We use metabase as an interface to the dataset.
**Make sure you move the venmo.tar.xz file into the cloned repository root directory so it sits next to the Dockerfile.**

To get mongodb and metabase up and running, run the following command:
```bash
> docker-compose up -d
```

This should start both containers. After this you'll have to manually untar
the file inside of the container and restore the database using the .bson file. The following commands will help you through this:
```bash
> docker-compose exec mongo /bin/bash
> cd tmp
> tar xf venmo.tar.xz
> mongorestore  --host localhost \
				--port 27017 \
				-u admin \
				-p password \
				--authenticationDatabase admin \
				--collection venmo 
				--db test \
				dump/test/venmo.bson
```

## Usage

After you've restored the mongodb database, you can run the steps provided
in the python jupyter notebook that is provided. You can start the jupyterlab
web server using the following command:
```bash
python3 -m jupyterlab
```

Now follow the following steps:
* Build up your new mongodb collection using the flattended out transactions.
* Find a nice transaction with a funny description
* Make an awesome meme about using a tool like [this](http://apimeme.com/) or automate it with a [REST API](https://rapidapi.com/meme-generator-api-meme-generator-api-default/api/meme-generator)

## Related Efforts

@01fade told a story about the lives of 5 unsuspecting humans.

https://publicbydefault.fyi/

Interesting reads:
* https://nycdatascience.com/blog/student-works/using-venmo-to-map-social-networks/
* https://medium.com/swlh/have-you-left-a-money-trail-on-venmo-d3676d624310

## Maintainers

[@jesseVDwolf](https://github.com/jesseVDwolf)
[@aprilmayjune135](https://github.com/aprilmayjune135)
[@qingqingqingli](https://github.com/qingqingqingli)

## Contributing

Do you want to make some awesome memes using venmo public data and want
to make people more aware that their financial transaction data is available
for everyone too see?


## Contributions



## License

[MIT](LICENSE) © Jesse van der Wolf