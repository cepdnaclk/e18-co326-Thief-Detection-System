import mysql.connector
import base64
from PIL import Image
from io import BytesIO

def save_base64_image(base64_string, file_path):
    # Decode the base64 string to bytes
    image_data = base64.b64decode(base64_string)

    # Create a PIL Image object from the image data
    image = Image.open(BytesIO(image_data))

    # Save the image to the specified file path
    image.save(file_path)



# Connect to the MySQL database
connection = mysql.connector.connect(
    host="sql12.freemysqlhosting.net",
    user="sql12629454",
    password="BEgnZYehMT",
    database="sql12629454"
)

# Create a cursor object to execute SQL queries
cursor = connection.cursor()

# Define the SQL query to retrieve data from the table
sql_query = "SELECT * FROM ImageData"

# Execute the SQL query
cursor.execute(sql_query)

# Fetch all the rows returned by the query
rows = cursor.fetchall()

# Process the retrieved data
for i,row in enumerate(rows):
    # Access the values in each row using index or column names
    column1_value = row[0]  # Assuming the first column is at index 0
    base64_string = column1_value
    file_path = "/Users/hari/Downloads/326Project/image"+ str(i)+".jpg"
    save_base64_image(base64_string, file_path)


    # ... and so on

    # Perform desired operations with the retrieved data

# Close the cursor and the database connection
# print(column1_value)
# Example usage
# base64_string = column1_value
# file_path = "/Users/hari/Downloads/326Project/image.jpg"

cursor.close()
connection.close()
