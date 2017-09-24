From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/8] GPIO extcon modernization
Date: Sun, 24 Sep 2017 16:56:14 +0200
Message-ID: <20170924145622.4031-1-linus.walleij@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, John Stultz <john.stultz@linaro.org>, Mike Lockwood <lockwood@google.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Like with the GPIO mouse input, I found that this driver has no in-tree
users at all.

I *could* just propose to delete it. But the driver seems generally useful,
so I made a patch series shaping it up to get configuration from device
tree or ACPI DSDT using device properties instead.

We start off the series by defining a set of device tree bindings for it.

It would be great to have some input from the initial authors on this
rewrite. I think we would not merge any board file using the platform
data anymore, so making it an all-in device property (device tree || ACPI)
driver seems reasonable.

Linus Walleij (8):
  extcon: gpio: Add DT bindings
  extcon: gpio: Localize platform data
  extcon: gpio: Move platform data into state container
  extcon: gpio: Convert to fully use GPIO descriptor
  extcon: gpio: Request reasonable interrupts
  extcon: gpio: Get debounce setting from device property
  extcon: gpio: Get connector type from device property
  extcon: gpio: Always check state on resume

 .../devicetree/bindings/extcon/extcon-gpio.txt     |  24 ++++
 drivers/extcon/extcon-gpio.c                       | 132 ++++++++++++---------
 include/dt-bindings/extcon/connectors.h            |  38 ++++++
 include/linux/extcon/extcon-gpio.h                 |  47 --------
 4 files changed, 135 insertions(+), 106 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/extcon/extcon-gpio.txt
 create mode 100644 include/dt-bindings/extcon/connectors.h
 delete mode 100644 include/linux/extcon/extcon-gpio.h

-- 
2.13.5
