From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH 0/1] gpio: mcp23s08: Add support for mcp23s18
Date: Tue,  1 Mar 2016 14:25:40 +0800
Message-ID: <1456813541-74321-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 203-59-230-133.perm.iinet.net.au ([203.59.230.133]:64002 "EHLO
	preid-centos7.electromag.com.au" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750803AbcCAGf1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Mar 2016 01:35:27 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Phil Reid <preid@electromag.com.au>

Add support for mcp23s18, and fixup documentation.

Phil Reid (1):
  gpio: mcp23s08: Add support for mcp23s18.

 .../devicetree/bindings/gpio/gpio-mcp23s08.txt        |  4 +---
 drivers/gpio/gpio-mcp23s08.c                          | 19 +++++++++++++++----
 2 files changed, 16 insertions(+), 7 deletions(-)

-- 
1.8.3.1

