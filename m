Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B831744E044
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 15:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169418; cv=none; b=KrXI3utAM2jMWgtJJID687bjWGwAoj7RaohaspEEgFoGPewuNq2b8tvRGsb38Gaum25DY45LwgsSTbxBsFB9pdZrVNbVkZKrOkx5gQQSThsZ3V73aC8tbMHEIbDq6NuhFOQKwaIm6ZquvABDMAwtNDjRwhjyieAtc7guTjc+Lfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169418; c=relaxed/simple;
	bh=JKfWbQcS2aZrKBUHgGYO7zHFZG+4D4u0/hz9c0raEB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HkgkQtDhREXc2mOugh2bCOJJU+wFzWVNYCVyR1v2SZi7TvUGSOwCV/0Rj6Dart8N5WACSRNf+tCNE+1N6QmlFrS2UHxJWOr7a1ySPTU+q9tJH7zQvArBJf1sjMyHkd4zg3MQcui+WV5MQ4uBBihZ+Yn/zBI0Yy+uuTeNFAgdYZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8ogF8uT; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8ogF8uT"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso10576705e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 08:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778169415; x=1778774215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jMOR/c+xknZ+G4AyIB7a/iCclsR4nTxLy+1MdkOuPg=;
        b=d8ogF8uTPZSK7+3NtrdblT0OfkMbmuO0NTIsOBDszpUSOlCaEEXGZil0xYYRfDGcfg
         XCW7VmJZIpTybI/8Mix6KM7RFST6TDll1C0FRi6Bzzaud6+TnT/F0kQBG3hnzkmU9431
         qljqz1nQ6njuIiksUvqEopXdJFq4xQsdboN3ylq9vIeZhQVSF8OlyXJXhm2EXnj2TCd6
         mCGBTNApiJiQGPf3gjlt0zn50FzeJC2elPKkiz5cTyqqdKfnXX6GOENhg0iBP/9Kgdwu
         RyOtzoNbAQzr8a1YwlIpCge/IO2C1nJ8DFiFzS7r2YJPR4fmzdDLCTSUkvIIZ3jbxeMk
         gD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778169415; x=1778774215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+jMOR/c+xknZ+G4AyIB7a/iCclsR4nTxLy+1MdkOuPg=;
        b=pBOMdE22wVH8wlT6ScalQMwczGgLLbLTeCTFSX5ZaBOnCmuhEcX9H0t3YUOOt718Gp
         /U7tK2x3M1KMSAI7Y/aJWL6VtPfPuuS/BIK2XkaMBBAraMbPi39WVM9R4VZtp8dCdo5p
         9Jt3Jz5E1WHdrQdGJc//yg+AR3gYLRQcAQASeer6r+gyGcBEloA0DeykET5elwk/VKm2
         N14dVLtkvjJGySyMAXXBWpr9mPpyDulEIIFydnwyTOjX25omX1K3GBZnNMoVrG5q09TI
         r7KR0kInjbvoAidTanXhb7sl1bTu/PplBOK4hvnXUIwAg5pmvujY2bO+pDNU8Ua2gf1j
         V2AA==
X-Forwarded-Encrypted: i=1; AFNElJ8Jo0Xy4no/+RaV5D4Fnapr0CH8GcR+XUF7aTuwAIB9EwOIYsqOAgCZTOUCkhaixAhNiwgkmuVrSUyE@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe3GMzHw4z3nHoE+Q+pLnmAuYrwfCqEhjHeuaU6NwklNZnTYAE
	0NYM0fjFm26uus2tmqF5E3LFHcV/P9FO0gWoWwzlYK/+vixmP3PJPjY5
X-Gm-Gg: AeBDiesDWtA0D+hET/4IQ6yduqPp+00L7YK4FXoPFpNfaaT+PpidpJ2iBx4OKkIe6AW
	pWW9M6XvciYdS9YEMoUP1yGrDsF6bIqGJ1cXRJoSB5r5IaAyRra5Vbk8GGutfqMPsagQGyfIc7o
	V66PxNeve4MKUJ3jDTLjCi8+kke8imJaj1BgJoT21QTHjlNWGzn1+YvNksNLxtu3nJXVGAZRVba
	7oRvnJiBNGqCsOVWMOQgCzvp3JSdJsw4Im1LWYSJXYQ/qSO6XQuolAFAIQM4ZS2dcYGd4ichnLY
	qP2CYrS7V+hjOfKnZoXMUJ0x+DcfNeL+GqNucfYrn7a1uaz2cUte+GhCeKqY8kt5JT9ISzEGb0I
	Sy5ZpCjcRNw3X7ZMnK3uNLlA0rCXf1s+0Sph7UNxqnY+D5q+BJgMZR0VVNzloMLHpcjAPkbbEZr
	SLrWAllM8ey+ZAfriZINIrkTFC7w==
X-Received: by 2002:a05:600c:8b08:b0:488:a977:8de with SMTP id 5b1f17b1804b1-48e51f32757mr152563955e9.16.1778169415087;
        Thu, 07 May 2026 08:56:55 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:68b1:8d59:e348:c16e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45412820463sm44581f8f.3.2026.05.07.08.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:56:54 -0700 (PDT)
From: Marco Scardovi <mscardovi95@gmail.com>
To: mika.westerberg@intel.com
Cc: andriy.shevchenko@intel.com,
	mathias.nyman@intel.com,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <mscardovi95@gmail.com>
Subject: [PATCH v3 2/6] gpiolib: Move DEFINE_FREE(free_gpio_desc) to driver header
Date: Thu,  7 May 2026 17:56:43 +0200
Message-ID: <20260507155647.403964-3-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507155647.403964-1-mscardovi95@gmail.com>
References: <20260506123421.1077421-1-mscardovi95@gmail.com>
 <20260507155647.403964-1-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 include/linux/gpio/driver.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 17511434ed07..7ee65b49056d 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -807,6 +807,8 @@ struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
 					    enum gpiod_flags dflags);
 void gpiochip_free_own_desc(struct gpio_desc *desc);
 
+DEFINE_FREE(free_gpio_desc, struct gpio_desc *, if (!IS_ERR_OR_NULL(_T)) gpiochip_free_own_desc(_T))
+
 struct gpio_desc *
 gpio_device_get_desc(struct gpio_device *gdev, unsigned int hwnum);
 
-- 
2.54.0

