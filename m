From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] the great <mach/gpio.h> purge
Date: Mon, 30 Jun 2014 22:06:10 +0200
Message-ID: <CACRpkdbPHn6bWdr8t9BrmE2JZZuuVnF7ujzEFdrM86WmrRS5Hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f50.google.com ([209.85.219.50]:48025 "EHLO
	mail-oa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750836AbaF3UGK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jun 2014 16:06:10 -0400
Received: by mail-oa0-f50.google.com with SMTP id n16so9560663oag.9
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2014 13:06:10 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "arm@kernel.org" <arm@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>

Hi ARM SoC guys,

please pull in this patch set removing <mach/gpio.h> for good.
I guess it could collide with some S5P deletion.
If you decide to pull the S5P purge first, tell me so I can rebase.

Yours,
Linus Walleij


The following changes since commit 4c834452aad01531db949414f94f817a86348d59:

  Linux 3.16-rc3 (2014-06-29 14:11:36 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-h-purge

for you to fetch changes up to 53430333c345c3531f9443d43c6fba1da693abe4:

  ARM: delete old reference to ARM_GPIOLIB_COMPLEX (2014-06-30 21:37:39 +0200)

----------------------------------------------------------------
This is a purge of all things <mach/gpio.h>, now I never
want to see it again.

- Remove the need for <mach/gpio.h> from S5P
- Kill CONFIG_NEED_MACH_GPIO_H
- Kill remnants of ARM_GPIOLIB_COMPLEX

----------------------------------------------------------------
Linus Walleij (4):
      ARM: s5p: cut the custom ARCH_NR_GPIOS definition
      ARM: mach-s5p: get rid of all <mach/gpio.h> headers
      ARM: kill CONFIG_NEED_MACH_GPIO_H
      ARM: delete old reference to ARM_GPIOLIB_COMPLEX

 arch/arm/Kconfig                                         | 10 ----------
 arch/arm/include/asm/gpio.h                              |  7 -------
 arch/arm/mach-s5p64x0/common.c                           |  2 +-
 arch/arm/mach-s5p64x0/dev-audio.c                        |  3 ++-
 .../mach-s5p64x0/include/mach/{gpio.h => gpio-samsung.h} |  7 +------
 arch/arm/mach-s5p64x0/mach-smdk6440.c                    |  1 +
 arch/arm/mach-s5p64x0/mach-smdk6450.c                    |  1 +
 arch/arm/mach-s5p64x0/setup-fb-24bpp.c                   |  2 +-
 arch/arm/mach-s5p64x0/setup-i2c0.c                       |  2 +-
 arch/arm/mach-s5p64x0/setup-i2c1.c                       |  2 +-
 arch/arm/mach-s5p64x0/setup-sdhci-gpio.c                 |  2 +-
 arch/arm/mach-s5p64x0/setup-spi.c                        |  2 +-
 arch/arm/mach-s5pc100/dev-audio.c                        |  2 +-
 .../mach-s5pc100/include/mach/{gpio.h => gpio-samsung.h} |  6 +-----
 arch/arm/mach-s5pc100/mach-smdkc100.c                    |  1 +
 arch/arm/mach-s5pc100/setup-fb-24bpp.c                   |  2 +-
 arch/arm/mach-s5pc100/setup-i2c0.c                       |  2 +-
 arch/arm/mach-s5pc100/setup-i2c1.c                       |  2 +-
 arch/arm/mach-s5pc100/setup-ide.c                        |  2 +-
 arch/arm/mach-s5pc100/setup-keypad.c                     |  2 +-
 arch/arm/mach-s5pc100/setup-sdhci-gpio.c                 |  2 +-
 arch/arm/mach-s5pc100/setup-spi.c                        |  2 +-
 arch/arm/mach-s5pv210/dev-audio.c                        |  2 +-
 .../mach-s5pv210/include/mach/{gpio.h => gpio-samsung.h} |  7 +------
 arch/arm/mach-s5pv210/mach-aquila.c                      |  1 +
 arch/arm/mach-s5pv210/mach-goni.c                        |  1 +
 arch/arm/mach-s5pv210/mach-smdkv210.c                    |  1 +
 arch/arm/mach-s5pv210/setup-fb-24bpp.c                   |  2 +-
 arch/arm/mach-s5pv210/setup-fimc.c                       |  3 ++-
 arch/arm/mach-s5pv210/setup-i2c0.c                       |  2 +-
 arch/arm/mach-s5pv210/setup-i2c1.c                       |  2 +-
 arch/arm/mach-s5pv210/setup-i2c2.c                       |  2 +-
 arch/arm/mach-s5pv210/setup-ide.c                        |  2 +-
 arch/arm/mach-s5pv210/setup-keypad.c                     |  2 +-
 arch/arm/mach-s5pv210/setup-sdhci-gpio.c                 |  2 +-
 arch/arm/mach-s5pv210/setup-spi.c                        |  2 +-
 arch/arm/plat-samsung/Kconfig                            | 16 ----------------
 arch/arm/plat-samsung/include/plat/gpio-core.h           |  3 +++
 arch/arm/plat-samsung/pm-gpio.c                          |  2 --
 arch/arm/plat-samsung/s5p-irq-eint.c                     |  2 +-
 drivers/gpio/gpio-samsung.c                              |  3 ---
 sound/soc/samsung/goni_wm8994.c                          |  2 +-
 42 files changed, 41 insertions(+), 82 deletions(-)
 rename arch/arm/mach-s5p64x0/include/mach/{gpio.h => gpio-samsung.h} (95%)
 rename arch/arm/mach-s5pc100/include/mach/{gpio.h => gpio-samsung.h} (97%)
 rename arch/arm/mach-s5pv210/include/mach/{gpio.h => gpio-samsung.h} (96%)
