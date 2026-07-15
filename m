Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E649149551C
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 16:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134582; cv=none; b=AIVb2wVEeRoKStOxVYUAJq+Daw7yyHxjNVlpodREk5PwRrSP9DSgXkBClZaABlQowojbtgLrmbAqcSuN/1Bb9/nXmAQDM9urzG9J5DKxkO8IRvhdhXO98NROElq7SeCbhjS/3QsDOZld60iLi50wCDrUvzSiINYtmO4WfCSpjwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134582; c=relaxed/simple;
	bh=RLuywGBB1JLiwZZJGzoixG997fODUvjPUuq1y8Z3XtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JQT3YQJcFZXUzdTbeVCkfAUWeWBr9wUDiXn5Xhq0f3jGX5lOjZnlxqgW09ZnknQzEKYqDwbaaDdDo5YTlVV70YTPiCnfCSGMmSMNyG3FZE+hAWnApF0oB16WM1WlWtOKdYRgGFX4C6QfPfi4iSyNpdzbF1LTKHCqsboeJNgijR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=mpz6mef8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="mpz6mef8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso48854035e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 09:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784134579; x=1784739379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rTnM189zUntFGaqZlzA686p2JQM6hMb5/yc/NgTCiTM=;
        b=mpz6mef8Felx3axT/OQ5ZbyEzONnraGm0uUWO75hMTNZzhZxUZDFp/qpPN3GYs1jMe
         +UyFpqmdPa6elmGyvLVH6rDzDspaeHcQxtrqNB5+4BZslRB5Al1t/VyGl6zGdZ/HgMsN
         3ZAiI0DqkUECQ2kv0uI968JJt9AggYcj+VvVoAHWGXma/CCBnKvfUkFfpf8/P0yLtLgj
         H//XER7FIEg6T05vWSPaDMLrIzjbHwvcozLNCPdSVFW1/0q3kehg2B1bAZ6J0XR55bQ2
         BV6ieaO/dnuHLiTe8JeVsGuyGI4siawpBqDg6l5hLvWgOW4nsgb0VatrjUfC2HR5WC/M
         OJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134579; x=1784739379;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rTnM189zUntFGaqZlzA686p2JQM6hMb5/yc/NgTCiTM=;
        b=kReKCSKMqQJHK5I/BT//4ygJXVQ9BXmvSUA9GdQaCWYT57nZxLO+iekGRySTjVZ/02
         zaA+cNZ8LS5rnNiO/1NJoP7gIix1g7PsXXBH5H7QZhIVMGVWLjQui8vAfW14GZM7rkIs
         Oe+xq5cg5U0EPBteBx0HhAEWfPGtosPZR+rHtE+JeBjigfuDPMCibM/n+1txvMQw19zT
         jaMv28xPBCdy/7+JB3tCXR39dfRCSwnnkL30+EEF5St7X2+Q0MraCu8zq/JZHZntRbDY
         oH86qKw2OQUBF/7aifjM78ALEw/G0uyanzM4aIlC+vlMuOOfwWzigwoSxDfcOi2aI/G/
         kEng==
X-Forwarded-Encrypted: i=1; AHgh+RqnwTJ1pa0fy0Fmmt8pGEGRRuUlsirNPFOLmfzGHcBwSYziLYkiHIi+ww3taJFlx1FDzXPjkSdrJvTL@vger.kernel.org
X-Gm-Message-State: AOJu0YyLDG0XhrgL02y8hvjKedGQwpnQfet9TFTdUn3/DgXJIEpYJSch
	IcZUV/ZnjJry6+VIFVZAZz7B8q282BYk7VDowcCrc/gpLbIUA5k2bL61v7RiaTdtk3M=
