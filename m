From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.16
Date: Sun, 11 Mar 2018 11:06:22 +0100
Message-ID: <CACRpkdZvwWmh7NqcoM9bgTxnLECv5thLavyCAS7jPv87DF0ZTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here is a singular fix for v4.16 and the Renesas RCAR driver.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 661e50bc853209e41a5c14a290ca4decc43cbfd1:

  Linux 4.16-rc4 (2018-03-04 14:54:11 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.16-3

for you to fetch changes up to 9ac79ba9c77d8595157bbdc4327919f8ee062426:

  gpio: rcar: Use wakeup_path i.s.o. explicit clock handling
(2018-03-05 09:01:21 +0100)

----------------------------------------------------------------
This is a single GPIO fix for the v4.16 series affecting the
Renesas driver, and fixes wakeup from external stuff.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      gpio: rcar: Use wakeup_path i.s.o. explicit clock handling

 drivers/gpio/gpio-rcar.c | 38 ++++++++++++++++----------------------
 1 file changed, 16 insertions(+), 22 deletions(-)
