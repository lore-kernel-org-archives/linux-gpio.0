Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032179;
	b=RCSN0aDUDhYWI7j5u3ME8GoZYp4/EuLXf8MNWtDcr8JtFaJRtuokYWNnsRp8qI7ZnpdR
	 inwGa1cvlZnU5Kxg6VOtrTXPEAT54TPKRzBu912/q4k00oMgSWoP1ttym5SuW7+BESUUd
	 U3NvLyFVxn3d4nNCCEKczB/4kkOp+pFWlY4Zjtd+FEGWdPUHBJeDOjnNF6geqfT7+/9i6
	 0NtNoF1aRsFK8ZCfWoApxBHi2i2Xmv1Rlgl3E6eRwHWPGZXrZGkhtG53DZZHXQi20bsOU
	 ZUoBfaE3YX29PPiupymWPiTe6RApTiJuTMLzKfg/w52J9FJ6UX38c9Eq03AN/zbwliA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=wqr2oHyh/WvkzMJU46Zu/Kg3r7Hga2odINRQa1fGeMI=;
	b=VmGxwj8H7RxHQFsXSreZeiQjWKJZ6pGW1bZhZsjk2ytZ+KIW3zts1yZQsLufVkyGy+Oy
	 lVFcXvsxkHCbXt2q+hx+SNc8pBcd+ZrY1YRk/0d5iBN2tYRv6ddJPTgQ6GMXK3Z/LhS3Q
	 2HuWMCSPmvqkTktP/1MPSFsbe+ONGAeWRgk8pLTa4siU5RXvJijRSnP216L9ybzDT9+GE
	 aAjTdjbPPnbpPNKoQ/GURWbbowUwSIXRb4cjYWnpyXWSGUexka0pRzQpKgtvs1Mr/kXRO
	 MnATYEOc6LyYx7rh0PMh0uJ1exF58ovwtNCI2wsf4flsdJgnD9u/A9gs9nmt1Lli9og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oP2cnKvH;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE43F606A324
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 16:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE43F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oP2cnKvH
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so11684215e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 09:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032167; x=1793636967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wqr2oHyh/WvkzMJU46Zu/Kg3r7Hga2odINRQa1fGeMI=;
        b=oP2cnKvHsgOa9ZR0+SLbt97VPWG4QPO9CUXDmVGNdTezfhLgNKqd2sAoMFI5fK3fwo
         vvsWp12hG5Vb6dB8NstqBJP+ROHKPUACHlIxQnD1POz29dE5rJQX+NKbIyqPYar2y6tN
         gnNwT6AEBbK9vWTBpEvnW7cU2eFiMlBAruEdbv4rfRKfNZDR1vDEQ7JU6W8m4JSNA8Kt
         kO/Nma8DAUspWGLSsZ98nfGe4krtqyfn8jF41eI6seyuOZgU77B9OHJy2/rrVhzZUwCU
         rjPMYVmafhyir8Uzywo9+UPr0fXYk1ImVuCN2Q1PcEr7rWsIfqP1Z/uheD248NVSJhx/
         hAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032167; x=1793636967;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqr2oHyh/WvkzMJU46Zu/Kg3r7Hga2odINRQa1fGeMI=;
        b=ee0d8nRyCaUw4fW4+NncGcs2hphHRr86wT4uFHWoouJ0cbhPQgyS9IFCNf4VRBw1N+
         P9du90gDW7WdUj4aAWMNeuMmpP4Q4oC6RwB8DulWf0ruz7KimRSmGcCahrQmZkJdnumd
         1lfUpaWt18Xb9CLx0nrR54uqZlvmfVolKaAqn54kyrCelrGsnPPXNoi2Xw0LrbEqbgL5
         2TXbMOvqbrdxa4RU4tkTuUYnVV0D0TX8+1+HcHF2XvxM9H/Sj7GbinxGywWFEIlC/IGc
         gwz1y2XBYJMNg/6qK0RFACHIhQcO35cRWagYqmp5ymLZjqLWIYimPra7NrUFje1/53vd
         +cuw==
