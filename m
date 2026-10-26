Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032190;
	b=vtg1PGhP3vX1jRXEiimoU4DWnhjNjMLq5mYGk3xdsNeV8RpCU/Sn3s8G+UR2ivkNd9jb
	 kTRSKqo7kY1t9k/ZUkpKaRAdJ+4k7MgFU+/tiZpB/RiDMb9O2xs8lLGgc2tqoCmjR7K0B
	 e9XDKp6M9bq84zxVsYE8dNJSdKoJUb5yAOaqafN+DYChAuUEeVsTeswpcTTtQLds6pwru
	 Nf8GvpDx/JJHKMx/oXavD0tFKr2Hak26shtM7SEYtn5QAmwOLPE76oGLi/upqq6d1srTc
	 xwEawtMc73ul5tRxzC2fqhEcaNRJiCMILIAWms/nUPUIsys18v1cJFUB0P5lM86VGNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=1lFPT45Zw6uc9EQ6HuofQ+tA1VlCJAYEDfHGwrz0ebc=;
	b=dQiLsA3uOba9vK357Vb0muaHEcp/h/LqaouANHeVtEdT8BqHp4k8ZzBPTGlNJshW1jO1
	 oY1Mqddp6Zx+9k1kXX6KjYiMcrOP6SrG364FKcGajEbELFoP8x3RtYDPEeOKTfCO0Zhkb
	 qgABl3/FOGa1aA7Z7K3pUAUjEZQam/9+xx5yrfvGqWpUV4/dOwDwIaSmGTIEYhelhz8ki
	 /4rZHTrOkbrMciKBM4dZj+neKOHmq5Dj4Y+iicykt7X5LYyTAqiilBzd5s5S/b/IZwm22
	 94WKSE0Km4aGMK3Yt6fvGkipdAYhFYp8knz7OCPGWyF3YsElXsw2E3Xac6PSelRDoaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pk0p0oau;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EEC606A328
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 16:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8EEC606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pk0p0oau
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso2367889f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 09:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032188; x=1793636988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1lFPT45Zw6uc9EQ6HuofQ+tA1VlCJAYEDfHGwrz0ebc=;
        b=pk0p0oauRis3BOsus+e8zDm0fTEruY+z2g2HZDiLFtXt2+HZ7DvrOOt2HrnE8mbD1v
         Mi51GyskGmvT9h4DE0a6yJo98KIWVyy8tf8bk+cuLWkGKvcvBz50RvsFWREwEe3J6TG2
         zN8HcNX4rsqMWXZHBCYNJRdBzAOXaQxu7MyGnJqPh3yxQvq4zMVLCVOknLjRpNdvuxIX
         GUlFwuUPBS5x4L26ry26Bo/56yvvd0MnzutNTTx/RArbbULms6kPga1EkcDRNGYLExiH
         Fk8n1Muj8Q5YVeCoU6a1GZ1bzwuTjc0wclE6kHyOOcxUmduMfdwD7nydjK9ObDfdjbAe
         V3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032188; x=1793636988;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1lFPT45Zw6uc9EQ6HuofQ+tA1VlCJAYEDfHGwrz0ebc=;
        b=f9/0tpVKCNN0LRMrlobwSapwp73P+HDimaQrNoX/Wml9Bzd1CeSh8gv8Y94gXLPP7V
         wkmnRpzAaXxGHwt37zd7jAQD5WiMBKSgYbdcxQ8bwR0N9oNMO2/gQaDeVYtI+B5vVMJd
         EypyoOCAEtiLEMk476OesF9bMwDrTXrhslm3Y7Bt7089/H1U8Wb5c2dFXy6heB0ALK/8
         9jFJo1Ix+mkMvyK50243i/Aw82vJPZcKP8WMsYheBmTsLo6hTFsXYDOuJKZ3BAPrZK8u
         ofm2aWW19FLONHaqVuUnPSgo86FNWnUmsqaTRl2ck/pMRYeT9pY2DprTCYO+JQS22xxM
         74sg==
