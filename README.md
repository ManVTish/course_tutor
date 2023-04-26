# README

Note: Endpoints were tested using Postman

1) POST /courses (create)

Request:
{
    "course": {
        "course_name": "CS",
        "skill": "programming",
        "fee": 150,
        "tutor_details": [
            {
                "tutor_name": "HKS",
                "expertise": "Electrical",
                "degree": "Bachelor",
                "yoe": 5
            },
            {
                "tutor_name": "GR",
                "expertise": "Web App",
                "degree": "Masters",
                "yoe": 10
            }
        ]
    }
}

2) GET /courses (index)

Response (for above request):
[
    {
        "id": 1,
        "name": "CS",
        "skill": "programming",
        "fees_in_USD": "150",
        "created_at": "2023-04-26T09:16:22.139Z",
        "course_tutors": [
            {
                "id": 1,
                "name": "HKS",
                "expertise": "Electrical",
                "qualification": "Bachelor",
                "work_exp_in_years": 5
            },
            {
                "id": 2,
                "name": "GR",
                "expertise": "Web App",
                "qualification": "Masters",
                "work_exp_in_years": 10
            }
        ]
    }
]
