Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165C043A80B
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 09:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068876; cv=none; b=L/D7BYgfvjO9Aid4kggJiWnQxKKLn416o9xCFb5yAcN2oup5s8yQKyzvTQ+XXSv+X+d5NrzJh0HLUM3lPk+Tki/PYcPNZMAGVL/gYTOLHmgrw9vDyuQ8Kpe/f3NboqbGiF+Ovu0YRwrnYj9qel+YFOs5n+amHaX43AXv38sjX0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068876; c=relaxed/simple;
	bh=QwgutwokZ3b0qwkGY6l4hQt9JqC8neMMcSvmNTqPuqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=duktn2b5oMBuvuxWNUPp0MW+puCcmaNlQCoYG8WzhD/LCnRE3AG5qrN3FecSY40sKVBMebq4dVM3Wbf6GRMxD1n1XWcRKQd65M0YpxbffdE4juwDll+E6y1u3bpIirZulUkjwcMaegxmnI+pSrvcYgUyTLnysycMIN0ysYVvkMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aG6M8SOG; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aG6M8SOG"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc5121bcf1aso3164359a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 02:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790068873; x=1790673673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VhqwyCXWCrR9ZsZI79xSj7TfrvM5uh6vx6A8zPKncw8=;
        b=aG6M8SOGcJZfavB4ZpeKV6X4E1aIu1Wtd1lllaL3XcYPExup7XC/7Sy6LoRQ8MdJ2X
         3TtZSJ74pVC8+2nhy+6T4LML2GvA5wlTyNewTXRXMIbOsEmd1ZvEWTxwfEfBS86MDPNW
         ozz3tMk3iUh7/0NbAAf7TeUKmjYHMBy6PS8FhJnCG86pPTYSADEBvVg9htupuH5NoQ9g
         QXUbY+z+xQ4Th7ezB5NJ3rTYLhw9KWwXRdhsIJZyuzqNJYY16V7dS+Q8Y8ZH/+cFitgD
         Rt/RQvceVtT9RiB0PIg3+V75ZzWBoisY8axXq7rNyk7coRuCaSKSeAigJX5tkfNRfQ/z
         cBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068873; x=1790673673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VhqwyCXWCrR9ZsZI79xSj7TfrvM5uh6vx6A8zPKncw8=;
        b=C+SyxGy0tMvHDIwadqodfdHtd2wHnvLB9kU3TQ1JZbqEcOs1lALRi9YT1a21nR85np
         wGuGmgs2P+DwVYqZ8dRuV+IT0dZJtAz4SQoyVJQLLHENc/o7Qyv6V7THbIR6m3Fg0Afy
         9EqR/cRR0OHzvirxvAmMU8+uKdQJmD02jEU0/suXop7KZiGYUXZfOI+CnKvqqNRfE0ep
         ekJnl2NN/LTlZsMM50yY0sYsCThrcMsbh1hIPR2+6/+UN7sXt1h696p+A3PNjiaz0s5H
         cOnzn/6SOc3gb9Smx2ycWbhslp1GA7yVu1CE822qOW+lJCydAQvjmLNYAqhrHOE6Mx8p
         pUsg==
X-Forwarded-Encrypted: i=1; AKwUvBxoH/PcMhkcQuc+0P7TxBd5jUh3bbPoGKbTz1qNW9rlAOH37G0V3heVV+B9mjSAxOOp0PMBPWjHcZWK@vger.kernel.org
X-Gm-Message-State: AFuF++nCDrjUE/Tpt3hbT5oEQ5UzrK0BOLnBoOzBYLkERIzuhV2PbVnx
	v1/MA5EBUsho7q1N3IH0S7OUoZM1kPsvDHYWe5bjd6DQOpKlPdAgJ3K9
X-Gm-Gg: AYBFou0BNCCw6wezJlqZwuAPAtwYJhc0bM0HNMIhVWxV8tBJLLQXX1vdwisHjGJFQE1
	2I7k5kmg+FuYvRa51AiXc3McNVYk2y8p9EBnDCbE57KtRXmkUd5U/mhW3V8dgD4sOj/frGJVizN
	xPrmBLUAtYHuT5iGSJFBng2Cm+NFlxlTQetLSBbSTNTjNPeHO3S5B2TSevkCWky0HQ6hXiAnjdA
	LTvwUqfUxX/08a//umOrXXO9kEvIX8LNicCA07Xgato+d2/S2WChpoh4mezO6cUhFd9K71BW0RV
	5EtFKIPgPbMGET4wLuTzdHWmuKOo+nZnKS/XlFYA4lnAkjMu5X0/6yn0YRLkMKHDeIi3B6rrCrO
	UVdrWXenBIQIYqg7Rbv9bm3nyIXqbba57VNT9TFvDXZdarlx77aA+obRI/sb7+HUDtGpuad9MX5
	bDVxdDG82GnPEdlbDKJX85SYofDHYqImIl1eO7KIoMNl8F6FnoKNBhXlagTC3FReQqu9Q+0Aijo
	yjd0sjifWM6uwBSGi8=
X-Received: by 2002:a17:90b:2686:b0:39e:4546:fb26 with SMTP id 98e67ed59e1d1-3a072e96de0mr714758a91.0.1790068873149;
        Tue, 22 Sep 2026 02:21:13 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06caf4a73sm899819a91.2.2026.09.22.02.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:21:12 -0700 (PDT)
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
Subject: [PATCH] gpio: zynq: fix runtime PM leak on request error path
Date: Tue, 22 Sep 2026 09:20:58 +0000
Message-ID: <20260922092102.1053513-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_get_sync() leaves the usage counter incremented even when it
fails, and zynq_gpio_request() returns the error without dropping it.

gpiolib does not call ->free() when ->request() fails, so zynq_gpio_free(),
which holds the only matching pm_runtime_put(), never runs. The reference
is leaked and the controller can no longer runtime-suspend, so its clock
stays enabled.

Switch to pm_runtime_resume_and_get(), which only increments the usage
counter on success.

Fixes: 3242ba117e9b ("gpio: Add driver for Zynq GPIO controller")
Cc: stable@vger.kernel.org
Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Build-tested on arm64 with CONFIG_GPIO_ZYNQ=m. Not tested on Zynq hardware.

 drivers/gpio/gpio-zynq.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 15a79d9a2e9e..13e4c5f0e297 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -798,15 +798,7 @@ static int zynq_gpio_runtime_resume(struct device *dev)
 
 static int zynq_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
-	int ret;
-
-	ret = pm_runtime_get_sync(chip->parent);
-
-	/*
-	 * If the device is already active pm_runtime_get() will return 1 on
-	 * success, but gpio_request still needs to return 0.
-	 */
-	return ret < 0 ? ret : 0;
+	return pm_runtime_resume_and_get(chip->parent);
 }
 
 static void zynq_gpio_free(struct gpio_chip *chip, unsigned int offset)
-- 
2.47.3

