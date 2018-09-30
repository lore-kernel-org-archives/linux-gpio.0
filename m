From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/2] USB: serial: ftdi_sio: add support for FT232R CBUS gpios
Date: Sun, 30 Sep 2018 14:27:03 +0200
Message-ID: <20180930122703.7115-3-johan@kernel.org>
References: <20180930122703.7115-1-johan@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180930122703.7115-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: Karoly Pados <pados@pados.hu>, Loic Poulain <loic.poulain@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

Enable support for cbus gpios on FT232R. The cbus configuration is
stored in one word in the EEPROM at offset 0x0a (byte-offset 0x14) with
the mux config for CBUS0, CBUS1, CBUS2 and CBUS3 in bits 0..3, 4..7,
8..11 and 12..15, respectively.

Tested using FT232RL by configuring one cbus pin at a time.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ftdi_sio.c | 40 +++++++++++++++++++++++++++++++++--
 drivers/usb/serial/ftdi_sio.h |  3 ++-
 2 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index be50b2a200aa..f1eb20acb3bb 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -2007,7 +2007,40 @@ static int ftdi_read_eeprom(struct usb_serial *serial, void *dst, u16 addr,
 	return 0;
 }
 
-static int ftx_gpioconf_init(struct usb_serial_port *port)
+static int ftdi_gpio_init_ft232r(struct usb_serial_port *port)
+{
+	struct ftdi_private *priv = usb_get_serial_port_data(port);
+	u16 cbus_config;
+	u8 *buf;
+	int ret;
+	int i;
+
+	buf = kmalloc(2, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = ftdi_read_eeprom(port->serial, buf, 0x14, 2);
+	if (ret < 0)
+		goto out_free;
+
+	cbus_config = le16_to_cpup((__le16 *)buf);
+	dev_dbg(&port->dev, "cbus_config = 0x%04x\n", cbus_config);
+
+	priv->gc.ngpio = 4;
+
+	priv->gpio_altfunc = 0xff;
+	for (i = 0; i < priv->gc.ngpio; ++i) {
+		if ((cbus_config & 0xf) == FTDI_FT232R_CBUS_MUX_GPIO)
+			priv->gpio_altfunc &= ~BIT(i);
+		cbus_config >>= 4;
+	}
+out_free:
+	kfree(buf);
+
+	return ret;
+}
+
+static int ftdi_gpio_init_ftx(struct usb_serial_port *port)
 {
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
 	struct usb_serial *serial = port->serial;
@@ -2049,8 +2082,11 @@ static int ftdi_gpio_init(struct usb_serial_port *port)
 	int result;
 
 	switch (priv->chip_type) {
+	case FT232RL:
+		result = ftdi_gpio_init_ft232r(port);
+		break;
 	case FTX:
-		result = ftx_gpioconf_init(port);
+		result = ftdi_gpio_init_ftx(port);
 		break;
 	default:
 		return 0;
diff --git a/drivers/usb/serial/ftdi_sio.h b/drivers/usb/serial/ftdi_sio.h
index 6cfe682f8348..a79a1325b4d9 100644
--- a/drivers/usb/serial/ftdi_sio.h
+++ b/drivers/usb/serial/ftdi_sio.h
@@ -457,7 +457,8 @@ enum ftdi_sio_baudrate {
 #define FTDI_SIO_READ_EEPROM_REQUEST_TYPE 0xc0
 #define FTDI_SIO_READ_EEPROM_REQUEST FTDI_SIO_READ_EEPROM
 
-#define FTDI_FTX_CBUS_MUX_GPIO		8
+#define FTDI_FTX_CBUS_MUX_GPIO		0x8
+#define FTDI_FT232R_CBUS_MUX_GPIO	0xa
 
 
 /* Descriptors returned by the device
-- 
2.19.0
