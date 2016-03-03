From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] late GPIO fix for v4.5
Date: Thu, 3 Mar 2016 21:06:13 +0700
Message-ID: <CACRpkdbCv2HOtmLxsxs93DsksOZ62nF44C3RBLxGvn8a3bJVow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:36274 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751658AbcCCOGO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Mar 2016 09:06:14 -0500
Received: by mail-oi0-f43.google.com with SMTP id r187so15514334oih.3
        for <linux-gpio@vger.kernel.org>; Thu, 03 Mar 2016 06:06:13 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>

Hi Linus,

regressions never arrive when you want them to, so here is a late
fix for the Renesas RCAR GPIO driver. It only affects that driver on
the very specific Renesas platforms.

Please pull it in.

Yours,
Linus Walleij

The following changes since commit 81f70ba233d5f660e1ea5fe23260ee323af5d53a:

  Linux 4.5-rc5 (2016-02-20 13:39:35 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.5-3

for you to fetch changes up to b26a719bdba9aa926ceaadecc66e07623d2b8a53:

  gpio: rcar: Add Runtime PM handling for interrupts (2016-02-25 15:46:27 +0100)

----------------------------------------------------------------
Late GPIO fix:
- Fix a runtime PM suspend/resume bug in the RCAR driver

----------------------------------------------------------------
Geert Uytterhoeven (1):
      gpio: rcar: Add Runtime PM handling for interrupts

 drivers/gpio/gpio-rcar.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
