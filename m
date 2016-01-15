From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH 0/1] gpio: gpio-altera: Remove gpiochip on probe failure.
Date: Fri, 15 Jan 2016 11:32:21 +0800
Message-ID: <1452828742-57299-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 203-59-230-133.perm.iinet.net.au ([203.59.230.133]:40572 "EHLO
	preid-centos7.electromag.com.au" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753326AbcAODjw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 14 Jan 2016 22:39:52 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: thloh@altera.com, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org
Cc: Phil Reid <preid@electromag.com.au>

Kernel fault occured because dt entry altr,interrupt-type was not defined.

Phil Reid (1):
  gpio: gpio-altera: Remove gpiochip on probe failure.

 drivers/gpio/gpio-altera.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
1.8.3.1

