Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792547410;
	b=jWaHEMPo8xVYDKz6JSwLAAUfWdldGOcxfdS7Gnro35eXSFWXL/LVxRfrmWar5kRuik4A
	 ea/06KHnaJv3ltcZnWwnti03iwXkFsc4MMUYqjn5H7Hd5VE5tr7Bugo7HGt/UvIKtSPbs
	 sMirxniJWUMkjrdcepJbqjAWaU/F67Ivap8OTyDL4p1r/O2GhJsp0vAhA77qcpQL4g5u9
	 c1/mBA6xkpdw9b3fKOQCIMVZIuIN5lERFKXKZOLK/S6x+8PglXN3lxvCE4DdsBQeBPN6O
	 dcw1nRa5Ha3pv5ChGNn1C5fcQBTH4sATJ4sOb8xsGJkP65Mob7Notjf7tMlyw6nJCvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792547410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZzodloN7LBcv77UWxjh4ySVp/0KBbsvTGp2wrXjuf+k=;
	b=xEdXnCaOZOvtnuuqb9MfabgPepXvsjHdEuyq/+hZUryL3m0wUsHldSdXqOzOOfg4KmCy
	 D01Wi2EU6mHhQSFDkAOvAYzmJrTjlffiz6lAVk0NPFDnVbb1EJ4Brqgq6q0DQGeQ8S5Dc
	 +6DPm+zzBSh4jApZNmxBwcvXrQInjsCHmB5kBBzT2tJUjSQ5WRxXSJh49aQk67oVUKqvv
	 uEOsAGnszMTV4uVAJLDc34N78w/Xpyl9dyT/mZVT8uxksiw2qkjDtjXU+i+3cDr7t9fxq
	 Iv/IFkjTGEeshih6GOvBgixGoQoJE9six6uApbqAB02ApnpDRw4v8MzJ62gy6FFdI1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E3fbWYHb;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A599B606A31B
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 01:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A599B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E3fbWYHb
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3514b90bb89so499578eec.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 18:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792547409; x=1793152209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZzodloN7LBcv77UWxjh4ySVp/0KBbsvTGp2wrXjuf+k=;
        b=E3fbWYHbX7mmjLg+UlxS8u1ckBsCnUupfeK9IDOV5bKHEOl9oXhdtzunmC1TZ8P3mU
         0uzHxGHRZ90em4PzeLIVtTiQVtU1nu18ihMU4e1wjaq9nn85rgLkqZ7sgumefeoYUa6e
         2Z/iyhkbVplGzkfRTG5eFKr578pCJ0EL/OftwCcTKv8wRc2h4+OscKuDqoIe7rlTYZIb
         hqHrRoNHRonTuNW0f1BNHmbGP2W3uuZtThNNOnkc7uVQ7cYPiAE7oAZXUz17Tgfomy4+
         tgNmSDdMvNq/O1OYLdZVXfxB+SIPOwgNcRlCsD/1YjbUbPfLbxl6ipSj2HCvLNlgdLSq
         9XXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792547409; x=1793152209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzodloN7LBcv77UWxjh4ySVp/0KBbsvTGp2wrXjuf+k=;
        b=m6mbAnVqzyVpGtCBEcVQyLbq+qBSWJKnr4N+miGq2xz0uRxjVwWGW8X2WwDnQvThdL
         ymipc3KGgFjPSAhDEoSbZdrtaFv/0JYDOPA87i+oS6rd8HO8sqwSR1+waPyLQbHhRfW5
         L52XxiZphL5q9JI0mE4FOEAfmgqiGByJYnMYv/KVX5lPqo9rmJ+rdSWAng7kGyJuEQ/K
         p+sOCRDi2bA0DtLcZ6zMk671v9Vl+VDIXnvUPP0bW8prRUGUHIXKseTa2PPhruFVwoPH
         gDL3DkmhQ5owFbWl0WnsaUEAhfCYP7+FIOJzvhatymdzCeZy0lrvzu1PT+DqYbeT9mi6
         F7dQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4UsKebil5zndIZHw4tiNXRmGtnmM/Uz+2nEJYgK82F/gufLpnHDajgG4QwuDhfRGQx8ibo/A+L8sJ@vger.kernel.org
X-Gm-Message-State: AFq9FYI2xPIm82NTE4gEuDqd7F1WHna812YbIGFiPAxoiUt+dU7mz552
	ivFqenupe5Wm19fWTldD60046+PMKBnGCzNlzRQPeEsiJMrQd0v73qUe
