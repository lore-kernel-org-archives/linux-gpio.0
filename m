From: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
Subject: [PATCH 0/2] Technologic I2C-FPGA gpio support
Date: Fri,  5 Aug 2016 10:41:44 -0400
Message-ID: <1470408106-8078-1-git-send-email-lucile.quirion@savoirfairelinux.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, kernel@savoirfairelinux.com, Lucile Quirion <lucile.quirion@savoirfairelinux.com>
List-Id: linux-gpio@vger.kernel.org

This driver aims to support all Technologic Systems's boards embedding FPGA
GPIOs with an I2C interface.

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
