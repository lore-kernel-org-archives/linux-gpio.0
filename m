From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 1/2] USB: ftdi_sio: add CBUS mode for FT232R devices
Date: Sun, 21 Jun 2015 00:12:56 +0200
Message-ID: <1434838377-8042-2-git-send-email-stefan@agner.ch>
References: <1434838377-8042-1-git-send-email-stefan@agner.ch>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:50625 "EHLO
	mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752949AbbFTWNE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jun 2015 18:13:04 -0400
In-Reply-To: <1434838377-8042-1-git-send-email-stefan@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: johan@kernel.org, linus.walleij@linaro.org, gnurou@gmail.com
Cc: grant.likely@secretlab.ca, gregkh@linuxfoundation.org, x-linux@infra-silbe.de, hachti@hachti.de, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>

Add interface to allow CBUS access. The functions set_bitmode and
read_pins use control transfers only hence should not interfere
with the serial operation mode.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/usb/serial/ftdi_sio.c | 41 +++++++++++++++++++++++++++++++++++++++++
 drivers/usb/serial/ftdi_sio.h | 22 ++++++++++++++++++++++
 include/linux/usb/ftdi_sio.h  | 32 ++++++++++++++++++++++++++++++++
 include/linux/usb/serial.h    |  2 ++
 4 files changed, 97 insertions(+)
 create mode 100644 include/linux/usb/ftdi_sio.h

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 4c8b3b8..23a3280 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1384,6 +1384,47 @@ static int change_speed(struct tty_struct *tty, struct usb_serial_port *port)
 	return rv;
 }
 
+int ftdi_sio_set_bitmode(struct usb_serial_port *port, u8 bitmask, u8 bitmode)
+{
+	struct ftdi_private *priv = usb_get_serial_port_data(port);
+	__u16 urb_value = 0;
+	int rv = 0;
+
+	urb_value = bitmode << 8 | bitmask;
+
+	rv = usb_control_msg(port->serial->dev,
+			     usb_sndctrlpipe(port->serial->dev, 0),
+			     FTDI_SIO_SET_BITMODE_REQUEST,
+			     FTDI_SIO_SET_BITMODE_REQUEST_TYPE,
+			     urb_value, priv->interface,
+			     NULL, 0, WDR_SHORT_TIMEOUT);
+	return rv;
+}
+EXPORT_SYMBOL(ftdi_sio_set_bitmode);
+
+int ftdi_sio_read_pins(struct usb_serial_port *port, u8 *pins)
+{
+	struct ftdi_private *priv = usb_get_serial_port_data(port);
+	int rv;
+	u8 *buf;
+
+	buf = kmalloc(1, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	rv = usb_control_msg(port->serial->dev,
+			     usb_rcvctrlpipe(port->serial->dev, 0),
+			     FTDI_SIO_READ_PINS_REQUEST,
+			     FTDI_SIO_READ_PINS_REQUEST_TYPE,
+			     0, priv->interface,
+			     buf, 1, WDR_SHORT_TIMEOUT);
+	*pins = *buf;
+	kfree(buf);
+
+	return rv;
+}
+EXPORT_SYMBOL(ftdi_sio_read_pins);
+
 static int write_latency_timer(struct usb_serial_port *port)
 {
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
diff --git a/drivers/usb/serial/ftdi_sio.h b/drivers/usb/serial/ftdi_sio.h
index ed58c6f..a62eb15 100644
--- a/drivers/usb/serial/ftdi_sio.h
+++ b/drivers/usb/serial/ftdi_sio.h
@@ -35,6 +35,8 @@
 #define FTDI_SIO_SET_ERROR_CHAR		7 /* Set the error character */
 #define FTDI_SIO_SET_LATENCY_TIMER	9 /* Set the latency timer */
 #define FTDI_SIO_GET_LATENCY_TIMER	10 /* Get the latency timer */
+#define FTDI_SIO_SET_BITMODE		11 /* Set the bitmode */
+#define FTDI_SIO_READ_PINS		12 /* Read pins in bitmode */
 
 /* Interface indices for FT2232, FT2232H and FT4232H devices */
 #define INTERFACE_A		1
@@ -345,6 +347,26 @@ enum ftdi_sio_baudrate {
  */
 
 /*
+ * FTDI_SIO_SET_BITMODE
+ *
+ * Set the chip's bitbang mode. Used to switch FT232R into CBUS	mode.
+ * For details see of the bitbang modes supported by FT232R devices
+ * refer to the FTDI Application Note AN_232R-01.
+ */
+
+#define FTDI_SIO_SET_BITMODE_REQUEST FTDI_SIO_SET_BITMODE
+#define FTDI_SIO_SET_BITMODE_REQUEST_TYPE 0x40
+
+/*
+ * FTDI_SIO_READ_PINS
+ *
+ * Read the current value of the bit mode.
+ */
+
+#define FTDI_SIO_READ_PINS_REQUEST FTDI_SIO_READ_PINS
+#define FTDI_SIO_READ_PINS_REQUEST_TYPE 0xC0
+
+/*
  * FTDI_SIO_SET_EVENT_CHAR
  *
  * Set the special event character for the specified communications port.
diff --git a/include/linux/usb/ftdi_sio.h b/include/linux/usb/ftdi_sio.h
new file mode 100644
index 0000000..8e1a292
--- /dev/null
+++ b/include/linux/usb/ftdi_sio.h
@@ -0,0 +1,32 @@
+/*
+ * Interface for FTDI SIO driver used by CBUS GPIO driver
+ *
+ * Copyright 2015 Stefan Agner
+ *
+ * Author: Stefan Agner <stefan@agner.ch>
+ *
+ *  This program is free software; you can redistribute  it and/or modify it
+ *  under  the terms of  the GNU General  Public License as published by the
+ *  Free Software Foundation;  either version 2 of the  License, or (at your
+ *  option) any later version.
+ */
+
+#ifndef __LINUX_USB_FTDI_SIO_H
+#define __LINUX_USB_FTDI_SIO_H
+
+#include <linux/usb/serial.h>
+
+/* MPSSE bitbang modes */
+enum ftdi_mpsse_mode {
+	/* switch off bitbang mode, back to regular serial/FIFO */
+	BITMODE_RESET = 0x00,
+
+	/* Bitbang on CBUS pins of R-type chips, configure in EEPROM before */
+	BITMODE_CBUS = 0x20,
+};
+
+int ftdi_sio_set_bitmode(struct usb_serial_port *port, u8 bitmask, u8 bitmode);
+int ftdi_sio_read_pins(struct usb_serial_port *port, u8 *pins);
+
+#endif /* __LINUX_USB_FTDI_SIO_H */
+
diff --git a/include/linux/usb/serial.h b/include/linux/usb/serial.h
index 704a1ab..d710656 100644
--- a/include/linux/usb/serial.h
+++ b/include/linux/usb/serial.h
@@ -17,6 +17,8 @@
 #include <linux/mutex.h>
 #include <linux/serial.h>
 #include <linux/sysrq.h>
+#include <linux/tty.h>
+#include <linux/usb.h>
 #include <linux/kfifo.h>
 
 /* The maximum number of ports one device can grab at once */
-- 
2.4.4

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
