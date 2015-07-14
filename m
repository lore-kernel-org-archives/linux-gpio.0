From: Joachim Eastwood <manabian@gmail.com>
Subject: [PATCH 0/2] LPC18xx pintrl patches
Date: Wed, 15 Jul 2015 00:25:25 +0200
Message-ID: <1436912727-11559-1-git-send-email-manabian@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f68.google.com ([209.85.215.68]:34910 "EHLO
	mail-la0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751563AbbGNWZm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2015 18:25:42 -0400
Received: by laem6 with SMTP id m6so1013926lae.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2015 15:25:40 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Joachim Eastwood <manabian@gmail.com>, linux-gpio@vger.kernel.org

Hej Linus,

This small patch set contains one new feature and one fix. While
implementing pinconf for USB1 I noticed a typo in a variable name
that meant that schmitt trigger was always begin enabled when
setting up pins. It would be nice if this fix (1st patch) to go
into 4.2 if possible.

The 2nd 'USB1 pinconf' patch is 4.3 material.

Both patches are based on 4.2-rc1. Note that the patches doesn't
touch any of the same code so they can be applied in any order.

At this point I don't except any more changes to pinctrl-lpc18xx
this time around.

Joachim Eastwood (2):
  pinctrl: lpc18xx: fix schmitt trigger setup
  pinctrl: lpc18xx: add support for usb1 pinconf

 drivers/pinctrl/pinctrl-lpc18xx.c | 58 +++++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 6 deletions(-)

-- 
1.8.0

