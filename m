Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137DA1B81D3
	for <linux-gpio@vger.kernel.org>; Sat, 24 Jan 2026 16:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769271751; cv=none; b=n1CJOJcvI2cMSRoddbL6+I8ke864CdpViPwb39vA1Bbpscp5MEnmV5DOc5NGkAAuvyz9Yh2/7TpHGeHCZJWHkS2m3H0OOQ0jT08+AuIDXkKVQRdDVHPJfMq02B7HAjRaH7Yd9KjcrAAqC8dQS5yxku1samfDo5M70V4DNlF0F/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769271751; c=relaxed/simple;
	bh=TvT+65Txm4un20WFBIxb++POx0lG1dCNvUcsKeW1Aug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l+qhNtla6vrBmUOfUwILknK2NP5ZR9pWnJCOps/rBCCvn886Vu+z3pWmCKWiT3jiH+6tyenPhDUpwm636T9I0w4hoaZfS6UWkq7GZQGnn6+4ns9FDCR865VrazqKP0SuuCf417NXNc3WO3cW/30BjPs6ILsQv8GoNEh4zWBQuiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQHxelOW; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQHxelOW"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c3e921afad1so1212343a12.1
        for <linux-gpio@vger.kernel.org>; Sat, 24 Jan 2026 08:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769271749; x=1769876549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xzqbs1GrytgzSMOd8OeslWj9jW5D/SjS+sxstTepNpk=;
        b=gQHxelOW8zgzNh1l4VVekEMGZ+vP2wF4SARDx/F+fYxOS3dSTknwo6mm1oUsqFzgFt
         GDRZKirl7oJmdBorbQ5JIXVNUypYapOCuIx7i20kmq7PMorr575GCJhW8qzvpTCeLTJX
         V+jHr+Vvm/suhIuYpC4RAcK15VLjox2a/zDk8Y8Lxx4IoqhB4WgdFsuq+zu4EyN7yvvc
         0RTAjVP6MrYZLRrQa/CtWEpJ3csFEI2Ock7+aPhFLOXxzo9TuOmFMqcs0p9gKyKtTvc9
         uQG0aiagbI+rChtCT6sH+Rrh+EBR5FUAPtIODBoei62IJ1sYmxSjiO5sXkBXKx5xtU1Q
         2Ntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769271749; x=1769876549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xzqbs1GrytgzSMOd8OeslWj9jW5D/SjS+sxstTepNpk=;
        b=efaXPT4Kxszf3rwNEY6dFDg0e6xznnCmJReiQ7mU0un7hEf04VLloG/INZg0zjZAmY
         7XuDKb6ikvCW2FQCcc0n9bEo88S3h1RjwVbu/YE2CDMF0GYmc8i/MeP3bjK9wS6T8/vd
         4QZ4fgmrPKgpyDP8PGEO6eEDKTSmxPOhEec3MBH+8J/XN665edjcdDkxLetax1R3KBsx
         PUOiQYCIcsTGyjlxBNaPEfRKfbhsNVeUJ/DQqN1y+CT6oESjipVL8O8a7nqurU7jjdRy
         zqpqjgdV7S+R/B3v3CJu2bbg2w7WZiFsp3ei/ECgYwXNF3yzELqa6TWzWR0WyXnDX17X
         4Y1w==
X-Gm-Message-State: AOJu0Yysee2Z63gVrGujFEznUNIp9G0O8h6ja5t9tIpf3Bg+rBTxJo+i
	HtdEOtOJji8aJNyEqzbzmrsdT0nKhcS8B9sm+WhKQ7lh0uH4wgmlTMjwNMvfBj+gGg==
X-Gm-Gg: AZuq6aLu7uk8OwYN4/oaTJ3KjjnMneLhBjND1kSOPTXtU6AsLS5AfDM6qOHObBiFRjH
	p5ap8qYqoIfe4ORsduo8wXjTa8ctubsXjeSKuRN8KY9q+0ap+EiHhQsl8CRYkhg23DZEAld526H
	ybunsc+p0p4uSfFhOCQ3k8YAwzFziYI/q5Xts44uuZ4IQoNgPG+aJdOajYsD+730QIGfSKn76Xd
	z7TyxhQ4JomdU+hbSs9V2+HjXvO9o4FrzkEtyoPPTtOQVC74pZ71g3SXiGzXAjYuBLY/div/mlx
	MbwpoONq4d4NVgokp+qYGmBm98vJFIy1J/EOM2RzPnmUJHfKAbZiam9yzuhP4Ss192+uqCPqS0g
	Lk93cg5wm53TkN8/uodrmAVuev9TQ7wykW1fCtPdoVdF/ojlV5UFlcyqSgDvQR6fHjxsW+9zWCV
	V7RyxaGC69GyDSk/KjOsStaOlHgTr97rYooyWtrs4qZh/QSAH6uXhxzQa1x68=
X-Received: by 2002:a17:90b:2ecc:b0:34a:adf1:677d with SMTP id 98e67ed59e1d1-35367027f06mr5738533a91.9.1769271748592;
        Sat, 24 Jan 2026 08:22:28 -0800 (PST)
Received: from pride-PowerEdge-R740.tailb307d0.ts.net ([115.156.141.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318662de5sm5160184b3a.18.2026.01.24.08.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 08:22:28 -0800 (PST)
From: Yuhao Huang <nekowong743@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org,
	Yuhao Huang <nekowong743@gmail.com>
Subject: [PATCH] gpio: virtuser: fix UAF in configfs release path
Date: Sun, 25 Jan 2026 00:21:11 +0800
Message-ID: <20260124162111.3945666-1-nekowong743@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gpio-virtuser configfs release path uses guard(mutex) to protect
the device structure. However, the device is freed before the guard
cleanup runs, causing mutex_unlock() to operate on freed memory.

Specifically, gpio_virtuser_device_config_group_release() destroys
the mutex and frees the device while still inside the guard(mutex)
scope. When the function returns, the guard cleanup invokes
mutex_unlock(&dev->lock), resulting in a slab use-after-free.

Limit the mutex lifetime by using a scoped_guard() only around the
activation check, so that the lock is released before mutex_destroy()
and kfree() are called.

Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the GPIO API")
Signed-off-by: Yuhao Huang <nekowong743@gmail.com>
---
 drivers/gpio/gpio-virtuser.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 37f2ce20f..6de5dcc97 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -1682,10 +1682,10 @@ static void gpio_virtuser_device_config_group_release(struct config_item *item)
 {
 	struct gpio_virtuser_device *dev = to_gpio_virtuser_device(item);
 
-	guard(mutex)(&dev->lock);
-
-	if (gpio_virtuser_device_is_live(dev))
-		gpio_virtuser_device_deactivate(dev);
+    scoped_guard(mutex, &dev->lock) {
+        if (gpio_virtuser_device_is_live(dev))
+            gpio_virtuser_device_deactivate(dev);
+    }
 
 	mutex_destroy(&dev->lock);
 	ida_free(&gpio_virtuser_ida, dev->id);
-- 
2.43.0

