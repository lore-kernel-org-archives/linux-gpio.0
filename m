From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.16
Date: Thu, 1 Mar 2018 09:25:28 +0100
Message-ID: <CACRpkdZpVtTVuPYMhRPP1WpyraHsXoRQX9yv5yv8hmOQWJ69vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Stefan Agner <stefan@agner.ch>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

two smallish pin control fixes: one actual code fix for the Meson and
a MAINTAINERS update.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.16-2

for you to fetch changes up to 78de41a368af26e54ba53e63629fd7f166f17cef:

  MAINTAINERS: add Freescale pin controllers (2018-02-21 11:09:23 +0100)

----------------------------------------------------------------
Pin control fixes for v4.16:

- Fix a pin group on the Meson.
- Assign maintainers for Freescale/NXP pin controllers.

----------------------------------------------------------------
Stefan Agner (1):
      MAINTAINERS: add Freescale pin controllers

Yixun Lan (1):
      pinctrl: meson-axg: adjust uart_ao_b pin group naming

 MAINTAINERS                               | 11 +++++++++++
 drivers/pinctrl/meson/pinctrl-meson-axg.c |  4 ++--
 2 files changed, 13 insertions(+), 2 deletions(-)
