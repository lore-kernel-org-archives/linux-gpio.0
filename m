From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v5.0
Date: Mon, 14 Jan 2019 09:27:04 +0100
Message-ID: <CACRpkdbP+kAp6px=QOZ6SDMLKVEYsjEA=CoR7D4whv0c4+motw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here are some GPIO fixes for the v5.0 series.

The patch hitting the MMC/SD subsystem is fixing up my own
mess when moving semantics from MMC/SD over to gpiolib.
Ulf is on vacation but I managed to reach him on chat and
obtain his ACK.

The other two are early-rc fixes that are not super serious
but pretty annoying so I'd like to get rid of them.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.0-2

for you to fetch changes up to e3e4767bd550b3f19278e42bcce143e0d2316ba2:

  mmc: core: don't override the CD GPIO level when "cd-inverted" is
set (2019-01-11 15:27:35 +0100)

----------------------------------------------------------------
GPIO fixes for the v5.0 series:
- Get rid of some WARN_ON() from the ACPI code
- Staticize a symbol
- Fix MMC polarity detection

----------------------------------------------------------------
Hans de Goede (1):
      gpiolib-acpi: Remove unnecessary WARN_ON from
acpi_gpiochip_free_interrupts

Martin Blumenstingl (1):
      mmc: core: don't override the CD GPIO level when "cd-inverted" is set

Wei Yongjun (1):
      gpio: pca953x: Make symbol 'pca953x_i2c_regmap' static

 drivers/gpio/gpio-pca953x.c | 2 +-
 drivers/gpio/gpiolib-acpi.c | 7 +------
 drivers/mmc/core/host.c     | 2 +-
 3 files changed, 3 insertions(+), 8 deletions(-)
