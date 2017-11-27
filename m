From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 13/18] gpio: mockup: verify that ngpio > 0
Date: Mon, 27 Nov 2017 11:48:49 +0100
Message-ID: <20171127104854.333-14-brgl@bgdev.pl>
References: <20171127104854.333-1-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:46050 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752463AbdK0KtX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Nov 2017 05:49:23 -0500
Received: by mail-wr0-f195.google.com with SMTP id a63so25905675wrc.12
        for <linux-gpio@vger.kernel.org>; Mon, 27 Nov 2017 02:49:22 -0800 (PST)
In-Reply-To: <20171127104854.333-1-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

Improve the module params sanitization: bail out from init if the user
tries to pass a non-positive number of GPIO lines for any mockup chip.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 68a0c1e06a16..532f5807390b 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -335,6 +335,15 @@ static int __init gpio_mockup_init(void)
 	/* Each chip is described by two values. */
 	num_chips = gpio_mockup_params_nr / 2;
 
+	/*
+	 * The second value in the <base GPIO - number of GPIOS> pair must
+	 * always be greater than 0.
+	 */
+	for (i = 0; i < num_chips; i++) {
+		if (gpio_mockup_ranges[i * 2 + 1] < 0)
+			return -EINVAL;
+	}
+
 	gpio_mockup_dbg_dir = debugfs_create_dir("gpio-mockup-event", NULL);
 	if (IS_ERR_OR_NULL(gpio_mockup_dbg_dir))
 		gpio_mockup_err("error creating debugfs directory\n");
-- 
2.15.0

