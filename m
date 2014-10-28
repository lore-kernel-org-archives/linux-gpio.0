From: Varka Bhadram <varkabhadram@gmail.com>
Subject: [PATCH gpio v2 0/3] cleanup on resource check
Date: Tue, 28 Oct 2014 12:07:04 +0530
Message-ID: <1414478227-24674-1-git-send-email-varkab@cdac.in>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:33455 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757344AbaJ1GkK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Oct 2014 02:40:10 -0400
Received: by mail-pa0-f54.google.com with SMTP id rd3so21496pab.41
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2014 23:40:09 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: gnurou@gmail.com, linus.walleij@linaro.org, Varka Bhadram <varkab@cdac.in>

This series removes the duplication of sanity check for
platform_get_resource() return resource. It will be checked 
with devm_ioremap_resource()

Series based on devel branch of [1].

[1]: https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-gpio.git

Varka Bhadram (3):
  gpio: gpio-davinci: remove duplicate check on resource
  gpio: gpio-stp-xway: remove duplicate check on resource
  gpio: gpio-tb10x: remove duplicate check on resource

 drivers/gpio/gpio-davinci.c  |    5 -----
 drivers/gpio/gpio-stp-xway.c |    8 ++------
 drivers/gpio/gpio-tb10x.c    |    7 +------
 3 files changed, 3 insertions(+), 17 deletions(-)

-- 
1.7.9.5

