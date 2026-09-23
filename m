Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273A149E130
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 11:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163562; cv=none; b=ut7Tc+ed5LIEAwkGvlfmoHM2Qad8WkE2KQ4eiZqyAh+bCkpHKEm1V77LHrYNsaxvPnTD6idPMWvv5wiY7RKjRkiZB8F5NCuvJLXNaV0/dp3z1yEsPO63ib96d3oGuFr4y95KUsWwkwTc4b95JsLtTp74bPH8YoTdYoJkE/yHlUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163562; c=relaxed/simple;
	bh=sT3f5CSowAx+WsW39V1WrOSwBm0jKQKK9E8vUOutaIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qpTOdMnQLBtIm1cOZ7iIAM6MTe4N5n+N/xYG/MhYJ/3+wDd+gWOuznYbCQy0qgiToGqVrSh2ivg8UM0Hgt6apIsmakQtPCuQpprnYfCcZw9UVTE79kBrVD8zImEHdfLO+ehN+AdiGiDge7ZIAp7+gFwdnpGrdypNan3Y0exkJlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/jzq1sy; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/jzq1sy"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so545309a91.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 04:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790163554; x=1790768354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=byz42tnH1aP31XpuO9qZLa1U10ksdFNPyaGh5na7j6c=;
        b=M/jzq1sy6BbcEwYE/S19gCSPQ8Lcy6K+LxMqYpK17+PbQ3JvWrfmmTYhyimJAa7brU
         DOGjqNv68DGLPBS93gqJvgsLZZQhc8NcczXAlkKGRf27C+3DO2dFl6VitfsEaZ2HZkm7
         +QKnbNv+qY7hLtDcxSz9+b0Qw+eN7g7AQwGVQGCYNMKhWxJdycOr0IRqcc54y5ts4K6N
         rl10Ic9LAhNeqqYQ4NB7dV3tTzhxkHWEQnNcCRkftVJgzvA/lgbEf0Cd17IBlLT4IDu9
         MbVc373RlcRSJvi1mYWnmWhITyyCBqsOQiaPqsR/znJYDaWRmF5pP0WqJpOKe7GgagKO
         5vSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790163554; x=1790768354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=byz42tnH1aP31XpuO9qZLa1U10ksdFNPyaGh5na7j6c=;
        b=k2GiXRfqmCAaPx0lKMiZXJkvaKHxuRC/QhFgVNLfNVDDqq2wfouKrAt/e4tpa7wytc
         IWGW34VAkMl0Qdr82Pf2iXZQvi7A3d0ciXAiyMTcb92pn3m8LVEELPkOVIvQV3LrDn/f
         2d/PZN/BPM+7zlZNntY8JYMlnunxVZgi9OPWFedQu6NxUtza0T1JBjk9R5eyv3nqILnh
         0RUNj+VJ9QD+x/gfeJyHk+6idu3nSrP+yV2IJc3HMNVEavenFHJSTSEumBGToGwtdeT7
         Je6vcV34xqqIdKMLZ0Jp4eMkKJwVmhT6jjNsywfDhiwmGo+RFSc7IcDu21E3LcE7xWw1
         vENA==
X-Forwarded-Encrypted: i=1; AKwUvBw6QOv0bkP34Sz2goxrwqAiR+b1aEjWQUS1aB8IvPcoVpNjnLE6F2hX7DFqUMLWAnhqjfuVeCkyfXe2@vger.kernel.org
X-Gm-Message-State: AFuF++lJKCcgipTLpSlMENNe6Iqv8d0lSHZySmEhfqvDAs+UvzaWRvuB
	6uyoDXPKHKx9uYSoKH26my2M2bpIUCX5mDxEII2uoFtSgo07pRQIPV//
X-Gm-Gg: AYBFou3kN7qRVb4pqZh4a3u1hQN1pLl7pPq3BaFqJEeKIlK654/L6NdybUg2K0OESZW
	O95u3qXc4TRgkYIQ9k5wZujVk1NRL4eD3ZXEVlBdjKCl782UDYUvmvQp5zAxQBXeLOQrDwip0MN
	4NJDkqw3h+sm8XUfeNhalXIYu7nn8sX3uoMvgR+ailLvbMeqqA0jnbGr1QfpW37DttRHElrax2w
	LayDe82KucIDScx6QbMptWgKI3IDre3kzwEqJwweU36ZCXMeAaP/hV4KiEpmU7dkaNteQnvvCTn
	Ein2kE0QQh4Jp9HsFUWK2nMJlp1qKPuVXJmXDH8JWdldz4Ul5vBcvYVOcI5vIt6bMluDM46XDqN
	VVFN9R+2w93HbqZ01qFOSr9Cc340utc0bMPRxdqc3IkJyD6I0wep6chNz54DVGQaaBHCnWoQdBF
	iDkFAlaM2tPjMDxXrtYT6I+sssmHK5OKrO9PXVSirbr4Q7YwyhA0zEZV//PFPdZuGqap3HGePp7
	TmQKo87k/sx/CEGM1sE
X-Received: by 2002:a17:90a:c886:b0:39d:f08e:e6e7 with SMTP id 98e67ed59e1d1-3a07e5373camr2045004a91.9.1790163553103;
        Wed, 23 Sep 2026 04:39:13 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddaf4easm4654288a91.6.2026.09.23.04.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:39:12 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ridham Khurana <khurana.ridham222@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] gpio: xilinx: fix runtime PM leak on request error path
Date: Wed, 23 Sep 2026 11:39:02 +0000
Message-ID: <20260923113905.1409290-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_get_sync() leaves the usage counter incremented even when it
fails, and xgpio_request() returns the error without dropping it.

gpiolib does not call ->free() when ->request() fails, so xgpio_free(),
which holds the only matching pm_runtime_put(), never runs. The reference
is leaked and the controller can no longer runtime-suspend, so its clock
stays enabled.

Switch to pm_runtime_resume_and_get(), which only increments the usage
counter on success.

Fixes: 26b04774621e ("gpio: gpio-xilinx: Add support for suspend and resume")
Cc: stable@vger.kernel.org
Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Build-tested on arm64 with CONFIG_GPIO_XILINX=m. Not tested on hardware.
 drivers/gpio/gpio-xilinx.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 532205175827..9406ce85f933 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -271,14 +271,7 @@ static void xgpio_save_regs(struct xgpio_instance *chip)
 
 static int xgpio_request(struct gpio_chip *chip, unsigned int offset)
 {
-	int ret;
-
-	ret = pm_runtime_get_sync(chip->parent);
-	/*
-	 * If the device is already active pm_runtime_get() will return 1 on
-	 * success, but gpio_request still needs to return 0.
-	 */
-	return ret < 0 ? ret : 0;
+	return pm_runtime_resume_and_get(chip->parent);
 }
 
 static void xgpio_free(struct gpio_chip *chip, unsigned int offset)
-- 
2.47.3

