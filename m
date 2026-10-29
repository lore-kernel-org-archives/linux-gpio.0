Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270193;
	b=13OWnwp0RGeOiLV9YyAJan88047L+RVrdz0Iqntq5x1LNtCEN4EjrPICzq0/U3xP2kyK
	 UsVr1w3smendCYLktdl4qKKOJrH7tqR4zXHP8sSU8ZVGP99UE9yyNLo9wGXjv+PnCePdc
	 owcp7xzZPehX6oDpehyXoIP0sQhzclHsdIdgrKnP+JiF1aNivubc+mLwmItpXr8Zkt8Jm
	 4xpGjgvuvn4wBiPdaK76SOEe6huF63/TF9QFLgy00+J4FC61/G97w7N0vTdsL04gxmfsj
	 CMAZsslmlc/yW/8yZ+WUR8Nqk2GYRNgKB8vCje2993OtNasU6+BR2FEfxNgcIfYDyGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jehMkVEgMGBUzExRW4jLTeS4kpPNr3py8r2FnDt6bfI=;
	b=A5zb40YRpHKi9ROQE3lF+zo5C57Cs5sbF6/85WoZ9QYR2HMMW9ha6qrxNHlNsGamcm18
	 c1+FRmbCySIv3tEXMvCxpMRaY+/sbU0eogvA51GGKjkHu7iAHHSGSLcVzIOAZQUNSSpLQ
	 loRt4ZvwAI+PowMjw1rUmWPZXk3QWF64UQ1vuVaNLkJHt/n3AlqTnJlhFLuNKw+DoUw8e
	 0371gyD0OX7cqe4AOn2bS1A0ljyni2NIgOajOK2XSi67eiZPC80Gb+dMwDPXhwaeSqcny
	 llUvqlsl9PtFfLB7jbMBQCRtbSvrK2DLVZgxLIjGPFoESOuCdLuc8LU8aTi6VCUhMNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gd4GPgsj;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB839606A31E
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 10:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB839606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gd4GPgsj
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1515382f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 03:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793270191; x=1793874991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jehMkVEgMGBUzExRW4jLTeS4kpPNr3py8r2FnDt6bfI=;
        b=gd4GPgsjVo6GcYklyr1/n1T+RIm/k3Kyr0LN0pHHmi0WpE+3LYFksPgqRfLZhxpWO8
         rTEQYvkf30gK2Jc+/VGp6ld4qZD8LMdn6EvRJMwNI6DswMMb5bRJ2fs1Zk1rEQM5CK+m
         3EshKbyw2XIgoDPG0+ldJGles3WBcJP2sZpWBkTsJZWnvwseD9CKkN1sE7waoSOPhZK4
         5BSUusbSKU3UIxWNCEkHPn76dxUwcvsa4/yCRj0YRxxrYSns18l+eQxWh6xDts8bLhK1
         HNK7rckLaQfqeHOgye/wqpFNdh23bS5dOk/EbYM7qonlCOq02rMf6bNh16lMaca32bKY
         Cgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270191; x=1793874991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jehMkVEgMGBUzExRW4jLTeS4kpPNr3py8r2FnDt6bfI=;
        b=n3fN8719aDRiSLRf8WpIobJtU596wvQv6vMGriiyzk5Fb5Q4IP3/r3pqXXHOb7WDJR
         gXdqiC/5xn8fWUm/ywASu0F98xb63ZSx6lTqDWIPgnYfcgbkWBZfUJjoZWknchkr/zJg
         ZPsaEjQEoxVhPjqLMDchgxDmS6Zr+hoYv3j8n/DUGAejmxQaCqWi6kTtUzytkRCJh1DL
         sjg/6wYLIAeSippwBE0/5HMxM/KRuldhLLdoHT9wh6Xqys5+VuJKCsKMGzsZizZ/2DSE
         yjFlbh9bw5ARWOWORNly44SVS1sXqHTuEfEuUNpvICK8ZuTD9mYM1cMQTSbVPG9x1YbK
         5DQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfFgeIwRUYjO6AgAiHMci60VHA6yeY1KnUOQeUXnLMfRTCPTNlPpIPzqE1w7JG1rAzfSgHU8geJZHg@vger.kernel.org
X-Gm-Message-State: AFq9FYJPhKYk5i1VyUR+CRKnfTSeBOtgd1e4V4o+GVCF7GGr47wtvdvk
	E+kMbJ/DLmvlbnT27m8dcURxN8lX2CLXtudh5MOah/HvhAtr99c6Y5UZ
