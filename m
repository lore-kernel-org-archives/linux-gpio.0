From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fixes for v4.12
Date: Sun, 11 Jun 2017 17:21:29 +0200
Message-ID: <CACRpkdZ8YaUXYc9Xwb3ZbR_ZuAGHtvqGqkiEvGdA9JwOOcjhfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:33401 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751764AbdFKPVa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Jun 2017 11:21:30 -0400
Received: by mail-io0-f174.google.com with SMTP id t87so27256300ioe.0
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jun 2017 08:21:30 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

these sat around a bit too long. Sorry for that.

Descriptions in the signed tag.

A maintainer dropped out, how typical. Candidates welcome. Pushing
the usual suspects to volunteer. As easy as in real life.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 08332893e37af6ae779367e78e444f8f9571511d:

  Linux 4.12-rc2 (2017-05-21 19:30:23 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.12-2

for you to fetch changes up to fc7a90686777e7d2da7a08cf0202c21f3b96febb:

  gpio: mvebu: fix gpio bank registration when pwm is used (2017-06-09
09:38:27 +0200)

----------------------------------------------------------------
A few overdue GPIO patches for the v4.12 kernel:

- Fix debounce logic on the Aspeed platform.

- Fix the "virtual gpio" things on the Intel Crystal Cove.

- Fix the blink counter selection on the MVEBU platform.

----------------------------------------------------------------
Alexandre Courbot (1):
      MAINTAINERS: remove self from GPIO maintainers

Hans de Goede (1):
      gpio: crystalcove: Do not write regular gpio registers for virtual GPIOs

Joel Stanley (1):
      gpio: aspeed: Don't attempt to debounce if disabled

Richard Genoud (2):
      gpio: mvebu: fix blink counter register selection
      gpio: mvebu: fix gpio bank registration when pwm is used

 MAINTAINERS                     |  1 -
 drivers/gpio/gpio-aspeed.c      |  3 +++
 drivers/gpio/gpio-crystalcove.c | 54 +++++++++++++++++++++++++++--------------
 drivers/gpio/gpio-mvebu.c       |  9 ++++++-
 4 files changed, 47 insertions(+), 20 deletions(-)
