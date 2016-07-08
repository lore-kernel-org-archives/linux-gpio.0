From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] final GPIO fixes for v4.7
Date: Fri, 8 Jul 2016 13:35:35 +0200
Message-ID: <CACRpkdbBZ+2jpu-Ao=D8AmaqDKxXvX3uWh2Q03sXEPnF2G+BUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:33060 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754073AbcGHLfg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2016 07:35:36 -0400
Received: by mail-oi0-f53.google.com with SMTP id u201so57941929oie.0
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jul 2016 04:35:36 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Colin Pitrat <colin.pitrat@gmail.com>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

I don't like to toss in last minute patches, but these are all for
things that are broken, and have bitten people for real. Two of
them go into stable. Maybe all of them if the compile test problem
is a pain in the ass also for stable folks.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit a99cde438de0c4c0cecc1d1af1a55a75b10bfdef:

  Linux 4.7-rc6 (2016-07-03 23:01:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.7-5

for you to fetch changes up to 92c74bceb0dd4b74a6c0b56c2f9a5c93a0860808:

  Revert "gpio: gpiolib-of: Allow compile testing" (2016-07-05 19:03:04 +0200)

----------------------------------------------------------------
Final (hopefully) GPIO fixes for v4.7:
- Fix an oops on the Asus Eee PC 1201
- Revert a patch trying to split GPIO parsing and GPIO configuration
- Revert a too liberal compile testing thing

----------------------------------------------------------------
Colin Pitrat (1):
      gpio: sch: Fix Oops on module load on Asus Eee PC 1201

Johan Hovold (1):
      Revert "gpiolib: Split GPIO flags parsing and GPIO configuration"

Linus Walleij (1):
      Revert "gpio: gpiolib-of: Allow compile testing"

 drivers/gpio/Kconfig          |  2 +-
 drivers/gpio/gpio-sch.c       | 21 +++++++++--------
 drivers/gpio/gpiolib-legacy.c |  8 +++----
 drivers/gpio/gpiolib.c        | 52 +++++++++++++------------------------------
 4 files changed, 31 insertions(+), 52 deletions(-)
