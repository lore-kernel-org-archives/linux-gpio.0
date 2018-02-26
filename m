From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.16
Date: Mon, 26 Feb 2018 10:36:00 +0100
Message-ID: <CACRpkdYGQUynZJu+4-Bj=TzL5=C4qt2cYav__9aHSnwD2NERDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

two fixes to GPIO, both by nice colleagues fixing my mistakes.
Please pull it in!

Linus Walleij

The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.16-2

for you to fetch changes up to c2b3eec47c1b2161adbc70676f1422e6f56aaa32:

  gpio: Handle deferred probing in of_find_gpio() properly (2018-02-21
09:37:34 +0100)

----------------------------------------------------------------
GPIO fixes for the v4.16 kernel:

- Two patches fixing up my mistakes with device tree properties
  compatible for SPI and regulators. Nice to smoke this out for
  v4.16 though, when we actually use it in v4.17 it will be
  in nice shape.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      gpio: Handle deferred probing in of_find_gpio() properly

Maxime Ripard (1):
      gpiolib: Keep returning EPROBE_DEFER when we should

 drivers/gpio/gpiolib-of.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)
