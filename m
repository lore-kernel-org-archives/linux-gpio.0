Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2210346FA5
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 19:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771441628; cv=none; b=iiTq853xI5oZIGXUEPW3mYd1Ui4uGi8JBsntuPxAVqF+az4g7GwZt6qHBCemMgvZpPK2NifyXzqVjCAEEPWBCQ3fwWNAsFApkLQOzJNobeuH7pB/SN0A/71DAoBl6QkZUd25ZsYHnEZpsAMxvD9wfRS+UUW3QKYnJypGR/8E05I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771441628; c=relaxed/simple;
	bh=uCBrk9pth5XV1KFw04fhtizU1ftrFLnIDIcUwZgJ8J8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lZs381k1hv06u6C5iQ170Wn0I88scDdiygoRzkE9Y/D2G3d+fynpTVXcgngHPH1Sd8NfEh9s/DBcvyuiJimcmlUdlbBkDBcrJOQJ412mnjZ6jjge1YLXhfXhzAw1ZsVXDu6A4+s2lkDv2K7Kpi60bgZwNflRJ+8cS478vqsHrX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvkrYUGH; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvkrYUGH"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b82c605dbdso307414eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 11:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771441627; x=1772046427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyK7vDKQpQpnD6sO1xK1OxrlziFUWCxllqoH51pcxYA=;
        b=fvkrYUGHoI7XioqxXG2KcXMW8GRMpp6h5TSU/BANz/m6tZXtc00MyPcKHIN3RvCh5R
         DtO/Is3SWl60B2pzYlyDxJNaNOTxRSPeBSPozAMrsBKNdByxHfRMutQ8HQ3/vdTxsZqW
         o6RpPcaQKQe6oGuDEdHU0F+KXAhDWzjCFg1+Xpjqd66s3pT6AxSdB7RwrPQJZhcga9Up
         lA5g5iPvSxfDZD134E+TAuwpjnYt4jbH9iQwRNeP/1h9CgtGgl5iUCnfBqGftd1aOyDl
         DsZH3l7sXJLKK6F7CyQZTIH4PZ3LANL2oc2SsNwr/JvDLYux3ZqloiQbMJgJlrB0cCst
         baaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771441627; x=1772046427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UyK7vDKQpQpnD6sO1xK1OxrlziFUWCxllqoH51pcxYA=;
        b=MuxrvX3VPlYqwCKZ6l80sHWnj2VQNUEySo40xFLeDKjeVmZY1GiRPtyEFdtULmCWiU
         BZmMUUDo6ZzsBMOrL50vrhwxgzJyRO01nQ0aCpYdThm0RNmva6ReJqUgxxCN2fJ7Pjd3
         Mmd1QBmfxe3ZO3qsU/ViW3LC7J5nNUdSIq8qB94d/XAWF+t2J8GTaCNuyBU3CLEEE6bl
         6dGDwDkF08BSpMgL6qmg/TwX+eIE+3OaEnEvTjOeysQa2rJMoQg1YiU8OPW+0dGyjiyL
         ck4yjrF0WTlKgEgA5HeD21tNlis6hLKPTDp4j+tJwAhuCvW1/tBAyUr1H8icPKIsZDS/
         HpYw==
X-Forwarded-Encrypted: i=1; AJvYcCXZBBCwNH3SS7p+XIIr9/bBgx1M0TdnGXghytGYuQwsZuDp/mgNcee07JlzlVh1bEgHspSUNKmLZ1TT@vger.kernel.org
X-Gm-Message-State: AOJu0Yxis+wU3Sqb23lMGvXCN1hrPw1ov5GISH/zud3GMldRCMwGCFpf
	LDa98j77P3kgWObPqvkKcq+k7fCXOf/34xvwgTlgg6vHXI+e/mR3T3ybWuUMZg==
X-Gm-Gg: AZuq6aL6p9K6MQFuSnfQnjmC7FVWOeJncskh29QXev+R6VpFECSyKvoyu4Xgk+lnIM5
	RKXlmXaS4gclfZoPzsq4sIfoKwYICKlDv3NRCCGLNS5MZ2r2m1xmSwSw2IbRbzqunJbYHKJdG0b
	BQ/087B4kxY4eLSMjoe7GQ3CYiZr8+Han88qIyRWKNShEZLwnp7XVSBPUxfmN019IYSQjksb86H
	Tpq6TF5exnRfL4/B2igNySIwxr2Y9K3NRxIwjlxjK3OPdcWb8p189V6TuSDSNqT+F6YH1v5Z9fj
	EEMM6fcNJbn5PB9yoNwEvWNqTn1vNKsNOtvLP7drngrTGVmqMCCR1aoGyBZSMXWrmyKY4rDcxuF
	SyBXtIDlPikfxWO/j6o6TzNQTSKgjNJ3AjtK1JoLCdEC0eqW/RDk/51jTX4gOs9icej+bm88ar1
	KKx6svWKHdB8HpVJ8aitQ610hBUxBUuALde8Up4+747QcbLMpQvWdufXdl9hH+X5JUn60VwRlo2
	Y5Qd5BQEJHh4/Y=
X-Received: by 2002:a05:7301:4090:b0:2ba:80fb:42bd with SMTP id 5a478bee46e88-2bd50064c6cmr1544602eec.14.1771441626892;
        Wed, 18 Feb 2026 11:07:06 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb543d80sm22108652eec.1.2026.02.18.11.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 11:07:06 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 4/7] gpio: lp873x: normalize return value of gpio_get
Date: Wed, 18 Feb 2026 11:06:53 -0800
Message-ID: <20260218190657.2974723-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
In-Reply-To: <20260218190657.2974723-1-dmitry.torokhov@gmail.com>
References: <20260218190657.2974723-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by lp873x_gpio_get() is normalized
to the [0, 1] range.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpio-lp873x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-lp873x.c b/drivers/gpio/gpio-lp873x.c
index 5376708a81bf..f4413fa5a811 100644
--- a/drivers/gpio/gpio-lp873x.c
+++ b/drivers/gpio/gpio-lp873x.c
@@ -55,7 +55,7 @@ static int lp873x_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	if (ret < 0)
 		return ret;
 
-	return val & BIT(offset * BITS_PER_GPO);
+	return !!(val & BIT(offset * BITS_PER_GPO));
 }
 
 static int lp873x_gpio_set(struct gpio_chip *chip, unsigned int offset,
-- 
2.53.0.335.g19a08e0c02-goog

