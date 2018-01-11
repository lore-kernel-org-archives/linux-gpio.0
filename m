From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fix for v4.15
Date: Thu, 11 Jan 2018 11:02:36 +0100
Message-ID: <CACRpkdb=aogLETpR_17533Vrx=r2mMnBrdZpKmaFXzLvnWxYXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

this is hopefully the last GPIO fix for v4.15. The bug was
created by an especially sloppy subsystem maintainer.

Yours,
Linus Walleij

The following changes since commit b2cd1df66037e7c4697c7e40496bf7e4a5e16a2d:

  Linux 4.15-rc7 (2018-01-07 14:22:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.15-4

for you to fetch changes up to 1e77fc82110ac36febf46c1e2782f504f7d23099:

  gpio: Add missing open drain/source handling to
gpiod_set_value_cansleep() (2018-01-10 14:17:17 +0100)

----------------------------------------------------------------
GPIO fix for v4.15: fix a raw vs elaborate GPIO descriptor bug
introduced by yours truly.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      gpio: Add missing open drain/source handling to gpiod_set_value_cansleep()

 drivers/gpio/gpiolib.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)
