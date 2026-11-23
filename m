Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433599;
	b=Ne7Iew+i80Y5F3jUBEYJbqQWkHdeLEb/FVWw9xMMDusEju1tAlFNxKSr9PHsO1hU4I7u
	 7xbRfgj5VKX1VJD5uZkXf0jN72JD1LU9F8oBsjcQUQhCYkhCa8ZF7hRBgYnXBC99//bTj
	 OJ0HFQeJjhX/2F47LycYpawBGIH87hW0ZdQvtEyjNzau12SDyzdlzNYZbV/G0qBQ0cpx2
	 l8zlMsISv99Sa+2n9n2lyk60EHdNVwE0sgu6YlF+VBsFafQkxb+xWKHOhZg3IMX/yb5/S
	 stYtW+cXUkK13pSfLUKTf9IigBQB3J+2d43ti4buvk+M/s4U14k3SDnkXQIOIK8mgJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5nRCKmjw8s473RAx2JKEdq4M1Q3NyMbXMqfx2Az/4ns=;
	b=xMRSevd+u27pt9zXEfRKIy7FPLK7+sa7Jph+LpahNbUTtkaOosrIimFNS+HiWqNFWYxC
	 opeW8T/ljY8QQiLiNqDjF/vZ7hPyIEJ6DBkKZSTZFPzlmU9BLRFcO7a8Y9JIqddm5likG
	 KPhLxPOQOCFXO+qvLsLi4r73cKGXs/8X8nKCJjxuzZubeFmn0qRZ1jrHz6aUB8ikShVnV
	 SHDxJlVN+b1sEMdN+vjywghuxxRkd7yIGuvWVNjwlSTnSDXY9v6gNllrq4sfYjxxP+E27
	 mn0wAzWyg44ToDryporW+06Zk6NgpgnmJZIXBWmHu5RcYnJ+elzNxdUls/TjfMHAh3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=biUKYNCE;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDFF606A31E
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 11:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBDFF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=biUKYNCE
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so427096166b.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 03:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795433597; x=1796038397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5nRCKmjw8s473RAx2JKEdq4M1Q3NyMbXMqfx2Az/4ns=;
        b=biUKYNCEDSO6ZYbSULcp133TIES6V1dgvHI/IVIY7FWNLyjJ4bHQ5LUQrP/OQ1QBgQ
         ktn45i/V0kMZbn/0X8cosa8dTNA9Pd2Slc7OLVlL9CSAAFROwkZL0Ldzbb1HxHFGEFPi
         cQRAL0AnW2VfMRFL3I5Fpyk/xUqSIRRPKzygNWZvQOws6bPpq6ptdKBUptrgLGm+WE7Z
         XM8wNv4QMbBTbgRzqUHvliKV114GQiNifJ1lpxUpTcWHFa4ruYCLnKGAVXra3wV2dNXX
         krxxXo0QgOKMeaHYY3+6BbRdpvxl3LScp9p6TPo4bLmncb4BgGbls2rkVyuatTMQU4z8
         eV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433597; x=1796038397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5nRCKmjw8s473RAx2JKEdq4M1Q3NyMbXMqfx2Az/4ns=;
        b=RRy2NCr+HJ9DH5pff2VK/ZTTg6+QRHTIV8N1VH77Lrgol0+MXJNT5gWZTHCkNLi7x9
         6fxCUcJ62MoDkzpbL5vuTP+/Yc1CMsPEniaqZVsZbYDL77+cc2EXcI2JKNBi56VXHIZK
         mY/OUE0dv5sA67P6kPF/2K2fYZTPYCW5XAJXtaY1+dP049AJo1Ul5DLq8Tu2Q5ViEsvD
         fHE24bubheMC7d5wKJnD1jeHKMxsI6xkYYtgV7gE93lCMopF65XMNqQCGxdHkA+ACkkO
         3EfYvwpUWSqGgapMC+QNzSi359Zmzmhy1hgPvD6hQYE6MTOAkpfzSSuyPDByLq+96Asw
         qF3w==
X-Gm-Message-State: APuU4Z/e1J1FcyIVA/d+o2EDbw4zwj4kz35FgtMXzjghgqDzDDRB/Sgd
	2ox5MLYDSoiYHh3renZVATWEsF4RBgmhKRZpfL/JDUDlIMLiDAgv6xXdnshDlG+aGAY=
