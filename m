From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/3] gpio: Convert two Intel GPIO drivers to use irqchip helpers
Date: Fri, 25 Jul 2014 09:54:45 +0300
Message-ID: <1406271288-15995-1-git-send-email-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Zhu Lejun <lejun.zhu@linux.intel.com>, Yang Bin <bin.yang@intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi,

As discussed in this thread:

https://www.mail-archive.com/linux-gpio%40vger.kernel.org/msg02929.html

This series converts the Intel Lynxpoint and Baytrail GPIO drivers to use
the new irqchip helper functions and then moves ACPI event registration to
happen in the helpers as well.

Mika Westerberg (3):
  gpio: lynxpoint: Convert to use gpiolib irqchip
  pinctrl: baytrail: Convert to use gpiolib irqchip
  gpio / ACPI: Move event handling registration to gpiolib irqchip helpers

 drivers/gpio/Kconfig               |  2 +-
 drivers/gpio/gpio-lynxpoint.c      | 93 ++++++++++----------------------------
 drivers/gpio/gpiolib-acpi.c        | 38 ++++++++++++----
 drivers/gpio/gpiolib.c             |  4 ++
 drivers/gpio/gpiolib.h             |  9 ++++
 drivers/pinctrl/Kconfig            |  2 +-
 drivers/pinctrl/pinctrl-baytrail.c | 87 ++++++++---------------------------
 7 files changed, 87 insertions(+), 148 deletions(-)

-- 
2.0.1
