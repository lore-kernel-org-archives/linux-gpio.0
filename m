Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A90245008;
	Fri, 13 Mar 2026 05:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773380494; cv=none; b=ibARf8L/yZlqiFqvmBuEgdArlbkcnJNNZcyTGE5L1a/EGRRMDfmZ7Zu/5hGz2qIg0+A89fM49rUx7H9uKoK/KhG0QEvrPxB5ArX0UaIZfIltRCkMFhJHXAyI/xZRzrXeWCWFSo4xGP+x/R9eynWu3O/jhT7crIAULK3/b1lRKTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773380494; c=relaxed/simple;
	bh=+IyyYU9JVjHo37U9N49OFcQnOj6+WalZWqifw1vkKJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jwuv8Aq0phUuXk1994fBXhNZcKcz6xXNpWBtzNdHsio+7FJkJ9chidFUC1h3mJhV3O+PRJjj9imkCmdYRTxzte49G3ypW1Bxx/thPld+L8SaJ0Jqfm1ZYqzNe2YfFKshEAB+HJ0FmHsNUbFLoAmT7XDPDbBJuG97nhbBXGSiLm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKOEYBbh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKOEYBbh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6A6C19421;
	Fri, 13 Mar 2026 05:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773380494;
	bh=+IyyYU9JVjHo37U9N49OFcQnOj6+WalZWqifw1vkKJo=;
	h=From:To:Cc:Subject:Date:From;
	b=OKOEYBbhVe+6tRWFRbK0WdRbomY58Rq02gJdbVmyLfUiObJdiJyT19A2dUkCiaF0u
	 e2I9A9+u6ZrZ3L2aLsv9DyRnZkZSooNF1/I8Mz8rJHYvM9ROAlqUlBai7Ii3bINHtH
	 0IYseXjmwZV1cjtw9Ojqu+M/8rtnFAJ/zInrOheDX4jZ4NC3Rir+SUHrcdi14SZWWB
	 B12JhV8HbarFtoSDaCNIlohG9hurFmZb6+K1trgRgjiEuyuCFFuCkFFR03BUc1w0KS
	 eItTWSU+Efg6sGdKsEhIXwDzu/PDL1G2R69TsfuzIgKitRPi/352da77BNgzbOVmz6
	 qaYawNrDKanvw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tzungbi@kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] Revert "gpio: Access `gpio_bus_type` in gpiochip_setup_dev()"
Date: Fri, 13 Mar 2026 05:41:12 +0000
Message-ID: <20260313054112.1248074-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit cc11f4ef666fbca02c8a2f11d0184d57e6b75579.

Commit cc11f4ef666f ("gpio: Access `gpio_bus_type` in
gpiochip_setup_dev()") moved the bus type assignment from
gpiochip_add_data_with_key() to gpiochip_setup_dev().

This change introduced a bug where dev_printk() and friends might access
the bus name after gpiochip_add_data_with_key() but before
gpiochip_setup_dev() has run.  In this window, the bus type is not yet
initialized, leading to empty bus names in logs.

Move the bus type assignment back to gpiochip_add_data_with_key() to
ensure the bus name is available before any potential users like
dev_printk().

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/all/CAMuHMdU0Xb=Moca5LUex+VxyHQa2-uYJgYf4hzHiSEjDCQQT=Q@mail.gmail.com/
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Geert: I hadn't seen the revert patch, so I've sent out a version.

Bart: In any case, please feel free to pick this patch.

 drivers/gpio/gpiolib.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index bbb96e52197c..c1290ba20eac 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -903,8 +903,6 @@ static int gpiochip_setup_dev(struct gpio_chip *gc)
 	struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
 	int ret;
 
-	gdev->dev.bus = &gpio_bus_type;
-
 	/*
 	 * If fwnode doesn't belong to another device, it's safe to clear its
 	 * initialized flag.
@@ -1095,6 +1093,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	 * then make sure they get free():ed there.
 	 */
 	gdev->dev.type = &gpio_dev_type;
+	gdev->dev.bus = &gpio_bus_type;
 	gdev->dev.parent = gc->parent;
 	device_set_node(&gdev->dev, gpiochip_choose_fwnode(gc));
 
@@ -1232,8 +1231,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	 * we get a device node entry in sysfs under
 	 * /sys/bus/gpio/devices/gpiochipN/dev that can be used for
 	 * coldplug of device nodes and other udev business.
-	 * We can do this only if gpiolib has been initialized
-	 * (i.e., `gpio_bus_type` is ready).  Otherwise, defer until later.
+	 * We can do this only if gpiolib has been initialized.
+	 * Otherwise, defer until later.
 	 */
 	if (gpiolib_initialized) {
 		ret = gpiochip_setup_dev(gc);
-- 
2.53.0.851.ga537e3e6e9-goog

