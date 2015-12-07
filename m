From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Subject: [PATCH v3 RESEND] gpio: arizona: Support Cirrus Logic CS47L24 and WM1831
Date: Mon, 7 Dec 2015 09:24:01 +0000
Message-ID: <1449480242-19380-1-git-send-email-rf@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:47899 "EHLO
	mx0a-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754404AbbLGJY0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2015 04:24:26 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, lee.jones@linaro.org
Cc: patches@opensource.wolfsonmicro.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

This patch seems to have got lost when all the other CS47L24 patches
were applied. I don't care whether it goes through the GPIO tree or
the MFD tree with the rest of the patches, but note that it has a build
dependency on the MFD patches for CS47L24.

Richard Fitzgerald (1):
  gpio: arizona: Support Cirrus Logic CS47L24 and WM1831

 drivers/gpio/gpio-arizona.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
1.9.1

