From: Alban Bedel <albeu@free.fr>
Subject: [PATCH 5/5] gpio: ath79: Update the copyright notice
Date: Thu, 28 Jan 2016 20:44:33 +0100
Message-ID: <1454010273-21513-5-git-send-email-albeu@free.fr>
References: <1454010273-21513-1-git-send-email-albeu@free.fr>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp2-g21.free.fr ([212.27.42.2]:63661 "EHLO smtp2-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S966434AbcA1TpV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 28 Jan 2016 14:45:21 -0500
In-Reply-To: <1454010273-21513-1-git-send-email-albeu@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Antony Pavlov <antonynpavlov@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, linux-kernel@vger.kernel.org, Alban Bedel <albeu@free.fr>

Add myself to the copyright list and remove the reference to Atheros'
BSP as nothing is left of this code.

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 drivers/gpio/gpio-ath79.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 0d94c0b..018ea9d 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -1,12 +1,11 @@
 /*
  *  Atheros AR71XX/AR724X/AR913X GPIO API support
  *
+ *  Copyright (C) 2015 Alban Bedel <albeu@free.fr>
  *  Copyright (C) 2010-2011 Jaiganesh Narayanan <jnarayanan@atheros.com>
  *  Copyright (C) 2008-2011 Gabor Juhos <juhosg@openwrt.org>
  *  Copyright (C) 2008 Imre Kaloz <kaloz@openwrt.org>
  *
- *  Parts of this file are based on Atheros' 2.6.15/2.6.31 BSP
- *
  *  This program is free software; you can redistribute it and/or modify it
  *  under the terms of the GNU General Public License version 2 as published
  *  by the Free Software Foundation.
-- 
2.0.0

