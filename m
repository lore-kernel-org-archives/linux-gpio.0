Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143FEC5519F
	for <linux-gpio@archiver.kernel.org>; Wed, 18 Nov 2020 14:29:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D732246B5
	for <linux-gpio@archiver.kernel.org>; Wed, 18 Nov 2020 14:29:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OO4/2RBX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgKRO31 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 18 Nov 2020 09:29:27 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34074 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbgKRO30 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Nov 2020 09:29:26 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AIETOB6103990;
        Wed, 18 Nov 2020 08:29:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605709764;
        bh=KIaOUjZAqHDFMPJ7onsZXDxLWHV4cStDELc2Qb5T0ig=;
        h=From:To:CC:Subject:Date;
        b=OO4/2RBXs5a8u3LqP/4oTa2DdhJL/TvXOrneq/QPkZiwRJr67QNuBvqguxNC6jtKy
         tGvJFRMUb0bocIZVqKUpBxjV8qCrFPxjETxKbTBogZoySV/HLQfKeyJRzCujnw4DAr
         Cen271mFS/o2dM3fyI+ZHrS0cRDWGDcWtxkX6U2E=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AIETOJo035215
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 18 Nov 2020 08:29:24 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 18
 Nov 2020 08:29:24 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 18 Nov 2020 08:29:24 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AIETNRX107661;
        Wed, 18 Nov 2020 08:29:23 -0600
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH] gpiolib: do not print err message for EPROBE_DEFER
Date:   Wed, 18 Nov 2020 16:29:17 +0200
Message-ID: <20201118142917.25752-1-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The gpiochip may have dependencies from pinmux and so got deferred. Now it
will print error message every time -EPROBE_DEFER is returned which is
unnecessary:

"gpiochip_add_data_with_key: GPIOs 0..31 (gpio-0-31) failed to register, -517"

Hence, do suppress error message for -EPROBE_DEFER case.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpiolib.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 089ddcaa9bc6..fd2c503a6aab 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -771,9 +771,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	ida_free(&gpio_ida, gdev->id);
 err_free_gdev:
 	/* failures here can mean systems won't boot... */
-	pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n", __func__,
-	       gdev->base, gdev->base + gdev->ngpio - 1,
-	       gc->label ? : "generic", ret);
+	if (ret != -EPROBE_DEFER) {
+		pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n", __func__,
+		       gdev->base, gdev->base + gdev->ngpio - 1,
+		       gc->label ? : "generic", ret);
+	}
 	kfree(gdev);
 	return ret;
 }
-- 
2.17.1

