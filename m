From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH v2 0/1] gpio: pca954x: Add vcc regulator and enable it
Date: Fri, 29 Jul 2016 11:39:54 +0800
Message-ID: <1469763595-38245-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 203-59-230-133.perm.iinet.net.au ([203.59.230.133]:57444 "EHLO
	preid-centos7.electromag.com.au" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750817AbcG2DkE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 28 Jul 2016 23:40:04 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org
Cc: Phil Reid <preid@electromag.com.au>

I have a system where the gpio device is attached to a gpio controlled
regulator. If not enabled prior to device probe it fails to load the
driver. Marking the regulator as always on does not always work as the
probe order changes and it's suspectible to race conditions.

I'm not aware of another way around this problem.

Changes from v1:
- Use devm_regulator_get instead of devm_regulator_get_optional.
  Core returns a dummy regultor that can be used if i doesn't exist.
  Simplify inital error handling.
- Add regulator_disable to probe error path.
- Add regulator_disable to remove.


Phil Reid (1):
  gpio: pca954x: Add vcc regulator and enable it

 drivers/gpio/gpio-pca953x.c | 41 ++++++++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 9 deletions(-)

-- 
1.8.3.1

