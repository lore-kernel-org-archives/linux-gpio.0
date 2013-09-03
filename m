From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] gpiolib: unlock on error in gpiod_set_debounce()
Date: Tue, 3 Sep 2013 15:15:00 +0300
Message-ID: <20130903121500.GA16312@elgon.mountain>
References: <5225c32f.kWadywtP9mkLJ38j%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:35357 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759989Ab3ICMPL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Sep 2013 08:15:11 -0400
Content-Disposition: inline
In-Reply-To: <5225c32f.kWadywtP9mkLJ38j%fengguang.wu@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, kbuild@01.org, Fengguang Wu <fengguang.wu@intel.com>

There is a missing unlock on error here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0eb9cba..3c01782 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1783,7 +1783,8 @@ static int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 	if (!chip->set || !chip->set_debounce) {
 		pr_warn("%s: missing set() or set_debounce() operations\n",
 			__func__);
-		return -EIO;
+		status = -EIO;
+		goto fail;
 	}
 
 	status = gpio_ensure_requested(desc);
