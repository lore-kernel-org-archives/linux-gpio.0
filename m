From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Subject: [PATCH 0/2] Fix bugs in the insertion of gpiochip.
Date: Sat, 14 Nov 2015 16:38:54 +0800
Message-ID: <1447490336-10209-1-git-send-email-bamvor.zhangjian@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:36719 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750814AbbKNIjK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Nov 2015 03:39:10 -0500
Received: by pacdm15 with SMTP id dm15so123309829pac.3
        for <linux-gpio@vger.kernel.org>; Sat, 14 Nov 2015 00:39:09 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, broonie@kernel.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

These patches try to fix following bugs which is found by my gpio
mockup driver and testscript[1](will send them later):
1.  Could not check the overlap if the new gpiochip is the secondly
    gpiochip.
2.  Could not check the overlap if the new gpiochip is overlap
    with the left of gpiochip.
3.  Allow overlap of base of different gpiochip.
4.  Allow to insert an empty gpiochip

The first patch fix the first three by rewriting the logic in the
gpiochip_add_to_list.

The second patch fix the fourth bug in gpiochip_add. I do not
found the checker in gpiolib.c. Hope it is not a redundant logic.

[1] https://github.com/bjzhang/linux/tree/gpio-fix-and-mockup-driver

Bamvor Jian Zhang (2):
  gpiolib: improve overlap check of range of gpio
  gpiolib: do not allow to insert an empty gpiochip

 drivers/gpio/gpiolib.c | 44 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 11 deletions(-)

-- 
2.1.4

