From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv2 0/6] mcp23s08 pinconf support
Date: Thu, 27 Apr 2017 16:19:31 +0200
Message-ID: <20170427141937.762-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49964 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752128AbdD0OTv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Apr 2017 10:19:51 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Steven Miao <realmz6@gmail.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, linux-gpio@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>

Hi,

Back in January I sent patches adding pinconf support
for configuring mcp23s08's pull-ups. Apart from my
custom Raspberry Pi setup the pull-up support is also
needed by Toby Churchill SL50.

Changes since PATCHv1:
 * Add patch moving mcp23s08 from gpio/ to pinctrl/
 * Add patches updating config references in arch/
 * Add patch removing pdata support for pullup config

I did not add a stub for GPIO_MCP23S08 selecting the
new PINCTRL_MCP23S08, since that would require a copy
of all "depends on" information, which is quite messy.
Also it seems to be quite unusual (I found no instance
of a select being used for a renamed config option).

I see the following merge strategies:

 a) Ignore limited bisectability and merge all
    patches through their own subsystem. Compilation
	should always succeed, but the blackfin boards
	will be without mcp23s08 support with only one of
	patch 1 and 2 being applied.
 b) - Squash patch 1 & 2
    - Queue that patch into gpio/pinctrl
	- Provide immutable-branch for blackfin & arm
	- Blackfin & ARM can pull immutable-branch & apply defconfig patch
	- gpio/pinctrl can queue patch 5 & 6
 c) The same as b), but squash patch 1-4 to guarantee
    bisectability for defconfig.

-- Sebastian

Sebastian Reichel (6):
  gpio: mcp23s08: move to pinctrl
  blackfin: boards: MCP23S08 config has been renamed
  blackfin: defconfig: MCP23S08 config has been renamed
  arm: lpc32xx: defconfig: MCP23S08 config has been renamed
  pinctrl: mcp23s08: add pinconf support
  pinctrl: mcp23s08: drop pullup config from pdata

 arch/arm/configs/lpc32xx_defconfig                 |   2 +-
 arch/blackfin/configs/BF609-EZKIT_defconfig        |   2 +-
 arch/blackfin/mach-bf527/boards/tll6527m.c         |   4 +-
 arch/blackfin/mach-bf609/boards/ezkit.c            |   4 +-
 drivers/gpio/Kconfig                               |  17 --
 drivers/gpio/Makefile                              |   1 -
 drivers/pinctrl/Kconfig                            |  14 ++
 drivers/pinctrl/Makefile                           |   1 +
 .../gpio-mcp23s08.c => pinctrl/pinctrl-mcp23s08.c} | 206 +++++++++++++++++----
 include/linux/spi/mcp23s08.h                       |   1 -
 10 files changed, 196 insertions(+), 56 deletions(-)
 rename drivers/{gpio/gpio-mcp23s08.c => pinctrl/pinctrl-mcp23s08.c} (86%)

-- 
2.11.0

