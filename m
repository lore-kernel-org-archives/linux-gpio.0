From: Varka Bhadram <varkabhadram@gmail.com>
Subject: [PATCH gpio 0/4] cleanup for gpio drivers
Date: Tue, 31 Mar 2015 09:49:07 +0530
Message-ID: <1427775551-6908-1-git-send-email-varkab@cdac.in>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:33840 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750706AbbCaETk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2015 00:19:40 -0400
Received: by pactp5 with SMTP id tp5so7165768pac.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2015 21:19:39 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, gnurou@gmail.com, Varka Bhadram <varkab@cdac.in>

Varka Bhadram (4):
  drivers: gpio: use devm_kzalloc
  gpio-max7300: remove 'ret' variable
  gpio-arizona: drop owner assignment from platform_drivers
  drivers: gpio: use (!foo) instead of (foo == NULL)

 drivers/gpio/gpio-adp5588.c  |    7 +++----
 drivers/gpio/gpio-arizona.c  |    3 +--
 drivers/gpio/gpio-da9052.c   |    2 +-
 drivers/gpio/gpio-da9055.c   |    2 +-
 drivers/gpio/gpio-kempld.c   |    2 +-
 drivers/gpio/gpio-max7300.c  |    4 +---
 drivers/gpio/gpio-mc33880.c  |    2 +-
 drivers/gpio/gpio-mcp23s08.c |    7 ++++---
 8 files changed, 13 insertions(+), 16 deletions(-)

-- 
1.7.9.5