X-Gm-Gg: AYBFou3XXZNc8Xzitp9j7MT84asjmaFskmN0SFsQmAGhgWf148eF1E9Zy8Hw+1ad4J9
	06Sj9d9waNT0W7Lzo547GDXcB/D5YlsW7ZUdXHdzG7Ydw5xnX7k0/F135rwuN/PdZ+tzubMlbjf
	Ur8yGML7A6ugyJ7+sgMvbyVzQjSLUeGcn7vR3IAy3WbIMmJ+voPQ7ZKqaiA4p2Q2hm9TAQPBEmv
	dN0uroszz7YC83MSLp9wqwosbo6tM0pVL0QWbAP+QGvm84JcgAohqSD56fo9T4yMzSdr5Bq1G5Z
	vPrHdfH4NPNoRjG2E+oYUobsd6PexT5jMqJj/Coaevp6QtXah8Y58GzQwaMfhE1XU9AXRSAM9JR
	CiAyJ0XBqIyptyoCGQhBofBwZ1kvxKNLT3DqPMTv2fcXONlBahaLj4LJGPBeaWul9ol0J3LyA1n
	sTOp6O6WroC/EJjOMgX5E4ZNwP7nUfYyrylpdkqgq1PUWt04yI22H4egMgnmt8BWgA6zN0nG3lm
	dso3SXBIuZofIQGsixlQdpcpBOdm1LXv3lzOwTU3ZKdOWNCTyCgWn88hsJMLvP844q1QYHb/TvU
	tDtbQ89i2o1JREZWLu02HxbSCkBMS0ZpB1vkTycRo5q8
X-Received: by 2002:a05:7022:698c:b0:14d:baf5:c411 with SMTP id a92af1059eb24-190a44718e6mr1323146c88.14.1792547408569;
        Tue, 20 Oct 2026 18:50:08 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bd6b7ccsm2106839c88.13.2026.10.20.18.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:50:07 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-input@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] Input: soc_button_array - use resources to set up IRQ info for gpio-keys
Date: Tue, 20 Oct 2026 18:49:59 -0700
Message-ID: <20261021015004.1537738-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for transitioning the driver to use static device
properties instead of platform data to configure gpio-keys driver,
switch to using IRQ resources attached to the gpio-keys platform device
to communicate the IRQ selection.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/soc_button_array.c | 33 +++++++++++++++++++++------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index dbf86ea778e6..d4dc4e7116a7 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -17,6 +17,7 @@
 #include <linux/gpio_keys.h>
 #include <linux/platform_data/x86/soc.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 static bool use_low_level_irq;
 module_param(use_low_level_irq, bool, 0444);
@@ -154,6 +155,11 @@ soc_button_device_create(struct platform_device *pdev,
 			 const struct soc_button_info *button_info,
 			 bool autorepeat)
 {
+	struct platform_device_info pdevinfo = {
+		.parent = &pdev->dev,
+		.name = "gpio-keys",
+		.id = PLATFORM_DEVID_AUTO,
+	};
 	const struct soc_button_info *info;
 	struct platform_device *pd;
 	struct gpio_keys_button *gpio_keys;
@@ -167,6 +173,15 @@ soc_button_device_create(struct platform_device *pdev,
 		if (info->autorepeat == autorepeat)
 			n_buttons++;
 
+	struct resource *irq_resources __free(kfree) = NULL;
+	/* See dmi_use_low_level_irq[] comment */
+	if (!autorepeat && (use_low_level_irq ||
+			    dmi_check_system(dmi_use_low_level_irq))) {
+		irq_resources = kzalloc_objs(*irq_resources, n_buttons);
+		if (!irq_resources)
+			return ERR_PTR(-ENOMEM);
+	}
+
 	gpio_keys_pdata = devm_kzalloc(&pdev->dev,
 				       sizeof(*gpio_keys_pdata) +
 					sizeof(*gpio_keys) * n_buttons,
@@ -174,6 +189,9 @@ soc_button_device_create(struct platform_device *pdev,
 	if (!gpio_keys_pdata)
 		return ERR_PTR(-ENOMEM);
 
+	pdevinfo.data = gpio_keys_pdata;
+	pdevinfo.size_data = sizeof(*gpio_keys_pdata);
+
 	gpio_keys = (void *)(gpio_keys_pdata + 1);
 	n_buttons = 0;
 
@@ -212,10 +230,9 @@ soc_button_device_create(struct platform_device *pdev,
 		}
 
 		/* See dmi_use_low_level_irq[] comment */
-		if (!autorepeat && (use_low_level_irq ||
-				    dmi_check_system(dmi_use_low_level_irq))) {
+		if (irq_resources) {
 			irq_set_irq_type(irq, IRQ_TYPE_LEVEL_LOW);
-			gpio_keys[n_buttons].irq = irq;
+			irq_resources[n_buttons] = DEFINE_RES_IRQ(irq);
 			gpio_keys[n_buttons].gpio = -ENOENT;
 		} else {
 			gpio_keys[n_buttons].gpio = gpio;
@@ -240,10 +257,12 @@ soc_button_device_create(struct platform_device *pdev,
 	gpio_keys_pdata->nbuttons = n_buttons;
 	gpio_keys_pdata->rep = autorepeat;
 
-	pd = platform_device_register_resndata(&pdev->dev, "gpio-keys",
-					       PLATFORM_DEVID_AUTO, NULL, 0,
-					       gpio_keys_pdata,
-					       sizeof(*gpio_keys_pdata));
+	if (irq_resources) {
+		pdevinfo.res = irq_resources;
+		pdevinfo.num_res = n_buttons;
+	}
+
+	pd = platform_device_register_full(&pdevinfo);
 	error = PTR_ERR_OR_ZERO(pd);
 	if (error) {
 		dev_err(&pdev->dev,
-- 
2.56.0.212.g129ede20d9-goog

