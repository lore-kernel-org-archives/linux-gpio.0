From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v2 0/3] Add support for PCI mapped devices and rmmod
Date: Wed, 10 Dec 2014 14:21:47 +0100
Message-ID: <1418217710-11987-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: linux-gpio@vger.kernel.org

The main purpose of this patchset is to use the driver on a PCI mapped fpga.

This patchset also converts the driver to platform device, so it will support
hot plugged devices and rmmod.

Changeset:

v2
Suggested by Alexandre Courbot <gnurou@gmail.com>
Merge 2 and 3 (convert to platform device and implement remove)

Ricardo Ribalda Delgado (3):
  gpio/xilinx: Remove offset property
  gpio/xilinx: Convert the driver to platform device interface
  gpio/xilinx: Add support for X86 Arch

 drivers/gpio/Kconfig       |   4 +-
 drivers/gpio/gpio-xilinx.c | 114 ++++++++++++++++++++++++++++-----------------
 2 files changed, 73 insertions(+), 45 deletions(-)

-- 
2.1.3