X-Gm-Gg: AYBFou2Bg9U77cx9g05i5BhGabq6Y+JNh13Yhg/Pr0YSn9ojRsGbdqUBSpg95vE73uP
	VWbak3YoA6SPcxsxPmTXL2VfnYwPmj1xNDwP+iYZVmzzBIUHDlZ//43GffV9IA8swmgP99Zfjv/
	VZNtffzQ+U8MQfGCaTr+CM1xGkJdt0Q3QUKdDjbDGWWe8e+FYIkCwHvwTiWyTWwcNN3V2UqH8Sb
	Lf6Co6HUXSit1zQfR571qaMjqPxWVRAmVQNt1IWla3oSg9CjNe6AJ0nnp0tNXmFYPbG040d7HEv
	TNzNlls0Bn5OgJePrEvNXenf6A25PCnfMyjFv8DCzNtQLY9EXnuGTE0d9QgUyGBNGvKZpclU6s7
	QyTq3bKC+E7SJVLnBvnBm5vWNyEIcg8+m14rAc+J+MQouxB+oeDpHw87+AwNNpucOc5WdTxkuJC
	NFCx3h037f3j2P9mGrmyMSnIXWc9mFnNGml1JFQlGmK67lnKI9vhzcPIyCKi7zz/0U7mwRfz/7F
	uGUjTYuFcu1sqoFUu3R+lhaEi2I7WrzzjQrcYfo9UYSX0koh2Co7b0wXvB1B24RSnCjF3mb8piF
	0OBlTtmj5kHJnCKup6CwwORndRVfGpt0vOraHyBu7v0Z9uY5OT5KtkBggA==
X-Received: by 2002:adf:e283:0:b0:48e:1299:c00f with SMTP id ffacd0b85a97d-48e5d288c04mr9053525f8f.3.1793270190865;
        Thu, 29 Oct 2026 03:36:30 -0700 (PDT)
Received: from LAPTOP-AVI.lan ([2a06:c701:4778:c500:4cef:6e83:1a47:83fa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7easm33914037f8f.52.2026.10.29.03.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:36:30 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] gpio: omap: Propagate runtime PM failures in probe and request
Date: Thu, 29 Oct 2026 12:36:26 +0200
Message-ID: <20261029103626.1527919-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

pm_runtime_get_sync() can fail when the OMAP PM domain cannot
resume a GPIO controller, but omap_gpio_probe() and
omap_gpio_request() ignore its return value.

Consequently, probe can register a GPIO controller despite a failed
resume, while a GPIO request can report success and modify GPIO
state even though runtime-PM acquisition failed.

Use pm_runtime_resume_and_get() in both paths and propagate
resume errors. On probe failure, disable runtime PM and unprepare
the debounce clock when applicable.

Reproduced both failures on QEMU N800 by injecting -EIO from the
OMAP PM-domain resume callback. The original driver continues
probe and accepts the GPIO request - while the patched driver
rejects both operations with -EIO. Normal GPIO controller
registration continues to work without fault injection.

Fixes: 77640aabd755 ("OMAP: GPIO: Implement GPIO as a platform device")
Fixes: 55b93c32520d ("gpio/omap: use pm-runtime framework")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---

Related/similar upstream GPIO runtime-PM commits:

  e9438ab5328a (gpio: zynq: fix runtime PM leak on request error path)
  ff82fc3a4a1d (gpio: xilinx: fix runtime PM leak on request error path)

Both use pm_runtime_resume_and_get() to avoid retaining a PM usage
reference when acquisition fails.

 drivers/gpio/gpio-omap.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index a9b9a3d9631e..31525a8eedf5 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -813,8 +813,11 @@ static int omap_gpio_request(struct gpio_chip *chip, unsigned offset)
 {
 	struct gpio_bank *bank = gpiochip_get_data(chip);
 	unsigned long flags;
+	int ret;
 
-	pm_runtime_get_sync(chip->parent);
+	ret = pm_runtime_resume_and_get(chip->parent);
+	if (ret < 0)
+		return ret;
 
 	raw_spin_lock_irqsave(&bank->lock, flags);
 	omap_enable_gpio_module(bank, offset);
@@ -1459,7 +1462,13 @@ static int omap_gpio_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, bank);
 
 	pm_runtime_enable(dev);
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		pm_runtime_disable(dev);
+		if (bank->dbck_flag)
+			clk_unprepare(bank->dbck);
+		return ret;
+	}
 
 	if (bank->is_mpuio)
 		omap_mpuio_init(bank);
-- 
2.43.0

