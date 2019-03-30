From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for the v5.1 series
Date: Sat, 30 Mar 2019 16:04:42 +0100
Message-ID: <CACRpkdY2yafXiqn8TDjTNQKUQn=d3xE5y9zUHuXp1ve25C0wcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here is the first set of GPIO fixes for the v5.1 series,
as you can see I was away on leave and Bartosz kindly
stepped in and collected a slew of fixes, I pulled them into
my tree in two sets and merged some two more fixes (fixing
my own caused bugs) on top.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.1-2

for you to fetch changes up to 86d0756558b701b2c5502d90f705c2936008922d:

  Merge tag 'gpio-v5.1-rc3-fixes-for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into fixes
(2019-03-29 03:04:47 +0100)

----------------------------------------------------------------
GPIO fixes for the v5.1 series:

- Revert the extended use of gpio_set_config() and think about
  how we can do this properly.

- Fix up the SPI CS GPIO handling so it now works properly on
  the SPI bus children, as intended.

- Error paths and driver fixes.

----------------------------------------------------------------
Andrew Jeffery (1):
      Revert "gpio: use new gpio_set_config() helper in more places"

Andrey Smirnov (2):
      gpio: of: Check propname before applying "cs-gpios" quirks
      gpio: of: Check for "spi-cs-high" in child instead of parent node

Axel Lin (1):
      gpio: adnp: Fix testing wrong value in adnp_gpio_direction_input

Bartosz Golaszewski (2):
      gpio: mockup: fix debugfs read
      gpio: mockup: use simple_read_from_buffer() in debugfs read callback

Geert Uytterhoeven (1):
      gpio: of: Fix of_gpiochip_add() error path

Kangjie Lu (2):
      gpio: exar: add a check for the return value of ida_simple_get fails
      gpio: aspeed: fix a potential NULL pointer dereference

Linus Walleij (2):
      Merge tag 'gpio-5.1-rc2-fixes-for-linus' of
git://git.kernel.org/.../brgl/linux into fixes
      Merge tag 'gpio-v5.1-rc3-fixes-for-linus' of
git://git.kernel.org/.../brgl/linux into fixes

Thomas Gleixner (1):
      gpio: amd-fch: Fix bogus SPDX identifier

 drivers/gpio/gpio-adnp.c                        |  6 ++++--
 drivers/gpio/gpio-aspeed.c                      |  2 ++
 drivers/gpio/gpio-exar.c                        |  2 ++
 drivers/gpio/gpio-mockup.c                      | 10 +++-------
 drivers/gpio/gpiolib-of.c                       | 17 ++++++++++++-----
 drivers/gpio/gpiolib.c                          |  4 ++--
 include/linux/platform_data/gpio/gpio-amd-fch.h |  2 +-
 7 files changed, 26 insertions(+), 17 deletions(-)
