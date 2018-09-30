From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/2] USB: serial: ftdi_sio: fix gpio name collisions
Date: Sun, 30 Sep 2018 14:27:02 +0200
Message-ID: <20180930122703.7115-2-johan@kernel.org>
References: <20180930122703.7115-1-johan@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180930122703.7115-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: Karoly Pados <pados@pados.hu>, Loic Poulain <loic.poulain@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

Drop the gpio line names, which cause gpiolib to complain loudly
whenever a second ftdi gpiochip is registered:

	gpio gpiochip5: Detected name collision for GPIO name 'CBUS0'
	gpio gpiochip5: Detected name collision for GPIO name 'CBUS1'
	gpio gpiochip5: Detected name collision for GPIO name 'CBUS2'
	gpio gpiochip5: Detected name collision for GPIO name 'CBUS3'

and also prevents the legacy sysfs interface from being used (as the
line names are used as device names whenever they are set):

	sysfs: cannot create duplicate filename '/class/gpio/CBUS0'

Until non-unique names are supported by gpiolib (without warnings and
stack dumps), let's leave the gpio lines unnamed.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ftdi_sio.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 6b727ada20cf..be50b2a200aa 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1778,10 +1778,6 @@ static void remove_sysfs_attrs(struct usb_serial_port *port)
 
 #ifdef CONFIG_GPIOLIB
 
-static const char * const ftdi_ftx_gpio_names[] = {
-	"CBUS0", "CBUS1", "CBUS2", "CBUS3"
-};
-
 static int ftdi_set_bitmode(struct usb_serial_port *port, u8 mode)
 {
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
@@ -2032,7 +2028,6 @@ static int ftx_gpioconf_init(struct usb_serial_port *port)
 
 	/* FIXME: FT234XD alone has 1 GPIO, but how to recognize this IC? */
 	priv->gc.ngpio = 4;
-	priv->gc.names = ftdi_ftx_gpio_names;
 
 	/* Determine which pins are configured for CBUS bitbanging */
 	priv->gpio_altfunc = 0xff;
-- 
2.19.0
