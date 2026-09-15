Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7263655FA
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 08:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459513; cv=none; b=iMF8DXA8ZdeapMzY5tSpY5PSE0KVMxkNCCLL3YOw692apS2izLyfNv++NHv70zLfLD6s6SlrImE8eRBs5iumQibWAY+PGs/avHNJn79VSkxvwVPuypQfM45hiLq/rSEOTJdssunYqk+Cry/SwnuLH1oQ3S3snGa3L323qs3gUS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459513; c=relaxed/simple;
	bh=j2+zPwCu/tcPTMIRdv2LcEAv8lu7jVFYREhBmWgopj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AmoJf9qhmOridS2AkCk0u6tooO9YEf/NOHEvZ15Hx4PnU8X3C9jVg8ImWWD7dA/gx/7shc5zyiqjqAao/e45ajhTF5XazyffwDkMlDwoY0qXW0ENVxbffnqxNk9jr/zxO3HV8/hD4MfvLf7j3fslG53VxBbhT6dddY8nUiAlik8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEchBQSg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEchBQSg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so11483015e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 01:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459507; x=1790064307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zhuxraLn+BRCMp0d+GHEVuibFLIukV2Tl86N4IJdTu0=;
        b=pEchBQSgB1JXW6RxbxRTb5E8RMPc4Mu3UBqgr8OJjNGd5nBPX8bujideEwhAsY9vQG
         X12MZthRla9XhtjTkWhyx+BvrMDASKC5KXu2RV+hIJLRbkPcVfJWTa9L1UEmroDwEr36
         qtFF6IVMqPbWkAW56BImS0WBCMfrFCd27GnMvMNUIWDtDfdfIpmbuzFmF+14JSZADrtf
         Wr4KQDD4p2LwKzJArL6l7N4SeojxdZAYzMUYR9JmfqkPI7FXGtKOhh1FEe1EiW5Qq4CO
         KjDQ6SYNSlpjTBMoAniC8+GCGYW9XH10fwFWar0LQ/nPY3+Vlruot9+SaiwPP/FmjtYl
         9Mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459507; x=1790064307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zhuxraLn+BRCMp0d+GHEVuibFLIukV2Tl86N4IJdTu0=;
        b=EPzRnN9JprViEHLBPDUn79q/MFLCvxWSQkecvCkLrvv3uelGdOAj2S6/LhGdOC2SyD
         S+BZgf1iBSC7+4YJLLtcod2PIa9zJMkR3+EQ89BLVi7NkDHpDvbTdcJToq8LqDESLnqX
         p+XrsIEONA38E1Ae72W6Qan0QRC10ioaSNNB1oqmrFZazA9a0zI8JO9d6HCXLOOFb2mC
         Z4RI5WK33Nh/1iwOmdOOXsKlxbwcieau1q0uZMliglQMNEBq+60a3tqxxXgCo2EUEHRY
         aincO1/7kbY9cOUsbVW2630QyoqL6OEBfnwh37X5cVJTCfwr0jPp7AKxPTC6NpiGeeKP
         ELsA==
X-Forwarded-Encrypted: i=1; AKwUvBz5sG5MLswTTIFrYBlsYkmrllSPPdvDOGQfFZDeaoxCIQ8yEG8imJZxFeb977KK74TCYiDIpXDXNMel@vger.kernel.org
X-Gm-Message-State: AFuF++nKAYyzjzcaHWj0cX7+Dmh9BW6L0eebdnZN2ebHSg2/Eqa/ajJr
	L6UXGmpV2hL6PK4EDijSK3PO09FN2KIQKQAHdfJHJCeprifM0gefh0pS
X-Gm-Gg: AYBFou3hcAsCHKPptrDh484t97Qpq2BXtXKV94BLWv2xKTDPF0ggnJq3Ihi8UDv93wq
	3kq7emreybKzBYHT/Za7MHyu9y1r3De9azAsovmh8AzAbn1Jo1fgrQcq34rvaTVBUL95dGrGwae
	/CdM/SmVZcoO2hhTD8UUtMdefjlP3ziSOUeKmLjlRv43f16ekmbI2I5GfeGSlk4Kk6f5u63cX0p
	RdsSOrQyid5tyWf6tpd6b+TTPjkYzhhwLxiLofizWYYw8jnP7bFjIoOvOd6zJo6m3hfcJoXrxQl
	Jyrr3C0xdsrSt6AtuMcImjcHpNAnv4xrMyymJIGJgU8Tq4zznrS7YwhNTwlKPKzkoh9e7qvpcL5
	bYkdkL53FpkGVbGNc897EQEZ8fvSjuA+cyTg3bmC5GbFB+hvoJXUHjyWi9dAGcXjpvUhAlgt057
	mBycvy5BN69tPrA64JXLralZdLP3ujDIWjD0JOx8gkINujommZfAjykgnLEGoxRyBku2z6wQt6Q
	em8
X-Received: by 2002:a05:600c:860b:b0:49c:dadb:18a7 with SMTP id 5b1f17b1804b1-49e7a6489bemr67096545e9.10.1789459507015;
        Tue, 15 Sep 2026 01:05:07 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d27315csm48588365e9.2.2026.09.15.01.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:05:06 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Haibo Chen <haibo.chen@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
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
Subject: [PATCH v6 3/4] gpiolib: add get_config() and gpiochip_generic_get_config()
Date: Tue, 15 Sep 2026 10:05:00 +0200
Message-ID: <20260915080501.329424-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915080501.329424-1-mehmet.fide@gmail.com>
References: <20260915080501.329424-1-mehmet.fide@gmail.com>
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
implementation, the mirror of gpiochip_generic_config(): a chip without
pin ranges, or a kernel without pinctrl, gets -ENOTSUPP.

Nothing in gpiolib calls get_config() and there is no consumer API; it
is for the chip's own use.

Suggested-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/driver-api/gpio/driver.rst |  7 +++++++
 drivers/gpio/gpiolib.c                   | 21 +++++++++++++++++++++
 include/linux/gpio/driver.h              |  9 +++++++++
 3 files changed, 37 insertions(+)

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
index ef8ccaf17c9c..0586fc1f9564 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2440,6 +2440,27 @@ int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
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
+#endif
+
+	return pinctrl_gpio_get_config(gc, offset, config);
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
2.55.0

