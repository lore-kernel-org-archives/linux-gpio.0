Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250C56F2F2
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 00:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773360750; cv=none; b=bjB0vrGixyuzYurVpn7LCOTxVYXPyGkVafQw3wZV9I4sbBctXYxfV+Uivw3y9lTtmOvjIcSpd4kfVbn8L32MqXzyIY1oFVnfrhK9JRBeDWHYqGhHFRhgrD9JSHbuY8nhuuUU/3oaIR5e0hvSaYfNO5q6sCEmTj7jC5FwTZMgAv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773360750; c=relaxed/simple;
	bh=T4r2vx6dhxOLnZH/JlyaRVdHbC7RPrKhEoaEGGAroBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PFNO0Ai5MCRfEcTOW+NzMlPlZ50twDI5CBUYW4TB1ES2oZOtaNKMz6qQ/aXo/qAYIU9o4pXUj1GNo9imUCxT6jmgtUMc5Fhv/OABbDhTNnzD4fcMQoSVEdbzBt6kYcRDQMX4b/sAHL1Jv4VSDhXL3xTOwkj4vZhdYp4er7oEdsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lim6HX+x; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lim6HX+x"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64c9a6d68e5so1462568d50.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 17:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773360748; x=1773965548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=riNuyQ7mIoctt4Nrm79i2EVlOIkF+ZTDYIpMnh/XtIM=;
        b=Lim6HX+xMzOPVP/Pp0w1ILKLhdAUQDcOXkWJAK0WEmjLa0fXXdWPV7MPlK6YcVRJNr
         ie8KDiYHdeoO97maDvBpVDu+609642Wh1gKr1r7r6uBZELON8yjPN6I9qdaYVyN9bujl
         RJjZKjZQe2uJ6juToj8jyNYPH1QwVcRjrcYrI31zzFycrKmClkVkzbMYddGtFEf+9Vae
         pCE7bE+s0nC9exiDdmesglQtpI/p4OEpUfi26s0HqC7eaKb5oHjizuSJTbChWAgkj+AI
         mbvupb9YnKwK2Ez37WjmENyAptqdsC9VN66QXXUp1lb1fwG0Oj//ycPAjGVFvc/yXjzy
         3mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773360748; x=1773965548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riNuyQ7mIoctt4Nrm79i2EVlOIkF+ZTDYIpMnh/XtIM=;
        b=H7IUh3LusZN1hBmkQaI1Qp2a0PP+GOKnJKLIEmvPGAJ8TzF5t/f2CKEBw2J5a2baWf
         rBvRydWaaselwjAbbIQ5A0O8cKCju+BQvxkS55Lwwps1b6Zq/chilFJ7VnO33pJBUc/C
         fUjbzDr/fl+1W4s8wc31JhtHRZH2b6S4ncngVlKNWCG6trPvJmZlxBxkSYAB6nQ7BIjg
         j8KIy/rAKYBQ3ba/0C1+QNeUEQo4u9D23GdoYb8WMlUqH5UxbsNE2cEBuQKuJ3WoiWFc
         j/2uMjJjYg20ear4qJUEhV7mSAW3tD9w3OhoCM3sR8Z6MWXNv5mkYpDDsAnEXoo4rhPC
         EUDQ==
X-Gm-Message-State: AOJu0YzQ3vZ4NBszhHmeikcsDgF2ikD0wHdz9f19djJ9LvtO/fenaGGQ
	rXOskrqJVNYFC3JY9mSLVTScGrjurxFakzejHEsoJ4V7VaBeu5N4uS4X4px9htGh
X-Gm-Gg: ATEYQzxu7WJTTrSaNVwooNueABHBHWC9uuSX02QUtLi9OFN/AaaN531YFr9SPZHgabR
	pWbktfKRu2GCKoQA8q5PAZq53XL36JI0OI4AgOb57Frm69EhtGsCAnfWhU4JSN8wYwAtXFUQgVc
	zPaZisz4wj21wD8MJrHBDr/0Uv4HEQagi8kNx2KyRY7WyQRGY0rV283OBxQzuVoySji8tVhf9CS
	YMwl3SNxgs3sxBVeySlT/u/lEgjsBkljuvVmI6k8hHlvwfTGykg/ZhyzmbOe0UcY5HEgQmiUgwg
	h/wgnubY1Mfm/PqjmSErxIxGTEtfcw1xFAISvsmCvQBwfEY9cEdccICXHIFG249Xda2SfKe1njW
	upW4oKJMhlyhA/ths2DjXqumsBFNe5YMPPu8O10AR/nNQ1iyvwD+fV/pHB7lVEctP57Fp/ihoQ1
	g8Up3ZGakDHxB3L0t6M52s9FlLhIXsB3ZenwYAdq3WprHhhSS18x0TIQ==
