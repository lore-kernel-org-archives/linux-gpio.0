From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.20
Date: Fri, 21 Dec 2018 09:59:10 +0100
Message-ID: <CACRpkdYn7hPt5Etb5oeD-pTW6ME4QAwnTZEXu8siGNxi-OgQew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

this is the hopefully last round of GPIO fixes.

The ACPI patch is pretty important for some laptop users, the
rest is driver-specific for embedded (mostly ARM) systems.

I took out one ACPI patch that wasn't critical enough because I
couldn't justify sending it at this point, and that is why the commit
date is today, but the patches have been in linux-next.

Sorry for not sending some of them earlier :(

Notice that we have a co-maintainer for GPIO now, Bartosz
Golaszewski, and he might jump in and make some pull requests
at times when I am off.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 2e6e902d185027f8e3cb8b7305238f7e35d6a436=
:

  Linux 4.20-rc4 (2018-11-25 14:19:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.20-3

for you to fetch changes up to c8da642d41a6811c21177c9994aa7dc35be67d46:

  gpio: mvebu: only fail on missing clk if pwm is actually to be used
(2018-12-21 09:23:46 +0100)

----------------------------------------------------------------
GPIO fixes for v4.20:
- ACPI IRQ request deferral
- OMAP: revert deferred wakeup quirk
- MAX7301: fix DMA safe memory handling
- MVEBU: selective probe failure on missing clk

----------------------------------------------------------------
Christophe Leroy (1):
      gpio: max7301: fix driver for use with CONFIG_VMAP_STACK

Hans de Goede (1):
      gpiolib-acpi: Only defer request_irq for GpioInt ACPI event handlers

Tony Lindgren (1):
      gpio: gpio-omap: Revert deferred wakeup quirk handling for regression=
s

Uwe Kleine-K=C3=B6nig (1):
      gpio: mvebu: only fail on missing clk if pwm is actually to be used

 drivers/gpio/gpio-max7301.c |  12 +---
 drivers/gpio/gpio-mvebu.c   |   6 +-
 drivers/gpio/gpio-omap.c    |  64 ++------------------
 drivers/gpio/gpiolib-acpi.c | 144 ++++++++++++++++++++++++++--------------=
----
 4 files changed, 95 insertions(+), 131 deletions(-)
