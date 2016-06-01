From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.7, take one
Date: Wed, 1 Jun 2016 09:32:19 +0200
Message-ID: <CACRpkdaiWCewzsQvZAGeHaBUZi4sKxkLGefyXCAc-O5=80cf0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:35445 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757243AbcFAHcU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2016 03:32:20 -0400
Received: by mail-oi0-f44.google.com with SMTP id w184so14861621oiw.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jun 2016 00:32:20 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

here are three pin control fixes for v4.7. Not much, and just driver
fixes.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.7-2

for you to fetch changes up to 5edf673d07fdcb6498be24914f3f38f8d8843199:

  pinctrl: mediatek: fix dual-edge code defect (2016-05-31 10:13:45 +0200)

----------------------------------------------------------------
Pin control fixes for v4.7:
- Add device tree matches to MAINTAINERS
- Inversion bug in the Nomadik driver
- Dual edge handling bug in the mediatek driver

----------------------------------------------------------------
Geert Uytterhoeven (1):
      MAINTAINERS: Add file patterns for pinctrl device tree bindings

Linus Walleij (1):
      pinctrl: nomadik: fix inversion of gpio direction

hongkun.cao (1):
      pinctrl: mediatek: fix dual-edge code defect

 MAINTAINERS                                   | 1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 5 +++--
 drivers/pinctrl/nomadik/pinctrl-nomadik.c     | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)
