import streamlit as st
from rembg import remove
from PIL import Image
from io import BytesIO
import base64

import authenticate

authenticate.set_st_state_vars()

st.set_page_config(layout="wide", page_title="Image Background Remover")

# Download the fixed image
def convert_image(img):
    buf = BytesIO()
    img.save(buf, format="PNG")
    byte_im = buf.getvalue()
    return byte_im


def fix_image(upload):
    image = Image.open(upload)
    col1.write("Original Image :camera:")
    col1.image(image)

    fixed = remove(image)
    col2.write("Fixed Image :wrench:")
    col2.image(fixed)
    st.sidebar.markdown("\n")
    st.sidebar.download_button("Download fixed image", convert_image(fixed), "fixed.png", "image/png")

##########################

if not st.session_state["authenticated"]:
    st.markdown("<h2 style='text-align: center;'>Please login!</h2>", unsafe_allow_html=True)
    authenticate.button_login()

else:
    st.write("## Remove background from your image")
    st.write(
        ":dog: Try uploading an image to watch the background magically removed. Full quality images can be downloaded from the sidebar. This code is open source and available [here](https://github.com/tyler-simons/BackgroundRemoval) on GitHub. Special thanks to the [rembg library](https://github.com/danielgatis/rembg) :grin:"
    )
    st.sidebar.write("## Upload and download :gear:")


    col1, col2 = st.columns(2)
    my_upload = st.sidebar.file_uploader("Upload an image", type=["png", "jpg", "jpeg"])

    if my_upload is not None:
        fix_image(upload=my_upload)
    else:
        fix_image("./zebra.jpg")

    authenticate.button_logout()
