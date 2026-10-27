Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098241;
	b=b3AgIELbEhvRngGhmvhphIifgAB1BAmTKAWW4WwSdua85hAhe8fYb0Bl+csjZVnrSSk+
	 g5c295uiGD/6zQBjZPldkSEbp3zxdoarYugzXSXEJU9s3JjB9AqVaVxkK0nkFbLVIeB8f
	 fS6f3/ecdjuRfLM1Tzzm7FuCZGBjI9WH/43SPpZu04spqIkKswZ7c8M5ba/U6sz8gX4RH
	 tEcJXtG8FRX1KIlkX9X6cGY5EVn4j8/RlVdL66aV3eZVWNOLTWnooVoDJU1Fl/M7jlNQ8
	 xf0/dkkpctdIf+8h9IjdAXrJ0UiA0L5JApIIOGDDUJg1eMPw9sPWDxL4KWPxddBInEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=akP3a91ASLrcbUz3Gca86EVegYF5hLtx7viYyYgaUSk=;
	b=CGgnSqIJJNwBxPdS0Z+CZkaxiR9jbLbtQQtnFlf+iDwd0WkuiNOgHv03NAYEHVp07O1R
	 /CdpBy6xhC40UiMGvGsu4LWzDRHYIReiER2T2j3VRiuvspXvApkbkfxhxsMz/rvQiA4Ea
	 4lyOP7/d0xKn1VXhCjT/yLYL9nMTrSPyST3iHOmczQIR0wGXGQU7eSdf9gMgjy1F7g1Gy
	 kl73SBgs0lIey05nzLpC12uzkO0M10ljM455qVEGvL3gqvHgg7kJzyZ/6q1noRz8bQU7d
	 jUy92bQdh2OxoovBETzilNwJP+IG29fAg09lU6PiBlOxBEUMo3aYFutOveUqkxS2p8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aaw4aiZB;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F818606A328
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 10:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F818606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aaw4aiZB
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so22084605e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 03:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098240; x=1793703040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=akP3a91ASLrcbUz3Gca86EVegYF5hLtx7viYyYgaUSk=;
        b=aaw4aiZBLq7VkZTEB/13yeOyJkGKRSQS1Vz5EknBBiHzrQCvv33xk58ptyp4xaVQTT
         YdPGGUo3Jrcq1mjamKuqTOBTSvDJYVGCzylLP7HTW6uI0JWrYFJ07s3KsgcmCYKLlPU7
         DGC8yThHNC/GBvkMy+NrzO+zDjIOAUjnkfk+xIkgctn4NouDZ1hXSI8YFoJ+Em/p0/it
         aM0zDNALQ6B0Phbz+icnrbIWIZeKa4ZajtvGwaJZ2fHYvoM6y/xQ5cyghsoVwXbwsfDI
         1if0wwnvRlz86XHLZpfhA2HvDZpMWhy3L0fztmhlV1xdJ+YtWDQQvRd72J2nAMN0tJkx
         3bHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098240; x=1793703040;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=akP3a91ASLrcbUz3Gca86EVegYF5hLtx7viYyYgaUSk=;
        b=TnLPzkLmKD0mRr8hd3nvwHLMk7RaisOYeq2cAyAH6PNUW/9LLQ/IdO3pouiCLKnkoU
         lOGeLXtiOtb1OASV655rMkCKhY+/DMFghN+IcYWNZOtwOW3zMS4ndadDpPKPeAG5iLO+
         4x49Hql7gjwAIl6waxmMAdX29AnhI0+9Mx7vulBn1KO4jO4EfYkkTFRnXJT9T3osOMDC
         AJs8doIV2QCFylIJGj7jooIUrvOddrJy6rKdJP92fjiDDUC1MpZr3wXv8BAIr/rRaLUP
         pAwCsvBe6/bgEwvmM8rszMmSe6j9kFwuplejcRjVJpXLNMAYav/IhFzryTydAYzuIMiU
         mzyA==
X-Forwarded-Encrypted: i=1; AKwUvBw7hwNkLNLQxaS8kJgdQY/Yu5q/6IYsYjZ88LxskdsWvThrZ/y6PFWG8KQtP3jU4mMCIQF/rkKvpd84@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ0Tun1/vBAhyvBb0RDIRAG8gTGmMcMaZMyPmXQH+q7h4reS/y
	xp69Ic4wwF91xNlLC/01ekrINvAGgkI5gS/rsrHvNO2Yh7GIpz4VCY7buDnSxriylD8YLDTdOkI
	E/py/WJM=
