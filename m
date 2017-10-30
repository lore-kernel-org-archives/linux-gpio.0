From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/3] pinctrl-mcp23s08: Fine-tuning for two function
 implementations
Date: Mon, 30 Oct 2017 16:45:31 +0100
Message-ID: <ca1c3c19-7e8c-90f0-493c-b6fae04e6a03@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:65114 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752005AbdJ3Ppf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 30 Oct 2017 11:45:35 -0400
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 30 Oct 2017 16:40:20 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Improve unlocking of a mutex in mcp23s08_irq()
  Use common error handling code in mcp23s08_dbg_show()
  Combine two function calls in mcp23s08_dbg_show()

 drivers/pinctrl/pinctrl-mcp23s08.c | 80 ++++++++++++++++++--------------------
 1 file changed, 37 insertions(+), 43 deletions(-)

-- 
2.14.3