X-Forwarded-Encrypted: i=1; AKwUvBy7Cgxl/Uuhf1Nn7Qd2uVoTGb0GBH4Ap7No5CyoTsoinFC+QEuaMTrenaoYtbyiJbDDY5dgK+tQ7iFl@vger.kernel.org
X-Gm-Message-State: AFq9FYKljckl/7TWFRtwxLukBh8zo9u/s//Z2X6B64l+vYsPYhANjpvw
	Ocne6g0zpzIsnQfV/4z0OYB0ukKXYsk5V41bCKiwRKAqwr9SJc3nJkDIhbcgPs5oRXMG4U+m0FT
	XaviuCs8=
X-Gm-Gg: AYBFou3mxrulDKkjUJek1t3nlehI118efu2wMx9gRl3IDjFziS8jR7KGUfjadYy9HwM
	b7K4z3eKFX7ksUQmjvDTm0kr6AVtNcRoYZVcEbLLfEfp9ri5JsiFyNauRuhGo8fNtzHRiFJMxFp
	tj11sIcZSHtC/iKiimz53ntXiHNXvx1tpJI1WlhLOS44GQ2a0loLlo+8jh/O+64T66co4aaCaj9
	e6sCPPSl27yDhQ2xet+qB7AyIToP5g+HtZpehShuC+7w/VlBr7mRFp4IK27BdETUASiYG0ICeIU
	jL4NbAUEMoNmG26mYPEp7+UFEctu3FESbzk4mCQRILcQWRxO/X25mAae/HOeyQGwxLOY1IFClM0
	GFXtGfCQo8xzgbLu+hOOwNXM+thhi2EcCEMMN8JD44+Ifij38Aq+0TAV0KJwtCjT+9a1D7ZOCVF
	gjkZWHLWeiaaycUGlVm3MmoiPyzP/eoFnwzbGHw/22H/FJ0J5sEkesHNXDaUC3heIxM729h+r4o
	xQXA3IW1P5lZLBC3PUT32CAM5vd8zsOUPo0fy8WQXh+Lgrnr1sgTWaZCg1mLbvXZiQZzgZFAcnC
	dinRfBOCxQKjsiSSZF+1twbVgdnFfvIX4qg4hAnt2J4=
X-Received: by 2002:a05:6000:24c8:b0:48c:49bd:62df with SMTP id ffacd0b85a97d-48e3eb4573cmr14327264f8f.1.1793032188353;
        Mon, 26 Oct 2026 09:29:48 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebd48fasm17264241f8f.31.2026.10.26.09.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:47 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yang Shen <shenyang39@huawei.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/22] gpio: Use named initializers for acpi_device_id array
Date: Mon, 26 Oct 2026 17:28:23 +0100
Message-ID:  <2acd554bae9411e84aa9ab8cb5d6748b5906b824.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9296; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=DVg+bZQdl2gsg71S1OFnw9htc+aJhDF/AqL2SGbE28c=; b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBq33+58coHu3kJpua7ArkJQPq8g+qTVT2KbDuDb mCCVk1vBKSJATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/uQAKCRCPgPtYfRL+ TurjB/dRcPMT/lpWNdsjk3yb7eXE/gvRfhO56sNU/VOW/pogfEwyZrrmulOpQVjjXEZJuGLSrfO lsUxrixZ4lUYqmR+W/2Kj4KML3vFvInHF+vYY821Nelie8odc6t1chGIjG3sy1Th1nkp6xAiN0i 9rsv8VMKPQyQQKGDr/VUELvn0OvX+Xnevlez04hEptGq5BUFPj1eEMnO7odoPb6ILjt81tWCY6d KG0cR5EdifTcRxQaBtk28lSejECRuUTZF0mP0f8/LWj5MVJbGEqLb1n/jZb4O/3yAg/O7KfZTap Rn/kjyP3JyyPHrOvRtPPhGnINt33Nmo10hHjIDCZlILZvwk=
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

