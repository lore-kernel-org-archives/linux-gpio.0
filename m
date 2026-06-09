Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521A83DD512
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 07:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990402; cv=none; b=GOBmcTEGabcR//JQgkuEcWQw5zdVBgvVWL4yI8rMv6TwrSt1bYpJ96qNM645olTy1sganLwiVx3eylQdq/7J2OQ03t1tAHlaTL5iWfnQPw8BdIPQO5r/1lUyS7+GEj/ebKryFnJEDAge0h/Y4CfIBkzT+ClPVAZY0wM8dSEGjYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990402; c=relaxed/simple;
	bh=RWkA0L6Q2phcYPLAt9VvFae3fkF5zlose9aOWTUDao0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oE1Rg9wGZFRWo5mET69jsxNuDJNenRm1OFz3yaxOAWZ5nVZBGdgPGgc/OmFOyORPig3HHU7+FZroNDYTimLQSVCMv1GlbZGBDbltlY7yLSulp+wWc97jyDzJqAPxf/19rkeU5hHm60yE2n71L6E0Kz9DiaYcvhnGLxPakYEnWl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqMYSfVS; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqMYSfVS"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-842264dde84so3038962b3a.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 00:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780990400; x=1781595200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EZxhU2iD6PdOyojyjLvdXFMxCVOPuNzGVXqMgxsvNpE=;
        b=HqMYSfVSjYbnFcQNHI7CGVcdGJkSxy77f5Ip2TId1N1c9/PYkZPZ4aNLH5b+PCzCZw
         lL7LjQFQOi/QgKh/kH7AKcCRVU1TFsR+PTLiVLNCZas+1wfJq1+i5xDVjneVHfOtX+PB
         Ryx1b9pXxkk3iVNsguhSuN6RhD6/0nXxcdc5CYal/dRL/nQXVMHLE7wEtV2kVLWKj23E
         Bu86DZgZf6JiCfIKeTXhn+XsxkajKBPEnHP2qLbzDD+6jE/WeHh1mGyo/8fTMzNKp93Z
         nPoXt5rcodkFO3CUi2cqUvQhT2VOmq6SCTpEuHDzgg/jkpltiJIrySfBZxZ0wTRNdegH
         IDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780990400; x=1781595200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZxhU2iD6PdOyojyjLvdXFMxCVOPuNzGVXqMgxsvNpE=;
        b=rZ66Vo/1VyH54EBd2IHgg506S0eVmLbu+OsoeuYp1/GtQyPY94f9vvVgeM4P1VeLwm
         sZwgkpNKEv4fqsUg3+IXeQV1WU/Gomej5dPPCBam1k3x46/7sJVvlkZ9vKgrV7Hk3nPt
         xTxTvVq0EBrq/gdLyqYCvSesakofR/DfF9b2kJccVSVjS1kV1Z9+c4MybWXRa5L+UI88
         ZXy4eoZn91Z3E2dtjL+mm7ButLMTuJfq7UlQiXF1cu+l5A5Ixbn68s7jyvv3CHIKtDXb
         hW8wBb2EcKrPDHx/3Z3tBYhd3CGZuQ/Bt6IV+QalQ0rg7uiF5pEB9XDNQBXy2LORmpn4
         kH4A==
X-Forwarded-Encrypted: i=1; AFNElJ+FA3ZLsDo8jyBP5gb/1EnGA5hKbDM57E/YpRgh8De6sGx5oH5d17YaRTn+Z1pBBBI1Et1UaOdQX+ZP@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg5puQGXY3fsfLVzpJkQMHRFfiGctX90n5iPg8jvzCerWaLnlu
	E1FtL32lpLIAhD/lam1HzXbqdJPB0kP/dU4tXB0dBPzJ2dVjLGCqeeON
X-Gm-Gg: Acq92OF9jDN0zxs/kJRIcAPS7mJRsSTxav5RmNS3kdvMHAdCiQzlFvHZg6/LWtD8mFv
	G9WJSQ1b5C3ala+hQIIO8mZ582SYzr9HHejDvu6iIMvWK5+TMK7fe7y5SRJ+/C1NLi5xCtS96gF
	UxXPEczuJALk2Lauk4PN3J473DgWcVp5hywZ/KvD0HcAzzuOuG+Wp7Ut1q7ALasKNsNp9tq3uZb
	GXPitaHP7VZLLqhi+nGBhKuRH5383v0fnPtj0EtZVgaugf8uak9SrnLMDWTOCMYl49vNs+6qNpU
	OX4poqi8q692fXWjFqjvztHUMqu2H/uOGblrs35uMKS5o9PuYrVDwJEjt/mOF5x8fq8SHJWApOB
	xjKeQfoDgNfIhLM+qHw0z6x6tS2BNcDWuN8b/RoKUX5oVELb9EYAvnRBaHqB16ygB53LI20WWcH
	GVuM2MvumT6xCR4cO4nxIxGRmxtf7ebMMfJ9xE/RqpKKnhQtaGEFL9Yw==
X-Received: by 2002:a05:6a21:7a9b:b0:3b2:86a4:acbd with SMTP id adf61e73a8af0-3b4d39ff987mr15436890637.2.1780990399495;
        Tue, 09 Jun 2026 00:33:19 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:37c9:44fa:729b:6aaa])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df034a2csm17670712a12.3.2026.06.09.00.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:33:19 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Harini Katakam <harini.katakam@xilinx.com>,
	Soren Brinkmann <soren.brinkmann@xilinx.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] gpio: zynq: fix runtime PM leak on remove
Date: Tue,  9 Jun 2026 15:33:13 +0800
Message-ID: <20260609073313.5-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_get_sync() increments the runtime PM usage counter even when it
returns an error. zynq_gpio_remove() uses it to keep the controller active
while removing the GPIO chip, but never drops the usage counter again.

Balance the get with pm_runtime_put_noidle() after disabling runtime PM.

Fixes: 3242ba117e9b ("gpio: Add driver for Zynq GPIO controller")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/gpio/gpio-zynq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 571e366624d2a..fafca91128b2e 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -1014,6 +1014,7 @@ static void zynq_gpio_remove(struct platform_device *pdev)
 	gpiochip_remove(&gpio->chip);
 	device_set_wakeup_capable(&pdev->dev, 0);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 static struct platform_driver zynq_gpio_driver = {
-- 
2.51.0

