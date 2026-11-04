Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829613;
	b=y1jFLDrgpqE7Dl/71jtyhzX9W21zIO7C7wrKBbf83V9vQLnnjAcRT8ILCEk7rpzWbuud
	 ZTda0SuTCzjvJpn8bhEIrSoQk/q1Twr55n6KpRj6q5YBKk60IJ7Sru3GOrR6XKuBc3FCy
	 Gt/ZUCxkf1EsTyc0SaQ2aFRugygYypfs4BBAhIrioExDcuUQwcKn8ye8j6WF/Ila7XG12
	 u4mviQnBZYOcVeOSlK8LexPhKSiPoLJXU7Qslt5mk9Ee+2RZIq5WTZrkzW4hOML0N2t/g
	 ZfKEMeQ4o8golQm7GxPbnZGFv2KaMuHYucqVNvUbvxc2VC2qK+S+CV3P5cDLPz6dyYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WMdcy3ZLtQBYBPHMfWrBfvXyV/RjSupJYsxTfmkSBvo=;
	b=bSEA+o38z9guNn2+9v72v3IMc+n+E2xoZbNGZm/UeC/UNbiWRZuhJx5HVUr1j7e2Jkb+
	 29g2kDDTNsCyQ2yTa2DBBWgn+u3H80a1Pq79CXqSNyZ897czf70T7dXcuuPKgqY10JOoh
	 wJaZa/dBvN6AUgt8VAqsOfWJagcTmc9yuOf9ddMC+7P+pYoMf9PDNthRwQKGH5ZUBdpVw
	 +/YaKLEP1saygGTntfnG80c1+g83wRtOta2uy5rE7o7fJJby4VqwZI5Dz8WLDzmSEvVKB
	 A9PvOL+TMQ4ZT9potPJrKOxszfD8vY6+8aijFKoV6EKkJZJBNpMaUoPGdAfjBo7hC1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WItqlh2A;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56403608C984
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 22:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56403608C984
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WItqlh2A
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e5378b281aso7768845ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 14:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829612; x=1794434412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WMdcy3ZLtQBYBPHMfWrBfvXyV/RjSupJYsxTfmkSBvo=;
        b=WItqlh2AckCqCZkzZGnzRsTKWRQCESl/g7QqZSeQcIQw4HSPL/aun24RwzM4TmB8XL
         e1qemL8vpsG9sQr+4uwEkdBbQQN0aptGAzJ5932b05czPx/TXSHReL2cYeWHQf8Gu3AU
         MWKxxFJsFjfLPcYhOBVn6UBxCnyOiV4YQU+zIbs8ahRY3uSJZPSFsJfPUFWN0xTFCY9m
         RUpsqz7j87Q/BhqhCkNnSBzKW9mMoALlVGxR1+rn6ersgqsoAGq2EQ2iQU9DokrZuqvT
         J+8Ma0M+2OA9ep5rcCAQRGrtu7oYlKTqtLzCypsh+WriaO1srBdwjSZew9o/aKO8dh/o
         sBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829612; x=1794434412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WMdcy3ZLtQBYBPHMfWrBfvXyV/RjSupJYsxTfmkSBvo=;
        b=kk9jWgJ59PeFfJsIVvyiUGAsRmyE5xJNmNqnR5NL4qsbxAptv3u3J17PXv7IMP6vvm
         XBkvcaRXqTsHko4HQfFUOwfp7b7Y/xq8u4YgGgsgpnoYCorE5nFxOfT+SUtHIwjA41v3
         nZoTwKSdIBfQUNDILKZIudVR58qcQDkNSwd1wyyxABpvw/r1BVG56okj4huecIGkFEBu
         aLi3bQJtehsucKz5GDJspubGPfoX7GqpsEgIkUnn2CKIyEiUqr5w7j2wynhmXu8HRhGp
         FKaSxDc4pyGWcfKWu9hshZhyKU5D8Ca8aSc+3jhmokBR6hTEuc7SFvmssBn/5Vrkye42
         RYDw==
X-Gm-Message-State: APuU4Z/D1or6E0QBAWIg2rIsQ4ErqdCZ6ehsxNV0w3v8sJytFrNL2ED0
	Alv2ovk5FLcEcbO5kgypTJiZOIG5LpqviBM+GJ1Kn60Ju7fsEN1EeY/7PfmMCA==
