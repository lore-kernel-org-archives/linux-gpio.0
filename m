From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.15 take one
Date: Tue, 5 Dec 2017 14:10:32 +0100
Message-ID: <CACRpkdYOpzrV8FpG8T0m-JjzOw_NDoqrEjvAuMpj-kcVDPb4LQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here are three small fixes for GPIO. Not much, I'm surprised
by the silence in my subsystems. All driver fixes.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.15-2

for you to fetch changes up to 8a64e557f399090f5d1917b2f32a065da2b12be1:

  gpio: pca953x: fix vendor prefix for PCA9654 (2017-12-02 22:41:43 +0100)

----------------------------------------------------------------
GPIO fixes for the v4.15 cycle:

- Fix a crash in the 74x164 driver
- Fix IRQ banks in the DaVinci driver
- Fix the vendor prefix in the PCA953x driver

----------------------------------------------------------------
Geert Uytterhoeven (1):
      gpio: 74x164: Fix crash during .remove()

Keerthy (1):
      gpio: davinci: Assign first bank regs for unbanked case

Sergei Shtylyov (1):
      gpio: pca953x: fix vendor prefix for PCA9654

 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 2 +-
 drivers/gpio/gpio-74x164.c                              | 4 ++--
 drivers/gpio/gpio-davinci.c                             | 2 +-
 drivers/gpio/gpio-pca953x.c                             | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
