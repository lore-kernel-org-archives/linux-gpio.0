Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269A51A9FB7
	for <linux-gpio@vger.kernel.org>; Sat,  5 Sep 2026 08:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788595364; cv=none; b=HP4NqCmC20tanq8uIsv6gCWH7XJ/4ttxSXKX59WH+KFiuiOXdEMF5fRrCiGbjBzhGssK3gTM5tG9zjp09i8lOTvYSv4l0Fu1GaccOUE5n//DmMCyRz65ULK0NzhLG3jMwY4qgKIK2+Q9D57AoCCnGmJEXAGDz+Wlja8ZdMJnAbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788595364; c=relaxed/simple;
	bh=SXa1ZqshOOzrXn0rzrXbqOiHkTLlgZAXXB9nEnyMS3M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BBoQ4jzRuNTYG9WRv4RVM4zzrVxtkjNq1O6jlR1F/deqIjoOIIDULE3unzdiewNAhVP98rs4q2m/1BW0AO4d2Ekj4EsjwYBxzqlyPCNpJYwqhg/20kXCojY6rIXtDUaykaa9j2A1ifYMzKzz4j3AqJtwbbP3rU3JzBidlEVhBgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Td8gutRK; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Td8gutRK"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1179009f8f.0
        for <linux-gpio@vger.kernel.org>; Sat, 05 Sep 2026 01:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788595361; x=1789200161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v6rV8mHJA3DgWiy+pOW7sTyqzuTia8uCBTPWEfM6Kl0=;
        b=Td8gutRKNDg6eklmbn237cR6fEI90jGMRmkeJooeomeM4WlbOfVHFv3Jm2bbWtHcux
         RX9FlF2VT3bb2tgo6cO6iah3EToeiWbhXAqFRFyoA8e+qEuXcqyewFOlbUmAmXxuPQ1O
         AgsLk6zmhhxQS6SbK8Leh9nIBjXCKzuqtCMadOg2tAK98Jl6tok9Fdg9+/yDjodyCFVs
         scrImAKHhPXskgZtJzCYFHbvt5CDWVR0icArZq89tJd0dEL3hpv5M8s9WUJaVYGcRbhz
         VxzlRyiEbc628WxNjIrg1EXd1IIYVGbOS94yxOKonP+xlehtMXZrEk7zOrY6i8HsJUkY
         mpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788595361; x=1789200161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v6rV8mHJA3DgWiy+pOW7sTyqzuTia8uCBTPWEfM6Kl0=;
        b=TjOu4a7doaOU2NVgGWvZGKsovySjrLBTOotHBdncADqYkR5F7jJb8i8+7EFgAwrQX/
         6V0hehNpw8L3dLsa8dIvrBODlI5HbLNt980W1IDxL2XBi43LbYvRPI/cB7+jOHkRdc6T
         gnhmMCpC1KBg7x2Trme5ZYOhj/7n4NpxACLeZE/IiPYaoOgPE8PvmqVZqB2eokg4SqZb
         XSV5BICHZx0HEiEVS2etazy62I8vF46lBVwKI3icxeZjwJjEDSeJjJVqAGu+MxwUq0it
         cguphISCooUFMlbY02I6ii+IG25VxOUfPhEm0VOz5HrTHrTDjDeUJt5wZciA661esWHg
         UITw==
X-Forwarded-Encrypted: i=1; AKwUvBxYy2D+MdEWILuu1NSV9/EubduTcPEIjxWNaEduAXal96s1LQGxCM9ozk52Zx9j7jO/oVbL6D5ByhDs@vger.kernel.org
X-Gm-Message-State: AFuF++mnSejVzJ6QmE3iZoy71OKp8inluDaEOFL2JlWsB639QkwaOn/k
	uz9U9JVh3qwV3q/ylUWFNfqhfJrOsGzQQVRprdJ0MdA+P3HW9To+7504
X-Gm-Gg: AYBFou36erSYCqMU7ZhMV6+CpRjquUFB0FnvBLG3yku1aWNea9v7NvB/5vyao2+FvSL
	Cx4vvfea1J2XA+Z1pX/qwY32McT0gaAfZIe41MrrcqEV5CcXoI7pNnCCWp5Qnf5iQNv/HJtfbHZ
	9NpG6ayx3cxG92Dp8jLvQttZH4MbuPTBFMRV6nWVtDuEFf4fFRnsJDkcUDa7uMDRAdYvTTGPy7W
	Klhf2ZVNw5MF15CgNLmH6IKyrCPKSPNWFnToxVZ1SREzReiCTRRPvbkRED9U0B7bhn4sVA4vkrB
	9UliK79hNYpC78HW7+/Lj5wlQN1sM3WsPBzE0dh9mBeTdyNwDNpefV7VN6ydO4VlU1QL/UJfMNg
	nw13ryF0yB0d9QME44gWZRGYcdAeFzqhPCcixRYYKk/+BMNKLvl4IioZg0ceY1cPlmGedRWG7xW
	eoZwzOIitzgkK2H0SDTHTPSqzSvPDeZLAMSlnWfFuwCpWiNHoP9KI85Otr3fOY3GOd3Iy8y0T0g
	8nilqqE/JLUJOmWuFs08H9UABVCb+Q2sSrObouord7rkFUKaIIpgDeBUCRJLZboLIqap4HDZSMk
	DX8b6vzUA/faQIncDBgMEWxPedZNW22ltTcAYIJGtOh/OIyLJstJM0z8ba5ZnwjNxME=
X-Received: by 2002:a05:6000:2010:b0:485:8a47:5b92 with SMTP id ffacd0b85a97d-4858a475dadmr9500479f8f.47.1788595361036;
        Sat, 05 Sep 2026 01:02:41 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9234sm12251794f8f.14.2026.09.05.01.02.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 01:02:40 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: stm32: Drop the nonexistent CONFIG_MACH_STM32MP25 from the STM32MP257 default
Date: Sat,  5 Sep 2026 10:02:35 +0200
Message-Id: <20260905080235.33785-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 619f8ca4a73d ("pinctrl: stm32: add stm32mp257 pinctrl support")
made CONFIG_PINCTRL_STM32MP257 default to MACH_STM32MP25, following the
MACH_* pattern of the arm32 entries above it, but no Kconfig symbol of
that name exists and git log -S finds no Kconfig file that ever defined
one: the STM32MP25 family is arm64 only, where CONFIG_ARCH_STM32 covers
it. Commit dba0aff2b89b ("pinctrl: stm32: Allow compile as module for
stm32mp257") added "|| (ARCH_STM32 && ARM64)" next to it, so the first
half now evaluates to n and changes no configuration.

Drop the first half.

Fixes: 619f8ca4a73d ("pinctrl: stm32: add stm32mp257 pinctrl support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/pinctrl/stm32/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/Kconfig b/drivers/pinctrl/stm32/Kconfig
index d6a171523012..cc425bbfc996 100644
--- a/drivers/pinctrl/stm32/Kconfig
+++ b/drivers/pinctrl/stm32/Kconfig
@@ -55,7 +55,7 @@ config PINCTRL_STM32MP157
 config PINCTRL_STM32MP257
 	tristate "STMicroelectronics STM32MP257 pin control"
 	depends on OF && HAS_IOMEM
-	default MACH_STM32MP25 || (ARCH_STM32 && ARM64)
+	default ARCH_STM32 && ARM64
 	select PINCTRL_STM32
 
 config PINCTRL_STM32_HDP
-- 
2.53.0

