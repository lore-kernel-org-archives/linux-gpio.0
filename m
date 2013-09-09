From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/8] IOP GPIO refactoring
Date: Mon,  9 Sep 2013 17:39:58 +0200
Message-ID: <1378741198-12847-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:46178 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750959Ab3IIPkI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Sep 2013 11:40:08 -0400
Received: by mail-la0-f52.google.com with SMTP id ev20so5032438lab.39
        for <linux-gpio@vger.kernel.org>; Mon, 09 Sep 2013 08:40:07 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Lennert Buytenhek <kernel@wantstofly.org>, Dan Williams <dan.j.williams@intel.com>, Mikael Pettersson <mikpe@it.uu.se>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>

This series refactor the IOP GPIO driver to move down to the
GPIO subsystem, instatiate as a platform device, remap its
I/O address, and kills off the <mach/gpio.h> dependency.

This is done to get rid of <mach/gpio.h> and the complex
local GPIO implementation.

Please do not report the checkpatch warning in patch 5,
I am only copy/pasting code from one place to another and
the warning is removed later in the series.

Linus Walleij (8):
  ARM: plat-iop: move the GPIO driver to drivers/gpio
  ARM: iop32x: request and issue reset using gpio
  ARM: iop32x: read N2100 power key using gpiolib
  gpio: decouple the IOP GPIO driver from platform
  ARM: plat-iop: remove custom complex GPIO implementation
  ARM: plat-iop: instantiate GPIO from platform device
  gpio: iop: use readl/writel accessors
  ARM: plat-iop: pass physical base for GPIO

 arch/arm/Kconfig                            |   4 +-
 arch/arm/include/asm/hardware/iop3xx-gpio.h |  75 ----------------
 arch/arm/include/asm/hardware/iop3xx.h      |  12 ---
 arch/arm/mach-iop32x/include/mach/gpio.h    |   6 --
 arch/arm/mach-iop32x/include/mach/iop32x.h  |   1 -
 arch/arm/mach-iop32x/iq31244.c              |   7 ++
 arch/arm/mach-iop32x/iq80321.c              |   7 ++
 arch/arm/mach-iop32x/n2100.c                |  27 +++++-
 arch/arm/mach-iop33x/include/mach/gpio.h    |   6 --
 arch/arm/mach-iop33x/include/mach/iop33x.h  |   1 -
 arch/arm/mach-iop33x/iq80331.c              |   7 ++
 arch/arm/mach-iop33x/iq80332.c              |   7 ++
 arch/arm/plat-iop/Makefile                  |   2 -
 arch/arm/plat-iop/gpio.c                    |  93 --------------------
 drivers/gpio/Kconfig                        |   9 ++
 drivers/gpio/Makefile                       |   1 +
 drivers/gpio/gpio-iop.c                     | 130 ++++++++++++++++++++++++++++
 17 files changed, 194 insertions(+), 201 deletions(-)
 delete mode 100644 arch/arm/include/asm/hardware/iop3xx-gpio.h
 delete mode 100644 arch/arm/mach-iop32x/include/mach/gpio.h
 delete mode 100644 arch/arm/mach-iop33x/include/mach/gpio.h
 delete mode 100644 arch/arm/plat-iop/gpio.c
 create mode 100644 drivers/gpio/gpio-iop.c

-- 
1.8.3.1

