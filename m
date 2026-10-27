Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098222;
	b=l4IXvEDVx2WbLDLxXvuMB/tuU0P+2zvFh6lCIc+cVu2kLehL46Xv30rx9slx6fGv4r7c
	 5cRWjEtvttna7UyIHEagHlMrkaTC0/s5kt7g+IQh5waEXXf+KxWl0SxoSNYX8K3Xsta1A
	 0uDmgc3kH8TTNMCK5fYlezBZ92maAIVQv4wWxUI4//3Agw0i4IBNYOK3vyCxdreWhB8/Y
	 TCczGUPBIUFqdapRtuDzKu0/Kioxh1Uf+makGS5ptBHj396T8L8knAME2dgaaIJc7gw+F
	 S017ugX4kgZpXqJ5YEPwJIxkjcjTb7Tyy6em42nvCwhNl9dfkTDLw0+jAHjr/Fzl3dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=wqr2oHyh/WvkzMJU46Zu/Kg3r7Hga2odINRQa1fGeMI=;
	b=nB1IUleLZkWbJlgavmVgdDByjqtATh+Roiy6bRehP+FYm/z5M1DjNnIgeBrTbEagFy03
	 uz6Ycg8hSJq6q3OGcXGfFSrtgel+wSKlcD3QLxXn2ZJseXZbv9RiXijrAn6/QyyShRwbB
	 Mk1Nn35HYPsTQyiEvn7/xTnuBbzN+KRu1Vj3rx7jjJj3CKd4SDGlieXkpuMKQHwNC/v3j
	 HdnQVLuExGixWkX1rAS6rMJ1uXT0N+SeS++Uvcvk7S3fF2pztrDSPA61kSjYPoxwEczGx
	 Sc03Xd8Ylfn+i72MdmzOgrdQOkbf4kp8v39umOmrfIxD0zupgQ4QjLL8pJUm93fVTRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eKqZh+Lg;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7AC60A2636
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 10:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C7AC60A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eKqZh+Lg
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so25080875e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 03:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098221; x=1793703021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wqr2oHyh/WvkzMJU46Zu/Kg3r7Hga2odINRQa1fGeMI=;
        b=eKqZh+Lgzdv5D2uFw0CICxE2DUA79MiqFBFi7PcIyINYJz9ld5AnFeuNzyDLtHoYFB
         TybIuQjduXU33wYAcfU2NVo6jVLNQKbZstPgI7iud/YkxeaVvuqmrOpZQG/CM3a9rhqq
         38og3eNx+7iAEj9HrlJkfo/Ytjz3Mf0CHzx8JfmGnafSEyVvaGPowBHp4JiSKl7NLfbW
         lxoDfDV2GDeLoO26yW3bPa6jifsHDZR0BCGqok7jbZr1TBJsBIqjbM8HsNmb1s7HOMck
         wI4/RpiIhiBFz28Pg7NY1EXE0WmcRKAKTMgnY7+GmDn9qR0LKRNWh4BAvq4iSPMRa8bI
         VWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098221; x=1793703021;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqr2oHyh/WvkzMJU46Zu/Kg3r7Hga2odINRQa1fGeMI=;
        b=luarjZWdPJpLukRxRkUaK1+zXMokHP3RYJKZEi1tXwXToUqtEIiaSVyKiPlVnX70dE
         DjvPVXV8uVUe5UnovEVDFXWiKcPhg1/QSy3z1rsr9Zq0+UtZszgnigf0i7RfhlRVRWji
         Chmv6y7znCvaCGVkHqtnGcMXPoy5MU5hbv6goc0oOam+7VSWRutmbMmA/7FC4JRbj47m
         Jd6ZWRmW/Xm8RnTLve59PJDNIhKw/b4HYzh2skk49/3RI4IOizAms2El8xF5tAZS4UTW
         EQQ3LF5Dms02UbUMSEVrBNOZtPe8WaYVx6CY5fau4LBELgJyaZtj+gf5jBty4Xfwfiqo
         X8pw==
X-Forwarded-Encrypted: i=1; AKwUvBw+pSaAiAEClDyKPg/ZmvEiIh+42pnH4J7z7OwNBZlAgsl2acREeMzgHmjjaBYLRQkc+nMdwknGgHLz@vger.kernel.org
X-Gm-Message-State: AFq9FYLT9dYIiXaJDCYiuyB1YJ4NlG2K4kJj47C6RLiPtrGPEnx6kQ1j
	JQ7ZGfq8Nml7CzVlrWGAj88NPpw3rkjGlgUifQ9dUeppFRpINe1ymao1AqURbmAdN6o=
