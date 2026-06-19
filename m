Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FB2283C93
	for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2026 08:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781859058; cv=none; b=AeBjnl4/mrzMm8xhQfWfnP7mGfsBWpHCvJfboiwYz8LxIP846S+rRy0GrVw4pWInxJyfpARbhOI5wrshEVLTZ5nW3zrY54pBU8iTKAfUOrVpMvJ08X6nNU//DQKVNAiVRCBOqIXRbmvS9WLna77C5RX01FWbXcd5J5QzRD2YvOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781859058; c=relaxed/simple;
	bh=QzZXIM3Ofs4vn5XfT+haYIswP1N5nYhvZRxIpc6RezM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hJBTNgzW69DJD2aykiXZuUcJ5lcuNKytdXwPga15WXdhSy4z9dzyZ6Jmw6GZwyzu/zWaBnvhN4YCzM67ZVubdvvkDtcUHsZGadnX+lgUUWnHFtjwlc1os5ijwy9VQ3sx9zhvdx/wDwdkIo1mRmlnLh2/7rEp3JJjMHkyrTKkItw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fK6puBgy; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fK6puBgy"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-842307473b5so1286000b3a.2
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2026 01:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781859056; x=1782463856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bohb1hK3/+OCZQMp5RUrUfWNQ+vz7fM1wfv77KnC/4Y=;
        b=fK6puBgyCLT5UISPDT/ndCj8v6x0gU4yUPM2xqtF4QVlhc7V6rvCOqsT8r8lRM1pjF
         cruioA9pFALHdq0MKEHr45U66K+jYYiyXqw0+06UXijehpMuu4zKMpxwKYKhY+1l5jIV
         s7W+pZEC4TbK3SdPTh3ItYUszhJl1JYmDsI7/t97MeTQZc8qajGqKRQv7bJEoM7Oxmag
         ZWjdcUuQWEJDBMIAYy9s1tW/0UIuVv4TYq/NS2p3QMNkODQH2L4lUdTfDUk+NeBl8Q7Q
         OWJ60NPstm3c6DIolKfnrm0u7DYj8J76Ml7snxUowf6T0fUiZls0oEXqWJE1qy8DNrZz
         Tffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781859056; x=1782463856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bohb1hK3/+OCZQMp5RUrUfWNQ+vz7fM1wfv77KnC/4Y=;
        b=r39rg3/YsREdrHtGBKz23xaPgpnp2VHNIwe20mpnx86bf2w5c+f3o9tI/vrTXRueoy
         NmL3eaKgkIzskLlgF8SIYR4Afux8qefSmVa/kw83oYyD/zew9JbVXPlAYr7Dlltgl183
         bCC4yeDhpnPXLV1Ln80QIBHuXfRVKwm/4vEF8QlyirufRsz7+Csjg3NHL7V6355s86Sy
         ZyCJ6EjCoUPrPtw/bVT3dAe+1AnKXva8TMrhFswVk2rIbiaZhNEd/Dt8WZpXBcnlj8mW
         7RFJZ9XNq1TD0dj5x2guxMQRH8PtV6LZpqE+GEPJYZcxpH+anatrhQXSWQc7JTongzjb
         znHQ==
X-Gm-Message-State: AOJu0YxLcb2o9UNk7BcLVzCRFQWfwjFtg3JqEyEW7obuR4xlRWtTEoSs
	B5Rl/kxCPYoGGhkqeZ3UeNJ98b/3AfluMFsbnFF7lNQIicQ3UP5ZR3iJI0YeOBVT
X-Gm-Gg: AfdE7cnOdySNZckXo7nmOLkH4Yzf7xCfKX3FhXZWe081Lgp7csEGy0Uzfdg8UXY7PLw
	ep8y2W8ULW5P1eXf9dMR314hr93Ijs5zMjq00xfMU/goVsp/NmTVFmtxL70FCfgXHWdJTBhT7RW
	yQQKdRohtHJOTn8qvaAfUjku5brxg3zTeJiKmIUzkKTV6M8mAQ1nuV6+5UYhhIFRNw9zzPFyDQ+
	oKHS/tcVvLhDwWKG+lQm328l6Mg+259XH3JKxwqad+rxAt69H+QYatfMO56boi+1yoE8TWmxXVh
	d1KDqJjP3Eyi8lMMO1PRLaXnLHU6X8WEE2PkcN4Txv9PZwbtFPzuxEMt5xLTKU5IwO2fU9ZW80G
	W8t3ZbiaNS3uL6iudbmz4XMBQvaIdR6Dlam0x5tzAezRRMK8AOYk/T7Tzv9QPBdNdf0/Zpzjdr9
	PvG46+EZiNxEUWQxRtEHYubSHVuk8=
