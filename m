From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 00/23] Kill ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB
Date: Wed, 20 Apr 2016 10:57:58 +0200
Message-ID: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:35691 "EHLO
	mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932391AbcDTI6b (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 04:58:31 -0400
Received: by mail-lf0-f48.google.com with SMTP id c126so36739267lfb.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2016 01:58:30 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

These intermediary symbols are just creating trouble.

Severe cargo-cult code warning on these.

This patch set gets rid of them.

Linus Walleij (23):
  gpio: remove deps on ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB
  arc: select GPIOLIB directly
  ARM: do away with ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB
  arm64: do away with ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB
  avr32: do away with ARCH_REQUIRE_GPIOLIB
  blackfin: do away with ARCH_REQUIRE_GPIOLIB
  cris: do away with ARCH_REQUIRE_GPIOLIB
  hexagon: update TODO list
  m68k: do away with ARCH_REQUIRE_GPIOLIB
  MIPS: do away with ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB
  openrisc: do away with ARCH_REQUIRE_GPIOLIB
  powerpc: do away with ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB
  sh: do away with ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB
  unicore: do away with ARCH_REQUIRE_GPIOLIB
  x86: do away with ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB
  alpha: remove ARCH_WANT_OPTIONAL_GPIOLIB
  ia64: remove ARCH_WANT_OPTIONAL_GPIOLIB
  metag: remove ARCH_WANT_OPTIONAL_GPIOLIB
  microblaze: remove ARCH_WANT_OPTIONAL_GPIOLIB
  nios2: remove ARCH_WANT_OPTIONAL_GPIOLIB
  sparc: remove ARCH_WANT_OPTIONAL_GPIOLIB
  xtensa: remove ARCH_WANT_OPTIONAL_GPIOLIB
  gpio: delete ARCH_[WANTS_OPTIONAL|REQUIRE]_GPIOLIB

 Documentation/gpio/board.txt           |  6 +++---
 Documentation/gpio/gpio-legacy.txt     | 16 ++++------------
 arch/alpha/Kconfig                     |  1 -
 arch/arc/plat-axs10x/Kconfig           |  2 +-
 arch/arc/plat-tb10x/Kconfig            |  2 +-
 arch/arm/Kconfig                       | 34 ++++++++++++++++------------------
 arch/arm/mach-at91/Kconfig             |  2 +-
 arch/arm/mach-bcm/Kconfig              |  7 +++----
 arch/arm/mach-berlin/Kconfig           |  2 +-
 arch/arm/mach-digicolor/Kconfig        |  2 +-
 arch/arm/mach-exynos/Kconfig           |  2 +-
 arch/arm/mach-imx/Kconfig              |  2 +-
 arch/arm/mach-integrator/Kconfig       |  4 ++--
 arch/arm/mach-meson/Kconfig            |  2 +-
 arch/arm/mach-mmp/Kconfig              |  2 +-
 arch/arm/mach-moxart/Kconfig           |  2 +-
 arch/arm/mach-mv78xx0/Kconfig          |  2 +-
 arch/arm/mach-mvebu/Kconfig            |  4 ++--
 arch/arm/mach-mxs/Kconfig              |  2 +-
 arch/arm/mach-nomadik/Kconfig          |  2 +-
 arch/arm/mach-omap2/Kconfig            |  2 +-
 arch/arm/mach-orion5x/Kconfig          |  2 +-
 arch/arm/mach-picoxcell/Kconfig        |  2 +-
 arch/arm/mach-prima2/Kconfig           |  2 +-
 arch/arm/mach-rockchip/Kconfig         |  2 +-
 arch/arm/mach-s3c24xx/Kconfig          |  2 +-
 arch/arm/mach-s3c64xx/Kconfig          |  2 +-
 arch/arm/mach-s5pv210/Kconfig          |  2 +-
 arch/arm/mach-shmobile/Kconfig         |  2 +-
 arch/arm/mach-spear/Kconfig            |  2 +-
 arch/arm/mach-sti/Kconfig              |  2 +-
 arch/arm/mach-sunxi/Kconfig            |  2 +-
 arch/arm/mach-tegra/Kconfig            |  2 +-
 arch/arm/mach-u300/Kconfig             |  2 +-
 arch/arm/mach-ux500/Kconfig            |  2 +-
 arch/arm/mach-vexpress/Kconfig         |  2 +-
 arch/arm/mach-vt8500/Kconfig           |  2 +-
 arch/arm64/Kconfig                     |  1 -
 arch/arm64/Kconfig.platforms           | 10 +++++-----
 arch/avr32/Kconfig                     |  2 +-
 arch/blackfin/Kconfig                  |  2 +-
 arch/cris/Kconfig                      |  2 +-
 arch/hexagon/Kconfig                   |  3 +--
 arch/ia64/Kconfig                      |  1 -
 arch/m68k/Kconfig.cpu                  |  2 +-
 arch/metag/Kconfig.soc                 |  1 -
 arch/microblaze/Kconfig                |  1 -
 arch/mips/Kconfig                      | 32 +++++++++++++++-----------------
 arch/mips/alchemy/Kconfig              |  2 +-
 arch/mips/pic32/Kconfig                |  2 +-
 arch/nios2/Kconfig                     |  1 -
 arch/openrisc/Kconfig                  |  2 +-
 arch/powerpc/Kconfig                   |  1 -
 arch/powerpc/platforms/40x/Kconfig     |  2 +-
 arch/powerpc/platforms/44x/Kconfig     |  2 +-
 arch/powerpc/platforms/512x/Kconfig    |  1 -
 arch/powerpc/platforms/83xx/Kconfig    |  3 ---
 arch/powerpc/platforms/85xx/Kconfig    |  4 ++--
 arch/powerpc/platforms/86xx/Kconfig    |  7 +++----
 arch/powerpc/platforms/8xx/Kconfig     |  2 +-
 arch/powerpc/platforms/Kconfig         |  8 ++++----
 arch/sh/Kconfig                        | 11 +----------
 arch/sh/boards/Kconfig                 | 17 ++++++++---------
 arch/sh/boards/mach-highlander/Kconfig |  2 +-
 arch/sh/boards/mach-rsk/Kconfig        |  6 +++---
 arch/sparc/Kconfig                     |  1 -
 arch/unicore32/Kconfig                 |  2 +-
 arch/x86/Kconfig                       |  3 +--
 arch/xtensa/Kconfig                    |  1 -
 drivers/gpio/Kconfig                   | 22 ----------------------
 70 files changed, 115 insertions(+), 176 deletions(-)

-- 
2.4.11

