From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.16 - second try
Date: Thu, 1 Mar 2018 08:53:56 +0100
Message-ID: <CACRpkdZxc_ubFFX6YKBWu_0jMw3AhZ=ni0aeHQmdFdok114o1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here is this pull request again, fixing up the device tree property readouts
for the GPIOs. Last time the fix needed fixing, not I think the fix is fixed.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.16-2

for you to fetch changes up to ce27fb2c56db6ccfe8099343bb4afdab15e77e7b:

  gpio: Handle deferred probing in of_find_gpio() properly (2018-02-27
09:48:07 +0100)

----------------------------------------------------------------
GPIO fixes for v4.16:

- Fix up device tree properties readout caused by my own
  refactorings.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      gpio: Handle deferred probing in of_find_gpio() properly

Maxime Ripard (1):
      gpiolib: Keep returning EPROBE_DEFER when we should

 drivers/gpio/gpiolib-of.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)
