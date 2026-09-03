Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567A7430301
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 07:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420714; cv=none; b=ihJ4mAzymkxxvapZXsgUAsnO+0dAi/8h+76+32lCoSwpUeH6H41+rq8//FZHsviA61mQ9/IboCCbN6rknaBkOxsHFdbREMMeRPvvagKzFpe2p56BfuwZdA7pmZU0A6l7HFI3dsls4UkFjxY97iTfsSjwJaq8+LcaXjymEo47L6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420714; c=relaxed/simple;
	bh=LcxBV1WWEYjZz4fBoSqst6/sNJz9269EPpoabw1fAo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=edqptqWe0BcMZeGCxGw1hCoibzhbenGSg1OXLlC8Q/U3Q7FV/Xrttk4nCMCQhyPNzRGdr2+Zi/tyw9O2HuttxnayXYo8XHdcyl+saT4nbSArkEqCTA748sdxBpB56p5VAockW09Mj02o9VMl298y9kBeI9dm7qPwI5KQxuci2Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYNbG36o; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYNbG36o"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49557167508so19912415e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 00:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788420709; x=1789025509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJKosOcUvZV9Jc2GAPrsEmXq7Dla2XoN1gJbr374+FE=;
        b=BYNbG36om9uK5/Qvd8KI5xKWnfbmQfM7YLLhnNRZ0l3H9hf1tqO/XUl54xvdOkFpZ2
         4Lcit2WZzfzDinhqoVRFuARaytUFKRtCoqXCrUZK9UoIJ+msdxSJEZgRqqmU8oqlHKQO
         gUztR/GyiMyLNKRv1WAmsmwwlSKRZWvv9iDwI6VaTgM0sQZtrB3fRbxQB5N7OFAcIy0M
         dJqRTdmWQjG3izA7r0FmQAvQ7x1WYl6WWNvgDhk9BFTiH3pQQCHwMMOtIGL5Zl968GSS
         78vf4pE1TPipUggOe7wfyyCXmNDTDo6oPPMFKywXnD8+6lGmbxsqwIK4nUJaH41FYPLA
         L5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420709; x=1789025509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJKosOcUvZV9Jc2GAPrsEmXq7Dla2XoN1gJbr374+FE=;
        b=DrKgqZcO+MF+G+uBDMLoGEZqrMOcDwlZWqyUaca2MwrPKuCSA6ABzxt6A4gEButaOd
         Tzi7c10GkJHZKJp3/wmlfHc5OhxhsoMGL/uca8XF3QjCzxTmmcgfk6EFTI7jiQjPZax9
         nrQW/zlp5aHrVQB+oJRERMFRbg0+cTRZOAW5p30pNETnE3BaY7Rm9y1vJlTNnSagIlHh
         d4HkgG9u0RamlAcVYab3oL/t5Kc6uk7bT8BMP/oA5q124kLDaVCtwkSQc+WBl/hOVoY5
         dCeP3GLfgWql7gyxmcpsv+OuTlKGxTkJlQCUEK9juoTH1y6Vb/lEs0gU5pDGgfYnGOF/
         Vq+g==
X-Forwarded-Encrypted: i=1; AKwUvBx+cNtpEduT0i3h2BRp023UawUt9WYxT+BKA9qTsD9c0VuMq4Az5y9u09zeSrgnxANVu9j0J9Wi20PK@vger.kernel.org
X-Gm-Message-State: AFuF++kqbeQqOHBAiPAOqAjg90y7nwmLlTZyOzWGAMnGlz6jfjKnZkWX
	AFgElewkOcebQSzzNoTIIjlDwa5S6et58tiw1u/4f+RfEeaKz0Epqknf
