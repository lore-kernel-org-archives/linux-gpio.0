From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v3.19 last take
Date: Mon, 2 Feb 2015 14:53:38 +0100
Message-ID: <CACRpkdZCkfNW1XO7BKhHZAERNZ8DjmECsiyAx+KE=1jgcr+MWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:39091 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754233AbbBBNxk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Feb 2015 08:53:40 -0500
Received: by mail-ob0-f176.google.com with SMTP id wo20so7971089obc.7
        for <linux-gpio@vger.kernel.org>; Mon, 02 Feb 2015 05:53:39 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Sonic Zhang <sonic.adi@gmail.com>, Tony Lindgren <tony@atomide.com>

Hi Linus,

there is a high bug-spot activity in GPIO this merge window, much
due to Johan Hovolds spearheading into actually exercising the
removal path for GPIO chips, something that was never really
exercised before.

The other two fixes are augmenting erroneous behaviours in two
specific drivers for minor systems.

I know it's late, but please pull this in for v3.19.

Yours,
Linus Walleij

The following changes since commit 26bc420b59a38e4e6685a73345a0def461136dce:

  Linux 3.19-rc6 (2015-01-25 20:04:41 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v3.19-5

for you to fetch changes up to 49d2ca84e433dab854c7a866bc6add09cfab682d:

  gpio: sysfs: fix memory leak in gpiod_sysfs_set_active_low
(2015-01-30 10:29:33 +0100)

----------------------------------------------------------------
Yet more GPIO fixes for the v3.19 series:
- Two fixes stabilizing that which was never stable before:
  removal of GPIO chips, now let's stop leaking memory.
- Make sure OMAP IRQs are usable when the irqchip API
  is used orthogonally to the gpiochip API.
- Provide a default GPIO base for the mcp23s08 driver.

----------------------------------------------------------------
Johan Hovold (2):
      gpio: sysfs: fix memory leak in gpiod_export_link
      gpio: sysfs: fix memory leak in gpiod_sysfs_set_active_low

Sonic Zhang (1):
      gpio: mcp23s08: handle default gpio base

Tony Lindgren (1):
      gpio: omap: Fix bad device access with setup_irq()

 drivers/gpio/gpio-mcp23s08.c | 17 ++++++++++-------
 drivers/gpio/gpio-omap.c     | 39 +++++++++++++++++++++++++++++++++------
 drivers/gpio/gpiolib-sysfs.c |  3 ++-
 3 files changed, 45 insertions(+), 14 deletions(-)
