From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] gpiolib: fix filtering out unwanted events
Date: Fri, 23 Jun 2017 13:45:15 +0200
Message-ID: <1498218316-27860-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f173.google.com ([209.85.128.173]:35942 "EHLO
        mail-wr0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751182AbdFWLpW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jun 2017 07:45:22 -0400
Received: by mail-wr0-f173.google.com with SMTP id c11so62153265wrc.3
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2017 04:45:21 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

Hi Linux,

I've just fixed an issue in libgpiod which accidentally also led to
filtering out unwanted events in user space instead of gpiolib kernel
code. I then noticed that programs don't behave correctly and tracked
it down to an issue in gpiolib.c.

Please take a look at the fix. The bug has been there for some time and
it's quite late in the release cycle, but I believe it should still go
in v4.12 since currently the character device interface doesn't do what
it promises to.

Bartosz Golaszewski (1):
  gpiolib: fix filtering out unwanted events

 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.9.3

