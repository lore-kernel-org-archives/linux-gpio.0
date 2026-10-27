Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098251;
	b=YHQtlrCHg1+3UgdIfOs7WtY8hF4ir8yGCh2y8g0WJ4mRd/zbKGdo9AI+AWT48hj8R+GV
	 i3Ocu34RFzcy03WAhvENAczeHNCd1Awq7Hj7BfffaKgvEF8hxBGRLEOYdEByKJBCSAfzd
	 Zk/+K/CZjuLzTBuL8+O3bKnA+UWFvWaEwwrOEbLisE7ws3lFw63/g+lfw5aTjCR6tXR0V
	 HWRr0H8bdwBxVPOMOeAOmRgxUTFCQfk7jGiF7JLu0FPK9YJ5yLz0a+D9lIE8cpwjYkphK
	 KXJbtTiZUSdeRlf2R9+3YsQeobOW+e49oIqd3T4p/vjhPLHHhoWqpMZ12TcGqKPYnLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=6CzQSR2Mr9KQQooh036x28O9hJJYMD9oyrD3pTQshjY=;
	b=W/EDu9d5kHi1Qmmf1yOxP/Jmwfa26NIwGmjKeoDnWF8W55HxpKnCAcWSGGkqoUCUanA5
	 ejO59i9oVSf56lHXFmLQ8vw6evJMeOyNJ6GYpcmiYzu2F7WWP7BFNSXJT7hngbLW7eALO
	 rbRDyrzkXJWk7GJATkiIXbMdUrSTwMQyBBPtfAEjgNF6IqJQSgkGTy6kYKz5ALG8VcyDI
	 HoYI6U/UDe6pwECe1wdN7uedYaxKQKX3IMTBfCjoxasov4vJCVasXomHlwMGB+/1Kydrt
	 W1gs6ohqzklihGH4qASRF1tz60grhQmcGMnQFvS5u8BtYu8oH0vq58njn5uRjQN4/pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ENfDYKSn;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE7D606B78B
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 10:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FE7D606B78B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ENfDYKSn
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so23009645e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 03:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098250; x=1793703050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6CzQSR2Mr9KQQooh036x28O9hJJYMD9oyrD3pTQshjY=;
        b=ENfDYKSn8uhaKH+GzAL0z2iDmpeq9HC8nVRfYxKZi5C0w6qyOwRYXBcx5oZdXgBOjy
         atEH6XIRDY7z5ZQRgb2/GLOBA7K0KQoocqi+xOz1d1dz6JDnKcyEizcT2puGSSH8DpSy
         JjKoavNTrwUcBeuRsF77amRi/nOKpFqSue9oLfg997Q4TsY1wj3BTIehO5ucyJuzC2fm
         1ISKs5cAM7NXjlPEHsEB/ej2K4Gnfanm9lNtGaC1IgprvdVmfdnhF4RyopEieHdbYhqf
         moduiP09i8V1dUMlhzY5/LAN16DRzYdxzWeqk7F8OMHC9jxClidxn0anrIl7dqbWS50x
         3vcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098250; x=1793703050;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6CzQSR2Mr9KQQooh036x28O9hJJYMD9oyrD3pTQshjY=;
        b=BBmWC9hHHNGO+SjHPtOsMdmJ5QuQr2Bcf0qqmjD6yxCrqQs2/Rm0JeHjz28c8lZMwh
         F/dI7EfxndKNf5bkAwgb7RaB0We08Tiw0PPFLLlDqrujp36+Rf13fA/+3IPUsNdNdpi7
         bPx4DYfLZ/EmdzJU40w3tlURWihzdTQ+P/AurEVOSApSaI0v9mCIv3sXJBxvvdavcGvJ
         uXnrFb0NBjmeV48GQFH8yKyE1K85qcfIhjEavHb8UG62RTlKNGr3T+4vrmbuywZVy2/P
         pDW+rkPEPQm0sqrGTmXWJXc5/HlqBIgRzoIH9nO5qn28CPy1+2F/CsM7uDwGpcpMIuFj
         ZVIg==
X-Forwarded-Encrypted: i=1; AKwUvBziSDP/bf9uHm4kSIe8AmGYZ/Jsonn1mVGxadvvkV8UR4WbwVLxA1rRG95GGx9QU0e/k8WuJr/wuDos@vger.kernel.org
X-Gm-Message-State: AFq9FYItsrt2ii3oCBXtKvhslPkeSTfV5q/noKB0oXeH20hnb+e9g6UH
	KwWCRMyzCLXbxswsYpGsXoDh09uBMaynYGI71ZQguuaHB/Dik7TcBZIFbx4s1OxoTVQ=
