From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH 0/1] gpio: mcp23s08: Fix clearing of interrupt
Date: Tue, 15 Mar 2016 15:46:29 +0800
Message-ID: <1458027990-128142-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from [203.59.230.133] ([203.59.230.133]:40291 "EHLO
	preid-centos7.electromag.com.au" rhost-flags-FAIL-FAIL-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750873AbcCOHya (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Tue, 15 Mar 2016 03:54:30 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org
Cc: Phil Reid <preid@electromag.com.au>

I think I had some debug statements in the code when testing with
patch 'gpio: mcp23s08: Add support for mcp23s18' which was hiding 
the problem.


Phil Reid (1):
  gpio: mcp23s08: Fix clearing of interrupt.

 drivers/gpio/gpio-mcp23s08.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
1.8.3.1

