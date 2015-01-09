From: Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH 0/7] Add PWM support to mvebu gpio driver
Date: Sat, 10 Jan 2015 00:34:46 +0100
Message-ID: <1420846493-31647-1-git-send-email-andrew@lunn.ch>
Return-path: <linux-pwm-owner@vger.kernel.org>
Sender: linux-pwm-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, kaloz@openwrt.org, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@googlemail.com>, linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
List-Id: linux-gpio@vger.kernel.org

This patchset starts out with some cleanups and fixes for the mvebu
gpio driver. Then new functionality is added. The Armada 370 and XP
SoC has the ability to "blink" the gpio lines at a configuration on
and off duration. So simple PWM support is added. However only a
single gpio line per gpio chip can be used as a PWM line due to
limitations of the hardware. The last patch shows one example of how
this could be used, converting a gpio-fan into a pwm-fan, so allowing
finer control over its rotation speed, and hence noise. This last
patch is not expected to be accepted, since the device is not yet in
mainline.

Andrew Lunn (7):
  gpio: mvebu: checkpatch fixes
  gpio: mvebu: Fix probe cleanup on error
  gpio: mvebu: Add limited PWM support
  DT: bindings: Extend mvebu gpio documentation with PWM
  mvebu: xp: Add pwm properties to .dtsi files
  arm: mvebu: Enable PWM in defconfig
  mvebu: wrt1900ac: Use pwm-fan rather than gpio-fan

 .../devicetree/bindings/gpio/gpio-mvebu.txt        |  31 ++++
 arch/arm/boot/dts/armada-370.dtsi                  |  10 +-
 arch/arm/boot/dts/armada-xp-mv78230.dtsi           |  10 +-
 arch/arm/boot/dts/armada-xp-mv78260.dtsi           |   8 +-
 arch/arm/boot/dts/armada-xp-mv78460.dtsi           |  10 +-
 arch/arm/boot/dts/armada-xp-wrt1900ac.dts          |   8 +-
 arch/arm/configs/mvebu_v7_defconfig                |   1 +
 drivers/gpio/Kconfig                               |   5 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-mvebu-pwm.c                      | 202 +++++++++++++++++++++
 drivers/gpio/gpio-mvebu.c                          | 133 +++++++-------
 drivers/gpio/gpio-mvebu.h                          |  79 ++++++++
 12 files changed, 421 insertions(+), 77 deletions(-)
 create mode 100644 drivers/gpio/gpio-mvebu-pwm.c
 create mode 100644 drivers/gpio/gpio-mvebu.h

-- 
2.1.3

