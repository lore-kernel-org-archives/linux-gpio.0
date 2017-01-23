From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for the v4.10 series
Date: Mon, 23 Jan 2017 09:42:58 +0100
Message-ID: <CACRpkdbbnnO3+SYSjzekyp0uCa3Nhggohs_CT5362Vn2xQcZow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ot0-f176.google.com ([74.125.82.176]:33637 "EHLO
        mail-ot0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750883AbdAWInA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Jan 2017 03:43:00 -0500
Received: by mail-ot0-f176.google.com with SMTP id 73so97645263otj.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2017 00:43:00 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

a single lockdep fix, nothing else going on. This makes lockdep noiseless
and work properly with threaded GPIO IRQchips.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 49def1853334396f948dcb4cedb9347abb318df5:

  Linux 4.10-rc4 (2017-01-15 16:21:59 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.10-3

for you to fetch changes up to 739e6f5945d88dcee01590913f6886132a10c215:

  gpio: provide lockdep keys for nested/unnested irqchips (2017-01-19
09:57:20 +0100)

----------------------------------------------------------------
GPIO fixes for v4.10:

- Fix a lockdep issue: the threaded irqchips also need their unique
  key, and take this opportunity to get rid of the horrible macro and
  replace it with a static inline.

----------------------------------------------------------------
Linus Walleij (1):
      gpio: provide lockdep keys for nested/unnested irqchips

 drivers/gpio/gpiolib.c      | 18 ++++++------
 include/linux/gpio/driver.h | 70 ++++++++++++++++++++++++++++++++-------------
 2 files changed, 59 insertions(+), 29 deletions(-)
