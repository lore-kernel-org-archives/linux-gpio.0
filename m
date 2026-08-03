Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9713515D3
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 22:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785796548; cv=none; b=V1F9cYV4E7V7dHMRtscjRERfHgZEWJQakE1BkqARXBznCd5zmKwtfwnp7/KVoBHe6LpofBUM7TaFvimqKGJjmIbNfVfAqc3V/qIuAE4meKjDDoZJwmQ7vwvAq367Nl60+eeG1RqNwNsHaYuMx6hGWmcfVJ2XU5TnNeWtK0Z5v4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785796548; c=relaxed/simple;
	bh=AOMzPzODPf8mHc2kmr0Tt256KecgOEegIb/DMgf/W3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C2lbC764m2r+/RL5otxcsIPfeZJUbA83NlX5q+/98Fg+9rOUMSX5+INGBfvsSRkCUdxomO/EY5IQPKGTx62nGlOOeM5N3yDRQslK9FShsO4heuJWgtm//uTcXDXukSBDQRdyxVDPtu7K6v2OMQewNyPkvC75RtWGclkPbv1TcL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRNdIZkO; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRNdIZkO"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so4588797b3a.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 15:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785796547; x=1786401347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dXpnyUMT81EKJBXnNMHRmhaDilXzipQAqbMBWXRrrs=;
        b=JRNdIZkOxAVUx/fy13PEzLxli8+MKk2ae0u5+I+8IQu/mWnmgLXAs6IwG4mLuvEx9m
         W/5C/BsGdWmMzs/+xXISqi1ZhxVkqGTzqNeov/UAhN3GTBKq2Xn22OKgxhFKrs/dvmnn
         5fhSec2gLw62Z7mYoTq/4r21wEIgepULxwEieK22MpOT1WeFuZNERxONO/PXFRWHNKtl
         AfIWosg9SrqRPYhG/Jp8rB8kCC8OQ/yglnJDg3tsiv8oN1Oy+5c/p4lwuGXb0BzYiF2t
         uSG5YOzm6xA6cDUi9HiJpFrziDINSg8j24yRhBXn9dJYs8/qx/4PZir5B6C7UD8W66mU
         fyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785796547; x=1786401347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dXpnyUMT81EKJBXnNMHRmhaDilXzipQAqbMBWXRrrs=;
        b=iLy0OmQC0OZIKnrVL6YtsNto93iZDWazSgrrEWZ7VTMohn78HqneSVF+EnsGxaCBcp
         w1j3p5fzebwdM2i51aRNpWTPjIzl+rm7nvc6gW5MJyRA5pzqDsk6/y05uIfvIoY5CezO
         U7n1zP7S2G80jz7cxS07JNEN/shkZv1GY/iBHMSYtP1ZONpDuu+yuh1VA4OJsZ/+LUdc
         M8pLX6nvNtGJWvcKHrsR/t3OorWPIDzI+8BoUT4if9ytmwrt+9o7APDAC1wJeLJbfXfu
         c/oNTfVQmrGroZzAD0k3BnuER8in0cyLPXs61AmN4QvKEqPIP0PHxUc9pOYsh7mmVNx0
         i4lg==
X-Gm-Message-State: AOJu0Yzt/mLrydqFn/+HHWP0FxEN/V4L1gyR4NP/qAjxvBO0o5p33pxa
	mdXsIDO3EwW5NtO2xaOlSfLgbHu2+ZbHAtyucyqIdvXTWTedLTakZCszG6y8kw==
X-Gm-Gg: AR+sD10wro6UAzE8gnY//wq8odiWIoNN+xBilC/8ynZ8fd0THdgGOJrEjRoy5tfpCKK
	+76aBxZEoDVWBefkAapdKlGrHEilmm6crlFRUF8DYn5yvRLDrpPgPFeJxGmD9rW7q7fIDFhNNJ0
	CwXGIPJCTpeJI8zYT+Iw8bB5EGnETGkZRVqQbsmER50AqmQ0RqHdTGj5O8rsKRa8mYkIfsNGqgQ
	uw7I+JQttS9IhH5gI43uiO8q4lrkgCkrpM7VGTJCe2dUfn7yT+b03szeDIlSCg6JbutQvJagVOY
	V0WvbYUXSdXg7AY39D/t4NwUhxowLCXOnPKv6kYry8LyQGwqdu9nGpfkCnYgEOCljuA0qm15pRL
	WKME6IrZg+8fuLC1l/bTpW2YKDCRUeqOvE3ee1/0lArb+AZ5SZHr2TMLg4ryFyB5OCzHdgIdI70
	FufeZZ3xMXBalLe0BsVxPcsuHvAG/ktcxI2F8mTBxySanhmSyU1WmUUdb/zPeD9ybCVYX3s85Z0
	i7X0yV905D5gNE9T+6KR8QfnSlAuSEBQRsIj6WKu8kW+q8z7oJdF3vaAMMvKqOr9CszuLY6SwxJ
	AV0LXIsQqayn2YGf7bpw7tdJqZ7e+zvLJt0XYw==
X-Received: by 2002:a05:6a00:4219:b0:846:1b9:cb63 with SMTP id d2e1a72fcca58-84ee48f8ac6mr10770362b3a.62.1785796546634;
        Mon, 03 Aug 2026 15:35:46 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d4473sm4186790b3a.40.2026.08.03.15.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:35:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 3/8] gpio: ppc44x: Use module platform driver helper for GPIO
Date: Mon,  3 Aug 2026 15:35:34 -0700
Message-ID: <20260803223539.86303-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803223539.86303-1-rosenp@gmail.com>
References: <20260803223539.86303-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded arch initcall registration with
module_platform_driver(). The initcall level changes from
arch_initcall to device_initcall, which is safe since the
driver no longer needs architecture-specific ordering.

Added MODULE info as a result, otherwise these warnings appear

ERROR: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-ppc4xx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-ppc4xx.o

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-ppc44x.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index 9b874ff8b124..99fb11cd7966 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -204,8 +204,7 @@ static struct platform_driver ppc44x_gpio_driver = {
 	},
 };
 
-static int __init ppc44x_gpio_init(void)
-{
-	return platform_driver_register(&ppc44x_gpio_driver);
-}
-arch_initcall(ppc44x_gpio_init);
+MODULE_DESCRIPTION("PPC44x gpio driver");
+MODULE_LICENSE("GPL");
+
+module_platform_driver(ppc44x_gpio_driver);
-- 
2.55.0

