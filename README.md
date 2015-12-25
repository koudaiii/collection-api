# Collection API

https://immense-harbor-2167.herokuapp.com/

For Hack a thon

## How to develop

```
git clone [this repository]
cd collection-api
bundle install
bundle exec foreman run web
```

## API

### GET(/collections/)

* req

```:json
{
  user_id: "id"
}
```

* res

```:json
{
 stamp_id: ["ojigi_2", "ojigi_3"]
}
```

* stamp_id で uniqにされたものを返すようにする

### POST(/collections)

```
{
  user_id : "user_id"
  stamp_id: "stamp_id"
}
```
