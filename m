From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] last GPIO changes for v4.12
Date: Fri, 23 Jun 2017 14:06:40 +0200
Message-ID: <CACRpkdZVMDAE0mwTZNiuSdbjiiRY2rrwgFO8K-gFLXKr7mAGeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:35611 "EHLO
        mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751230AbdFWMGl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jun 2017 08:06:41 -0400
Received: by mail-io0-f175.google.com with SMTP id h134so31585478iof.2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2017 05:06:41 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ralph Sennhauser <ralph.sennhauser@gmail.com>

Hi Linus,

here is a single patch that has been sitting around. Sorry for sending
it this late, but the MVEBU people really want to get their ABI right
before the v4.12 release.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 41f1830f5a7af77cf5c86359aba3cbd706687e52:

  Linux 4.12-rc6 (2017-06-19 22:19:37 +0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.12-3

for you to fetch changes up to 6c7515c61ffa0985c57abd8892c7928b52b9a306:

  gpio: mvebu: change compatible string for PWM support (2017-06-20
13:42:20 +0200)

----------------------------------------------------------------
A single GPIO patch fixing the compatible string for the
MVEBU PWM controller embedded in the GPIO controller before
we release v4.12. Hopefully.

----------------------------------------------------------------
Ralph Sennhauser (1):
      gpio: mvebu: change compatible string for PWM support

 Documentation/devicetree/bindings/gpio/gpio-mvebu.txt | 6 +++---
 drivers/gpio/gpio-mvebu.c                             | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)