X-Gm-Gg: AYBFou17fZeXUMuqR2u87L9Qdeq2hjeP14p7auAxWE3G+oaDir/funY53qDv221YRoA
	nUIEwyfjj4IG0ThmAZaXzwWkugNm/MuJneHvIqSTgPYV9UaivoHdEEK1twmUhSOvKkJzJ+j9E/R
	aUuYJEOL7ZMHKV4Dn3h1SYy76D1CW2Wh4OR8MG+SJEfB4qgsWvMdr8OrGvSnXJj6uwF4oJuCpmx
	64/puQR7kCpglv7LmXPT6GXn0J9qGMAMgnKnvu4Fmxm8kBW79LJOJCxahB6bD0xqUzfLKHazMO2
	7pyHLWWSt0ehy3xC3G6ek1H9LR994A+lu1fwcOJU4ijCwl+BK1J0dwFIfQxFbC1j4p+W5IEl/L9
	kkvf9DDSAiydhW2zkGWysV+Asx9lrgoo+xGoSXkWUTZRtC1qMCZfGAWNCYamOU3+0MfCIKoGH+R
	VaD9OyIkCJT7PT06/j7YMhqyaxrzNh/dPfi5TJP+SoLads1g8nbLIpvcdHioujzO7CbA==
X-Received: by 2002:a05:600c:548b:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49ce5821208mr144915075e9.7.1788420708055;
        Thu, 03 Sep 2026 00:31:48 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce551bf7asm69369455e9.2.2026.09.03.00.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:31:47 -0700 (PDT)
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
Subject: [PATCH v4 2/3] gpiolib: add get_config() and gpiochip_generic_get_config()
Date: Thu,  3 Sep 2026 09:31:42 +0200
Message-ID: <20260903073143.2068494-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903073143.2068494-1-mehmet.fide@gmail.com>
References: <20260903073143.2068494-1-mehmet.fide@gmail.com>
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
query and returning the packed answer the way pinctrl_gpio_get_config()
does, and gpiochip_generic_get_config() as the pin control backed
implementation, the mirror of gpiochip_generic_config(). Without
CONFIG_PINCTRL the pinctrl stub returns 0 and leaves the config alone,
so the helper answers -ENOTSUPP there instead.

Nothing in gpiolib calls get_config() and there is no consumer API; it
is for the chip's own use.

Suggested-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 Documentation/driver-api/gpio/driver.rst |  6 ++++++
 drivers/gpio/gpiolib.c                   | 23 +++++++++++++++++++++++
 include/linux/gpio/driver.h              |  9 +++++++++
 3 files changed, 38 insertions(+)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index a4f160b95089..5be217815c9b 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -134,6 +134,12 @@ ending up in the pin control back-end "behind" the GPIO controller, usually
 closer to the actual pins. This way the pin controller can manage the below
 listed GPIO configurations.
 
+The optional .get_config() callback reads a configuration back with the same
+packed format: the parameter to query goes in, the packed parameter and
+argument come out. gpiochip_generic_get_config() is its pin control backed
+counterpart. Nothing in gpiolib calls it; it is for the GPIO driver's own use,
+for example to learn the direction of a line when the pin controller owns it.
+
 If a pin controller back-end is used, the GPIO controller or hardware
 description needs to provide "GPIO ranges" mapping the GPIO line offsets to pin
 numbers on the pin controller so they can properly cross-reference each other.
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ef8ccaf17c9c..44328aed1646 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2440,6 +2440,29 @@ int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_config);
 
+/**
+ * gpiochip_generic_get_config() - read back the configuration of a pin
+ * @gc: the gpiochip owning the GPIO
+ * @offset: the offset of the GPIO to query
+ * @config: the packed parameter to query, replaced by the packed answer
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
index 17511434ed07..5c81cce69173 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -359,6 +359,10 @@ struct gpio_irq_chip {
  * @set_config: optional hook for all kinds of settings. Uses the same
  *	packed config format as generic pinconf. Must return 0 on success and
  *	a negative error number on failure.
+ * @get_config: optional hook to read back a setting. Uses the same packed
+ *	config format as generic pinconf: the parameter to query goes in, the
+ *	packed parameter and argument come out. Must return 0 on success and a
+ *	negative error number on failure.
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

