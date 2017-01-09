From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.10
Date: Mon, 9 Jan 2017 14:33:08 +0100
Message-ID: <CACRpkdYZ4JjH2K25izeX-3H2rzTK3x3QS9NxDyyeHBOYADX9CQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

two small fixes is all I collected for GPIO so far.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:

  Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.10-2

for you to fetch changes up to 5018ada69a04c8ac21d74bd682fceb8e42dc0f96:

  gpio: Move freeing of GPIO hogs before numbing of the device
(2016-12-30 09:11:21 +0100)

----------------------------------------------------------------
GPIO fixes for the v4.10 series:

- Move free:ing of GPIO hogs to after free:ing the device
  to get rid of a warning state.

- A small comile warning fix.

----------------------------------------------------------------
Arnd Bergmann (1):
      gpio: mxs: remove __init annotation

Geert Uytterhoeven (1):
      gpio: Move freeing of GPIO hogs before numbing of the device

 drivers/gpio/gpio-mxs.c | 2 +-
 drivers/gpio/gpiolib.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
