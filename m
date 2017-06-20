From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.12, take three
Date: Tue, 20 Jun 2017 13:51:23 +0200
Message-ID: <CACRpkdY-vFyd1F8SysCdpTRAr0bf63H1m6JBikfzv454dYyi5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:34890 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750985AbdFTLvZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2017 07:51:25 -0400
Received: by mail-it0-f48.google.com with SMTP id m62so12626496itc.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2017 04:51:25 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

some late arriving fixes. I should have sent earlier, just swamped
with work as usual. Thomas patch makes AMD systems usable
despite driver bugs so it is fairly important.

Please pull in these two patches!

Yours,
Linus Walleij

The following changes since commit 3c2993b8c6143d8a5793746a54eba8f86f95240f:

  Linux 4.12-rc4 (2017-06-04 16:47:43 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.12-3

for you to fetch changes up to b7c747d4627462f25b3daabf49c18895a6722faa:

  pinctrl: stm32: Fix bad function call (2017-06-09 10:51:54 +0200)

----------------------------------------------------------------
Pin control fixes for v4.12, take three:

- Make the AMD driver use a regular interrupt rather than a chained one,
  so the system does not lock up.

- Fix a function call error deep inside the STM32 driver.

----------------------------------------------------------------
Alexandre TORGUE (1):
      pinctrl: stm32: Fix bad function call

Thomas Gleixner (1):
      pinctrl/amd: Use regular interrupt instead of chained

 drivers/pinctrl/pinctrl-amd.c         | 91 ++++++++++++++++-------------------
 drivers/pinctrl/stm32/pinctrl-stm32.c |  2 +-
 2 files changed, 42 insertions(+), 51 deletions(-)
