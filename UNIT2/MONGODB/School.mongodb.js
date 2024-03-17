use("School")

db.getCollection('Users').insertMany(
    [
        {
          "name": "Alice",
          "marks": 50,
          "subject": ["Math"],
          "address": {
            "state_id": "CA",
            "country_id": "USA"
          }
        },
        {
          "name": "Bob",
          "marks": 65,
          "subject": ["English", "History"],
          "address": {
            "state_id": "NY",
            "country_id": "USA"
          }
        },
        {
          "name": "Charlie",
          "marks": 75,
          "subject": ["Science", "Physics"],
          "address": {
            "state_id": "TX",
            "country_id": "USA"
          }
        },
        {
          "name": "David",
          "marks": 80,
          "subject": ["Chemistry", "Biology"],
          "address": {
            "state_id": "FL",
            "country_id": "USA"
          }
        },
        {
          "name": "Eva",
          "marks": 55,
          "subject": ["Art"],
          "address": {
            "state_id": "WA",
            "country_id": "USA"
          }
        },
        {
          "name": "Frank",
          "marks": 90,
          "subject": ["Computer Science"],
          "address": {
            "state_id": "CA",
            "country_id": "USA"
          }
        },
        {
          "name": "Grace",
          "marks": 70,
          "subject": ["Geography", "Economics"],
          "address": {
            "state_id": "IL",
            "country_id": "USA"
          }
        },
        {
          "name": "Hannah",
          "marks": 85,
          "subject": ["Music"],
          "address": {
            "state_id": "GA",
            "country_id": "USA"
          }
        },
        {
          "name": "Ian",
          "marks": 60,
          "subject": ["Physical Education"],
          "address": {
            "state_id": "OH",
            "country_id": "USA"
          }
        },
        {
          "name": "Jack",
          "marks": 95,
          "subject": ["Literature", "Philosophy"],
          "address": {
            "state_id": "MI",
            "country_id": "USA"
          }
        }
      ]
      
)