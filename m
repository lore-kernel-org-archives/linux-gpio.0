Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23C6446854
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 18:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784225811; cv=none; b=i3hQBnRHITzpG2gZEadZQBB9HLKb1g+VRmk9a56xQzYSmojyIm4JSuOFNcuOin64gr1G+/Lnz7k4BLUTtHhJF0YDzVyUyJ2WYLTD3dwcxaxUBA2a3cTbDG2qZCQDq2f7i983ysZ0L/jQ9fNt8GUthtEW0+ZcxgTuoy4BNVtKNPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784225811; c=relaxed/simple;
	bh=Efbsu1xIE7s436CBwuioeeP26PbwIsZHvSLfo8w9864=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jQeV5yJQ/BUnXxgbGPjlK3t5anC31z9avyz7A2qAfmGn26eUo1Uf5OIy1fdGuHZkjxC6xERW3cgUHsJyLZcsXyu/Osem92VXt8DeNhsQ0izP4fqPbdnTfmtJ6l1g3JP7T3XYYWjyWQ5RNWaWKI93UXLbNYBhGibYeHbbKX57+dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIYH58kw; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIYH58kw"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cee9b74ee1so35323805ad.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 11:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784225806; x=1784830606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=80kzqQxDPzxzS+os3KIXMK4OJKPHHq+HrsLNx95GDVs=;
        b=SIYH58kwT+roGRuHK9TQFe6Qf8JXnWaQcVxlhVhUsKEmQjTm6TpwwSP26aYcw6GUOQ
         opeKvbiohlKNMQUUTsEJoJhUGGlFFAUn99QIc5s6+9Sx47tFqCdAT/6TJj+q99u+Co6S
         2Ls3g99pf2mBbUZUJItkOjZ/SamZTTUhlerIIN35vtKQfchLFhDFTrBUvfhpa6G9ntRP
         KXFTlykip/MYViGEUm9urM67wE10SjwC0otJUfEyswHlhu0ZeB+K/ctYtmDnMZJTREQA
         y5lwk3glFeW5Cf06vh/HXu64JvOxzptvekrHmnChOkFGeP0Jf/1Oyff4iMjnV8wmwXJj
         JaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784225806; x=1784830606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=80kzqQxDPzxzS+os3KIXMK4OJKPHHq+HrsLNx95GDVs=;
        b=HdNPh69a0aLSzG+klplUorUv5zpHFlhHN7Bb0dNkd9VIMasv81sA4cxXEtCE8gb1U2
         cqAyqtUrPspbiylEuhvC4IYY/SvgLYmDKjUWZkmrfC9z1ET7fW8mR+ia/INCEmNbKSs2
         urLb6AQdbs2gD5WvpEtkhj/StBkujTaCQ0K98hXe8ms1w4DLbiENK68c/gzUA/wh69uc
         xkM9cwKnltrXFKMkswEhScI6VdoE4qaxpjkV5DgAEKwyceHCDQEfLHgxvSfGn+augt8o
         njvbgdNAgHrSVS5q1MOr90odG3pQUmRUvC+kyixjCzl2619kr1DKLFUu8CbK6Y6GKR4D
         BNCA==
X-Gm-Message-State: AOJu0YxhpIfH6xH9DHlhw76eXUi/SG3oT9unb6At0LKTZf79lzDVA6G1
	0YgjaAefxrGmLWwd/g71wAPFUDpv1XSd2gtvvyguphPlvTwtdRvsCvMHLnJlDQ==
X-Gm-Gg: AfdE7cnnBrkIZ/+vLBHZ/PRnFW10s4qtSnDHeBWzf351FaxV7SXWHG/zfG9HK8fNux7
	VMip03GgIENcEnRAaW7ApaO8Av1w6QxkfYb1tRVLm6jnKmKrCP5K66J9jhLyDx3WhzBNi+Ucqn0
	7hMdWJ3QVobDBqGKWk2QF0iTO5TnNvKORo6gupJGBfjp1TOI2YoHVk48Ij+clGwCu07kh4a10tk
	J4Sr/sarTdxGVm6zHLRAGF2hqwq2/7kBIpszopAJPJnFfeF2F6VgYYa3+uRFV2GfkpGY1oErzze
	Cg/qEL03c17jOqS2N++tiBZAZ+TsAv7AFortE7EMrsJ6yPOOEak7/rk++hCKBsSV4TQO8NHazJV
	CsDxBGSLYjdSwtFXStw8z8M8M+a6CnGHIBgUy4wd+6TR/UJ5VHKbzrfwes/rK6W8Wh+2C/9OQlV
	aOG/JqIp70rpnVxqsdaan+VZL07IjKKk+Po86cW+HehqCYi2di4B4DAwdCaAen9HsjHYGQx6eqf
	dKPgdHSNieOasIpubSCdQrSGdKqslsdw+We53jl/Odf3NEkSz0Pp3I=
X-Received: by 2002:a17:903:1aee:b0:2c2:bd0d:3cf0 with SMTP id d9443c01a7336-2cf03d9dba9mr87376235ad.25.1784225806229;
        Thu, 16 Jul 2026 11:16:46 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1055de4fsm24689575ad.44.2026.07.16.11.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:16:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2] gpio: logicvc: use devm_platform_get_and_ioremap_resource()
Date: Thu, 16 Jul 2026 11:16:44 -0700
Message-ID: <20260716181644.101450-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the regmap fallback path, replace of_address_to_resource() plus
devm_ioremap_resource() with devm_platform_get_and_ioremap_resource(),
which looks up the resource and maps it in one call. The helper returns a
pointer to the resource, so update resource_size() to dereference it.

Drop the now-unused linux/of_address.h include; of_node is still used by
syscon_node_to_regmap() and platform_get_resource() resolves the same MEM
resource that of_address_to_resource(of_node, 0) did.

Built for ARM (multi_v7_defconfig + CONFIG_GPIO_LOGICVC) with LLVM=1;
drivers/gpio/gpio-logicvc.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: remove unused ret.
 drivers/gpio/gpio-logicvc.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-logicvc.c b/drivers/gpio/gpio-logicvc.c
index cb9dbcc290ad..697370f43002 100644
--- a/drivers/gpio/gpio-logicvc.c
+++ b/drivers/gpio/gpio-logicvc.c
@@ -8,7 +8,6 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
@@ -91,7 +90,6 @@ static int logicvc_gpio_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *of_node = dev->of_node;
 	struct logicvc_gpio *logicvc;
-	int ret;

 	logicvc = devm_kzalloc(dev, sizeof(*logicvc), GFP_KERNEL);
 	if (!logicvc)
@@ -102,20 +100,14 @@ static int logicvc_gpio_probe(struct platform_device *pdev)

 	/* Grab our own regmap if that fails. */
 	if (IS_ERR(logicvc->regmap)) {
-		struct resource res;
+		struct resource *res;
 		void __iomem *base;

-		ret = of_address_to_resource(of_node, 0, &res);
-		if (ret) {
-			dev_err(dev, "Failed to get resource from address\n");
-			return ret;
-		}
-
-		base = devm_ioremap_resource(dev, &res);
+		base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 		if (IS_ERR(base))
 			return PTR_ERR(base);

-		logicvc_gpio_regmap_config.max_register = resource_size(&res) -
+		logicvc_gpio_regmap_config.max_register = resource_size(res) -
 			logicvc_gpio_regmap_config.reg_stride;

 		logicvc->regmap =
--
2.55.0

