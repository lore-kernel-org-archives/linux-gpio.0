From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 00/54] GPIO: clamp return values from drivers
Date: Tue, 22 Dec 2015 15:08:32 +0100
Message-ID: <1450793312-21725-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:36763 "EHLO
	mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752088AbbLVOIz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:08:55 -0500
Received: by mail-lf0-f52.google.com with SMTP id z124so125128619lfa.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:08:54 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20Andersson?= <bjorn.andersson@sonymobile.com>, Johan Hovold <johan@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Michael Trimarchi <michael@amarulasolutions.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

It was recently discovered that a bunch of GPIO drivers were not
clamping their return values from the .get() function to [0,1].
Some did. Some did and returned a proper errorcode, for example
for GPIOs on slow buses. Some returned the bit set in some register,
so GPIO at offset 0 would return 0/1 but offset 2 would return
0/4 and expect the core to clamp it. Which it used to do, until we
decided to propagate error codes. Which we shouldn't have, before
going over all drivers to check if they were doing this "return
something other than zero and expect it to be treated as asserted"
business.

Usually it was all OK because the gpiolib core did this:

value = value < 0 ? value : !!value;

So the only time the error pops out is when a 32bit machine expect
something greater than 2^31 to be interpreted as asserted. This is
typically the case when a 32bit register contains 32 GPIOs, bit 31
is a GPIO line and is read: then that is seen as a negative
value and propagated as an error code, so all other cases including
the 31 first GPIOs work fine. That is why the error is not so
prominent, and took some time to detect.

Anyway, this series fixes all drivers in the kernel.

Merge tactic: I will merge the GPIO and pinctrl subsystem changes
for v4.5, returning the propagation of the error code.

Subsystem maintainers may merge this as a fix for their v4.5 trees
or ACK them so that I can merge them. In the next kernel cycle
for v4.6 I will take a sweep and merge remaining fixes.

