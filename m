From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.9 nocheinmal
Date: Fri, 18 Nov 2016 09:44:20 +0100
Message-ID: <CACRpkdbWum3Xn82ucCtwHJ5iHTNg5FsEJNqXbpHdmfnjV6viXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f182.google.com ([209.85.220.182]:35211 "EHLO
        mail-qk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751574AbcKRIoV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2016 03:44:21 -0500
Received: by mail-qk0-f182.google.com with SMTP id n204so254613045qke.2
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2016 00:44:21 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Keno Fischer <keno@juliacomputing.com>, Phil Reid <preid@electromag.com.au>

Hi Linus,

these are hopefully the last GPIO fixes for v4.9. The most important
is that it fixes the UML randconfig builds that have been nagging me
for some time and me being confused about where the problem was
really sitting, now this fix give this nice feeling that everything is
solid and builds fine.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit bc33b0ca11e3df467777a4fa7639ba488c9d4911:

  Linux 4.9-rc4 (2016-11-05 16:23:36 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.9-4

for you to fetch changes up to f9c22ec6c1c511285dc539b83aabdabdb6baf245:

  gpio: Remove GPIO_DEVRES option (2016-11-16 20:46:32 +0100)

----------------------------------------------------------------
GPIO fixes for the v4.9 series:

- Finally, after being puzzled by a bunch of recurrent UML
  build failures on randconfigs from the build robot, Keno
  Fischer nailed it: GPIO_DEVRES is optional and depends on
  HAS_IOMEM even though many users just unconditionally rely
  on it to be available. And it *should* be available:
  garbage collection is nice for this and it *certainly* has
  nothing to do with having IOMEM. So we got rid of it, and
  now the UML builds should JustWork(TM).

- Do not call .get_direction() on sleeping GPIO chips on the
  fastpath when locking GPIOs for interrupts: it is done
  from atomic context, no way.

- Some driver fixes.

----------------------------------------------------------------
Keno Fischer (1):
      gpio: Remove GPIO_DEVRES option

Linus Walleij (2):
      gpio: do not double-check direction on sleeping chips
      gpio: tc3589x: fix up .get_direction()

Phil Reid (2):
      gpio: pca953x: Fix corruption of other gpios in set_multiple.
      gpio: pca953x: Move memcpy into mutex lock for set multiple

 drivers/gpio/Kconfig        | 4 ----
 drivers/gpio/Makefile       | 2 +-
 drivers/gpio/gpio-pca953x.c | 4 ++--
 drivers/gpio/gpio-tc3589x.c | 2 +-
 drivers/gpio/gpiolib.c      | 7 +++++--
 5 files changed, 9 insertions(+), 10 deletions(-)
