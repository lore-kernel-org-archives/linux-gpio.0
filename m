Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3810C25B0E
	for <linux-gpio@archiver.kernel.org>; Tue, 16 Aug 2022 14:34:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbiHPOeY (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 16 Aug 2022 10:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbiHPOeW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Aug 2022 10:34:22 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFEB36B178;
        Tue, 16 Aug 2022 07:34:20 -0700 (PDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4M6YVX03k4zlWBx;
        Tue, 16 Aug 2022 22:31:16 +0800 (CST)
Received: from CHINA (10.175.102.38) by canpemm500009.china.huawei.com
 (7.192.105.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 16 Aug
 2022 22:34:18 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] gpio: mockup: remove gpio debugfs when remove device
Date:   Tue, 16 Aug 2022 14:52:25 +0000
Message-ID: <20220816145225.84283-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.102.38]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPIO mockup debugfs is created in gpio_mockup_probe() but
forgot to remove when remove device. This patch add a devm
managed callback for removing them.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpio-mockup.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 8943cea92764..1fdc444b093b 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -373,6 +373,13 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
 	}
 }
 
+static void gpio_mockup_debugfs_cleanup(void *data)
+{
+	struct gpio_mockup_chip *chip = data;
+
+	debugfs_remove_recursive(chip->dbg_dir);
+}
+
 static void gpio_mockup_dispose_mappings(void *data)
 {
 	struct gpio_mockup_chip *chip = data;
@@ -455,6 +462,10 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 
 	gpio_mockup_debugfs_setup(dev, chip);
 
+	rv = devm_add_action_or_reset(dev, gpio_mockup_debugfs_cleanup, chip);
+	if (rv)
+		return rv;
+
 	return 0;
 }
 
-- 
2.34.1

