From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] late GPIO fixes for the v4.0 series
Date: Mon, 30 Mar 2015 10:02:17 +0200
Message-ID: <CACRpkdbr5Qi4if5ReaYZh3Yu7=wYe8FyiyZeJtw3sFUSwEXjjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@linaro.org>, Kevin Hao <haokexin@gmail.com>, "qipeng.zha" <qipeng.zha@intel.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here are the (hopefully) last GPIO fixes for v4.0. Nothing
controversial whatsoever, just fixes.

Please pull it in.

Yours,
Linus Walleij


The following changes since commit 13a7a6ac0a11197edcd0f756a035f472b42cdf8b:

  Linux 4.0-rc2 (2015-03-03 09:04:59 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.0-3

for you to fetch changes up to c6ac19dac2683a8b06aebcc10cb1c711b555a949:

  gpio: syscon: reduce message level when direction reg offset not in
dt (2015-03-27 11:17:08 +0100)

----------------------------------------------------------------
Late GPIO fixes:
- Syscon GPIO fix for Keystone DSP GPIOs
- Pin number translation fix for ACPI GPIO
- A smallish compiler warning fix on the mpc8xxx driver

----------------------------------------------------------------
Grygorii Strashko (1):
      gpio: syscon: reduce message level when direction reg offset not in dt

Kevin Hao (1):
      gpio: mpc8xxx: remove __initdata annotation for mpc8xxx_gpio_ids[]

qipeng.zha (1):
      gpiolib: translate pin number in GPIO ACPI callbacks

 drivers/gpio/gpio-mpc8xxx.c |  2 +-
 drivers/gpio/gpio-syscon.c  |  2 +-
 drivers/gpio/gpiolib-acpi.c | 10 ++++++++++
 3 files changed, 12 insertions(+), 2 deletions(-)
