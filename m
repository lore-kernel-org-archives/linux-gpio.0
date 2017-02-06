From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 0/3] pinctrl: berlin/mvebu/spear: make bool code non-modular
Date: Mon, 6 Feb 2017 03:03:49 -0500
Message-ID: <20170206080352.17808-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Jisheng Zhang <jszhang@marvell.com>, Linus Walleij <linus.walleij@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Hebb <tommyhebb@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Viresh Kumar <vireshk@kernel.org>, spear-devel@list.st.com, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Nothing really new here -- if the Kconfig and/or the Makefile does
not allow building the code as modular, then we don't need to be
using module_xyz() functions and/or MODULE_XYZ macros.

Here we audit and remove such instances in three subdirectories of
the pinctrl subsystem: berlin, mvebu, and spear, which allows us
to have a good net removal of unused code as per the diffstat.

Rather than do one commit per driver, we take advantage of the
fact that the drivers are grouped already and bundle the changes
per family, since the changes are not really deeply technical.

Build tested for allmodconfig on linux-next for arm, arm64, i386
and x86_64.

An automated mapping from the object file to the Makefile and then
finally to the Kconfig variable (unless obj-y) and type follows as
a double check; run on the current code base in linux-next today.

Paul.
--

drivers/pinctrl/berlin/Makefile:obj-$(CONFIG_PINCTRL_BERLIN_BG2) += berlin-bg2.o
drivers/pinctrl/berlin/Kconfig:config PINCTRL_BERLIN_BG2
drivers/pinctrl/berlin/Kconfig:	def_bool MACH_BERLIN_BG2

drivers/pinctrl/berlin/Makefile:obj-$(CONFIG_PINCTRL_BERLIN_BG2CD) += berlin-bg2cd.o
drivers/pinctrl/berlin/Kconfig:config PINCTRL_BERLIN_BG2CD
drivers/pinctrl/berlin/Kconfig:	def_bool MACH_BERLIN_BG2CD

drivers/pinctrl/berlin/Makefile:obj-$(CONFIG_PINCTRL_BERLIN_BG2Q) += berlin-bg2q.o
drivers/pinctrl/berlin/Kconfig:config PINCTRL_BERLIN_BG2Q
drivers/pinctrl/berlin/Kconfig:	def_bool MACH_BERLIN_BG2Q

drivers/pinctrl/berlin/Makefile:obj-$(CONFIG_PINCTRL_BERLIN_BG4CT) += berlin-bg4ct.o
drivers/pinctrl/berlin/Kconfig:config PINCTRL_BERLIN_BG4CT
drivers/pinctrl/berlin/Kconfig:	bool "Marvell berlin4ct pin controller driver"

drivers/pinctrl/mvebu/Makefile:obj-$(CONFIG_PINCTRL_ARMADA_370) += pinctrl-armada-370.o
drivers/pinctrl/mvebu/Kconfig:config PINCTRL_ARMADA_370
drivers/pinctrl/mvebu/Kconfig:	bool

drivers/pinctrl/mvebu/Makefile:obj-$(CONFIG_PINCTRL_ARMADA_375) += pinctrl-armada-375.o
drivers/pinctrl/mvebu/Kconfig:config PINCTRL_ARMADA_375
drivers/pinctrl/mvebu/Kconfig:	bool

drivers/pinctrl/mvebu/Makefile:obj-$(CONFIG_PINCTRL_ARMADA_38X) += pinctrl-armada-38x.o
drivers/pinctrl/mvebu/Kconfig:config PINCTRL_ARMADA_38X
drivers/pinctrl/mvebu/Kconfig:	bool

drivers/pinctrl/mvebu/Makefile:obj-$(CONFIG_PINCTRL_ARMADA_39X) += pinctrl-armada-39x.o
drivers/pinctrl/mvebu/Kconfig:config PINCTRL_ARMADA_39X
drivers/pinctrl/mvebu/Kconfig:	bool

drivers/pinctrl/mvebu/Makefile:obj-$(CONFIG_PINCTRL_ARMADA_XP) += pinctrl-armada-xp.o
drivers/pinctrl/mvebu/Kconfig:config PINCTRL_ARMADA_XP
drivers/pinctrl/mvebu/Kconfig:	bool

drivers/pinctrl/mvebu/Makefile:obj-$(CONFIG_PINCTRL_DOVE) += pinctrl-dove.o
drivers/pinctrl/mvebu/Kconfig:config PINCTRL_DOVE
drivers/pinctrl/mvebu/Kconfig:	bool

drivers/pinctrl/mvebu/Makefile:obj-$(CONFIG_PINCTRL_KIRKWOOD) += pinctrl-kirkwood.o
drivers/pinctrl/mvebu/Kconfig:config PINCTRL_KIRKWOOD
drivers/pinctrl/mvebu/Kconfig:	bool

