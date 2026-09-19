Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82690377023
	for <linux-gpio@vger.kernel.org>; Sat, 19 Sep 2026 17:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789837870; cv=none; b=osMZTM3qU3ycwChO4VdzHHlnEm4qo/OV5cX+xCorAJagT2CC9eMoP//nq+7ybCeqpzjjQ5fEh3wLfJtFZQSwv1uNf+m633ZyZIEZ5S8LB/xrslq9uKOdYWXmFG3LBaiyH3Jj7iTQF3wm1Vy0Eufcap4NJ0KDi9U2dD955aGbvRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789837870; c=relaxed/simple;
	bh=cnELjqd1Pl7f/0JTN+K6wmbhpcxee0KU5jbx2ycb1p8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L0hUGN+ejWXebx29etWcedPSZgBSrt6imZo4lqM5eDvnq41rdq7kpp8aHq7usm7rEMC6wvufbbpk0Zdyh+KaLS8B9dCaHUBXby3i3f/ci+jPUli39qB5Ux3Do0asExdrDPdkyb40DHCpvs2dTcoaaGlbTD1IgDj8I77ejFTWrIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTVKXYZT; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTVKXYZT"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so8018945e9.0
        for <linux-gpio@vger.kernel.org>; Sat, 19 Sep 2026 10:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789837867; x=1790442667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfqMrkAh22cdKYOtoUtJ+Se8srdrCdZTjCyOvlrBsnY=;
        b=PTVKXYZTzpVBkuYsalNCIu17XXvZky34ZiJ/nx7qavLPtQUx8Wt38QB7nIUNHALYjo
         A3TugXHZXAbrQUWDE6OzRcC+Ni2U7GOpxAa/fIDFq987+Pjm+Sfaw+/ECh7K+esK6BVS
         MxvTq/Wy4E0dtH9QMDZEkUGzhJ1+PPB+nl/bV9F1AUMufowWdgvXwclfNc++bUbeB3fo
         gX4jCk+/DJmu9Trw5Z4kXJwPo1edIz6SxvaPa7RLxnXqZTsOzoD5KxfOsqz4talWEuUz
         89ZZWcrXzLftpcssJ4/BjZtoHMjbtCpRMP9rrzj4oj/PuASQ6hlb27C0G7oCkGYbsHEh
         eXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789837867; x=1790442667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DfqMrkAh22cdKYOtoUtJ+Se8srdrCdZTjCyOvlrBsnY=;
        b=RgEy3Nn+tjJtBE4YHoz2IS4AxE2/32BnuXJQ0dgzVSweu0o4PdPsBtPwbL+0PBL9E5
         bRke/RWc+DiTM+cy6evDj1nFouqbm5MzBv0QNhQ5HRaLJjyjrNSjjTqN6HkrLzTVeZt4
         EM9I8mK/qJqsRHIc+lYqj7W1tWpSvIgIYAs3PuatNWFIDDyj7TT1zpcx5fSxjsvXzooz
         5ipZpJuO6btoh+auKd4BciEhKAU6dLHUVx8N1YCoaa110yYxg6YReC+qoMqvefpE3E9q
         au++Id6Kt/OX1vMS3STSH/TzpOcUDy53TN4exxZL0H6kfcqZN5Ve0vHexaXphOtsdj2N
         z/uQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEhcts+OW8b7DGSSyueAQNBHyPEbJUqah8yOADGNbaVogBRREWoubnLLsIboYoim8N46KDQpni81WH@vger.kernel.org
X-Gm-Message-State: AFuF++mr4+O6NG8wstaf7Zelqb00y9rnzt2AMwcexDO88MHWcTEGwo04
	ExCsg/FB1IkAgCyU334hY2T2uFrhHloODh3uQ6wkbjtpl9dg/IzzZPEv
X-Gm-Gg: AYBFou1Jyvwc28U7ROYQGrXBiC8Hh18lZHM+XzMFtFq1BnVHVyeal5AXSdJ6APIO5lz
	NzuoaRQ7OqtBxYdzP8vTfRQ1fSse+pGWXKHB3xkBn2Z2msXq8GJNxGyVg6ZQNDt13dI5WQLwkkQ
	B5ExU+qX84rethNGzJIpd9rvD5RgwIZwfxofMhtx46YIW6ByYaLZnDzVwhRaZqp2LBoD3zgUymt
	mrGsjfI7qabLXKXW37CZvbrHPI0QuTm5HRUoFlqA2ReqLQQcL7d3WoFFmBQK/6o07FptYqwKqCK
	C4rjoNLP8F04U9tXru4embixm3qNlzWk4O1YBqyZe4XhrsQXlSxR0+w9NFgHLWRvnrJJcOW3QN2
	RFgk4I0KpHWGIX7TX8NWffHxH/0lOhdl6nJoMdbHV2n+MBFIkIeaawn566oW3K7rozLXhIsMYr7
	J8xDboEywRevjvl7p+ORIidIN0YoUSPZpV5Zr9L8gEzjUOIanJNcWdiHJZTw4aSM+Pms41xL+u9
	4VlwXevXP3eNgTmu5hX2260dTS01oxNqUczT+9aPavDbDBLTFCpmYSCjsiXTxidlv+J9Wx6kxG5
	v/sOnKdkGWoJ1foM/jRlWUdp0f3jsa1uev1bFmf3E7mcDddb8oAQK24HVe45Xfvgta2w63Mn60W
	E847AcG/BcfS0pAQ=
X-Received: by 2002:a05:600c:358a:b0:49c:fa20:cc08 with SMTP id 5b1f17b1804b1-49fc5741844mr94051495e9.31.1789837866288;
        Sat, 19 Sep 2026 10:11:06 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0f8563sm98714425e9.6.2026.09.19.10.11.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Sep 2026 10:11:05 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jerome Neanne <jneanne@baylibre.com>,
	Jonathan Cormier <jcormier@criticallink.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] gpio: tps65219: Fix GPIO input value reads
Date: Sat, 19 Sep 2026 19:10:58 +0200
Message-Id: <20260919171100.90430-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260919171100.90430-1-kmehltretter@gmail.com>
References: <20260919171100.90430-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TPS65219_MFP_GPIO_STATUS_MASK is already BIT(4). Passing it to BIT()
again tests bit 16, which cannot be set in the 8-bit MFP_CTRL register,
so GPIO0 is always reported low when configured as an input.

Test the register value with the mask directly.

Fixes: 57e30e00bd5b ("gpio: tps65219: add GPIO support for TPS65219 PMIC")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Testing:

  - A temporary KUnit test instantiated the driver with a RAM-backed
    regmap under x86_64 QEMU 10.2.1.  The TPS65219 input-high test
    failed on the base commit and passes with this series.
  - This has not been tested on real hardware; testing on affected
    hardware is welcome.

 drivers/gpio/gpio-tps65219.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
index 457fd8a589e89..b25c6f7277680 100644
--- a/drivers/gpio/gpio-tps65219.c
+++ b/drivers/gpio/gpio-tps65219.c
@@ -79,7 +79,7 @@ static int tps65219_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	if (ret)
 		return ret;
 
-	ret = !!(val & BIT(TPS65219_MFP_GPIO_STATUS_MASK));
+	ret = !!(val & TPS65219_MFP_GPIO_STATUS_MASK);
 	dev_warn(dev, "GPIO%d = %d, MULTI_DEVICE_ENABLE, not a standard GPIO\n", offset, ret);
 
 	/*
-- 
2.53.0
