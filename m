Return-Path: <SRS0=ToIH=UR=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BECC31E5B
	for <linux-gpio@archiver.kernel.org>; Tue, 18 Jun 2019 15:51:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C24FD20673
	for <linux-gpio@archiver.kernel.org>; Tue, 18 Jun 2019 15:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560873065;
	bh=KG8fTQS3ciKEa3GeQARg2vuYlZu59EP0SpvlKNATg3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=S4g3Rn9ULbcLEkTFylFGCUhoYY3cU6uuNxU+2CCixxZegTiNv17B8XdUppK5BGSJH
	 0XQ/F1LBKwhAyhaOJ3Amn+cj308F0wIFKPN7aD+CkoIMJIn/ekEfUr7PysRClKAHMY
	 TH48U8B2JA5FyVYjGUS5lWJ5KalFOSPW1bjSJ4Tc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729412AbfFRPvF (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 18 Jun 2019 11:51:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:37062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729246AbfFRPvF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Jun 2019 11:51:05 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B02420673;
        Tue, 18 Jun 2019 15:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560873064;
        bh=KG8fTQS3ciKEa3GeQARg2vuYlZu59EP0SpvlKNATg3g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z2MdnD626qeBFpl/f9/UCgzg/HDX5Em/u27HN2XxK8ZvtzmV3WkHX4cGh+u+Cb35l
         Clyl5HY5uZlNJqnTw8Z6xxE1zrWDpjswjqZuKQbD0z1XUjefpu9RaZWZIW9fYxw+r3
         4ZZNWqKa6VbqQbXsZ9Wu9fUO1986ZsrMZJTaUHK4=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     bamv2005@gmail.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-gpio@vger.kernel.org
Subject: [PATCH 3/3] gpio: mockup: no need to check return value of debugfs_create functions
Date:   Tue, 18 Jun 2019 17:50:47 +0200
Message-Id: <20190618155047.16894-3-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190618155047.16894-1-gregkh@linuxfoundation.org>
References: <20190618155047.16894-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Bamvor Jian Zhang <bamv2005@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpio/gpio-mockup.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index b6a4efce7c92..f955aff6dd82 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -325,8 +325,6 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
 	devname = dev_name(&gc->gpiodev->dev);
 
 	chip->dbg_dir = debugfs_create_dir(devname, gpio_mockup_dbg_dir);
-	if (IS_ERR_OR_NULL(chip->dbg_dir))
-		goto err;
 
 	for (i = 0; i < gc->ngpio; i++) {
 		name = devm_kasprintf(dev, GFP_KERNEL, "%d", i);
@@ -341,16 +339,11 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
 		priv->offset = i;
 		priv->desc = &gc->gpiodev->descs[i];
 
-		evfile = debugfs_create_file(name, 0200, chip->dbg_dir, priv,
-					     &gpio_mockup_debugfs_ops);
-		if (IS_ERR_OR_NULL(evfile))
-			goto err;
+		debugfs_create_file(name, 0200, chip->dbg_dir, priv,
+				    &gpio_mockup_debugfs_ops);
 	}
 
 	return;
-
-err:
-	dev_err(dev, "error creating debugfs files\n");
 }
 
 static int gpio_mockup_name_lines(struct device *dev,
@@ -501,8 +494,6 @@ static int __init gpio_mockup_init(void)
 	}
 
 	gpio_mockup_dbg_dir = debugfs_create_dir("gpio-mockup", NULL);
-	if (IS_ERR_OR_NULL(gpio_mockup_dbg_dir))
-		gpio_mockup_err("error creating debugfs directory\n");
 
 	err = platform_driver_register(&gpio_mockup_driver);
 	if (err) {
-- 
2.22.0

