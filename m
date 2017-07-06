From: Anatolij Gustschin <agust@denx.de>
Subject: [PATCH 0/3] FPGA Manager support for FPP via FT232H FT245-FIFO
Date: Thu,  6 Jul 2017 22:49:15 +0200
Message-ID: <1499374158-12388-1-git-send-email-agust@denx.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:42416 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751980AbdGFUtX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Jul 2017 16:49:23 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alan Tull <atull@kernel.org>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, linux-gpio@vger.kernel.org, linux-fpga@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

This series adds support for fast passive parallel (FPP) Altera
FPGA configuration using FTDI FT232H chip in FT245-FIFO mode.
It has been used to configure Arria 10 FPGAs.

Patch 1 adds an FT232H MFD driver with common functions that
can be used for FT232H USB-GPIO/I2C/SPI master adapter drivers.
Currently it is used for FT232H GPIO support (in patch 2) and
for FT245 FIFO transfers in FPP FPGA manager driver in patch 3.
Driver support for FT232H USB-I2C/SPI master adapters can be
added later.

Patch 2 adds a simple GPIO driver supporting four FT232H CBUS GPIOs.

Patch 3 adds an FPGA Manager driver for Altera FPP FPGA configuration
via FT232H FT245-FIFO interface.

Anatolij Gustschin (3):
  mfd: Add support for FTDI FT232H devices
  gpio: Add FT232H CBUS GPIO driver
  fpga manager: Add FT232H driver for Altera FPP

 drivers/fpga/Kconfig          |   7 +
 drivers/fpga/Makefile         |   1 +
 drivers/fpga/ftdi-fifo-fpp.c  | 569 ++++++++++++++++++++++++++++++++++++++++++
 drivers/gpio/Kconfig          |  11 +
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-ftdi-cbus.c | 251 +++++++++++++++++++
 drivers/mfd/Kconfig           |   9 +
 drivers/mfd/Makefile          |   1 +
 drivers/mfd/ftdi-ft232h.c     | 470 ++++++++++++++++++++++++++++++++++
 include/linux/mfd/ftdi/ftdi.h |  71 ++++++
 10 files changed, 1391 insertions(+)
 create mode 100644 drivers/fpga/ftdi-fifo-fpp.c
 create mode 100644 drivers/gpio/gpio-ftdi-cbus.c
 create mode 100644 drivers/mfd/ftdi-ft232h.c
 create mode 100644 include/linux/mfd/ftdi/ftdi.h

-- 
2.7.4

