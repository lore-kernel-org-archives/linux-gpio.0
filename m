From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fix for v4.15
Date: Thu, 18 Jan 2018 08:49:29 +0100
Message-ID: <CACRpkda6AwD3JwP=wjtc8j1zrPip7W4G_tZzeg=yv1kMfubDCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:46673 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753888AbeARHta (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jan 2018 02:49:30 -0500
Received: by mail-it0-f67.google.com with SMTP id c16so12423627itc.5
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jan 2018 23:49:30 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, Clemens Gruber <clemens.gruber@pqgruber.com>

Hi Linus,

this is the (hopefully) last GPIO fix for v4.15.

Again the especially endowed screwer-upper who has
been open coding bit fiddling is yours truly.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit a8750ddca918032d6349adbf9a4b6555e7db20da:

  Linux 4.15-rc8 (2018-01-14 15:32:30 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.15-5

for you to fetch changes up to 07c7b6a52503ac13ae357a8b3ef3456590a64b65:

  gpio: mmio: Also read bits that are zero (2018-01-16 23:42:36 +0100)

----------------------------------------------------------------
GPIO fix for the v4.15 series, this fixes the bit fiddling in the
MMIO GPIO driver.

----------------------------------------------------------------
Linus Walleij (1):
      gpio: mmio: Also read bits that are zero

 drivers/gpio/gpio-mmio.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)