X-Forwarded-Encrypted: i=1; AKwUvBz7brt9mCo2J4Y+3QfP8YOgg5O+YEHd4xu+H8QIVlhdcj2M27tQwftXB3udOHQDoGncYuad0aD8sjXv@vger.kernel.org
X-Gm-Message-State: AFq9FYKVMljS4bHuTKAy5AYwywoPKDIBnnyzH+7sppOGNMNUVt/1CcCa
	MadOVyAydQBlYnBXJ9NLMcn4AqPK4F2v+NQDhggIVa39Mv4gVkQmaRgOO7gejiTMYoc=
X-Gm-Gg: AYBFou3TkQGK522X7yn7g4LmqZJJO/peKjc7Qe/EcLRf+wnKmgRLwB1IqV+VL+wAECq
	vuRcjBS5nLXrwNz4HqGK3PrhRrmWPSLI8UVhGbxrMPtunD6nPsL3fAlnpjTsuDG/0e3aTcoQPjA
	oyTN7N6hE1t92s8tcXFZ8eZspBjcV/tvC3FBKPihrGUrHvOY3BvC43rQJQj4fes/HGfEVASBAn8
	OBiZfZl+XUhvxbq5buJWOEQr250DMFUUH/6LgUQZcy/vlQaGeE/7QGXJLeSnv9eBIOZO1vry2cV
	IDb0710yR5ZuXz7LPgkCKNmB8Jq8/ghPMn3WOdeBQ1bW/vGoHyKzbQubl13+PdZNx4Ftfw/skLE
	AW8y8yfE+2RLDgmC/+i+QqltB9QkAnfD5hdfo63gJd1VWPyIJTKukYYT6LohyHbYUWL7m5hVU5T
	WpRLZfmjS+NdTsAi807wGtrRsjfj208s9ZVomf+pXT9VtOAV3GO6c5dXmtfC/Q5Y3+3gPnaEWTt
	uZ9dXY9sTAwz1lQYgrMfCELWS+yc1ZDAbmwqDhe2O/0IJb4ExIax7PXLp1tOR/WecbeZ3Oo5jxZ
	SPie3dml0GHJckQRRscTvWlnhP3GLoDCgTz/vVMIV7zm
X-Received: by 2002:a05:600c:e547:20b0:4a7:c366:d791 with SMTP id 5b1f17b1804b1-4a7c366d7c7mr2488415e9.1.1793032167395;
        Mon, 26 Oct 2026 09:29:27 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a574088sm191680635e9.9.2026.10.26.09.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:26 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Yang Shen <shenyang39@huawei.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/22] gpio: Drop unused assignment of acpi_device_id driver data
Date: Mon, 26 Oct 2026 17:28:14 +0100
Message-ID:  <16c3eef04c5e344b86c068def56779ccf8a90438.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2815; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=w3ZZRjAJ/J3qAkfFOC8HTjGkZ4zKUXCz6t5iB/yC7aU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33+j0NcRj8CGwJZKkKv1p3iTbcoYX9Do2QXWz A0z9fNMkgGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/owAKCRCPgPtYfRL+ TmZOB/wJNB50xuHcTWKR+ARhgh/cccagicNCoa01dFtlxjanrxgRkVA0PwVozDfQgzfJ5/jsVE3 UAiYam6fczClINdVPONcXBRaPTF7XbZczdvkLkcHlVJmlQOVEHaUhWrAVkxFmOaIvgebj/GAlj6 pMMvk8ReRcdvHkbgwii+pLhBSlkIE6rvZ8yZnFo8RJdXwRxt6whR+Y8jhqV8qUQaQ9fky0Vl365 RV/z6zJV2p/Q1TxgrkB9gm8PIZZopPa4ZSM9kC5CWv/jMQxvLUyYMk9FmPJMc9SYNxZ0Tv95+I5 DdtFxvDY9vz9URgZhI/Bps9IcrrrX+UM4B+COaOJHx79jgLu
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

