From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pinctrl fixes for v4.12 last one
Date: Sat, 1 Jul 2017 14:26:01 +0200
Message-ID: <CACRpkdb0pumOxSEydmOD1Do1eU3BCbf6q_v9sDgb2rfwJ_Nt+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:36764 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752010AbdGAM0D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Jul 2017 08:26:03 -0400
Received: by mail-io0-f172.google.com with SMTP id z62so36063722ioi.3
        for <linux-gpio@vger.kernel.org>; Sat, 01 Jul 2017 05:26:03 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Brian Norris <briannorris@chromium.org>

Hi Linus,

Brian noticed that this regression has not got a proper fix for the
entire merge window and consequently we need to revert the
offending commit.

It's part of the RT-mainstream work, the dance goes like this,
two steps forward, one step back.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit c0bc126f97fb929b3ae02c1c62322645d70eb408:

  Linux 4.12-rc7 (2017-06-25 18:30:05 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.12-4

for you to fetch changes up to 1d80df93d9d170eba8c3654719e5857307efd077:

  Revert "pinctrl: rockchip: avoid hardirq-unsafe functions in
irq_chip" (2017-06-29 15:03:24 +0200)

----------------------------------------------------------------
A last fix for v4.12, an IRQ problem reported early in the merge window
appears not to have been properly fixed, so the offending commit will be
reverted and we will find the proper fix for v4.13. Hopefully.

----------------------------------------------------------------
Brian Norris (1):
      Revert "pinctrl: rockchip: avoid hardirq-unsafe functions in irq_chip"

 drivers/pinctrl/pinctrl-rockchip.c | 44 ++++----------------------------------
 1 file changed, 4 insertions(+), 40 deletions(-)