X-Gm-Gg: AZFdTZd3K//pVb/qxkVL4IAuFcS1gqdzSxgc5waWjok2bMrSaXWPcxq8dZfLISRCOtB
	D82AVaxl5YzUxhaumYfS3S8N581OgceWsQBNT/6VvGGGNrE6m5JBK5sWVGTl3uWN0Umahw/6hZK
	Yy+uCj4yyLwbVQB/m7gXvC5KKWQg9QEQROzn7F0UvU0h3lxzsk45sxPhLKnFz/K66gOjjgWSy3j
	+n3OQy4TAKCQSmyRmFyYrSP7qkfoIMBZ6/b5QCZnzkfyQHFx6q/cZ/tJ2T+lscrD1Ul3nH7RYeM
	toh2T0wAYL3iGi3Bb9UhC4W8F3P6Qnm20orWsiruIm08pExX2IeL0Z7RPY6+r43yKZ5DULxLF4s
	2NBeHqcm7g3086wp71WmsgE/1sqAfsB1lPMBfzMuAFTg8DKus5LumuclKsovN7rs2N/Blv+SkJG
	RKpla+EeQqRp64Xnc200P3y4BrRwHuYMdA/+gyjRryEpaY8oj1CGr8v45xxYYCYtGS3NSdnYg7A
	Ngu2w1sADSN1O0WXM+AkwNc+KCHAIpKIUd+TkmD65bQ9e6XlSti2rOuouHIJeQIQvDxFC7V5hF6
	C5aAv7Hv80i/xwpiPXKeaSMEdUza
X-Received: by 2002:a17:906:564b:b0:c29:f5d8:9c72 with SMTP id a640c23a62f3a-c513a9a466emr618942666b.33.1795433596901;
        Mon, 23 Nov 2026 03:33:16 -0800 (PST)
