From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v4 armsoc/drivers/bus+gpio 0/5] Add Moxtet bus and GPIO over Moxtet bus
Date: Thu,  7 Mar 2019 13:52:46 +0100
Message-ID: <20190307125251.724-1-marek.behun@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
List-Id: linux-gpio@vger.kernel.org

Hello,

this is the fourth version of patches to support the Moxtet bus and
GPIOs over it. Moxtet is a Turris Mox specific tiny bus over SPI.

I know that merge window is now closed, but I am trying this anyway now, since
Documentation/process/2.Process.rst mentions that even when merge window is
closed, "An occasional exception is made for drivers for previously-unsupported
hardware; if they touch no in-tree code, they cannot cause regressions and
should be safe to add at any time."

These patches apply to current linux/master, linux-gpio/devel
and arm-soc/arm/drivers.

I would appreciate reviews for the changes I made. I removed the Acked-by,
since the changes in drivers/bus/moxtet.c are non-trivial.

Marek

Changes since v3:
  - added module_description file in /sys/bus/moxtet/devices/*/
  - moved debugging into debugfs:
    - removed input_value and output_value debug files from
      /sys/bus/moxtet/devices/*/
    - added input and output debug files to debugfs/moxtet
  - added support for interrupts into moxtet driver:
    Some modules send interrupt via a shared line for all modules.
    In addition to this, they also send interrupt information via the SPI
    shift register, so that the system can distinguish which modules exactly
    sent it and won't have to check all modules.
    This is also needed to fix some bugs when one module sent IRQ and then
    another module sent another IRQ before the first was handled by the system,
    but the handling was already in progress. Since the shared line is
    falling-edge, the second IRQ was never handled.
  - since moxtet driver is now also interrupt controller, device-tree binding
    documentation is also changed

Changes since v2:
  - addressed the issues in device tree documentation pointed by Rob Herring
  - cosmetic changes suggested by Linus Walleij
  - added sysfs ABI documentation for /sys/bus/moxtet/devices attribute files
    as suggested by Linus Walleij

Marek Behún (5):
  bus: Add support for Moxtet bus
  dt-bindings: bus: Document moxtet bus binding
  bus: moxtet: Add sysfs and debugfs documentation
  drivers: gpio: Add support for GPIOs over Moxtet bus
  dt-bindings: gpio: Document GPIOs via Moxtet bus

 Documentation/ABI/testing/debugfs-moxtet      |  23 +
 .../ABI/testing/sysfs-bus-moxtet-devices      |  17 +
 .../devicetree/bindings/bus/moxtet.txt        |  44 +
 .../devicetree/bindings/gpio/gpio-moxtet.txt  |  18 +
 MAINTAINERS                                   |  12 +
 drivers/bus/Kconfig                           |  10 +
 drivers/bus/Makefile                          |   1 +
 drivers/bus/moxtet.c                          | 886 ++++++++++++++++++
 drivers/gpio/Kconfig                          |   9 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-moxtet.c                    | 179 ++++
 include/dt-bindings/bus/moxtet.h              |  16 +
 include/linux/moxtet.h                        | 109 +++
 13 files changed, 1325 insertions(+)
 create mode 100644 Documentation/ABI/testing/debugfs-moxtet
 create mode 100644 Documentation/ABI/testing/sysfs-bus-moxtet-devices
 create mode 100644 Documentation/devicetree/bindings/bus/moxtet.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-moxtet.txt
 create mode 100644 drivers/bus/moxtet.c
 create mode 100644 drivers/gpio/gpio-moxtet.c
 create mode 100644 include/dt-bindings/bus/moxtet.h
 create mode 100644 include/linux/moxtet.h

-- 
2.19.2