X-Gm-Gg: AYBFou0VapyQTVekEnmS/YjuIZ77hTQRZnJpFOKe8zdqKRQu7n2axSm2JopHw0ophUA
	Nlzb1ADElHArvPv9RfSNYttijWVeXynYgiKLgtO0vKjnr3M2Fylh0ey6mtziIpsbV8Q0FXF4RuX
	3z8UD7MWXJ4W9WA0m1tLoe5jrT2aZw+u/qDGx+oXMhqdFGfexa7ByOFDxm6lnzI7AU6UuDuIHLh
	ogYhukdd4MrBtzQap7YZ1lJQB+/lUI6SEvM/twEX1Mo3gHAsGNsZyyo+6rqhNovNh2jChn/LwnY
	OWEKLepve2nlaD1Xhkaa0InB75Q9SjLRW6MGQ1l77RyE1w+dCHrOgD51eT+x9WLKBaQoEUmkL3W
	mzMmD5719/OTasF5omYPKGtNFtKe37OxWA6JQ4iy3Vz00pRpTS0RVNj4mBztUQ4C+RadQiHBt7E
	d3QXvnQlXhV9iHdWG5UPetNEbYieTflaXFiGM3fijXua9fCwy49/VRvylwNmhy91mgqpVIKqVU0
	ydPX0YR/jtLcPeeB9YIRMsxu66TEFGzxObCVBVbjQ36kUF1wredNVrWxOS4R/nCFdZOvvlcbY8M
	xbFQkKyCKeMr0TRrCgvDOfVjvHe7tMfFDBu5pB6LANlWInIcMh908mKz2c0Kngoml4TIzK8WQRH
	iSRgfolaZ6XpUPmy8cul5jiMpU2KnT5zjqtyaaICRirbR70wuKEe9uoEEaIGdPov1PRYQ4MqWq3
	kheA==
X-Received: by 2002:a17:903:13d0:b0:2e9:9b5b:e179 with SMTP id d9443c01a7336-2eb36504ec5mr174592975ad.50.1793829612330;
        Wed, 04 Nov 2026 14:00:12 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e4dsm11237865ad.21.2026.11.04.14.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:00:10 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/5] gpio: ppc44x: tidy up includes and probe
Date: Wed,  4 Nov 2026 13:59:59 -0800
Message-ID: <20261104215959.24035-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104215959.24035-1-rosenp@gmail.com>
References: <20261104215959.24035-1-rosenp@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some unused includes that are not used directly.

While at it:
 - use devm_kzalloc_obj() for the chip allocation
 - rename the platform_device from ofdev to the conventional pdev
 - compact the OF match table
 - move module_platform_driver() next to the driver struct

No functional change.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-ppc44x.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index 8b9ea00f170c..04653e753d43 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -10,13 +10,8 @@
  */
 
 #include <linux/bits.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
 #include <linux/io.h>
-#include <linux/of.h>
 #include <linux/gpio/generic.h>
-#include <linux/types.h>
-#include <linux/slab.h>
 #include <linux/platform_device.h>
 
 /* Pins are numbered from the MSB; the select registers use 2 bits per pin */
@@ -139,20 +134,20 @@ ppc44x_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }
 
-static int ppc44x_gpio_probe(struct platform_device *ofdev)
+static int ppc44x_gpio_probe(struct platform_device *pdev)
 {
-	struct device *dev = &ofdev->dev;
+	struct device *dev = &pdev->dev;
 	struct ppc44x_gpio __iomem *regs;
 	struct ppc44x_gpio_chip *chip;
 	struct gpio_generic_chip_config config;
 	struct gpio_chip *gc;
 	int ret;
 
-	regs = devm_platform_ioremap_resource(ofdev, 0);
+	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	chip = devm_kzalloc_obj(dev, *chip);
 	if (!chip)
 		return -ENOMEM;
 
@@ -180,9 +175,7 @@ static int ppc44x_gpio_probe(struct platform_device *ofdev)
 }
 
 static const struct of_device_id ppc44x_gpio_match[] = {
-	{
-		.compatible = "ibm,ppc4xx-gpio",
-	},
+	{ .compatible = "ibm,ppc4xx-gpio" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, ppc44x_gpio_match);
@@ -194,8 +187,7 @@ static struct platform_driver ppc44x_gpio_driver = {
 		.of_match_table	= ppc44x_gpio_match,
 	},
 };
+module_platform_driver(ppc44x_gpio_driver);
 
 MODULE_DESCRIPTION("PPC44x gpio driver");
 MODULE_LICENSE("GPL");
-
-module_platform_driver(ppc44x_gpio_driver);
-- 
2.56.0

