From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.3, take one
Date: Wed, 16 Sep 2015 09:19:45 +0200
Message-ID: <CACRpkda8sOECzYj+UomRfYoYqF4gC3n8bshKn9tZ-i6B1Kuutw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:36592 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752322AbbIPHTp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Sep 2015 03:19:45 -0400
Received: by oibi136 with SMTP id i136so115214533oib.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2015 00:19:45 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

Hi Linus,

this is the first round of GPIO fixes for the v4.3 series. Quite a lot
of patches, but the influx of new stuff in the merge window was
equally big, so I'm not surprised. Details in the signed tag as usual.

Please pull this in!

Yours,
Linus Walleij

The following changes since commit 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f:

  Linux 4.3-rc1 (2015-09-12 16:35:56 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.3-2

for you to fetch changes up to 46d4f7c25e1bb59b1663878b843a7ec06eaf5806:

  gpio: omap: Fix GPIO numbering for deferred probe (2015-09-14 09:12:04 +0200)

----------------------------------------------------------------
This is the first round of GPIO fixes for v4.3:

- Return value checks and thus nicer errorpath for two drivers.

- Make GPIO_RCAR arch neutral.

- Propagate errors from GPIO chip ->get() vtable call. It turned
  out these can actually fail sometimes, especially on slowpath
  controllers doing I2C traffic and similar.

- Update documentation to be in sync with the massive changes in
  the v4.3 merge window, phew.

- Handle deferred probe properly in the OMAP driver.

- Get rid of surplus MODULE_ALIAS() from sx150x.

----------------------------------------------------------------
Bjorn Andersson (1):
      gpio: Propagate errors from chip->get()

Dirk Behme (2):
      Documentation: gpio: board: add flags parameter to gpiod_get*() functions
      Documentation: gpio: board: describe the con_id parameter

Javier Martinez Canillas (2):
      gpio: sx150x: Remove unnecessary MODULE_ALIAS()
      Documentation: gpio: Explain that <function>-gpio is also supported

Kuninori Morimoto (1):
      gpio: rcar: GPIO_RCAR doesn't relate to ARM

Peng Fan (2):
      gpio: mxc: need to check return value of irq_alloc_generic_chip
      gpio: mxs: need to check return value of irq_alloc_generic_chip

Tony Lindgren (2):
      gpio: omap: Fix gpiochip_add() handling for deferred probe
      gpio: omap: Fix GPIO numbering for deferred probe

 Documentation/gpio/board.txt    | 40 +++++++++++++++++++++++++---------------
 Documentation/gpio/consumer.txt |  3 +++
 drivers/gpio/Kconfig            |  2 +-
 drivers/gpio/gpio-mxc.c         | 12 ++++++++++--
 drivers/gpio/gpio-mxs.c         | 13 +++++++++++--
 drivers/gpio/gpio-omap.c        |  9 +++++++--
 drivers/gpio/gpio-sx150x.c      |  1 -
 drivers/gpio/gpiolib.c          | 21 ++++++++++++++-------
 8 files changed, 71 insertions(+), 30 deletions(-)
