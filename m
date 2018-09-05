From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.19 take one
Date: Wed, 5 Sep 2018 13:59:44 +0200
Message-ID: <CACRpkdaD3aQQ6Kn6S-CCGOH2DsX5WUNBB0Jwq9P0k=O0E08MiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here are some GPIO fixes. The ACPI stuff is probably the most
annoying for users that get fixed this time.

Details in the signed tag.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.19-2

for you to fetch changes up to d49b48f088c323dbacae44dfbe56d9c985c8a2a1:

  gpio: Fix crash due to registration race (2018-08-31 11:30:45 +0200)

----------------------------------------------------------------
GPIO fixes for the v4.19 cycle:

- Atomic contexts, cansleep* calls and such fastpath/slopwpath
  things.

- Defer ACPI event handler registration to late_initcall()
  so IRQs do not fire in our face before other drivers have
  a chance to register handlers.

- Race condition if a consumer requests a GPIO after
  gpiochip_add_data_with_key() but before of_gpiochip_add()

- Probe errorpath in the dwapb driver.

----------------------------------------------------------------
Alexey Khoroshilov (1):
      gpio: dwapb: Fix error handling in dwapb_gpio_probe()

Andy Shevchenko (1):
      gpiolib: acpi: Switch to cansleep version of GPIO library call

Hans de Goede (1):
      gpiolib-acpi: Register GpioInt ACPI event handlers from a late_initcall

Michael Hennerich (1):
      gpio: adp5588: Fix sleep-in-atomic-context bug

Vincent Whitchurch (1):
      gpio: Fix crash due to registration race

 drivers/gpio/gpio-adp5588.c | 24 ++++++++++---
 drivers/gpio/gpio-dwapb.c   |  1 +
 drivers/gpio/gpiolib-acpi.c | 86 ++++++++++++++++++++++++++-------------------
 drivers/gpio/gpiolib-of.c   |  1 +
 4 files changed, 72 insertions(+), 40 deletions(-)