Received: from lin-mg ([178.226.61.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afca58asm382625566b.65.2026.11.23.03.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:33:16 -0800 (PST)
From: Maria Garcia <mariagarcia7293@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Guy Morand <guy.morand@bytesatwork.ch>,
	=?UTF-8?q?Theo=20L=C3=A9brun?= <theo.lebrun@bootlin.com>,
	Maria Garcia <mariagarcia7293@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] gpio: pca953x: Fix TCA6418 bulk transfers and input caching
Date: Mon, 23 Nov 2026 12:32:33 +0100
Message-ID: <20261123113234.197852-2-mariagarcia7293@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261123113234.197852-1-mariagarcia7293@gmail.com>
References: <20261123113234.197852-1-mariagarcia7293@gmail.com>
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

The TCA6418E does not support PCA-style 0x80 auto-increment on the
command byte, uses MSB-first bit ordering in Bank 0, and requires
input registers to be marked volatile so regmap does not return
stale cached values.

Disable REG_ADDR_AI for TCA6418_TYPE, apply bitrev8() to Bank 0
in bulk read/write helpers, and mark TCA6418_INPUT volatile.

Also, add IRQ-related registers to the tca6418_check_register
function for the sake of completion: GPIO_INT_EN, GPIO_INT_LVL,
GPIO_INT_STAT, INT_STAT

Fixes: 6c99a046edfa ("gpio: pca953x: Add support for TI TCA6418")
Reported-by: Guy Morand <guy.morand@bytesatwork.ch>
Closes: https://lore.kernel.org/linux-gpio/CAFOBSkSHt5nwdqsf=V0esBh23oTkOzy--9-vBQFPBoroGK3-HA@mail.gmail.com/
Tested-by: Guy Morand <guy.morand@bytesatwork.ch>
Signed-off-by: Maria Garcia <mariagarcia7293@gmail.com>
---
 drivers/gpio/gpio-pca953x.c | 41 +++++++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 3b2407690281..10a6fbdcb64d 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -10,6 +10,7 @@
 
 #include <linux/atomic.h>
 #include <linux/bitmap.h>
+#include <linux/bitrev.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/errno.h>
@@ -37,9 +38,14 @@
 #define PCA953X_INVERT		0x02
 #define PCA953X_DIRECTION	0x03
 
+#define TCA6418_INT_STAT	0x02
+#define TCA6418_INT_STAT_GPI	BIT(1)
+#define TCA6418_GPIO_INT_STAT	0x11
 #define TCA6418_INPUT		0x14
 #define TCA6418_OUTPUT		0x17
+#define TCA6418_GPIO_INT_EN	0x1a
 #define TCA6418_DIRECTION	0x23
+#define TCA6418_GPIO_INT_LVL	0x26
 
 #define REG_ADDR_MASK		GENMASK(5, 0)
 #define REG_ADDR_EXT		BIT(6)
@@ -384,22 +390,37 @@ static bool pcal6534_check_register(struct pca953x_chip *chip, unsigned int reg,
 	return true;
 }
 
-/* TCA6418 breaks the PCA953x register order rule */
+/*
+ * TCA6418 breaks the PCA953x register order rule
+ * Access masks: BIT(0) readable, BIT(1) writeable, BIT(2) volatile
+ */
 static bool tca6418_check_register(struct pca953x_chip *chip, unsigned int reg,
 				   u32 access_type_mask)
 {
-	/*  Valid Input Registers - BIT(0) for readable access */
+	if (reg == TCA6418_INT_STAT)
+		return access_type_mask & (BIT(0) | BIT(1) | BIT(2));
+
+	if (reg >= TCA6418_GPIO_INT_STAT &&
+	    reg < (TCA6418_GPIO_INT_STAT + NBANK(chip)))
+		return access_type_mask & (BIT(0) | BIT(2));
+
 	if (reg >= TCA6418_INPUT && reg < (TCA6418_INPUT + NBANK(chip)))
-		return (access_type_mask & BIT(0));
+		return (access_type_mask & (BIT(0) | BIT(2)));
 
-	/*  Valid Output Registers - BIT(1) for writeable access */
 	if (reg >= TCA6418_OUTPUT && reg < (TCA6418_OUTPUT + NBANK(chip)))
 		return (access_type_mask & (BIT(0) | BIT(1)));
 
-	/*  Valid Direction Registers - BIT(2) for volatile access */
+	if (reg >= TCA6418_GPIO_INT_EN &&
+	    reg < (TCA6418_GPIO_INT_EN + NBANK(chip)))
+		return access_type_mask & (BIT(0) | BIT(1));
+
 	if (reg >= TCA6418_DIRECTION && reg < (TCA6418_DIRECTION + NBANK(chip)))
 		return (access_type_mask & (BIT(0) | BIT(1)));
 
+	if (reg >= TCA6418_GPIO_INT_LVL &&
+	    reg < (TCA6418_GPIO_INT_LVL + NBANK(chip)))
+		return access_type_mask & (BIT(0) | BIT(1));
+
 	return false;
 }
 
@@ -577,6 +598,9 @@ static int pca953x_write_regs(struct pca953x_chip *chip, int reg, unsigned long
 	for (i = 0; i < NBANK(chip); i++)
 		value[i] = bitmap_get_value8(val, i * BANK_SZ);
 
+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
+		value[0] = bitrev8(value[0]);
+
 	ret = regmap_bulk_write(chip->regmap, regaddr, value, NBANK(chip));
 	if (ret < 0) {
 		dev_err(&chip->client->dev, "failed writing register: %d\n", ret);
@@ -598,6 +622,9 @@ static int pca953x_read_regs(struct pca953x_chip *chip, int reg, unsigned long *
 		return ret;
 	}
 
+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
+		value[0] = bitrev8(value[0]);
+
 	for (i = 0; i < NBANK(chip); i++)
 		bitmap_set_value8(val, value[i], i * BANK_SZ);
 
@@ -1251,7 +1278,9 @@ static int pca953x_probe(struct i2c_client *client)
 
 	pca953x_setup_gpio(chip, chip->driver_data & PCA_GPIO_MASK);
 
-	if (NBANK(chip) > 2 || PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) {
+	if (PCA_CHIP_TYPE(chip->driver_data) != TCA6418_TYPE &&
+	    (NBANK(chip) > 2 ||
+	     PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE)) {
 		dev_info(dev, "using auto increment\n");
 		regmap_config = &pca953x_ai_i2c_regmap;
 	} else {
-- 
2.52.0

