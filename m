From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for the v4.2 series, take one
Date: Tue, 21 Jul 2015 20:36:04 +0200
Message-ID: <CACRpkdafhMgGtR5OS=6TMXnnsBht9AQefMAHWUfvcuXf_ymmiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:34736 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933356AbbGUSgG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2015 14:36:06 -0400
Received: by obre1 with SMTP id e1so121136234obr.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2015 11:36:05 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>

Hi Linus,

here are some overly ripe pin control fixes for the v4.2 series.
They got delayed because of various crap commits and having
to clean and rinse the patch stack a few times. Now they are
however looking good.

Please pull this in, details in the signed tag.

Yours,
Linus Walleij

The following changes since commit bc0195aad0daa2ad5b0d76cce22b167bc343=
5590:

  Linux 4.2-rc2 (2015-07-12 15:10:30 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.gi=
t
tags/pinctrl-v4.2-2

for you to fetch changes up to 681ccdcc756f17f847beba5ac4cd3d03e0949489=
:

  pinctrl: lpc18xx: fix schmitt trigger setup (2015-07-20 11:01:53 +020=
0)

----------------------------------------------------------------
Pin control fixes for the v4.2 series:
- Some dead defines dropped from the Samsung driver, was
  targeted for -rc2 but got delayed
- Drop the strict mode from abx500, this was too strict
- Fix the R-Car sparse IRQs code to work as intended
- Fix the IRQ code for the pinctrl-single GPIO backend to not
  enforce threaded IRQs
- Clear the latched events/IRQs for the Broadcom BCM2835
  driver
- Fix up debugfs for the Freescale imx1 driver
- Fix a typo bug in the Schmitt Trigger setup in the LPC18xx
  driver

----------------------------------------------------------------
Grygorii Strashko (1):
      pinctrl: single: ensure pcs irq will not be forced threaded

Joachim Eastwood (1):
      pinctrl: lpc18xx: fix schmitt trigger setup

Jonathan Bell (1):
      pinctrl: bcm2835: Clear the event latch register when disabling i=
nterrupts

Krzysztof Kozlowski (1):
      pinctrl: samsung: Remove old unused defines

Linus Walleij (1):
      pinctrl: abx500: remove strict mode

Sergei Shtylyov (1):
      sh-pfc: fix sparse GPIOs for R-Car SoCs

Uwe Kleine-K=C3=B6nig (1):
      Subject: pinctrl: imx1-core: Fix debug output in .pin_config_set =
callback

 drivers/pinctrl/bcm/pinctrl-bcm2835.c         | 2 ++
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 3 +--
 drivers/pinctrl/nomadik/pinctrl-abx500.c      | 1 -
 drivers/pinctrl/pinctrl-lpc18xx.c             | 4 ++--
 drivers/pinctrl/pinctrl-single.c              | 3 ++-
 drivers/pinctrl/samsung/pinctrl-samsung.c     | 5 -----
 drivers/pinctrl/sh-pfc/sh_pfc.h               | 2 +-
 7 files changed, 8 insertions(+), 12 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
