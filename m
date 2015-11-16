From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Subject: [PATCH V2 0/2] Fix bugs in the insertion of gpiochip.
Date: Mon, 16 Nov 2015 13:02:45 +0800
Message-ID: <1447650167-29070-1-git-send-email-bamvor.zhangjian@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:34681 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750712AbbKPFC6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2015 00:02:58 -0500
Received: by padhx2 with SMTP id hx2so162555148pad.1
        for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2015 21:02:58 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, broonie@kernel.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

The first version of these patches could be found [1].

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

Changes since v1
1.  Update comment and print according to suggestion given by Linus.
2.  Delete the dedicated checking for base overlap. The other logic
    in the patch 1/2 already cover it.

[1] http://www.spinics.net/lists/linux-gpio/msg09594.html
[2] https://github.com/bjzhang/linux/tree/gpio-fix-and-mockup-driver

Bamvor Jian Zhang (2):
  gpiolib: improve overlap check of range of gpio
  gpiolib: do not allow to insert an empty gpiochip

 drivers/gpio/gpiolib.c | 64 +++++++++++++++++++++++++++++++++++---------------
 1 file changed, 45 insertions(+), 19 deletions(-)

-- 
2.1.4

