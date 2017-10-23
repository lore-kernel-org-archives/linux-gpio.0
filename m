From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.14
Date: Mon, 23 Oct 2017 15:40:04 +0200
Message-ID: <CACRpkdYw72PGvLVLv+SPcs8hZq55OMvZu9RfZK-D3wrN0ZNhFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:45292 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932093AbdJWNkF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Oct 2017 09:40:05 -0400
Received: by mail-it0-f67.google.com with SMTP id n195so5935133itg.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Oct 2017 06:40:05 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Daniel Drake <drake@endlessm.com>, Dmitry Mastykin <mastichi@gmail.com>

Hi Linus,

two last minute fixes for pin controllers, both regressions
in specific drivers.

Nothing special about this, please pull them in!

Yours,
Linus Walleij

The following changes since commit 33d930e59a98fa10a0db9f56c7fa2f21a4aef9b9:

  Linux 4.14-rc5 (2017-10-15 21:01:12 -0400)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.14-4

for you to fetch changes up to 59861701076b0cfac0b5eaa67a380fff6ab85b9e:

  pinctrl: mcp23s08: fix interrupt handling regression (2017-10-19
10:20:03 +0200)

----------------------------------------------------------------
Pin control fixes for v4.14:

- Fix a touchpad pin control issue on the AMD affecting Asus
  laptops.
- Fix an interrupt handling regression on the MCP23s08.

----------------------------------------------------------------
Daniel Drake (1):
      pinctrl/amd: fix masking of GPIO interrupts

Dmitry Mastykin (1):
      pinctrl: mcp23s08: fix interrupt handling regression

 drivers/pinctrl/pinctrl-amd.c      | 10 +++++++++-
 drivers/pinctrl/pinctrl-mcp23s08.c |  6 +++---
 2 files changed, 12 insertions(+), 4 deletions(-)
