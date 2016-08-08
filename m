From: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
Subject: [PATCH v2 0/2] Technologic I2C-FPGA gpio support
Date: Mon,  8 Aug 2016 12:46:04 -0400
Message-ID: <1470674766-17491-1-git-send-email-lucile.quirion@savoirfairelinux.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.savoirfairelinux.com ([208.88.110.44]:34753 "EHLO
	mail.savoirfairelinux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752147AbcHHQqW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Aug 2016 12:46:22 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, kernel@savoirfairelinux.com, Lucile Quirion <lucile.quirion@savoirfairelinux.com>

This driver aims to support all Technologic Systems's boards embedding FPGA
GPIOs with an I2C interface.

Changes in v2:
 - convert from bool to tristate


Lucile Quirion (2):
  gpio: add bindings for Technologic I2C-FPGA gpio controller
  gpio: add Technologic I2C-FPGA gpio support

 .../devicetree/bindings/gpio/gpio-ts4900.txt       |  29 +++
 drivers/gpio/Kconfig                               |   6 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-ts4900.c                         | 238 +++++++++++++++++++++
 4 files changed, 274 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-ts4900.txt
 create mode 100644 drivers/gpio/gpio-ts4900.c

-- 
2.5.5

