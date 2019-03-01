From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v3 bus+gpio 0/5] Add Moxtet bus and GPIO over Moxtet bus
Date: Fri,  1 Mar 2019 04:58:47 +0100
Message-ID: <20190301035852.26780-1-marek.behun@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
List-Id: linux-gpio@vger.kernel.org

Hello,

this is the third version of my patches to support the Moxtet bus and
GPIOs over it. Moxtet is a Turris Mox specific tiny bus over SPI.

Patches are rebased to current linux-gpio (branch devel and/or for-next).

Changes since last version:
  - addressed the issues in device tree documentation pointed by Rob Herring
  - cosmetic changes suggested by Linus Walleij
  - added sysfs ABI documentation for /sys/bus/moxtet/devices attribute files as suggested by Linus Walleij

Marek

Marek Behún (5):
  bus: Add support for Moxtet bus
  dt-bindings: bus: Document moxtet bus binding
  bus: moxtet: Add sysfs documentation
  drivers: gpio: Add support for GPIOs over Moxtet bus
  dt-bindings: gpio: Document GPIOs via Moxtet bus

 .../ABI/testing/sysfs-bus-moxtet-devices      |  25 +
 .../devicetree/bindings/bus/moxtet.txt        |  36 ++
 .../devicetree/bindings/gpio/gpio-moxtet.txt  |  18 +
 MAINTAINERS                                   |   8 +
 drivers/bus/Kconfig                           |  10 +
 drivers/bus/Makefile                          |   1 +
 drivers/bus/moxtet.c                          | 533 ++++++++++++++++++
 drivers/gpio/Kconfig                          |   9 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-moxtet.c                    | 179 ++++++
 include/linux/moxtet.h                        | 109 ++++
 11 files changed, 929 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-moxtet-devices
 create mode 100644 Documentation/devicetree/bindings/bus/moxtet.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-moxtet.txt
 create mode 100644 drivers/bus/moxtet.c
 create mode 100644 drivers/gpio/gpio-moxtet.c
 create mode 100644 include/linux/moxtet.h

-- 
2.19.2
