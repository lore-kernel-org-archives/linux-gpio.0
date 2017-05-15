From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv3 00/14] mcp23s08 pinconf & cleanup
Date: Mon, 15 May 2017 11:24:24 +0200
Message-ID: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Steven Miao <realmz6@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, linux-gpio@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: linux-gpio@vger.kernel.org

Hi,

Here is a rebase of my PATCHv2 in combination with the second patchset, which
migrates to regmap based register caching. I also added a few more patches, that
do misc. cleanups in the driver and remove ~100 loc (that's 10%).

The first patch and the 12th patch ("simplify spi_present_mask handling") needs
Acked-by from Steven Miao for the blackfin architecture changes (defconfig, two
boardfiles) and from Vladimir Zapolskiy or Sylvain Lemieux for the lpc32xx_defconfig
changes.

Changes since PATCHv1:
 * Add patch moving mcp23s08 from gpio/ to pinctrl/
 * Add patches updating config references in arch/
 * Add patch removing pdata support for pullup config
Changes since PATCHv2:
 * rebase to v4.12-rc1
 * squash patch 1-4 for bisectability
 * use devm_pinctrl_register in patch adding pinctrl support
 * include patchset for regmap based caching
 * constify structs in patch switching to regmap caching
 * add new patches with more cleanups (-120 locs)

-- Sebastian

Sebastian Reichel (14):
  gpio: mcp23s08: move to pinctrl
  pinctrl: mcp23s08: add pinconf support
  pinctrl: mcp23s08: drop pullup config from pdata
  pinctrl: mcp23s08: switch to regmap caching
  pinctrl: mcp23s08: drop OF_GPIO dependency
  pinctrl: mcp23s08: irq mapping is already done
  pinctrl: mcp23s08: use managed kzalloc for mcp
  pinctrl: mcp23s08: switch to devm_gpiochip_add_data
  pinctrl: mcp23s08: simplify i2c pdata handling
  pinctrl: mcp23s08: simplify spi pdata handling
  pinctrl: mcp23s08: generalize irq property handling
  pinctrl: mcp23s08: simplify spi_present_mask handling
  pinctrl: mcp23s08: drop comment about missing irq support
  pinctrl: mcp23s08: fix comment for mcp23s08_platform_data.base

 arch/arm/configs/lpc32xx_defconfig                 |   2 +-
 arch/blackfin/configs/BF609-EZKIT_defconfig        |   2 +-
 arch/blackfin/mach-bf527/boards/tll6527m.c         |   8 +-
 arch/blackfin/mach-bf609/boards/ezkit.c            |   4 +-
 drivers/gpio/Kconfig                               |  17 -
 drivers/gpio/Makefile                              |   1 -
 drivers/pinctrl/Kconfig                            |  13 +
 drivers/pinctrl/Makefile                           |   1 +
 .../gpio-mcp23s08.c => pinctrl/pinctrl-mcp23s08.c} | 647 +++++++++++++--------
 include/linux/spi/mcp23s08.h                       |  38 +-
 10 files changed, 425 insertions(+), 308 deletions(-)
 rename drivers/{gpio/gpio-mcp23s08.c => pinctrl/pinctrl-mcp23s08.c} (64%)

-- 
2.11.0
