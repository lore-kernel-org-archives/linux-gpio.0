From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: Fix a documentation spelling mistake
Date: Sun, 21 Jan 2018 16:53:30 +0100
Message-ID: <20180121155330.5657-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35597 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750832AbeAUPzi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jan 2018 10:55:38 -0500
Received: by mail-lf0-f66.google.com with SMTP id a204so7629458lfa.2
        for <linux-gpio@vger.kernel.org>; Sun, 21 Jan 2018 07:55:37 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

Simple etraneous letter.

Reported-by: Alexander Stein <alexander.stein@systec-electronic.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/gpio/board.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpio/board.txt b/Documentation/gpio/board.txt
index b1d106167baa..659bb19f5b3c 100644
--- a/Documentation/gpio/board.txt
+++ b/Documentation/gpio/board.txt
@@ -125,7 +125,7 @@ where
   - flags is defined to specify the following properties:
 	* GPIO_ACTIVE_HIGH	- GPIO line is active high
 	* GPIO_ACTIVE_LOW	- GPIO line is active low
-	* GPIO_OPEN_DRAIN	- GPIO line ise set up as open drain
+	* GPIO_OPEN_DRAIN	- GPIO line is set up as open drain
 	* GPIO_OPEN_SOURCE	- GPIO line is set up as open source
 	* GPIO_PERSISTENT	- GPIO line is persistent during
 				  suspend/resume and maintains its value
-- 
2.14.3

