From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] ARM: davinci: fix GPIO breakage after v4.19
Date: Wed, 21 Nov 2018 10:35:11 +0100
Message-ID: <20181121093523.12503-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Russell King <linux@armlinux.org.uk>, Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This is the entire set of changes needed to fix the broken GPIO support
for DaVinci boards in legacy mode after certain changes made to the
GPIO driver in 4.19, namely: commits 587f7a694f01 ("gpio: davinci: Use
dev name for label and automatic base selection") and eb3744a2dd01
("gpio: davinci: Do not assume continuous IRQ numbering").

Bartosz Golaszewski (12):
  ARM: davinci: da8xx: define gpio interrupts as separate resources
  ARM: davinci: dm365: define gpio interrupts as separate resources
  ARM: davinci: dm646x: define gpio interrupts as separate resources
  ARM: davinci: dm355: define gpio interrupts as separate resources
  ARM: davinci: dm644x: define gpio interrupts as separate resources
  gpio: davinci: restore a way to manually specify the GPIO base
  ARM: davinci: da850: set the GPIO base to 0
  ARM: davinci: dm365: set the GPIO base to 0
  ARM: davinci: dm646x: set the GPIO base to 0
  ARM: davinci: dm355: set the GPIO base to 0
  ARM: davinci: da830: set the GPIO base to 0
  ARM: davinci: dm644x: set the GPIO base to 0

 arch/arm/mach-davinci/da830.c              |  4 ++-
 arch/arm/mach-davinci/da850.c              |  4 ++-
 arch/arm/mach-davinci/devices-da8xx.c      | 40 ++++++++++++++++++++++
 arch/arm/mach-davinci/dm355.c              | 32 +++++++++++++++++
 arch/arm/mach-davinci/dm365.c              | 37 ++++++++++++++++++++
 arch/arm/mach-davinci/dm644x.c             | 22 ++++++++++++
 arch/arm/mach-davinci/dm646x.c             | 12 +++++++
 drivers/gpio/gpio-davinci.c                |  2 +-
 include/linux/platform_data/gpio-davinci.h |  2 ++
 9 files changed, 152 insertions(+), 3 deletions(-)

-- 
2.19.1
