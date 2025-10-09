
###  **1. if-elif-else example (save as `if_elif.py`)**

```python
# if_elif.py
# Simple program using if, elif, and else

score = int(input("Enter your score: "))

if score >= 90:
    print("Grade: A")
elif score >= 75:
    print("Grade: B")
elif score >= 60:
    print("Grade: C")
else:
    print("Grade: F")
```

**How to run:**

```bash
python3 if_elif.py
```

**Example output:**

```
Enter your score: 82
Grade: B
```

---

###  **2. List example (save as `list_demo.py`)**

```python
# list_demo.py
# Simple program showing basic list operations

fruits = ["apple", "banana", "cherry"]

print("Original list:", fruits)

# Add a new item
fruits.append("mango")
print("After adding mango:", fruits)

# Remove an item
fruits.remove("banana")
print("After removing banana:", fruits)

# Access specific items
print("First fruit:", fruits[0])

# Iterate over list
print("All fruits:")
for fruit in fruits:
    print("-", fruit)

# List comprehension (length of each fruit name)
lengths = [len(fruit) for fruit in fruits]
print("Name lengths:", lengths)
```

**How to run:**

```bash
python3 list_demo.py
```

**Example output:**

```
Original list: ['apple', 'banana', 'cherry']
After adding mango: ['apple', 'banana', 'cherry', 'mango']
After removing banana: ['apple', 'cherry', 'mango']
First fruit: apple
All fruits:
- apple
- cherry
- mango
Name lengths: [5, 6, 5]
```