X-Gm-Gg: AfdE7ckAxqGn1sASqxRcQxqmYhvaCGwXCiLv+s17j+CvVo3GvwjkD2lwa2oYKqZ/ajx
	7yesrAG3C9YNtJAFNieA09Bsn5rgmxygTTyHr3oINaNUc4d0oOJfLo0U1QDAbiNwZLcL6SqTyNb
	pa6MQCAALMHrixCDM/IkOG0jWC7B0H1D1vwVO2lr2UmOVnHnPNZhA/1C3m9lmjaUIUT0zRxfWoC
	WLYF+U930zjGXmdFWX/QHM4V6o6Sqct5P48yuZsIrEFjP2mOfa5Bf/7btIDRRLNgAgsAhKtpxKh
	4zjxcX+ApYETER9ViL5BDbfzD0uCBabsPIT0rr2vuaQOffPfXn2FCEbtcYTnBwGQneVfnnVllv5
	ACuM1ufirIDYyMlaYKLY80XuSscVRxnaEl+UbMFIaz5Lo5nAMyssyIs/xppB5PtejgTox1T+/aW
	1iYngHLiY1puwuXua62kXA9XWqgALR+3FCTHKWLsx7gMGP+8Usn3VnjPicXBBF5MLE1rXDuduZe
	npua9pPPXz8pA==
X-Received: by 2002:a05:600c:48aa:b0:493:b243:8ffc with SMTP id 5b1f17b1804b1-49538a18721mr50702945e9.35.1784134579197;
        Wed, 15 Jul 2026 09:56:19 -0700 (PDT)
Received: from localhost (p200300f65f47db04249e031dea91a10d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:249e:31d:ea91:a10d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4953c599049sm55105735e9.0.2026.07.15.09.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:56:18 -0700 (PDT)
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
Subject: [PATCH v2 12/21] gpio: Use named initializers for acpi_device_id array
Date: Wed, 15 Jul 2026 18:55:17 +0200
Message-ID:  <e5fcd45dffbb0d9cf164d53729593c72e0f53a8a.1784133987.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
References: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8307; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=RLuywGBB1JLiwZZJGzoixG997fODUvjPUuq1y8Z3XtI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqV7uGgGYFj/C+E4AxTufmoACzyNpf1Wx+3xR0g vpYIN9sZ2uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCale7hgAKCRCPgPtYfRL+ TutdB/9Zj7400qU7sJAAyIJ9LbqbhGihC6UokRM5T7EbFm/yNvb3VuKgj/GFibfxeBwDIAUsco0 zafxfqh8TOWbSd70YIP4l7YojQIGCTC/yGtcq9KDkpQOkHJxUMkC10zzlNTUXDwPYtPDY7iLMZy yvNdEarwe3yXapa8yWmTe06T+X+mRPCL91cubUUliynoVdK5/7h5W17AeipQY0/0SqBp7bRB+u5 +j2ket9QN1PY7djMq1dnXVbeSNdlVnpF3Ui/6KjmVRc0tbJWnq1Y38nPUjbiFdeEMXDwuAUF9jL S6+iQ4PyRC2PHKWyKE8RdgXhETKyTFRcT0EAJi0frWB0lxpp
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
 drivers/gpio/gpio-mlxbf3.c          |  2 +-
 drivers/gpio/gpio-mpc8xxx.c         |  2 +-
 drivers/gpio/gpio-novalake-events.c |  2 +-
 drivers/gpio/gpio-pca953x.c         |  2 +-
 drivers/gpio/gpio-usbio.c           | 12 ++++++------
 drivers/gpio/gpio-xgene-sb.c        |  2 +-
 drivers/gpio/gpio-xgene.c           |  2 +-
 drivers/gpio/gpio-xlp.c             |  4 ++--
 13 files changed, 25 insertions(+), 25 deletions(-)

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
diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index 7d747958f2bc..99b880596330 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -271,7 +271,7 @@ static void mlxbf3_gpio_shutdown(struct platform_device *pdev)
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
index f6b870b7b352..918cadc2db07 100644
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
index 614523d461fe..3a34b9ac3248 100644
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
 MODULE_DEVICE_TABLE(acpi, usbio_gpio_acpi_hids);
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
2.55.0.11.g153666a7d9bb

