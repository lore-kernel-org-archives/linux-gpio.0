Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3419B485945
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 09:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364915; cv=none; b=P+hPa6wZWUTP4ZasH1I4LEieRuX3BAYaU9yD2uE6YRwjagrj456So0cTuNqhxHnTmdUYCr63jNZIte/hckyGLasOFKmoJO+M0ia2eqYKraPf1Y1e9I49fX/u37WM85UCObx36mLYL6T2OwKWi1TtrfjRJ6XIon3EcY5LqFCNPv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364915; c=relaxed/simple;
	bh=Dpq+FO5QbLndF4YnGvOsuU+Pnen1hEqYaV9KK3NgiQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nYdn0HmXPqfravrXZVK0oD4TYw4bPPNvV/GGRDgOl8JgQJizcH24rWSH6CNj6QKKJG0PucNlKZ2Rq5FDv0/W5e10Bp4el/cE8+u06NWrZKvIRHSo3mBtP3k4Q0AWHaBGXMG8KOv66mxjRkw+Sduts7NkqdhDBYWdMtGF3prMN4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3MK+Zf7; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3MK+Zf7"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e60f9af6e6so2947565ad.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2026 02:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364882; x=1791969682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H1J1BmnMCHIN1mCq8wvdeA2+rRcjtrkkpWyNZuKl0xQ=;
        b=Z3MK+Zf7APYobFc2IwOnyisZeGC/MmecXpB5IO10qhJkRak/W8kKIuGZk/ksqf9qLt
         zh9JQ59fUd1NUwk/Ga/bnnevJjZinE3uNUxvaDAd8LRCqrRZRsIxUwBIrZQ08WzBjG52
         2KqBA/ylDZylKOyWoc4vYOH8DhBHrhgUguSVQ9pC17jWcA3KyrF16P6/TatLJn1hAgGt
         X4DEO6HMu42WzG5uHKf2oh3fd2A8vW4Xjo/3RQn56xBZSrWa5SSbs9JE8yy27j4ZIYT5
         ZYf1oW6XHWsntDFrJwjxSdQDdehshNo/JOTnRxU0NOG4domfsjt7UNKHD/zus2OpPInY
         TU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364882; x=1791969682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H1J1BmnMCHIN1mCq8wvdeA2+rRcjtrkkpWyNZuKl0xQ=;
        b=mu0DOfhUGxZ4FTHnjsQzs2rguzGiVze6zdY6/8mB4wnmHS2PfXy4qMcVCR4hETHjNc
         7IzzlXOcZ/b1Lt24XF+ff94OYKtaqXHXnvBgFn3hBhOeAGvkzW/RqRbcyjZ4Y4ZJgon7
         w4I1XNjSp6GJ9D7LeAQfpwJZyQ9gsR34GyNq+kCz/wYoOBBh9hrFqNjqxelmX0it8uwK
         pMngmFarM3RD+WelXeB+pMlWgzhXDIMv5rNH6F+B/nLwoHE6KUymWjaEWX097M+K3mxu
         hIIpH9ylAudxEoOE4tkMEL10kVjuJ18XKcleBlj1Pcaqp+fckfp515inmmozFMU/3tlf
         8i5Q==
X-Forwarded-Encrypted: i=1; AKwUvBytPl1SWDRJ/yMXArcSqeTw3ciS8ObCh5P0Qez/cFA94clS4jKkAZBRK0iZqOKCvvwb8vBHbfyfiEhw@vger.kernel.org
X-Gm-Message-State: AFq9FYKeXRblg+bF8zQLzyVvLGIpAdActVPqOEDKkeEGd6AEpS4TnVnj
	4JrRJVHFrPpfSpH2cYW7gGu0eny9tHGpm17PdLvOyxquBGUd/TGmOfBI
X-Gm-Gg: AYBFou2sGfBU6/tfUp1zKWhHgU/igwPhk9aYYG2X1O0CcGj5c2JFBz8aNmOJ2T3HWEf
	jgc1TXHYpUFjB7JiHUyFImuud0nePKVsA7mWtKl3uW33alyN3iflXKf4Hchxso3o8oVwjcO8fDY
	vgOx9mrfgNrmekDS4RzYHG9jQs1/jvnugUj1kGlSDY6Tl/IxIdsUZZVDn4wgiLYEGH2symPUAwi
	JjlJqg3BUir181vRP+E2OPANtRuCDDCY49JPSkb7QTLpqZNy5xtZ6NNC7zX+fphxVL14T01aOAs
	rv/NC6AFH547FOit4p7Df/VpmS7PTpCJbMOFEmfSWx7GVQXNZniArNASF+99tMmG2bfajxhoGpb
	E5edjfzXSEvjXOOTHZWmOmFCKV/hRNBXZOJ2VOmrMfx4/G3hJdICmv9RUxorNjD/oWJs1cBROA6
	oWVHdG6Qv9bv3OWCT3r9AeTQ8CBLRWsyX7J98j04Yr34gJbAAze0kSK5rrKz3eQ1QBZfEPyyRP/
	dX1Bk45G6Pst1iZ7C6SyJjJS65YzPdBqh6+zSRh
X-Received: by 2002:a17:903:1a87:b0:2e5:d33a:88da with SMTP id d9443c01a7336-2e5ffc3bc98mr17065405ad.16.1791364882232;
        Wed, 07 Oct 2026 02:21:22 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm7180675ad.25.2026.10.07.02.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:21:21 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v8 01/13] gpio: nct6694: Mark the GPIO controller as sleeping
Date: Wed,  7 Oct 2026 17:20:50 +0800
Message-Id: <20261007092102.3768818-2-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007092102.3768818-1-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

The GPIO callbacks take a mutex and issue USB transfers, so this GPIO
chip must not be used in atomic context. Change the can_sleep switch in
struct gpio_chip to true.

Fixes: 611a995e8ae1 ("gpio: Add Nuvoton NCT6694 GPIO support")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v8:
- New patch. Set can_sleep, as the GPIO callbacks sleep on USB I/O.

 drivers/gpio/gpio-nct6694.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-nct6694.c b/drivers/gpio/gpio-nct6694.c
index a8607f0d9915..a38add1cde29 100644
--- a/drivers/gpio/gpio-nct6694.c
+++ b/drivers/gpio/gpio-nct6694.c
@@ -444,7 +444,7 @@ static int nct6694_gpio_probe(struct platform_device *pdev)
 	data->gpio.set_config		= nct6694_set_config;
 	data->gpio.init_valid_mask	= nct6694_init_valid_mask;
 	data->gpio.base			= -1;
-	data->gpio.can_sleep		= false;
+	data->gpio.can_sleep		= true;
 	data->gpio.owner		= THIS_MODULE;
 	data->gpio.ngpio		= NCT6694_NR_GPIO;
 
-- 
2.34.1

