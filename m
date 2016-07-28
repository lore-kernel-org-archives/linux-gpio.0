From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH 0/1] gpio: pca954x: Add optional regulator enable.
Date: Thu, 28 Jul 2016 16:13:40 +0800
Message-ID: <1469693621-17851-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 203-59-230-133.perm.iinet.net.au ([203.59.230.133]:64680 "EHLO
	preid-centos7.electromag.com.au" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751840AbcG1INw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 28 Jul 2016 04:13:52 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org
Cc: Phil Reid <preid@electromag.com.au>

I have a system where the gpio device is attached to a gpio controlled
regulator. If not enabled prior to device probe it fails to load the
driver. Marking the regulator as always on does not always work as the
probe order changes and it's suspectible to race conditions.

I'm not aware of another way around this problem.

Phil Reid (1):
  gpio: pca954x: Add optional regulator enable.

 drivers/gpio/gpio-pca953x.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

-- 
1.8.3.1

