From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RFC/PATCH 0/2] GPIO: Add support for the PCA9621
Date: Thu,  8 Oct 2015 21:32:30 +0300
Message-ID: <1444329152-11946-1-git-send-email-laurent.pinchart@ideasonboard.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:51282 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754665AbbJHSce (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2015 14:32:34 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>

The gpio-pcf857x driver could possibly be reused instead of creating a new
driver. However,

The NXP PCA9621 (http://www.nxp.com/documents/data_sheet/PCA9621.pdf) is an
I2C 8-bit open-drain output expander, simpler than the PCF* and PCA* devices
currently supported in the kernel.

The first patch creates a new driver for the device, there's nothing special
there.

The second patch tries another approach and adds support for the device to the
existing gpio-pcf857x. This requires extending the pcf857x_id driver data with
a flag to signal open-drain devices and modify the get/set/direction handlers
to take the flag into account. The driver then started becoming a bit too
dirty for my taste.

Please note that neither of the two patches has been tested as I don't have
access to the hardware right now, but I'd like to already know which approach
would be preferred.

Laurent Pinchart (2):
  gpio: Add PCA9621 driver
  gpio: pcf857x: Add PCA9621 support

 .../devicetree/bindings/gpio/nxp,pca9621.txt       |  19 +++
 drivers/gpio/Kconfig                               |   6 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-pca9621.c                        | 163 +++++++++++++++++++++
 drivers/gpio/gpio-pcf857x.c                        |  41 +++++-
 5 files changed, 225 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,pca9621.txt
 create mode 100644 drivers/gpio/gpio-pca9621.c

-- 
Regards,

Laurent Pinchart

