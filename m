From: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
Subject: [PATCH v4 0/2] Technologic I2C-FPGA gpio support
Date: Fri, 12 Aug 2016 11:16:47 -0400
Message-ID: <1471015009-5925-1-git-send-email-lucile.quirion@savoirfairelinux.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.savoirfairelinux.com ([208.88.110.44]:38103 "EHLO
	mail.savoirfairelinux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752250AbcHLPRK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Aug 2016 11:17:10 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, kernel@savoirfairelinux.com, Lucile Quirion <lucile.quirion@savoirfairelinux.com>

This driver aims to support all Technologic Systems's boards embedding FPGA
GPIOs with an I2C interface.

Changes in v2:
 - convert from bool to tristate

Changes in v3:
 - use regmap abstraction to read/write from I2C
 - use devm_gpiochip_add_data()
 - implement ts4900_gpio_get_direction() function
 - use explicit bit names (GPIO_IN/GPIO_OUT)
 - fix ts4900_gpio_set() function (do not force the line as output)
 - doc: document ngpios property

Changes in v4:
 - do not use deprecated gpio interface (linux/gpio.h)
 - select REGMAP_I2C

Lucile Quirion (2):
  gpio: add bindings for Technologic I2C-FPGA gpio controller
  gpio: add Technologic I2C-FPGA gpio support

 .../devicetree/bindings/gpio/gpio-ts4900.txt       |  29 ++++
 drivers/gpio/Kconfig                               |   7 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-ts4900.c                         | 190 +++++++++++++++++++++
 4 files changed, 227 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-ts4900.txt
 create mode 100644 drivers/gpio/gpio-ts4900.c

-- 
2.5.5