X-Gm-Gg: AYBFou0AukAO5/SYlDFXHdXaXAFZ9m8O0zSz0y8G9O6NKooWoZ2H7JRDQkeU1Pn5zPd
	uktTXW0fqdBAPN3gyKY7h9Mx2cax0HXdVyR5GXP9G1oUoJKomMyvtPMb215T8WR8fUu8D1Xwg+E
	udldmjzV4ndxAD4uRAzFYZEbmnpahZt918/oUNn1lQy3AoV6pVpgOrxW9Fp2ZRLQYGNhWkyuewp
	0tqczQKCI9RA3cwRucixgoQJWhNvCAdr2fpXK9Nf6krrkvhfbSUeXXilj0f7A8O5coTitMNo6ho
	JSSVvcsR7im7kLK+oP8RnlKKH3eYtGI2JPAyG78mf6bL85aVjdppH4wYmA8CVcy/zXF254aF8N6
	7j8KVHqRkc61fX6Wgpnafcz+2XXT0vtt5T5JjIUagqB3NyGMX9LffnQl3agbfZiZtYTmcRV3WOK
	yB77eZVDHFl2n1nukOJdbu0wKeF09qQzMOcnapkMnXzAFpB1nOoEx/4Ns8lhqIRtaraveDCw3XE
	yqnm9/iiVhVln9jhqSIs1OjrB0rjP7tvewnGM5ZFFpEXrJNRMi320fWlRdXy3siyYSarwoXLjAH
	BIjtLZCkd6jUtdAebvAwii8fNHrT3yTyH/roExZeVNAE
X-Received: by 2002:a05:600c:4fc8:b0:4a8:cb23:f71b with SMTP id 5b1f17b1804b1-4a8cb23f9b4mr5095015e9.18.1793098249732;
        Tue, 27 Oct 2026 03:50:49 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a0a9cafsm275349205e9.5.2026.10.27.03.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:49 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v4 18/23] gpio: Unify style of acpi_device_id arrays
Date: Tue, 27 Oct 2026 11:48:55 +0100
Message-ID:  <7a0486cce391b8af37eda4b3b976fdfacd3714af.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7445; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xecV7P6Tu5XHFl5UH4gpYV2pLRSEwcVsWkWhxPVL700=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IHO/yZJvOoMpXlEFS7tgqKuSom88PszB9mFs V0MW8PIBECJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBzgAKCRCPgPtYfRL+ Ts+pB/9SbUDUCRJAvItOF61OFctWOaDy8lf8DtxqMcrJgFnsPxzLI927ESbvmGZxsMA0/eO0tXh FUSkmnGJbiBTFwF/K6NFk9wBjtqETssm9CM4k9BsEXuNOyN8T8l5OTPnMb+V7NP+fSL6xNseEgW IH/2jAWbP97+F4FSaNzJgrSD9Hk1e8PrZ8pnuPYDJzWKN1Aelz+rnKIuw+OgplLuKUVAx81FKLR +vlfLjmSx39tHfy9jim7CE8SjT6chgHn/q0aXq/Edd79W+DSFUkBkHE4PiIAcQKBo3wV+an2ZUQ tBtnMVD+xk+ErVTGvlIg3SliCRFK6iMK+2aRG3kKd2EBP8Ip
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Update the various acpi_device_id arrays to conform to the most used and
generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the few offenders accordingly. Additionally sort the entries by
.id.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-amdpt.c           | 2 +-
 drivers/gpio/gpio-dwapb.c           | 2 +-
 drivers/gpio/gpio-graniterapids.c   | 2 +-
 drivers/gpio/gpio-hisi.c            | 2 +-
 drivers/gpio/gpio-loongson-64bit.c  | 2 +-
 drivers/gpio/gpio-mlxbf.c           | 2 +-
 drivers/gpio/gpio-mlxbf2.c          | 2 +-
 drivers/gpio/gpio-mlxbf3.c          | 2 +-
 drivers/gpio/gpio-novalake-events.c | 2 +-
 drivers/gpio/gpio-tegra186.c        | 2 +-
 drivers/gpio/gpio-xgene-sb.c        | 2 +-
 drivers/gpio/gpio-xgene.c           | 2 +-
 drivers/gpio/gpio-xlp.c             | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-amdpt.c b/drivers/gpio/gpio-amdpt.c
