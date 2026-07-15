Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5672B3AD525
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 16:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134570; cv=none; b=mES6hC3bqEM0ZlFVWQGZz9v6L5GEQ0euTxVCF/uwclzR9tRYqxsLQ2fRgTyrbuBuLW+YvhR9MJ0J4+ixJ/KVQGHHyGPiCC6Mv3VwAEkXYXFnAO1bmz+ZMVuyuPJE2CGsMcM0GExZYhEREwt2bwOKaJi9P7p3aKx2uFhwPqvBEeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134570; c=relaxed/simple;
	bh=6hwJuma979jZQDZLBkrMYqYiY+NhQUd+S7AVIvNjNrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pmxqV4qEKNQ4EMcBjj848zQSPHFD1qdExKCJFZb4STP30lhy+2tHi8Ufh4GMJRdQImQ1j4U0G+qVEwS0jVXN618foJzzIYoJ4dNJxE9TV6gPsV6RV2uTgvJjMXKbtQmDMc2JWT41rxHpIcOa1HMGGL2zxE+kre9XrQmJiFu/zyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=W9dAgCEH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="W9dAgCEH"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c19bad03so50438205e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 09:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784134567; x=1784739367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4DVSVL/HIeRX1Q1SSXYhOkwGEVj2mM+l37dv0HLLm48=;
        b=W9dAgCEHgjTvh5nbzaaxin4lJ1QD2276guAPzLzaKYWVCU3NdMJSxlvP+KPzRL/zK9
         0UIpNTAEdR6nRZVuOpcV8D+D4x46mdwFZg1ryL5wuZyNemWbP3R1s7/AkXuCIq8kY9t0
         7uSuSzKpS7TJ/85hcV5QDRmZF9KZWId1j8EhW9weFbWGDnUrymzhgn9m+OuOHS6ykOjI
         yF+YAm794mVGuw0xKH+cLWLUVznNflePkdwfJQsDIATxi2EOho+NM1hZDHlRYOZPHwPP
         8Jf1+sdAA2ufex0YD/CKYlu2e84t0MHI2mhdSqyHWDwgABCbZYb9jfs0XXkoeOjlR+EO
         QLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134567; x=1784739367;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4DVSVL/HIeRX1Q1SSXYhOkwGEVj2mM+l37dv0HLLm48=;
        b=Vi2MdBc6BHET0clVnbP13L5gO/cXNllxavnWZChwraPNaF0b2TnGDvSWeibIvNp6mW
         aUkZN/asSYX9bIugFEG3YbX3DMqokepWhGe7ccGLdHjvpRoR4uS2MNtmsh6taOlvNFdx
         Ek8WNv+P4g363dFEiLinO2uJpwyhStGZKZ58q632qmwEseCRmsA99kv8CScQybbfVmF2
         gmejN8fEYKCqykWfvduETCMj+/sRL5H4XlR0inLYXysQ//noq6OlgR/nSUQxk/I6zy1/
         j4H8Af7AGoWePRyf/U9FTDD4MPWJFS6NC+spilCmkvKgUDVKzpuBYBvW2vWjDGjxzNFZ
         49ng==
X-Gm-Message-State: AOJu0YwKV57VvCR4FyCV3L9mqNBqZXFTapGg5bSnRdoiYvCo29Cqc9SH
	hqiHj8gP5JhDUB1FnXDN7ZWtWMvMYTJWfAPCpI5txeu4bJpEKC982Qv9ATKJ3XLgitM=
X-Gm-Gg: AfdE7cmlChSUO4+YhqiXad86zIfF7h4PUpWf+5taw5iUqfDPBHDQBi5Ff9o4TfCwkUn
	idTP1lBMDBaiRY+mgr/PRkgHMbe+eGRPyiJDcixnhKlSVX1gwPYL4qBgYtojTccAhmecYudkWzo
	ZOAD5Oa5I5rhhwg/RXwW7bMG740uC7l7kghuRbmiIPWKoSOdZGbjGhpasraikEXL2h1VREKGenf
	t2TV9mkCfyaG7suCG4n5eOtE2P3FksPh4XvrlgJo5t6SWpx5eKm4VkRfVM2zeXFysuFA7+GkOq0
	uCpHXy7EGEBkhjPgjmq+x8wdmgzsNIhxmxmtZhuoO1SQs8bdqj7hYvDs0V4HdAEjhADbo3oETVs
	jvvxSPrl9mcp+F6wvLBc0AbNBAoMgdflQOEPZv0qQ1+y0Wo8xFkJo0v/8ho4/rAGFsDsQ7o7NAa
	DbqrKy1IykYBbca4Q2pCp2zPzgUXkZ7Do1MApow6WqPL6pyX3vBwJlRBXUl2cEVs6v6sie8Naug
	LgGmY5xZISKeg==
X-Received: by 2002:a05:600c:4708:b0:493:f5d9:3b0 with SMTP id 5b1f17b1804b1-4953c2998admr40681815e9.35.1784134567369;
        Wed, 15 Jul 2026 09:56:07 -0700 (PDT)
Received: from localhost (p200300f65f47db04249e031dea91a10d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:249e:31d:ea91:a10d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f4635082csm17833011f8f.7.2026.07.15.09.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:56:06 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/21] gpio: Drop unused assignment of acpi_device_id driver data
Date: Wed, 15 Jul 2026 18:55:08 +0200
Message-ID:  <84e35efa8e9ad4b9ed9f1a966d644e26146b662a.1784133987.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2828; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=6hwJuma979jZQDZLBkrMYqYiY+NhQUd+S7AVIvNjNrw=; b=owGbwMvMwMXY3/A7olbonx/jabUkhqzw3YU9n5O6WJNEEns9TrI9/3JU4Oix0K4lptUW890t6 s7nFgh3MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjCRhmccDIsDY+f62kg9q5WR jfrJ/t/ohjujulS4f/mJtaKXVgoaHVluv+lQm82VS30zs869dl2tJtx9dAVP4MXUC+p5v09OTXj 3+3+wniRvXGvKWRbxv3dPfv3huFLg4+m9Pz/3HutdplN8TdRHsezNbFc5iaIaKfeOzEjPnRHPF9 5sfS1yoZRjepFNwOTd2vHJnY36PNkZUQKsgvumzZttV7GV2eHOK6HnP3bv/K5sPnHqfeZl8pcjJ 82sXt///dblRatVTgrEfiipF5DULp4suLHN9vVXhqmOl215cz/vDX/H3Oqez1MmLzdNfd0xtST/ x39azYRPTXPON3OTDV8XKmkyvTPGtbXast7z2JqaCg8uAA==
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
index 650abdce863a..ecb0feb9b73f 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -449,7 +449,7 @@ static int mlxbf2_gpio_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(mlxbf2_pm_ops, mlxbf2_gpio_suspend, mlxbf2_gpio_resume);
 
 static const struct acpi_device_id mlxbf2_gpio_acpi_match[] = {
-	{ "MLNXBF22", 0 },
+	{ "MLNXBF22" },
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf2_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index 566326644a2c..7d747958f2bc 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -271,7 +271,7 @@ static void mlxbf3_gpio_shutdown(struct platform_device *pdev)
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
2.55.0.11.g153666a7d9bb

