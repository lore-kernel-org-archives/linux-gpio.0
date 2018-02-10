From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/2] GPIO-Timberdale: Adjustments for timbgpio_probe()
Date: Sat, 10 Feb 2018 21:31:24 +0100
Message-ID: <da77f86c-a366-0a0f-10fd-9b7cfd879391@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:47715 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751182AbeBJUba (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 10 Feb 2018 15:31:30 -0500
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Feb 2018 21:28:29 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Improve a size determination

 drivers/gpio/gpio-timberdale.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.16.1

