Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E975C001DF
	for <linux-gpio@archiver.kernel.org>; Wed,  2 Aug 2023 03:49:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbjHBDta (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 1 Aug 2023 23:49:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjHBDt2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2023 23:49:28 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A95CF1BF
        for <linux-gpio@vger.kernel.org>; Tue,  1 Aug 2023 20:49:27 -0700 (PDT)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RFyZ44wghztRVm;
        Wed,  2 Aug 2023 11:46:04 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 11:49:25 +0800
From:   Zhu Wang <wangzhu9@huawei.com>
To:     <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <andy@kernel.org>,
        <florian.fainelli@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        <linux-gpio@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <andriy.shevchenko@linux.intel.com>
CC:     <wangzhu9@huawei.com>
Subject: [PATCH -next v2] gpio: raspberrypi-exp: remove redundant of_match_ptr()
Date:   Wed, 2 Aug 2023 11:48:55 +0800
Message-ID: <20230802034855.151866-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver depends on CONFIG_OF, so it is not necessary to use
of_match_ptr() here, and __maybe_unused can also be removed.

Even for drivers that do not depend on CONFIG_OF, it's almost always
better to leave out the of_match_ptr(), since the only thing it can
possibly do is to save a few bytes of .text if a driver can be used both
with and without it.

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

---
Changes in v2:
- Change of_match_ptr to of_match_ptr() in the commit message.
---
 drivers/gpio/gpio-raspberrypi-exp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-raspberrypi-exp.c b/drivers/gpio/gpio-raspberrypi-exp.c
index ecb0d3800dfe..9d1b95e429f1 100644
--- a/drivers/gpio/gpio-raspberrypi-exp.c
+++ b/drivers/gpio/gpio-raspberrypi-exp.c
@@ -234,7 +234,7 @@ static int rpi_exp_gpio_probe(struct platform_device *pdev)
 	return devm_gpiochip_add_data(dev, &rpi_gpio->gc, rpi_gpio);
 }
 
-static const struct of_device_id rpi_exp_gpio_ids[] __maybe_unused = {
+static const struct of_device_id rpi_exp_gpio_ids[] = {
 	{ .compatible = "raspberrypi,firmware-gpio" },
 	{ }
 };
@@ -243,7 +243,7 @@ MODULE_DEVICE_TABLE(of, rpi_exp_gpio_ids);
 static struct platform_driver rpi_exp_gpio_driver = {
 	.driver	= {
 		.name		= MODULE_NAME,
-		.of_match_table	= of_match_ptr(rpi_exp_gpio_ids),
+		.of_match_table	= rpi_exp_gpio_ids,
 	},
 	.probe	= rpi_exp_gpio_probe,
 };
-- 
2.17.1

