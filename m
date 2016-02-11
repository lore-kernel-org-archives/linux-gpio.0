From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.5
Date: Thu, 11 Feb 2016 15:07:28 +0100
Message-ID: <CACRpkdZbBDk+2r0AReOd3VvkZedEUTYw6HPo-fi4aQUQ5trY7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here are some GPIO fixes for the v4.5 series. Very few so far
given that I was refactoring around like a madman for this merge
window. I thank the zeroday build tests for the smoothness.

Please pull these little things in.

Yours,
Linus Walleij

The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:

  Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.5-2

for you to fetch changes up to 6ec9249a83b00a754af435ed57ad02ffed105d93:

  gpio: davinci: Fix the number of controllers allocated (2016-02-10
11:00:49 +0100)

----------------------------------------------------------------
GPIO fixes for the v4.5 series:
- Probe errorpath fix for the Altera
- irqchip ofnode pointer added to the DaVinci driver
- controller instance number correction for DaVinci

----------------------------------------------------------------
Keerthy (1):
      gpio: davinci: Add the missing of-node pointer

Lokesh Vutla (1):
      gpio: davinci: Fix the number of controllers allocated

Phil Reid (1):
      gpio: gpio-altera: Remove gpiochip on probe failure.

 drivers/gpio/gpio-altera.c  | 5 +++--
 drivers/gpio/gpio-davinci.c | 7 ++++---
 2 files changed, 7 insertions(+), 5 deletions(-)