X-Gm-Gg: AYBFou0J17X6tHR7geBLjEnwSRRLKwulMmRirUim7yCZ20a+ZVXAD1tucw++Yuisrap
	JXkTjPy3MrA+xNacs63WOsDBCzbkfTRXWupZpitFmOXfKq3bbN3OW4BcmYKmsI8JD921qXAx2eQ
	jb6g3Q7D9IbqphpXjjROY680UqL1WXQ6L9ee40ARYdFUxA0lsfCLYdN4Ve1zaCkswPpZjdptz+7
	7iFr3W6zfvheV6fBzNhka3vI4Tz1lj2TnNPnlJBulOzJw8X7Rx0qSSKCXA/BmPW3SpVxsrETkXG
	Acsz1wSo9y3S6F9pEun9Zs7WnyPpUs4KiqzfbgX0gxNJMXvE+SlRk4P39uvyCPpOFTM6EVD2RxR
	2lymDZTa22mjKcO/1afNyYCm+1k3WSJCnd2ZfdihOWL4oFre7evYgH+ZXNWZfqbnCTb6kAy0S34
	mckrLvIAsXGbWInsNV2Va+pfOgaDSqV1GyBb9rNlo8ghwj1+zbYMpX+IAAq6atRZ/j8qJ4LNyOG
	U8gd1JyirF2yiJDk6UwTgV/eUsMuBb6Qdd5yGfwgaKaTtef1130A63VAZJ9jDYDRt2+BjGYSIUw
	8obJZ/XG0C1wjWL9ayPOKKU/9c657A18+V/yizrxSeY=
X-Received: by 2002:a05:600c:3155:b0:4a2:1cc:6551 with SMTP id 5b1f17b1804b1-4a35accc591mr202414745e9.35.1793098220677;
        Tue, 27 Oct 2026 03:50:20 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a029332sm230145445e9.4.2026.10.27.03.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:20 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 03/23] gpio: Drop unused assignment of acpi_device_id driver data
Date: Tue, 27 Oct 2026 11:48:40 +0100
Message-ID:  <28a56ed1ecf497caa4b15e950cbe49679f3db2e5.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2815; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=w3ZZRjAJ/J3qAkfFOC8HTjGkZ4zKUXCz6t5iB/yC7aU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IGSdsDYn65dNz644U6+MQGUkT1RRZVPs1iCb djGn+3ofpmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBkgAKCRCPgPtYfRL+ TsQMCACNFeA49ZlUxPZeEfLgRDzcKGjDLpqqUnWiATJWRH00aUXSTzB0nV5oly64XY+3q90+1Jc pi1Aw8FqHvBlUszglMN6Sg5Gtmqu+t1qShe9D3w0f5GsJUeKI06RjBrtlbpeKL486nkqNjzhuFe 5LWGfOUqGiBOW6nYP+7n1K7muIufp5JtNFuaMIiiwBZTXmrS9KTW5fKAEPUezWayc0SDdGdVu3/ Gx98VBP1aThG+v9FfR138JjwqP6gwMmvakx7F+0KlJP8dujm79mL3wnlq+A0P72MNjBN+gy/Qcy DYUwA3YoAeCjVNKZgVUAqkF/OMDZj/qwSL6eqouVSYA3eUgg
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The drivers explicitly set the .driver_data member of struct
acpi_device_id to zero without relying on that value. Drop these
unused assignments.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-hisi.c   | 2 +-
 drivers/gpio/gpio-mlxbf.c  | 2 +-
 drivers/gpio/gpio-mlxbf2.c | 2 +-
 drivers/gpio/gpio-mlxbf3.c | 2 +-
 drivers/gpio/gpio-xgene.c  | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index 42d41cf87ac7..3b65ed4592ee 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -222,7 +222,7 @@ static void hisi_gpio_init_irq(struct hisi_gpio *hisi_gpio)
 }
 
 static const struct acpi_device_id hisi_gpio_acpi_match[] = {
-	{"HISI0184", 0},
+	{ "HISI0184" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, hisi_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-mlxbf.c b/drivers/gpio/gpio-mlxbf.c
index 1d338b24d52c..b2a7a41f1437 100644
--- a/drivers/gpio/gpio-mlxbf.c
+++ b/drivers/gpio/gpio-mlxbf.c
@@ -133,7 +133,7 @@ static int mlxbf_gpio_resume(struct platform_device *pdev)
 #endif
 
 static const struct acpi_device_id mlxbf_gpio_acpi_match[] = {
-	{ "MLNXBF02", 0 },
+	{ "MLNXBF02" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 5e4726d583c1..70b6a5413a86 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -451,7 +451,7 @@ static int mlxbf2_gpio_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(mlxbf2_pm_ops, mlxbf2_gpio_suspend, mlxbf2_gpio_resume);
 
 static const struct acpi_device_id mlxbf2_gpio_acpi_match[] = {
-	{ "MLNXBF22", 0 },
+	{ "MLNXBF22" },
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf2_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index 929f64c5140a..4c10a78e428e 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -273,7 +273,7 @@ static void mlxbf3_gpio_shutdown(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id mlxbf3_gpio_acpi_match[] = {
-	{ "MLNXBF33", 0 },
+	{ "MLNXBF33" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf3_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 809668449dbe..22d22962963b 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -194,7 +194,7 @@ static const struct of_device_id xgene_gpio_of_match[] = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_gpio_acpi_match[] = {
-	{ "APMC0D14", 0 },
+	{ "APMC0D14" },
 	{ },
 };
 #endif
-- 
2.56.0.rc1