X-Gm-Gg: AYBFou1fyExRKYHa58aPGc0hbXHRGIR0Pb2xjxeUmAL39Xy1sb2SQu+RYMSEm+yCMHb
	wKFZG4pmzkO1OhTVFqBTXN5zBztYXgNU7C9GbELCKPk+WD/0JtZXFoEYoE3PAwWMcidOJSllSP+
	72sL+N2CAPdWIsaxxjJxvvqg21bD/51VvtbXKwb+vze/TKjIScWi+yoiSscfzGUfWb2PObSab5j
	ytycP+kR4fgx08jVw6EnbqxRK7qcthFyi0QvxV243vCJxHFwuYeicWFBRU1H8EjV7is7pVffLGZ
	/rhdLThyGWy1OiiXKvo3koH1J3npxV3JkXbGZ5QYJxgyWbagJZA7e7FNAlv48RMqO5OZWlvu97o
	+bUftXp9IXj8YdBaAdXKGU4LiYwYG+aBPDitrWuB6ItvcFI428yo2h1xVUIg/h3xe7sDBTVSy/Q
	gAiifDBF+R/9hpuY+BnnaWOu4Johh/i0GcxJxud9FwN1+6GoUIvRP0cvXpVuJ0gZPkkwPLlI70A
	Fs6P9RbJxrdU1jV81xJpQDt2i8NCD52V1C1CqzNWrvxxS2hll4bf3hiLVYP2JmohJ4NWTQU/HNR
	WG2IILaZI5a611sO8wskYjNG/z+HDuITupeKMt/oqy0=
X-Received: by 2002:a05:600c:c098:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4a5018d1340mr118752415e9.23.1793098239637;
        Tue, 27 Oct 2026 03:50:39 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a0bae01sm319025215e9.7.2026.10.27.03.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:39 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 12/23] gpio: Use named initializers for acpi_device_id array
Date: Tue, 27 Oct 2026 11:48:49 +0100
Message-ID:  <8813ad9f30c4127f48c82b1a14a8e8e1c4f1d2a5.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9364; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=LqCaeYlVkMqOi2hn/8QGrW/4N0F0mxLWNGfGZ3YBqJA=; b=owGbwMvMwMXY3/A7olbonx/jabUkhqwHjdv//v1qFX/PM3eNz+WVRkcXaWqHbChhni1taNPn+ /YDt5ZkJ6MxCwMjF4OsmCKLfeOaTKsqucjOtf8uwwxiZQKZwsDFKQAT6axl/2e48MRsV97clnkZ Tdobv9fN0rGzPCus8ixng5+AA+OrW0nN8z79/vjvw8YHbOuj262t+uwnsR/amJ58S+k4t2Fn22t xo8aXd299mqiesbc0ZVd7eueB5Z8Mpa/s+X3XtipWSueEAPNUvxMWrFIP2nbo3VtitfyxSAH7zK iEJ1lGBQ+iQrbOM1K8fyTs38/26486AxImiL5prOeea+b/8t4DOyHLhF3Mzr3X/ERKtrCZVUn8M /1wtvXCbvGnC2SNM1W7SrprVUwD2XszUxTYd207eoUzvj5uqdTaCfZhd5atql5i+ipRWFU4Zp/E SZ48nexfKfuLBPOs79W7f+70VSsMvLAi9pNjp5+6SEUDAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
acpi_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com> # gpio-usbio
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-amdpt.c           |  6 +++---
 drivers/gpio/gpio-dwapb.c           | 10 +++++-----
 drivers/gpio/gpio-graniterapids.c   |  2 +-
 drivers/gpio/gpio-hisi.c            |  2 +-
 drivers/gpio/gpio-mb86s7x.c         |  2 +-
 drivers/gpio/gpio-mlxbf.c           |  2 +-
 drivers/gpio/gpio-mlxbf2.c          |  2 +-
 drivers/gpio/gpio-mlxbf3.c          |  2 +-
 drivers/gpio/gpio-mpc8xxx.c         |  2 +-
 drivers/gpio/gpio-novalake-events.c |  2 +-
 drivers/gpio/gpio-pca953x.c         |  2 +-
 drivers/gpio/gpio-usbio.c           | 12 ++++++------
 drivers/gpio/gpio-xgene-sb.c        |  2 +-
 drivers/gpio/gpio-xgene.c           |  2 +-
 drivers/gpio/gpio-xlp.c             |  4 ++--
 15 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/gpio/gpio-amdpt.c b/drivers/gpio/gpio-amdpt.c
