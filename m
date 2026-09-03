Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323CA3F8232
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 07:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422388; cv=none; b=vAEHd2KLr66Sw1b5YyDqJV/RYUZ7u74St5dwc9Z+Ogv3TVKQ8UzgDf9XS8bHPXijIjvBo+WoJKk3k8oApaZ6w1f3T+3pW4KLDGaZJbZvO9UpIu5YwL4LM2Jq1QVAJNy2LLj/GIIAE0K/XsA9o8F26We468tlkJvdL17I6P7o/c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422388; c=relaxed/simple;
	bh=vpxMREyKPKzJjjlqFAlHvba6Vo7YZEhqwIUksEjNrnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lGGvqXsugXuAnek8swgQLolT1mY1Lv8n5xSOebLBhH2ualXoTERFgetdJ/LqGGVhV2A74t75r+DV96uzQZ1wSlzYC4JRbuOiFFd8nbACbOhiPMstXOvC+x2CbBOx1KpTc1kBUyugVogh2BGkxenQ2IjDYj6jF5ncOBEm794b9LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxQoWlC+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxQoWlC+"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4956869750eso13999475e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 00:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422384; x=1789027184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRfXYK5ceQGJKTl6ugaWhRpE3JruSeXGhAudETkOsVY=;
        b=gxQoWlC+vARRcZtwBA1vS5rO6BP1zTBvPqmfalPFe9Ch92fDy2LV8yohy0eOdJJ/gM
         Bj/H3fhj83g0zOJHGHzonWcVAvIUSXOpX6mITTpx7nsW2/DT7yyRkr6w97gNhAlbM0Cj
         /tVr9+O4G77zrhSH54jixkdyZ81mZZLHcq+iCpxW+nxHF5oXIjr5q/69Argo6VvEsZgo
         R0t2JFPRdbgNbIz2HacV9CIFNVMvRcVnwM3owJWpqIwROJZtowlA8m4qRPU47T1vlXV/
         UE0/fwCe0GASpaQ4fMfwuDicBP+tInD/Qx6D3yGIgM8PqF26vuhF5eQHNykhRvyf4EiP
         UAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422384; x=1789027184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RRfXYK5ceQGJKTl6ugaWhRpE3JruSeXGhAudETkOsVY=;
        b=i5bErT7r8Vx5lp9m1tDYWfLRMs3VK7VILF+ocuryv5lUqaOS7MDDbDhRHV6prLChHf
         lo9o832bXIeAXBMezX3spLZbxUF1lWsW7wZCo+b6J+L98AXRXBiMgNCGHngRIl/M2Z4c
         Kvg5enJl8xFFOOp3Re0/b6u2vqnGAenJf9O3fS4dSVCa4+6mSQ3oGpzvh/ghQp8+L8Ki
         4Br37ca0wnC4+/XuNqFQ2fKc9LrNQrVHFN//DvH8HM4BBaRbAV3F8zQr20sDIYluGDgO
         OBf8Cu3d1fUYNFUekqMmIuJgU4s5gWvthiVM5HZZIjmOu/QmGOV2XtXIrwq5rGgPUHtp
         u+fQ==
X-Forwarded-Encrypted: i=1; AKwUvByxHyHI6cwFq3AIasXyI9oQh77xk99ytCjdNMQ1gJNC4rAzz1C4eOmWN9Xb3XYdE0dXrw3LHHCInNoc@vger.kernel.org
X-Gm-Message-State: AFuF++kwrLr1dFmt8jzbL6e2CEx0Ewx/NCAphWakvO1UEVe55rX9+Sko
	FKRkS+ucBFkwBvEcc1+S8Ko56vlzT7AEwG0RilJsqmNj8AdJU4Y8VtXN
X-Gm-Gg: AYBFou2nRBJJN2aBeBIydwFjmy0v5HgH7JCkn7A0NXDhHkwac4DI0Td4K+z9qeZzrZx
	4s10hpoThtm9ouLvXDpHxJ9VLesuCROU0C653AdyiS65x2hXQWNe15AViRNqjRQbi2lBf3EgiAN
	pZKVxAtmaAF6PXIAFs8t86ctB6j0gGEtzVvbun8dT9aK8V5CMa1e5s3qGhn3OF/PPxAJQzFCOmh
	YWlXSqp2rtQvdoiIkrsBAV83jTApGArDq0mDNjsf5A81U/LMEV+Lsie9wRZRwZuYNAxajHn2THV
	0mpl563WH2kWJAlNcd3S/Poa0dh3s2DGz5znQeieUmsnfN2xTj8aNjeIqmJNO3iicC2HSLVPD2U
	IW3ddyoJNP1/ASeGn9JPJ8o0OzLChU5mJjHALfg+Up2g2A/dTHMqDXUtVwn5UoMRlobLl4cqBSC
	mtBsVytdhlzmn87gNIsOWFdghX256ATtqXMh4AMVZ9v7SkousRSDgQXSuVvrHaeSQTow==