X-Received: by 2002:a05:690e:44a3:b0:649:38be:34bd with SMTP id 956f58d0204a3-64e63050c8cmr1360709d50.45.1773360747727;
        Thu, 12 Mar 2026 17:12:27 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65b39dd2sm144411d50.14.2026.03.12.17.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 17:12:27 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: cs5535: use dynamically allocated priv struct
Date: Thu, 12 Mar 2026 17:12:09 -0700
Message-ID: <20260313001209.117823-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Static allocation is deprecated.

Remove the FIXME as gpiochip_add_data allows using gpiod_get_data.
No need for container_of.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-cs5535.c | 48 +++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/gpio/gpio-cs5535.c b/drivers/gpio/gpio-cs5535.c
index 8affe4e9f90e..5f5373d86397 100644
--- a/drivers/gpio/gpio-cs5535.c
+++ b/drivers/gpio/gpio-cs5535.c
@@ -39,10 +39,6 @@ static ulong mask = GPIO_DEFAULT_MASK;
 module_param_named(mask, mask, ulong, 0444);
 MODULE_PARM_DESC(mask, "GPIO channel mask.");
 
-/*
- * FIXME: convert this singleton driver to use the state container
- * design pattern, see Documentation/driver-api/driver-model/design-patterns.rst
- */
 static struct cs5535_gpio_chip {
 	struct gpio_chip chip;
 	resource_size_t base;
@@ -285,30 +281,29 @@ static const char * const cs5535_gpio_names[] = {
 	"GPIO28", NULL, NULL, NULL,
 };
 
-static struct cs5535_gpio_chip cs5535_gpio_chip = {
-	.chip = {
-		.owner = THIS_MODULE,
-		.label = DRV_NAME,
-
-		.base = 0,
-		.ngpio = 32,
-		.names = cs5535_gpio_names,
-		.request = chip_gpio_request,
-
-		.get = chip_gpio_get,
-		.set = chip_gpio_set,
-
-		.direction_input = chip_direction_input,
-		.direction_output = chip_direction_output,
-	},
-};
-
 static int cs5535_gpio_probe(struct platform_device *pdev)
 {
+	struct cs5535_gpio_chip *priv;
+	struct gpio_chip *gc;
 	struct resource *res;
 	int err = -EIO;
 	ulong mask_orig = mask;
 
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	gc = &priv->chip;
+	gc->owner = THIS_MODULE;
+	gc->label = DRV_NAME;
+	gc->ngpio = 32;
+	gc->names = cs5535_gpio_names;
+	gc->request = chip_gpio_request;
+	gc->get = chip_gpio_get;
+	gc->set = chip_gpio_set;
+	gc->direction_input = chip_direction_input;
+	gc->direction_output = chip_direction_output;
+
 	/* There are two ways to get the GPIO base address; one is by
 	 * fetching it from MSR_LBAR_GPIO, the other is by reading the
 	 * PCI BAR info.  The latter method is easier (especially across
@@ -329,9 +324,9 @@ static int cs5535_gpio_probe(struct platform_device *pdev)
 	}
 
 	/* set up the driver-specific struct */
-	cs5535_gpio_chip.base = res->start;
-	cs5535_gpio_chip.pdev = pdev;
-	spin_lock_init(&cs5535_gpio_chip.lock);
+	priv->base = res->start;
+	priv->pdev = pdev;
+	spin_lock_init(&priv->lock);
 
 	dev_info(&pdev->dev, "reserved resource region %pR\n", res);
 
@@ -347,8 +342,7 @@ static int cs5535_gpio_probe(struct platform_device *pdev)
 				mask_orig, mask);
 
 	/* finally, register with the generic GPIO API */
-	return devm_gpiochip_add_data(&pdev->dev, &cs5535_gpio_chip.chip,
-				      &cs5535_gpio_chip);
+	return devm_gpiochip_add_data(&pdev->dev, gc, priv);
 }
 
 static struct platform_driver cs5535_gpio_driver = {
-- 
2.53.0

