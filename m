From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [RFC v1 0/9] gpio: davinci: reuse for keystone arch
Date: Tue, 26 Nov 2013 21:40:06 +0200
Message-ID: <1385494815-15740-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>, linux-gpio@vger.kernel.org, nsekhar@ti.com
Cc: prabhakar.csengg@gmail.com, linux-kernel@vger.kernel.org, davinci-linux-open-source@linux.davincidsp.com, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-gpio@vger.kernel.org

This series is intended to update Davinci GPIO driver and reuse
it for Keystone SoCs, because Keystone uses the similar GPIO IP like Davinci.
Keystone GPIO IP: supports:
- up to 32 GPIO lines;
- only unbanked irqs;

See Documentation:
Keystone - http://www.ti.com/lit/ug/sprugv1/sprugv1.pdf

[1] Depends on patch:
"[PATCH 1/2] gpio: davinci: Fix a check for unbanked gpio"
https://lkml.org/lkml/2013/11/8/22

[2] and depends on series from Prabhakar Lad:
"[PATCH v6 0/6] gpio: daVinci: cleanup and feature enhancement"
https://www.mail-archive.com/devicetree@vger.kernel.org/msg05970.html

Based on:
git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git
branch: keystone/master

This series has been marked as RFC because it's based on an unfinished
series of patches [2], but with hope that it will help to reach final decisions 
and satisfy all interested parties.

Grygorii Strashko (9):
  gpio: davinci: get rid of DAVINCI_N_GPIO
  gpio: introduce GPIO_DAVINCI kconfig option
  gpio: davinci: use chained_irq_enter/chained_irq_exit API
  gpio: davinci: make IRQ initialization soc specific
  gpio: davinci: reuse for Keystone SoC
  arm: dts: keystone: add GPIO device entry
  ARM: keystone_defconfig: enable gpio support
  arm: dts: keystone-evm: add LEDs supports
  ARM: keystone_defconfig: enable LED support

 .../devicetree/bindings/gpio/gpio-davinci.txt      |    4 +-
 arch/arm/boot/dts/k2hk-evm.dts                     |   23 ++
 arch/arm/boot/dts/keystone.dtsi                    |   45 +++
 arch/arm/configs/keystone_defconfig                |   11 +
 drivers/gpio/Kconfig                               |    7 +
 drivers/gpio/Makefile                              |    2 +-
 drivers/gpio/gpio-davinci.c                        |  306 ++++++++++++++------
 7 files changed, 305 insertions(+), 93 deletions(-)

-- 
1.7.9.5