Linus Walleij (54):
  gpio: da9052: Be sure to clamp return value
  gpio: davinci: Be sure to clamp return value
  gpio: em: Be sure to clamp return value
  gpio: ich: Be sure to clamp return value
  gpio: intel-mid: Be sure to clamp return value
  gpio: janz-ttl: Be sure to clamp return value
  gpio: kempld: Be sure to clamp return value
  gpio: lpc32xx: Be sure to clamp return value
  gpio: max732x: Be sure to clamp return value
  gpio: ml-ioh: Be sure to clamp return value
  gpio: mpc8xxx: Be sure to clamp return value
  gpio: msic: Be sure to clamp return value
  gpio: pcf857x: Be sure to clamp return value
  gpio: pch: Be sure to clamp return value
  gpio: sa1100: Be sure to clamp return value
  gpio: sta2x11: Be sure to clamp return value
  gpio: sx150x: Be sure to clamp return value
  gpio: tc3589x: Be sure to clamp return value
  gpio: twl4030: Be sure to clamp return value
  gpio: tz1090: Be sure to clamp return value
  gpio: tx1090-pdc: Be sure to clamp return value
  gpio: ucb1400: Be sure to clamp return value
  gpio: viperboard: Be sure to clamp return value
  pinctrl: baytrail: Be sure to clamp return value
  pinctrl: coh901: Be sure to clamp return value
  pinctrl: xway: Be sure to clamp return value
  pinctrl: spmi-gpio: Be sure to clamp return value
  pinctrl: spmi-mpp: Be sure to clamp return value
  pinctrl: ssbi-gpio: Be sure to clamp return value
  gpio: ssbi-mpp: Be sure to clamp return value
  pinctrl: sunxi: Be sure to clamp return value
  ARM: scoop: Be sure to clamp return value
  ARM: sa1100/simpad: Be sure to clamp return value
  blackfin: gpio: Be sure to clamp return value
  m68k: coldfire/gpio: Be sure to clamp return value
  mips: alchemy: Be sure to clamp return value
  mips: ar7/gpio: Be sure to clamp return value
  mips: txx9: Be sure to clamp return value
  mips: rb532: Be sure to clamp return value
  mips: txx9: iocled: Be sure to clamp return value
  powerpc: ppc4cc/gpio: Be sure to clamp return value
  powerpc: qe_lib/gpio: Be sure to clamp return value
  powerpc: simple_gpio: Be sure to clamp return value
  unicore: gpio: Be sure to clamp return value
  mfd: asic3: Be sure to clamp return value
  mfd: dm355evm_mps: Be sure to clamp return value
  mfd: htc-egpio: Be sure to clamp return value
  mfd: tc6393xb: Be sure to clamp return value
  mfd: tps65010: Be sure to clamp return value
  mfd: ucb1x00-core: Be sure to clamp return value
  fbdev: via-gpio: Be sure to clamp return value
  sound: soc: wm8903: Be sure to clamp return value
  sound: soc: ac97: Be sure to clamp return value
  Revert "gpio: revert get() to non-errorprogating behaviour"

 arch/arm/common/scoop.c                  | 2 +-
 arch/arm/mach-sa1100/simpad.c            | 4 ++--
 arch/blackfin/kernel/bfin_gpio.c         | 2 +-
 arch/m68k/coldfire/gpio.c                | 2 +-
 arch/mips/alchemy/common/gpiolib.c       | 6 +++---
 arch/mips/ar7/gpio.c                     | 2 +-
 arch/mips/kernel/gpio_txx9.c             | 2 +-
 arch/mips/rb532/gpio.c                   | 2 +-
 arch/mips/txx9/generic/setup.c           | 2 +-
 arch/powerpc/sysdev/ppc4xx_gpio.c        | 2 +-
 arch/powerpc/sysdev/qe_lib/gpio.c        | 2 +-
 arch/powerpc/sysdev/simple_gpio.c        | 2 +-
 arch/unicore32/kernel/gpio.c             | 2 +-
 drivers/gpio/gpio-da9052.c               | 9 +++------
 drivers/gpio/gpio-davinci.c              | 2 +-
 drivers/gpio/gpio-em.c                   | 2 +-
 drivers/gpio/gpio-ich.c                  | 4 ++--
 drivers/gpio/gpio-intel-mid.c            | 2 +-
 drivers/gpio/gpio-janz-ttl.c             | 2 +-
 drivers/gpio/gpio-kempld.c               | 2 +-
 drivers/gpio/gpio-lpc32xx.c              | 8 ++++----
 drivers/gpio/gpio-max732x.c              | 4 ++--
 drivers/gpio/gpio-ml-ioh.c               | 2 +-
 drivers/gpio/gpio-mpc8xxx.c              | 2 +-
 drivers/gpio/gpio-msic.c                 | 2 +-
 drivers/gpio/gpio-pcf857x.c              | 2 +-
 drivers/gpio/gpio-pch.c                  | 2 +-
 drivers/gpio/gpio-sa1100.c               | 2 +-
 drivers/gpio/gpio-sta2x11.c              | 2 +-
 drivers/gpio/gpio-sx150x.c               | 2 +-
 drivers/gpio/gpio-tc3589x.c              | 2 +-
 drivers/gpio/gpio-twl4030.c              | 2 +-
 drivers/gpio/gpio-tz1090-pdc.c           | 2 +-
 drivers/gpio/gpio-tz1090.c               | 2 +-
 drivers/gpio/gpio-ucb1400.c              | 2 +-
 drivers/gpio/gpio-viperboard.c           | 2 +-
 drivers/gpio/gpiolib.c                   | 8 +-------
 drivers/mfd/asic3.c                      | 3 ++-
 drivers/mfd/dm355evm_msp.c               | 2 +-
 drivers/mfd/htc-egpio.c                  | 2 +-
 drivers/mfd/tc6393xb.c                   | 4 ++--
 drivers/mfd/tps65010.c                   | 4 ++--
 drivers/mfd/ucb1x00-core.c               | 2 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c | 2 +-
 drivers/pinctrl/pinctrl-coh901.c         | 2 +-
 drivers/pinctrl/pinctrl-xway.c           | 2 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 2 +-
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 4 ++--
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c  | 6 +++---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c    | 2 +-
 drivers/video/fbdev/via/via-gpio.c       | 2 +-
 sound/soc/codecs/wm8903.c                | 2 +-
 sound/soc/soc-ac97.c                     | 2 +-
 54 files changed, 70 insertions(+), 78 deletions(-)

-- 
2.4.3

