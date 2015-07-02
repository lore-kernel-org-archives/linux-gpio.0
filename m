From: Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: [PATCH] gpio-pca953x: Support NXP PCAL9555A with Agile I/O
Date: Thu,  2 Jul 2015 19:33:45 +0200
Message-ID: <1435858426-19623-1-git-send-email-clemens.gruber@pqgruber.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.pqgruber.com ([178.189.19.235]:44760 "EHLO
	mail.pqgruber.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753124AbbGBRmR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jul 2015 13:42:17 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Clemens Gruber <clemens.gruber@pqgruber.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

Hi,

the following patch adds support for the NXP PCAL9555A and its extra
feature set called Agile I/O. 

The PCAL9535A, the PCAL9539A and the PCAL6416A also use the same registers
and should (in theory) work too, but I could only test on the PCAL9555A.
But if somebody has one or more of those other chips, please tell me if the
patch does work for them too. Then we could add them to the device ids and
docs later.

Cheers,
Clemens

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>

Clemens Gruber (1):
  gpio-pca953x: Support NXP PCAL9555A with Agile I/O

 .../devicetree/bindings/gpio/gpio-pca953x.txt      | 24 +++++++-
 drivers/gpio/gpio-pca953x.c                        | 69 ++++++++++++++++++
 2 files changed, 92 insertions(+), 1 deletion(-)

-- 
2.4.5

