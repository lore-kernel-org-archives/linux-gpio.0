From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for the v4.0 series
Date: Thu, 19 Mar 2015 09:55:14 +0100
Message-ID: <CACRpkdbxX0EYXO6y53wG248DssV-wAXLGkNHoZqKOgz-_AFk0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:34312 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752053AbbCSIzO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2015 04:55:14 -0400
Received: by oier21 with SMTP id r21so59424447oie.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2015 01:55:14 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

here is a slew of pin control fixes I've accumulated for the
v4.0 kernel. Nothing special, just driver fixes (mainly embedded
Intel it seems) and a misunderstanding regarding the stub
functions was reverted.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit c517d838eb7d07bbe9507871fab3931deccff539:

  Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.0-2

for you to fetch changes up to ef6d24cc7f5b2b5c4184eddb039e2add6231a122:

  pinctrl: sun4i: GPIOs configured as irq must be set to input before
reading (2015-03-18 10:56:46 +0100)

----------------------------------------------------------------
A set of pin control fixes for the v4.0 release cycle:

- Fix up consumer return values on pin control stubs.
- Four patches fixing up the interrupt handling and
  sleep context save in the Baytrail driver.
- Make default output directions work properly in the
  Cherryview driver.
- Fix interrupt locking in the AT91 driver.
- Fix setting interrupt generating lines as input in
  the sunxi driver.

----------------------------------------------------------------
Boris Brezillon (1):
      pinctrl: at91: move lock/unlock_as_irq calls into request/release

Hans de Goede (1):
      pinctrl: sun4i: GPIOs configured as irq must be set to input
before reading

Linus Walleij (1):
      Revert "pinctrl: consumer: use correct retval for placeholder functions"

Mika Westerberg (4):
      pinctrl: baytrail: Relax GPIO request rules
      pinctrl: baytrail: Clear interrupt triggering from pins that are
in GPIO mode
      pinctrl: baytrail: Rework interrupt handling
      pinctrl: baytrail: Save pin context over system sleep

qipeng.zha (1):
      pinctrl: update direction_output function of cherryview driver

 drivers/pinctrl/intel/pinctrl-baytrail.c   | 254 +++++++++++++++++++++--------
 drivers/pinctrl/intel/pinctrl-cherryview.c |   1 +
 drivers/pinctrl/pinctrl-at91.c             |  17 +-
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c  |   1 +
 drivers/pinctrl/sunxi/pinctrl-sunxi.c      |  14 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h      |   4 +
 include/linux/pinctrl/consumer.h           |   6 +-
 7 files changed, 216 insertions(+), 81 deletions(-)
