import io
import paho.mqtt.client as mqtt
from PIL import Image

# MQTT broker settings
broker_address = "3c32f0b9a6ab48a0981e92db4965c5af.s1.eu.hivemq.cloud"
broker_port = 8883
topic = "work/cam0"



# MQTT event callbacks
def on_connect(client, userdata, flags, rc):
    print("Connected to MQTT broker")
    client.subscribe(topic)

def on_message(client, userdata, msg):
    # When a message is received, decode and display the image
    image = decode_image(msg.payload)
    display_image(image)

def on_disconnect(client, userdata, rc):
    print("Disconnected from MQTT broker")

# MQTT client setup
client = mqtt.Client()
client.tls_set(ca_certs="./ca_cert.crt")
client.username_pw_set("vilakshan29", "Selva1969")
client.on_connect = on_connect
client.on_message = on_message
client.on_disconnect = on_disconnect


client.connect(broker_address, broker_port, 60)

# Image decoding and display functions
def decode_image(image_data):
    print(image_data)
    image = Image.open(io.BytesIO(image_data))
    return image

def display_image(image):
    image.show()

# Start the MQTT client loop
client.loop_forever()
