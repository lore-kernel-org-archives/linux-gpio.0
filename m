From: Martyn Welch <martyn.welch@collabora.co.uk>
Subject: [PATCH v5 2/2] USB: serial: cp210x: Adding GE Healthcare Device ID
Date: Tue, 29 Mar 2016 17:47:29 +0100
Message-ID: <ddee21e702ef47d8c97d6fa3b37acbb8be28634e.1459269397.git.martyn.welch@collabora.co.uk>
References: <cover.1459269397.git.martyn.welch@collabora.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44216 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757626AbcC2Qr5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2016 12:47:57 -0400
In-Reply-To: <cover.1459269397.git.martyn.welch@collabora.co.uk>
In-Reply-To: <cover.1459269397.git.martyn.welch@collabora.co.uk>
References: <cover.1459269397.git.martyn.welch@collabora.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, Martyn Welch <martyn.welch@collabora.co.uk>

The CP2105 is used in the GE Healthcare Remote Alarm Box, with the
Manufacturer ID of 0x1901 and Product ID of 0x0194.

Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
---
 drivers/usb/serial/cp210x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index b1eb8da..5b5c4ec 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -170,6 +170,7 @@ static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(0x1843, 0x0200) }, /* Vaisala USB Instrument Cable */
 	{ USB_DEVICE(0x18EF, 0xE00F) }, /* ELV USB-I2C-Interface */
 	{ USB_DEVICE(0x18EF, 0xE025) }, /* ELV Marble Sound Board 1 */
+	{ USB_DEVICE(0x1901, 0x0194) },	/* GE Healthcare Remote Alarm Box */
 	{ USB_DEVICE(0x1ADB, 0x0001) }, /* Schweitzer Engineering C662 Cable */
 	{ USB_DEVICE(0x1B1C, 0x1C00) }, /* Corsair USB Dongle */
 	{ USB_DEVICE(0x1BA4, 0x0002) },	/* Silicon Labs 358x factory default */
-- 
1.8.3.1

