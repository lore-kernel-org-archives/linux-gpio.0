From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/3] ARM: davinci: fix ethernet support on da850-evm
Date: Tue, 13 Nov 2018 14:50:48 +0100
Message-ID: <20181113135051.15308-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Russell King <linux@armlinux.org.uk>, Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Ethernet doesn't work on da850-evm in legacy boot mode since v4.19. This
series addresses two problems I've found. I guess with this kind of
intrusive changes in the GPIO driver, other boards may be broken at the
moment too.

Bartosz Golaszewski (3):
  ARM: davinci: define gpio interrupts as separate resources
  gpio: davinci: restore a way to manually specify the GPIO base
  ARM: davinci: fix da850-evm boot in legacy mode

 arch/arm/mach-davinci/da850.c              |  4 ++-
 arch/arm/mach-davinci/devices-da8xx.c      | 42 +++++++++++++++++++++-
 drivers/gpio/gpio-davinci.c                |  2 +-
 include/linux/platform_data/gpio-davinci.h |  2 ++
 4 files changed, 47 insertions(+), 3 deletions(-)

-- 
2.19.1
