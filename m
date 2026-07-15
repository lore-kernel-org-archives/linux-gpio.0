Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E403481A9B
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 16:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134580; cv=none; b=lvvaybnRWkIJiPnnDCPGrS6iT66fOARDZjC1VXaeaXt33V17PvUYgJEgVNxgzUgRcyHG07Yo+YRoTp3QpLJKBKbKgFaY4M1+q7NorCBFlYqLKWTGdr4yawjDz+uO13mN5zYagGcopcy94D9gx8W0Pe/l+hyIM8HXvfumESoJ7jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134580; c=relaxed/simple;
	bh=bkwlINiazla+tZRSHtoxnsVLP20L2oXwibDxhkxj7js=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KjdGwpxLQ2PMZvoHhbrir2Iw4sctjoG9YqIcWwhtklWatsqElxz1tDX9Ovl4aJYnMkVIptxzSNZh/NbxIE2G5P9m7/sp8dqNAKiuy4VBqPiVrbjEIhM0qLD0/U6h4VZ3Eyq4XeHrqCzeny/+iPIc1m9EPsSJiVh8+wH8BYtTXp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HFfTNWAV; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HFfTNWAV"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c19bad03so50439035e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 09:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784134576; x=1784739376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WUteuwME2uGYWU75R4Isd7MT7Vc8E+akRTgRNZu/pPU=;
        b=HFfTNWAVcM30czx3m02hWfHgvAdC9Ay1MiQwS/fyYP/2+Tv0nl3iBRYIGQIEZdoBs4
         BG4f/+wJbxpR4DiHCtxzkJOAa8WL1WE1j0sTWLuQEI24l/StjTvKzBY5GoE3JR6EYHuP
         BDdGOV5aS/opgwZWZb6gT3psM9/+RXVc5wGcQWkL/W3eVQaA+dFFYzU8WjsF5cI7/g8F
         z3IblQWOKRcgbpsxlEFU2NBBx4Eq8O0ORXMspTF1VeH7NuPr0vb7YDSYGFMIO2kAGYCV
         8LMASrzu7TyMrnvoCi39uEnCnpxeBkNuaL8PtlJvgqTal1WK430wQOHS2i+WpuLk1SvL
         fjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134576; x=1784739376;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WUteuwME2uGYWU75R4Isd7MT7Vc8E+akRTgRNZu/pPU=;
        b=tFJ7SEJmjAdGgoOr0VEyg1QiRqlw/xk28Ct4tyr+m6d2ZCqwD1fbXjwcTs7ePFwyfg
         Os8HwVxQfQ1MzzmvMcwoGR2K0tYlNgPWlU2mMzPUHZ1aI5jvwylDEgxlogrobQF1KrGP
         h8UXc3gg6pEBKm8t7Z1pJrjI/LygYUEkZpp9AxzgTGRC7U5iS48JobSR+EoGkoyPOwOx
         BVlY83oNxlVoVuv593OFZ01S/kKc0EMsPL1Kdg2ejAHg11JzcAIVr9zlXszPdNRwL68m
         B+uYA4aSSLtm5Yxg6Y+qizELx1SnsKnLM5bYsFMbii0d8BVSIhdpJAjHTSAKyiI84t9I
         Pf+w==
X-Forwarded-Encrypted: i=1; AHgh+RqnDOTM7hrVimDHA4ax2BPITtJGcvXubg9T3JH2SquhYn8YAWOmEUmmBKbWRu7lALEfoZfhv5VXjecd@vger.kernel.org
X-Gm-Message-State: AOJu0YxLxls4nOKFWRMyXxvRC0IVnOzWQH5gZd0aSCrb6WKtd29o63Ki
	Yq08GVpu9xSaql51CVizE22OIP+JfgMMb6aG89yMhMGaVB+fXGCFN+13YW1b4hH1FrE=
X-Gm-Gg: AfdE7clUe6qGRPDZFS9Dqv2ysZ980XzwlAOLlI0t1oph6d/sW1ea21LIcNShHyCidC9
	QZKSSy5kexLkX5VraCy0lc4paF8h/4q9E3VBObplWHCwDfwvNMFrzVPWL5zWfoI6fAY0JxDKKyA
	wofp2UCT1QNNBnieXxONdHqqAgP3cot10eVMe0MgdEKqjy8jUovKajEkCdV03Kn2GuDVH4nj/q2
	XrLgdATm9XZbhhGyhbqze8zEntuRE68TMkXPCJ6MSoYGm/edGAormEkjbViHAY5fCTxB6HSwZmE
	Z+u/R7puTxGwqnsXAmMwnv4q2ceqfIRc7YUn7M6b/C3McJs0MYb36fWhGjWVsvHQfrWiYoGEr0V
	5xpJlAbs0BHWuicEutnlRM0u3WdGBq8L7YmNq9bIT46e7zQ62jYcIHvYGYDVzyEgHvYyc00IsIc
	qeJomIGxA905C91tmj7Yw7G19hDamysyZworEVs9MRv6eFWWUZtnmf8wVITaDexAitVp+XZWhED
	b8XfILQfWMfUQ==
X-Received: by 2002:a05:600c:530c:b0:492:3da4:81ef with SMTP id 5b1f17b1804b1-4953c830f66mr38636005e9.18.1784134576362;
        Wed, 15 Jul 2026 09:56:16 -0700 (PDT)
Received: from localhost (p200300f65f47db04249e031dea91a10d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:249e:31d:ea91:a10d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f4634e0e4sm18987290f8f.4.2026.07.15.09.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:56:15 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/21] gpio: pxa: Add missing platform module annotations
Date: Wed, 15 Jul 2026 18:55:15 +0200
Message-ID:  <6ed0564789ca797493334e295e9b719e0aaaced3.1784133987.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
References: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=849; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=bkwlINiazla+tZRSHtoxnsVLP20L2oXwibDxhkxj7js=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqV7uCfbVfdlQ5r0zs0kre524NEm2S5UK0eWJqn Pnclzpjq0CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCale7ggAKCRCPgPtYfRL+ TsicCAC3UUWHqhLJMKnrxTj9BXf9AvCClJyo+mVLp8z4bvTsCWSjR9+oMfBbssEfopG0bej2zMk y4ELMYlCIGylUtn7h8dgyPUlIM3H1hCQyUZA0L7VPeYqeg0TbB3FmqbNFGnRUK74YiwFs62VZqu lISsR8VOoqoSU1wqRFKo+/q8sL79S0pxNYxRCyn1dUAvsOeXzI2eBESw7vRciQnWSu5PWuGYAII OtkrB67k5UezyHlqL1Vs90NAF/UclcHI63A/ElHYIkP2kQe2tMywz/Q59SXaW1VUcAS/39Yaqhl 4VBAxrmnrDTtV8gwVluLF3t9PiveIa5hB7F2r/xGyt0O2XrE
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A driver module matching devices using a platform device id table is
supposed to declare that in the module's metadata. Add this information
for the gpio-pxa driver that failed to declare this.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-pxa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 317e3bc925eb..7aaed5b30e7e 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -719,6 +719,7 @@ static const struct platform_device_id gpio_id_table[] = {
 	{ .name = "pxa1928-gpio",	.driver_data = (unsigned long)&pxa1928_id },
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, gpio_id_table);
 
 static struct platform_driver pxa_gpio_driver = {
 	.probe		= pxa_gpio_probe,
-- 
2.55.0.11.g153666a7d9bb

