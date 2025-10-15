#dictionaries
person = [
    {"name": "shiza", "designation": "student", "degree": "cs"},
    {"name": "shifa", "designation": "student", "degree": "telecom"},
    {"name": "shana", "designation": "student", "degree": "cs"}
]

for p in person:
    print(p["name"])


# Initial dictionary
person = {
    "name": "xyz",
    "designation": "student",
    "degree": "cs"
}

# Add a new key-value pair
person["age"] = 21
print("After adding age:", person)

# Remove a key-value pair
del person["degree"]
print("After removing degree:", person)

#output:
shiza
shifa
shana
After adding age: {'name': 'xyz', 'designation': 'student', 'degree': 'cs', 'age': 21}
After removing degree: {'name': 'xyz', 'designation': 'student', 'age': 21}

