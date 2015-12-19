From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.4, take 2
Date: Sat, 19 Dec 2015 12:42:30 +0100
Message-ID: <CACRpkdYp8D1fD4xK7Lcfuw2FFY4YrykWLikVgJrR+hei3_DP+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here are some GPIO fixes for the v4.4 series.
Most prominent: I revert the error propagation from the
.get() function until we can fix up all the drivers properly
for v4.5.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 527e9316f8ec44bd53d90fb9f611fa7ffff52bb9:

  Linux 4.4-rc4 (2015-12-06 15:43:12 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.4-3

for you to fetch changes up to 45ad7db90b42555c8107f18ec6d6a1e9bce34860:

  gpio: revert get() to non-errorprogating behaviour (2015-12-17 15:48:29 +0100)

----------------------------------------------------------------
GPIO fixes for the v4.4 series:
- Revert the error number propagation from the .get() vtable
  entry temporarily, until we make the proper fixes to all drivers.
- Fix the clamping behaviour in the generic GPIO driver.
- Driver fix for the ath79 driver

----------------------------------------------------------------
Axel Lin (1):
      gpio: ath79: Fix the logic to clear offset bit of
AR71XX_GPIO_REG_OE register

Linus Walleij (2):
      gpio: generic: clamp values from bgpio_get_set()
      gpio: revert get() to non-errorprogating behaviour

 drivers/gpio/gpio-ath79.c   | 2 +-
 drivers/gpio/gpio-generic.c | 4 ++--
 drivers/gpio/gpiolib.c      | 8 +++++++-
 3 files changed, 10 insertions(+), 4 deletions(-)