X-Received: by 2002:a05:600c:1c27:b0:49c:dcec:bd27 with SMTP id 5b1f17b1804b1-49ce57fd7bamr166027785e9.8.1788422384199;
        Thu, 03 Sep 2026 00:59:44 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee3b0af8sm52373275e9.0.2026.09.03.00.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:59:43 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v5 2/3] gpiolib: add get_config() and gpiochip_generic_get_config()
Date: Thu,  3 Sep 2026 09:59:39 +0200
Message-ID: <20260903075940.2089367-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903075940.2089367-1-mehmet.fide@gmail.com>
References: <20260903075940.2089367-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A chip with a pin control backend sets a line's configuration through
set_config() and gpiochip_generic_config(), but has no way to read one
back. gpio-mmio needs that to learn the direction of a line whose
direction lives in the pin controller.

Add the optional get_config() callback, taking the packed parameter to
query and returning its bare argument the way pinctrl_gpio_get_config()
does, and gpiochip_generic_get_config() as the pin control backed
implementation, the mirror of gpiochip_generic_config(). Without
CONFIG_PINCTRL the pinctrl stub returns 0 and leaves the config alone,
so the helper answers -ENOTSUPP there instead.

Nothing in gpiolib calls get_config() and there is no consumer API; it
is for the chip's own use.

Suggested-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 Documentation/driver-api/gpio/driver.rst |  7 +++++++
 drivers/gpio/gpiolib.c                   | 23 +++++++++++++++++++++++
 include/linux/gpio/driver.h              |  9 +++++++++
 3 files changed, 39 insertions(+)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index a4f160b95089..3e53374c7e9f 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -134,6 +134,13 @@ ending up in the pin control back-end "behind" the GPIO controller, usually
 closer to the actual pins. This way the pin controller can manage the below
 listed GPIO configurations.
 
+The optional .get_config() callback reads a configuration back: the packed
+parameter to query goes in, its bare argument comes out, the way
+pinctrl_gpio_get_config() answers. gpiochip_generic_get_config() is its pin
+control backed counterpart. Nothing in gpiolib calls it; it is for the GPIO
+driver's own use, for example to learn the direction of a line when the pin
+controller owns it.
+
 If a pin controller back-end is used, the GPIO controller or hardware
 description needs to provide "GPIO ranges" mapping the GPIO line offsets to pin
 numbers on the pin controller so they can properly cross-reference each other.
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ef8ccaf17c9c..fb3ef6754a9e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2440,6 +2440,29 @@ int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_config);
 
+/**
+ * gpiochip_generic_get_config() - read back the configuration of a pin
+ * @gc: the gpiochip owning the GPIO
+ * @offset: the offset of the GPIO to query
+ * @config: the packed parameter to query, replaced by its bare argument
+ *
+ * Returns:
+ * 0 on success, or negative errno on failure.
+ */
+int gpiochip_generic_get_config(struct gpio_chip *gc, unsigned int offset,
+				unsigned long *config)
+{
+#ifdef CONFIG_PINCTRL
+	if (list_empty(&gc->gpiodev->pin_ranges))
+		return -ENOTSUPP;
+
+	return pinctrl_gpio_get_config(gc, offset, config);
+#else
+	return -ENOTSUPP;
+#endif
+}
+EXPORT_SYMBOL_GPL(gpiochip_generic_get_config);
+
 #ifdef CONFIG_PINCTRL
 
 /**
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 17511434ed07..4077dc678cae 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -359,6 +359,10 @@ struct gpio_irq_chip {
  * @set_config: optional hook for all kinds of settings. Uses the same
  *	packed config format as generic pinconf. Must return 0 on success and
  *	a negative error number on failure.
+ * @get_config: optional hook to read back a setting. Takes the packed
+ *	generic pinconf parameter to query and returns its bare argument in
+ *	the same variable, like pinctrl_gpio_get_config(). Must return 0 on
+ *	success and a negative error number on failure.
  * @to_irq: optional hook supporting non-static gpiod_to_irq() mappings;
  *	implementation may not sleep
  * @dbg_show: optional routine to show contents in debugfs; default code
@@ -434,6 +438,9 @@ struct gpio_chip {
 	int			(*set_config)(struct gpio_chip *gc,
 					      unsigned int offset,
 					      unsigned long config);
+	int			(*get_config)(struct gpio_chip *gc,
+					      unsigned int offset,
+					      unsigned long *config);
 	int			(*to_irq)(struct gpio_chip *gc,
 						unsigned int offset);
 
@@ -708,6 +715,8 @@ int gpiochip_generic_request(struct gpio_chip *gc, unsigned int offset);
 void gpiochip_generic_free(struct gpio_chip *gc, unsigned int offset);
 int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config);
+int gpiochip_generic_get_config(struct gpio_chip *gc, unsigned int offset,
+				unsigned long *config);
 
 /**
  * struct gpio_pin_range - pin range controlled by a gpio chip
-- 
2.54.0