index 32c4d0ee8101..74b40e2c3485 100644
--- a/drivers/gpio/gpio-amdpt.c
+++ b/drivers/gpio/gpio-amdpt.c
@@ -128,7 +128,7 @@ static const struct acpi_device_id pt_gpio_acpi_match[] = {
 	{ .id = "AMDF030", .driver_data = PT_TOTAL_GPIO },
 	{ .id = "AMDIF030", .driver_data = PT_TOTAL_GPIO },
 	{ .id = "AMDIF031", .driver_data = PT_TOTAL_GPIO_EX },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, pt_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index e159c3f98f1c..3b24daabcf0f 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -720,10 +720,10 @@ static const struct of_device_id dwapb_of_match[] = {
 MODULE_DEVICE_TABLE(of, dwapb_of_match);
 
 static const struct acpi_device_id dwapb_acpi_match[] = {
-	{ .id = "HISI0181", .driver_data = GPIO_REG_OFFSET_V1 },
 	{ .id = "APMC0D07", .driver_data = GPIO_REG_OFFSET_V1 },
 	{ .id = "APMC0D81", .driver_data = GPIO_REG_OFFSET_V2 },
 	{ .id = "FUJI200A", .driver_data = GPIO_REG_OFFSET_V1 },
+	{ .id = "HISI0181", .driver_data = GPIO_REG_OFFSET_V1 },
 	{ .id = "LECA0001", .driver_data = GPIO_REG_OFFSET_V1 },
 	{ }
 };
diff --git a/drivers/gpio/gpio-graniterapids.c b/drivers/gpio/gpio-graniterapids.c
index 6a77a5864d09..72be289c65fa 100644
--- a/drivers/gpio/gpio-graniterapids.c
+++ b/drivers/gpio/gpio-graniterapids.c
@@ -395,7 +395,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(gnr_gpio_pm_ops, gnr_gpio_suspend, gnr_gpio_resu
 
 static const struct acpi_device_id gnr_gpio_acpi_match[] = {
 	{ .id = "INTC1109" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, gnr_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index 1a89695ce515..f03df71e3296 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -223,7 +223,7 @@ static void hisi_gpio_init_irq(struct hisi_gpio *hisi_gpio)
 
 static const struct acpi_device_id hisi_gpio_acpi_match[] = {
 	{ .id = "HISI0184" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, hisi_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index 0fdf15faa344..d76c3cf177d1 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -556,7 +556,7 @@ static const struct acpi_device_id loongson_gpio_acpi_match[] = {
 		.id = "LOON000F",
 		.driver_data = (kernel_ulong_t)&loongson_gpio_ls3a6000_data,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, loongson_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-mlxbf.c b/drivers/gpio/gpio-mlxbf.c
index b6a460363d01..f07dca415b70 100644
--- a/drivers/gpio/gpio-mlxbf.c
+++ b/drivers/gpio/gpio-mlxbf.c
@@ -134,7 +134,7 @@ static int mlxbf_gpio_resume(struct platform_device *pdev)
 
 static const struct acpi_device_id mlxbf_gpio_acpi_match[] = {
 	{ .id = "MLNXBF02" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 62d9ffb7b41e..3a0010fa6760 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -452,7 +452,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(mlxbf2_pm_ops, mlxbf2_gpio_suspend, mlxbf2_gpio_
 
 static const struct acpi_device_id mlxbf2_gpio_acpi_match[] = {
 	{ .id = "MLNXBF22" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf2_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index 96c40f745320..33efa819061b 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -274,7 +274,7 @@ static void mlxbf3_gpio_shutdown(struct platform_device *pdev)
 
 static const struct acpi_device_id mlxbf3_gpio_acpi_match[] = {
 	{ .id = "MLNXBF33" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf3_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-novalake-events.c b/drivers/gpio/gpio-novalake-events.c
index d5a3bd48bed3..113a4069120a 100644
--- a/drivers/gpio/gpio-novalake-events.c
+++ b/drivers/gpio/gpio-novalake-events.c
@@ -305,7 +305,7 @@ static int nvl_gpio_probe(struct platform_device *pdev)
 
 static const struct acpi_device_id nvl_gpio_acpi_match[] = {
 	{ .id = "INTC1114" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, nvl_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 34e084c95d7a..50de4bf20a5a 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -1617,7 +1617,7 @@ static const struct acpi_device_id  tegra186_gpio_acpi_match[] = {
 	{ .id = "NVDA0608", .driver_data = (kernel_ulong_t)&tegra241_aon_soc },
 	{ .id = "NVDA0708", .driver_data = (kernel_ulong_t)&tegra410_compute_soc },
 	{ .id = "NVDA0808", .driver_data = (kernel_ulong_t)&tegra410_system_soc },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, tegra186_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index 6f2907468507..30b6e9f3f8ba 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -340,7 +340,7 @@ MODULE_DEVICE_TABLE(of, xgene_gpio_sb_of_match);
 
 static const struct acpi_device_id xgene_gpio_sb_acpi_match[] = {
 	{ .id = "APMC0D15" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, xgene_gpio_sb_acpi_match);
 
diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 84c1cc165024..f4adf2962557 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -196,7 +196,7 @@ MODULE_DEVICE_TABLE(of, xgene_gpio_of_match);
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_gpio_acpi_match[] = {
 	{ .id = "APMC0D14" },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, xgene_gpio_acpi_match);
 #endif
diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index 50625f98f8e2..d659112d7f1c 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -306,7 +306,7 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 static const struct acpi_device_id xlp_gpio_acpi_match[] = {
 	{ .id = "BRCM9006" },
 	{ .id = "CAV9006" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, xlp_gpio_acpi_match);
 #endif
-- 
2.56.0.rc1