index 8458a6949c65..32c4d0ee8101 100644
--- a/drivers/gpio/gpio-amdpt.c
+++ b/drivers/gpio/gpio-amdpt.c
@@ -125,9 +125,9 @@ static int pt_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id pt_gpio_acpi_match[] = {
-	{ "AMDF030", PT_TOTAL_GPIO },
-	{ "AMDIF030", PT_TOTAL_GPIO },
-	{ "AMDIF031", PT_TOTAL_GPIO_EX },
+	{ .id = "AMDF030", .driver_data = PT_TOTAL_GPIO },
+	{ .id = "AMDIF030", .driver_data = PT_TOTAL_GPIO },
+	{ .id = "AMDIF031", .driver_data = PT_TOTAL_GPIO_EX },
 	{ },
 };
 MODULE_DEVICE_TABLE(acpi, pt_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index aa7c08e60707..e159c3f98f1c 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -720,11 +720,11 @@ static const struct of_device_id dwapb_of_match[] = {
 MODULE_DEVICE_TABLE(of, dwapb_of_match);
 
 static const struct acpi_device_id dwapb_acpi_match[] = {
-	{"HISI0181", GPIO_REG_OFFSET_V1},
-	{"APMC0D07", GPIO_REG_OFFSET_V1},
-	{"APMC0D81", GPIO_REG_OFFSET_V2},
-	{"FUJI200A", GPIO_REG_OFFSET_V1},
-	{"LECA0001", GPIO_REG_OFFSET_V1},
+	{ .id = "HISI0181", .driver_data = GPIO_REG_OFFSET_V1 },
+	{ .id = "APMC0D07", .driver_data = GPIO_REG_OFFSET_V1 },
+	{ .id = "APMC0D81", .driver_data = GPIO_REG_OFFSET_V2 },
+	{ .id = "FUJI200A", .driver_data = GPIO_REG_OFFSET_V1 },
+	{ .id = "LECA0001", .driver_data = GPIO_REG_OFFSET_V1 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, dwapb_acpi_match);
diff --git a/drivers/gpio/gpio-graniterapids.c b/drivers/gpio/gpio-graniterapids.c
index 2d0fe3abd5e0..6a77a5864d09 100644
--- a/drivers/gpio/gpio-graniterapids.c
+++ b/drivers/gpio/gpio-graniterapids.c
@@ -394,7 +394,7 @@ static int gnr_gpio_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(gnr_gpio_pm_ops, gnr_gpio_suspend, gnr_gpio_resume);
 
 static const struct acpi_device_id gnr_gpio_acpi_match[] = {
-	{ "INTC1109" },
+	{ .id = "INTC1109" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, gnr_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index 3b65ed4592ee..1a89695ce515 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -222,7 +222,7 @@ static void hisi_gpio_init_irq(struct hisi_gpio *hisi_gpio)
 }
 
 static const struct acpi_device_id hisi_gpio_acpi_match[] = {
-	{ "HISI0184" },
+	{ .id = "HISI0184" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, hisi_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-mb86s7x.c b/drivers/gpio/gpio-mb86s7x.c
index 78bcae130e0e..58915ffb4bfe 100644
--- a/drivers/gpio/gpio-mb86s7x.c
+++ b/drivers/gpio/gpio-mb86s7x.c
@@ -213,7 +213,7 @@ MODULE_DEVICE_TABLE(of, mb86s70_gpio_dt_ids);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id mb86s70_gpio_acpi_ids[] = {
-	{ "SCX0007" },
+	{ .id = "SCX0007" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(acpi, mb86s70_gpio_acpi_ids);
diff --git a/drivers/gpio/gpio-mlxbf.c b/drivers/gpio/gpio-mlxbf.c
index b2a7a41f1437..b6a460363d01 100644
--- a/drivers/gpio/gpio-mlxbf.c
+++ b/drivers/gpio/gpio-mlxbf.c
@@ -133,7 +133,7 @@ static int mlxbf_gpio_resume(struct platform_device *pdev)
 #endif
 
 static const struct acpi_device_id mlxbf_gpio_acpi_match[] = {
-	{ "MLNXBF02" },
+	{ .id = "MLNXBF02" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 70b6a5413a86..62d9ffb7b41e 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -451,7 +451,7 @@ static int mlxbf2_gpio_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(mlxbf2_pm_ops, mlxbf2_gpio_suspend, mlxbf2_gpio_resume);
 
 static const struct acpi_device_id mlxbf2_gpio_acpi_match[] = {
-	{ "MLNXBF22" },
+	{ .id = "MLNXBF22" },
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf2_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index 4c10a78e428e..96c40f745320 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -273,7 +273,7 @@ static void mlxbf3_gpio_shutdown(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id mlxbf3_gpio_acpi_match[] = {
-	{ "MLNXBF33" },
+	{ .id = "MLNXBF33" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf3_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index ee35da06cbc7..e79312a7d5a4 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -486,7 +486,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(mpc8xx_pm_ops,
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id gpio_acpi_ids[] = {
-	{"NXP0031",},
+	{ .id = "NXP0031" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, gpio_acpi_ids);
diff --git a/drivers/gpio/gpio-novalake-events.c b/drivers/gpio/gpio-novalake-events.c
index b3bf0038f84a..d5a3bd48bed3 100644
--- a/drivers/gpio/gpio-novalake-events.c
+++ b/drivers/gpio/gpio-novalake-events.c
@@ -304,7 +304,7 @@ static int nvl_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id nvl_gpio_acpi_match[] = {
-	{ "INTC1114" },
+	{ .id = "INTC1114" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, nvl_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index afec5ec23696..77b447c0fea5 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -180,7 +180,7 @@ static const struct dmi_system_id pca953x_dmi_acpi_irq_info[] = {
 #endif
 
 static const struct acpi_device_id pca953x_acpi_ids[] = {
-	{ "INT3491", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
+	{ .id = "INT3491", .driver_data = 16 | PCA953X_TYPE | PCA_LATCH_INT },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, pca953x_acpi_ids);
diff --git a/drivers/gpio/gpio-usbio.c b/drivers/gpio/gpio-usbio.c
index 489c8ac6299e..e34734aa4365 100644
--- a/drivers/gpio/gpio-usbio.c
+++ b/drivers/gpio/gpio-usbio.c
@@ -26,12 +26,12 @@ struct usbio_gpio {
 };
 
 static const struct acpi_device_id usbio_gpio_acpi_hids[] = {
-	{ "INTC1007" }, /* MTL */
-	{ "INTC10B2" }, /* ARL */
-	{ "INTC10B5" }, /* LNL */
-	{ "INTC10D1" }, /* MTL-CVF */
-	{ "INTC10E2" }, /* PTL */
-	{ "INTC1116" }, /* NVL */
+	{ .id = "INTC1007" }, /* MTL */
+	{ .id = "INTC10B2" }, /* ARL */
+	{ .id = "INTC10B5" }, /* LNL */
+	{ .id = "INTC10D1" }, /* MTL-CVF */
+	{ .id = "INTC10E2" }, /* PTL */
+	{ .id = "INTC1116" }, /* NVL */
 	{ }
 };
 
diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index 3675456b1e9b..6f2907468507 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -339,7 +339,7 @@ static const struct of_device_id xgene_gpio_sb_of_match[] = {
 MODULE_DEVICE_TABLE(of, xgene_gpio_sb_of_match);
 
 static const struct acpi_device_id xgene_gpio_sb_acpi_match[] = {
-	{ "APMC0D15" },
+	{ .id = "APMC0D15" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, xgene_gpio_sb_acpi_match);
diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index b34b0c58b67c..84c1cc165024 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -195,7 +195,7 @@ MODULE_DEVICE_TABLE(of, xgene_gpio_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_gpio_acpi_match[] = {
-	{ "APMC0D14" },
+	{ .id = "APMC0D14" },
 	{ },
 };
 MODULE_DEVICE_TABLE(acpi, xgene_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index aede6324387f..50625f98f8e2 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -304,8 +304,8 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xlp_gpio_acpi_match[] = {
-	{ "BRCM9006" },
-	{ "CAV9006" },
+	{ .id = "BRCM9006" },
+	{ .id = "CAV9006" },
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, xlp_gpio_acpi_match);
-- 
2.56.0.rc1