drivers/pinctrl/mvebu/Makefile:obj-y += pinctrl-mvebu.o

drivers/pinctrl/mvebu/Makefile:obj-$(CONFIG_PINCTRL_ORION) += pinctrl-orion.o
drivers/pinctrl/mvebu/Kconfig:config PINCTRL_ORION
drivers/pinctrl/mvebu/Kconfig:	bool

drivers/pinctrl/spear/Makefile:obj-$(CONFIG_PINCTRL_SPEAR_PLGPIO) += pinctrl-plgpio.o
drivers/pinctrl/spear/Kconfig:config PINCTRL_SPEAR_PLGPIO
drivers/pinctrl/spear/Kconfig:	bool "SPEAr SoC PLGPIO Controller"

drivers/pinctrl/spear/Makefile:obj-$(CONFIG_PINCTRL_SPEAR1310) += pinctrl-spear1310.o
drivers/pinctrl/spear/Kconfig:config PINCTRL_SPEAR1310
drivers/pinctrl/spear/Kconfig:	bool "ST Microelectronics SPEAr1310 SoC pin controller driver"

drivers/pinctrl/spear/Makefile:obj-$(CONFIG_PINCTRL_SPEAR1340) += pinctrl-spear1340.o
drivers/pinctrl/spear/Kconfig:config PINCTRL_SPEAR1340
drivers/pinctrl/spear/Kconfig:	bool "ST Microelectronics SPEAr1340 SoC pin controller driver"

drivers/pinctrl/spear/Makefile:obj-$(CONFIG_PINCTRL_SPEAR300) += pinctrl-spear300.o
drivers/pinctrl/spear/Kconfig:config PINCTRL_SPEAR300
drivers/pinctrl/spear/Kconfig:	bool "ST Microelectronics SPEAr300 SoC pin controller driver"

drivers/pinctrl/spear/Makefile:obj-$(CONFIG_PINCTRL_SPEAR310) += pinctrl-spear310.o
drivers/pinctrl/spear/Kconfig:config PINCTRL_SPEAR310
drivers/pinctrl/spear/Kconfig:	bool "ST Microelectronics SPEAr310 SoC pin controller driver"

drivers/pinctrl/spear/Makefile:obj-$(CONFIG_PINCTRL_SPEAR320) += pinctrl-spear320.o
drivers/pinctrl/spear/Kconfig:config PINCTRL_SPEAR320
drivers/pinctrl/spear/Kconfig:	bool "ST Microelectronics SPEAr320 SoC pin controller driver"

---

Cc: "Antoine Ténart" <antoine.tenart@free-electrons.com>
Cc: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Jisheng Zhang <jszhang@marvell.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Thomas Hebb <tommyhebb@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Viresh Kumar <vireshk@kernel.org>
Cc: spear-devel@list.st.com
Cc: linux-gpio@vger.kernel.org

Paul Gortmaker (3):
  pinctrl: mvebu: make bool drivers explicitly non-modular
  pinctrl: spear: make bool drivers explicitly non-modular
  pinctrl: berlin: make bool drivers explicitly non-modular

 drivers/pinctrl/berlin/berlin-bg2.c        |  9 ++-------
 drivers/pinctrl/berlin/berlin-bg2cd.c      |  9 ++-------
 drivers/pinctrl/berlin/berlin-bg2q.c       |  9 ++-------
 drivers/pinctrl/berlin/berlin-bg4ct.c      |  9 ++-------
 drivers/pinctrl/mvebu/pinctrl-armada-370.c |  8 +-------
 drivers/pinctrl/mvebu/pinctrl-armada-375.c |  8 +-------
 drivers/pinctrl/mvebu/pinctrl-armada-38x.c |  8 +-------
 drivers/pinctrl/mvebu/pinctrl-armada-39x.c |  8 +-------
 drivers/pinctrl/mvebu/pinctrl-armada-xp.c  |  8 +-------
 drivers/pinctrl/mvebu/pinctrl-dove.c       | 17 ++---------------
 drivers/pinctrl/mvebu/pinctrl-kirkwood.c   |  8 +-------
 drivers/pinctrl/mvebu/pinctrl-mvebu.c      |  1 -
 drivers/pinctrl/mvebu/pinctrl-orion.c      |  8 +-------
 drivers/pinctrl/spear/pinctrl-plgpio.c     |  7 +------
 drivers/pinctrl/spear/pinctrl-spear1310.c  | 12 ------------
 drivers/pinctrl/spear/pinctrl-spear1340.c  | 12 ------------
 drivers/pinctrl/spear/pinctrl-spear300.c   | 12 ------------
 drivers/pinctrl/spear/pinctrl-spear310.c   | 12 ------------
 drivers/pinctrl/spear/pinctrl-spear320.c   | 12 ------------
 19 files changed, 18 insertions(+), 159 deletions(-)

-- 
2.11.0
