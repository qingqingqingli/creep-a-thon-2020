# creep-a-thon-2020

![Alt text](img/leo.jpg?raw=true "Leo is awesome")

## Table of Contents

- [Background](#background)
- [Install](#install)
- [Usage](#usage)
- [Related Efforts](#related-efforts)
- [Maintainers](#maintainers)
- [Contributing](#contributing)
- [License](#license)

## Background

The data of Venmo's users are public by default. Venmo was launched in 2009, targeting friends that needed an easy way to split their bills. In the first quarter of 2018, Venmo handled $12 billion in transactions. Currently, Venmo has over 50 million users, of which 83% are below 34 years old. Their young demographic is often unaware of the fact that their transaction history, including username, profile picture, and the notes that come with their payments are out there for the world to see. In 2019, Mozilla and EFF (Electronic Frontier Foundation) have sent a public letter to Venmo, in which they state their privacy concerns regarding the data of Venmo's users. Since then, Venmo has only limited the rate of use of its API. Today, there exists a dataset, published by Dan Salmon, an information security grad student. This dataset contains around seven million transactions.

On December 12th, Codam students were challenged by Mozilla to present a revealing story found within the dataset published by [Dan Salmon](https://github.com/sa7mon/venmo-data). This challenge is called the "Creep-a-Thon". We are being graded on on three criteria: Open Source Implementation, Storytelling, and Privacy Recommendations.

When Venmo users create an account, their data is public, unless you change that in the settings. Venmo is unwilling to make the data of their users private by default. That's where our solution comes in to play. To reach Venmo's young demopgraphic, we decided we had to be where their users are. That's why we have created an Instagram account (@setyourvenmoprivate), where we post memes that use notes that real people have used by paying with Venmo. Our message is to make Venmo users aware of the fact that their data is public, and we encourage them to change this setting to private. You can join us in the making of memes using and improving this small set of tools we made in this repository. 

## Install

The dataset used is provided by researcher [@sa7mon](https://github.com/sa7mon) from his [venmo-data repository](https://github.com/sa7mon/venmo-data). To automatically have
the compressed dataset file copied into the container, you'll have to 
download the *venmo.tar.xz* file from the [google drive](https://drive.google.com/drive/folders/1m59TMADiwk3gArT-teUUOBlSKokq51ZL?usp=sharing)

For the whole system to work, some tools have to be installed. Make sure
*docker-compose* is installed with docker and *pip* is installed with python.
* Python3.6: https://www.python.org/downloads/
* Docker: https://docs.docker.com/get-docker/

To install the necessary packages, run the following command on your host computer:
```bash
> python3 -m pip install pandas jupyterlab pymongo
```

We use MongoDB as a main database because the dataset is provided in the
form of a .bson restore file. We use metabase as an easy interface to the dataset.
**Make sure you move the venmo.tar.xz file into the cloned repository root directory so it sits next to the Dockerfile.**

To get mongodb and metabase up and running, run the following command:
```bash
> docker-compose up -d
```

This should start both containers. **Metabase might take around 15 seconds too start so don't worry if you can not immediately reach it**. After this you'll have to manually untar
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

Metabase runs on localhost port 3000 so going to http://localhost:3000 will get you too the login screen. Going through to initial setup, you will need the following information when adding the database:
| Option        | Value  |      
| ------------- |:-------------:|
| Database type     | right-aligned |
| Name      | venmo-dataset      |
| Host | mongo      |
| Database name | flatten      |
| Port | 27017      |
| username | admin      |
| password | password      |
| Authentication Database | admin |

Now follow the following steps:
* Build up your new mongodb collection using the flattended out transactions.
* Find a nice transaction with a funny description
* Make an awesome meme about using a tool like [this](http://apimeme.com/) or automate it with a [REST API](https://rapidapi.com/meme-generator-api-meme-generator-api-default/api/meme-generator)
* Share it on instagram with the hashtag **#SetYourVenmoPrivate**

![Alt text](img/insta.jpg?raw=true "https://www.instagram.com/setyourvenmoprivate/")

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


## Aknowledgements :raised_hands:

Thanks to [Codam](https://www.codam.nl/en/) for organising the Creep-a-thon in collaberation with [Mozilla](https://www.mozilla.org/en-US/).

## License

[MIT](LICENSE) © Jesse van der Wolf