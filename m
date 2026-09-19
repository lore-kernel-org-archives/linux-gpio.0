Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3E528DB54
	for <linux-gpio@vger.kernel.org>; Sat, 19 Sep 2026 17:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789837868; cv=none; b=pT8GextMirYmN47OULsQDWq/aqtQ7e/+eoLz9XMEiLnm2mO6sV/A/Q/whgIRjR+RuqbwK5BkerjBTpjdEeV50ZywUrdKpoLBEmjKCTKU7GcJMh5NlY+cELsaYGjtptmA0gOerXm4d8QwUlRfquixHssxYMD4hD2XspGsO5vAPqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789837868; c=relaxed/simple;
	bh=dHkZRLWtlQaSHjeSXr42g7Q+eXX0UFEmGROzXfKyUJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rvLUJM7ikX5wgi9QPbO4cFEs/od8C8gKZRm/61qmYaUqUf/Tz07PmpEcGe/lSn2EU+78D53DiD2aXhstsMUO8MZqwdxhzsjKQq/IzZX+qa2U0Ycj79DDTWoxRncozQWIzIypwe1bEwX1qeudLbU5q5zsYI++2Uyt6HAw//75/k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lxr4ODfY; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lxr4ODfY"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so917410f8f.3
        for <linux-gpio@vger.kernel.org>; Sat, 19 Sep 2026 10:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789837865; x=1790442665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bOIVDTJSR3DD2SJCi7iFUDKjBfcaQ+nLmnWw0gGBUpE=;
        b=Lxr4ODfYmauH7rsz1xUu7ScH56pOVVzCi9U7DJBuxFiIMSK/Y2k0uwqDs3pqF5s4LJ
         CMvZSr/BG0HQDyy3mRDsrNgh8GLi+HDs4+LtjBwzh73jY+U95WGEe2AWrC/3vvZcZAcD
         WFqkCpK3oBVxrd1/Pk4Nzih9dIbOj2mXyR+fFX28TqlvXrJQIfkqOmLkf/BHvtLc8NZm
         FLGY5oil0NCm0s+EH3ziY2ORcTFHnOJVFzctGGxzU/E2iNRKOngDdKLj0wLoIFj+u4fb
         jeCgFyym4fzcd2Oxwy2R03M8MH7FliB7obyz+wY9Mo4nARKqHQlAuo1eNUw9hBJQLVaa
         eXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789837865; x=1790442665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bOIVDTJSR3DD2SJCi7iFUDKjBfcaQ+nLmnWw0gGBUpE=;
        b=cjY4uxS8kj0LyfeCHU5dn3d7p4GfBXjFU6Pw92BbUzM5tkf5k4TEvayYoueF7FXTxN
         GBdIvBg4DbF4cogPEGRUWnS7sB7W/0DcjWmpUoSMRG2bupuI4/6w3O+Wx8QvFpq3NyTG
         IvQrI7t6h/4XLbA9tSnknE+olFwWooFguGHexFFrippXfYvbucs03wHRuMsxhXRnUGGt
         ayv0yv9HgDbaBhKRfbFtnRMoZiXMnHT998qMXfipVhTJQDMd75btOyUG2778+TW9NLlT
         c/BMtKtPNfe/Z8/8REm/MZtpAGM3tGKKWn32OuEQKAIkxPXUAK4hH1G7cKR/4H9bEtdf
         Ef7g==
X-Forwarded-Encrypted: i=1; AKwUvBy0G8U16i1sRAFG2qZHZk2Ku9O+iF2PNnuLtrYj7SrmXXnhGDXJMO2DenTiqp1Asih+wpkr0XWMlOqE@vger.kernel.org
X-Gm-Message-State: AFuF++kCUqkz7h4MOdrOmLorMRQAptu+NKhoi+8sjT2dylONYZuyXNai
	bCbkutIl0uc6JNnvU6TVl5w9+VJYdxElm6CC0yyEdjV9V9TjfxD7sLXu
X-Gm-Gg: AYBFou2TzOlLxUnA047s8nvCune7/R8ba88c9gB3/bdpeEaV7mNM6AUmZIw8Oi1a8q/
	jGwGLvopWT2glsRkHcmszwvjr9iYXP5JXnhIAonOJB8edA68+oHYxC/VVz8YNpxEr4V7EV9AQZ1
	TxQhAUnSqfetgOnh4u56FAHgm9IaqAzT5k9bbp2Lmfm5/2NzUbG5mZE+TokNQPg07wWFfOAqcpn
	ChVnOGJsJDWEJ28yRwPeJglxjVAg+CvcG8+NtHX9NxJkGP9nlG3Q0LvdTzwUpPYDTketcP1HmWv
	MOvM3/X18xbg7TghK5R/SIu7ABwG+pxnzl2cT052IS/EEIKwpK8NVXg/3OpmRgKRp7DsfP2Nelq
	F2Ned9jPp/CHhxCJh0HGMoaV8Dm0/YJfn8Y2+MxZbwRzVi0LND7ocKLMdbuBrEsw1qfE3vajKIz
	+waXpE46OYHciZ/3cNlqIXq8H2dAJLQMrmv3stG/n74m76rb/fTd78oTNEEdX03Uu0xxLnZidb6
	nvhGLhoyDyraM48ugTRvDhfp8hNBeP6ATsx2wejIs6+Rvp49akTEviwTCgVEVvp/xAEqOeZTBFB
	hTRJCGUEZK1VEt7lRVwkJW3tC5f3VCo5bPLUXiPAQFA0YnkzvLLiC0cQd9UuX/yWArnColI92cm
	9XWn4LsduxWJV+CA=
X-Received: by 2002:a05:600c:620e:b0:49f:ce78:3560 with SMTP id 5b1f17b1804b1-49fce7835e0mr32486945e9.17.1789837864986;
        Sat, 19 Sep 2026 10:11:04 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0f8563sm98714425e9.6.2026.09.19.10.11.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Sep 2026 10:11:04 -0700 (PDT)
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
Subject: [PATCH 0/3] gpio: tps65219: Fix TPS6521x GPIO handling
Date: Sat, 19 Sep 2026 19:10:57 +0200
Message-Id: <20260919171100.90430-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I found patch 1 while looking through the tree for code that mixes up
bit numbers and bit masks. Patches 2 and 3 turned up while checking the
nearby TPS65214 code.

Patch 1 fixes TPS65219 input reads. Patches 2 and 3 fix TPS65214
direction handling.

I tested the series under x86_64 QEMU 10.2.1 with a temporary KUnit
suite and a RAM-backed regmap. Both tests failed on the base commit.
The TPS65219 input-high test returned low, and the TPS65214
direction-output test left GPIO_CONFIG clear. Both tests pass with this
series. A W=1 build of drivers/gpio/gpio-tps65219.o also passes.

The KUnit suite is not included. It tests the driver logic, not real
PMIC hardware. I have not tested this on real hardware. Testing on
affected hardware is welcome.

Karl Mehltretter (3):
  gpio: tps65219: Fix GPIO input value reads
  gpio: tps65219: Use the variant-specific direction callback
  gpio: tps65219: Fix TPS65214 GPIO direction programming

 drivers/gpio/gpio-tps65219.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)


base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
-- 
2.53.0