X-Received: by 2002:a05:6a00:12e0:b0:842:6c02:2fa4 with SMTP id d2e1a72fcca58-84556084f18mr1900742b3a.14.1781859055538;
        Fri, 19 Jun 2026 01:50:55 -0700 (PDT)
Received: from evo.www.tendawifi.com ([103.98.7.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8455364c24esm1742377b3a.12.2026.06.19.01.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:50:55 -0700 (PDT)
From: Archit More <architmore303@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	Archit More <architmore303@gmail.com>
Subject: [PATCH] gpio: make gpio_chip_guard accept const gpio_desc
Date: Fri, 19 Jun 2026 14:20:36 +0530
Message-Id: <20260619085036.85242-1-architmore303@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make gpio_chip_guard accept a const struct gpio_desc pointer,
allowing gpiod_get_raw_value_commit() and gpiod_to_irq() to use
the helper instead of open-coding SRCU-protected chip lookups.

This removes duplicated code and eliminates the FIXME comments
about gpio_chip_guard being unusable with const descriptors.

Signed-off-by: Archit More <architmore303@gmail.com>
---
 drivers/gpio/gpiolib.c | 28 ++++++++--------------------
 drivers/gpio/gpiolib.h |  2 +-
 2 files changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1e6dce430dca..3ee924b2ab94 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3406,20 +3406,13 @@ static int gpio_chip_get_value(struct gpio_chip *gc, const struct gpio_desc *des
 
 static int gpiod_get_raw_value_commit(const struct gpio_desc *desc)
 {
-	struct gpio_device *gdev;
-	struct gpio_chip *gc;
 	int value;
 
-	/* FIXME Unable to use gpio_chip_guard due to const desc. */
-	gdev = desc->gdev;
-
-	guard(srcu)(&gdev->srcu);
-
-	gc = srcu_dereference(gdev->chip, &gdev->srcu);
-	if (!gc)
+	CLASS(gpio_chip_guard, guard)(desc);
+	if (!guard.gc)
 		return -ENODEV;
 
-	value = gpio_chip_get_value(gc, desc);
+	value = gpio_chip_get_value(guard.gc, desc);
 	value = value < 0 ? value : !!value;
 	trace_gpio_value(desc_to_gpio(desc), 1, value);
 	return value;
@@ -4126,8 +4119,6 @@ EXPORT_SYMBOL_GPL(gpiod_is_shared);
  */
 int gpiod_to_irq(const struct gpio_desc *desc)
 {
-	struct gpio_device *gdev;
-	struct gpio_chip *gc;
 	int offset;
 	int ret;
 
@@ -4135,16 +4126,13 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 	if (ret <= 0)
 		return -EINVAL;
 
-	gdev = desc->gdev;
-	/* FIXME Cannot use gpio_chip_guard due to const desc. */
-	guard(srcu)(&gdev->srcu);
-	gc = srcu_dereference(gdev->chip, &gdev->srcu);
-	if (!gc)
+	CLASS(gpio_chip_guard, guard)(desc);
+	if (!guard.gc)
 		return -ENODEV;
 
 	offset = gpiod_hwgpio(desc);
-	if (gc->to_irq) {
-		ret = gc->to_irq(gc, offset);
+	if (guard.gc->to_irq) {
+		ret = guard.gc->to_irq(guard.gc, offset);
 		if (ret)
 			return ret;
 
@@ -4152,7 +4140,7 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 		return -ENXIO;
 	}
 #ifdef CONFIG_GPIOLIB_IRQCHIP
-	if (gc->irq.chip) {
+	if (guard.gc->irq.chip) {
 		/*
 		 * Avoid race condition with other code, which tries to lookup
 		 * an IRQ before the irqchip has been properly registered,
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index dc4cb61a9318..841b7f8dba6c 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -244,7 +244,7 @@ DEFINE_CLASS(gpio_chip_guard,
 
 		_guard;
 	     }),
-	     struct gpio_desc *desc)
+	    const struct gpio_desc *desc)
 
 int gpiod_request(struct gpio_desc *desc, const char *label);
 int gpiod_request_commit(struct gpio_desc *desc, const char *label);
-- 
2.34.1

