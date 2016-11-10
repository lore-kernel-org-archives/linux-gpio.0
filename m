From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.9
Date: Thu, 10 Nov 2016 09:58:24 +0100
Message-ID: <CACRpkdY43rPkqmgxoKydDzZOt30_YNxN7S__5a+xPo+UunwPyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f170.google.com ([209.85.220.170]:34730 "EHLO
        mail-qk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752528AbcKJI6Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2016 03:58:25 -0500
Received: by mail-qk0-f170.google.com with SMTP id q130so287959566qke.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2016 00:58:25 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Patrice CHOTARD <patrice.chotard@st.com>, Andrew Jeffery <andrew@aj.id.au>, Ray Jui <ray.jui@broadcom.com>, Stefan Agner <stefan@agner.ch>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

here is a set of pin control fixes for the v4.9 cycle.

All is about drivers, no core business going on.

Details are in the signed tag.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit a909d3e636995ba7c349e2ca5dbb528154d4ac30:

  Linux 4.9-rc3 (2016-10-29 13:52:02 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.9-3

for you to fetch changes up to a33547cc764ca994d27a8fcc5fc61fbf4b2f7361:

  pinctrl-aspeed-g5: Never set SCU90[6] (2016-11-07 10:31:33 +0100)

----------------------------------------------------------------
Pin control fixes for the v4.9 cycle:

- Fix a host of runtime problems with the Intel
  Cherryview driver: suspend/resume needs to be
  marshalled properly, and strange effects from BIOS
  interaction during suspend/resume need to be
  dealt with.

- A single bit was being set wrong in the Aspeed
  driver.

- Fix an iProc probe ordering fallout resulting from
  v4.9 refactorings for bus population.

- Do not specify a default trigger in the ST Micro
  cascaded GPIO IRQ controller: the kernel will moan.

- Make IRQs optional altogether on the STM32 driver,
  it turns out not all systems have them or want them.

- Fix a re-probe bug in the i.MX driver, it will
  eventually crash if probed repeatedly, not good.

----------------------------------------------------------------
Alexandre TORGUE (2):
      pinctrl: stm32: remove dependency with interrupt controller
      pinctrl: stm32: move gpio irqs binding to optional

Andrew Jeffery (1):
      pinctrl-aspeed-g5: Never set SCU90[6]

Mika Westerberg (2):
      pinctrl: cherryview: Serialize register access in suspend/resume
      pinctrl: cherryview: Prevent possible interrupt storm on resume

Patrice Chotard (1):
      pinctrl: st: don't specify default interrupt trigger

Ray Jui (1):
      pinctrl: iproc: Fix iProc and NSP GPIO support

Stefan Agner (1):
      pinctrl: imx: reset group index on probe

 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.txt    | 10 +++++-----
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c              |  2 +-
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c                |  2 +-
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c                  |  2 +-
 drivers/pinctrl/freescale/pinctrl-imx.c                 |  1 +
 drivers/pinctrl/intel/pinctrl-cherryview.c              | 17 ++++++++++++++---
 drivers/pinctrl/pinctrl-st.c                            |  2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c                   |  8 +++++---
 8 files changed, 29 insertions(+), 15 deletions(-)
