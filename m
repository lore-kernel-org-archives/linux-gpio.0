Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D8B5632BD
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 19:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790709291; cv=none; b=gRA0FjWVkj6AVF0/Zc/uYT4+2uXu9hqq8DX5QzRBb3p2BGZoEXn6VaHOdXjFCh3TJZ1Udc5fV3G/N2C3rAEX9GffQVRFI2mU7elRWyfv9MSXMh0dw4eqOPKXzFZF0GvWVIzqhI7IzNk/0K2/y9cNAiE6XrSC9DvIZUe7bTVHIp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790709291; c=relaxed/simple;
	bh=Pv/l3itL8JsJ4s5ry5pR4tNn6OwFRXIJfgpLIUHSuHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dxxBlMZEsA5CZHiijPFj8iLJOi9CpN5tYqn8UxrubdYNW8Ep9nbCNNwBjEgUcRUTolQDaH+XpasRRb1+prAJeOVVWdqBcJMzXtSUV6zZcy5rMr0BsUp4A+v9YWP6+g1ePHzkJI9xJZ9h6zvyfmNV0qqVDCWu5bk4ypuwwFDBuHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sh1zapjW; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sh1zapjW"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso3334592a91.1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 12:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790709288; x=1791314088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MkuBm3NTuDKO/qlCUh6Ov5EtTqjJE3iu5H/AI55Tjds=;
        b=sh1zapjW4rTLsFv2YdwfMpA/o2pc4ErOvUdcvMZPCTveWriw+Fz3EtvQO+/9Vn27Bi
         rC9sTRPmbnkTVyQMcRIUGfj5IYolL5WtRE1Ykrdg+J7oRrGJCjQmtRA59jcovDE1cjJ0
         ZRXr82zJIriI+e43qCgMMs3ESxUQNv4q2J0bt3TRK6W7ob2IdydA37NK+itPdAtqj7wl
         7VgYLu3LOoY3x0xNz0IxKDvaBxRw/yNHeOCVpqtWGwqoybArcWj8+RzW0xONmV46A5do
         0vyHi/yV5Hwc6QWxWsnmhBCSA8s5Usi9v/06dX563oonu3hqI+n68q7zTUpeo2eLycGH
         OnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790709288; x=1791314088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkuBm3NTuDKO/qlCUh6Ov5EtTqjJE3iu5H/AI55Tjds=;
        b=vJTMo5ozV6g/Zc4lx15sfTj+b6HENi1D9bkXbCjNCv3/oUX8kQyosFG702nBUZSX8R
         sKsSocRHv38GL9rUIVNg35oDi3/7eaaXG4XzeTuyttSlIEroYV2LAMJW5ZPqsti2fNjV
         aDrMuRrtkt7FSsUM9O+G996W/vA5mi6hh5JbMikL1GeOxy4NrSqhJjAXh9yJrdjKa/P8
         LWKAl/IG7+Nm6SV3CsLJNwoXy48ZBC62vkvjwaPVTbtAeClfMCxy+a6XjWujr/zj851V
         KV64UkHAQPnCvdXSvgxT0FNfSpavgPjmW+knoFcfQ98PL32uMSpz2B9quEZWoroaCjDf
         GpXw==
X-Gm-Message-State: AFq9FYKSaM91PzAICIveux3AmAIYzEjHSgmnuAmDm7LgVeR79eXH6fte
	dcGe231P8FDaou0f0aHlG0yQlbaYpQGqnfGTSg32lDckTfxNmK/RMWZFWeu+gwKY
X-Gm-Gg: AYBFou0qqy7QhwUUV3VcEzWIs0u1dFI+vQQJmCe05+RB+osP70ZsCxCfTTtV9WnuoYN
	fdHSw5QKRw4x6h7mHZNfwNH5DE0QzRECXgnHvemfLB7SGx2oM2//HNMKp3v8cAMIn4RUrAlcX5E
	aUEv4afudg2unbfxhfqUr420rQQ4Mo8trYnn039hrAg4Qb/hCBKoTPH1V3BB2V3L0yDlZwPxnQ3
	pEmUckDxbeeSbA9effZVtg6KFwbUVILXU6BHucjzhfxu7NLiv/NQvIPVgxbBwRW1+mF/fYjfbrI
	0JMPI7v4BggFNzyaST5AJIi4hMsTcdXyHNUDE6Cy4LOZwzwij3qq5gTkAFI+kS+MfXProV+8DTI
	Pa3Fa97yU7Xzjfr3rMbEaYggAt6LrCd+AxZ96BgeWnNNct1GBZrQ/Y0qw6J3izigz/i7liA7xgG
	I08BQTixDFDFFPyZjIusygBhbTIA+aEUXqdt61CTC3FzzWt/OEh5dCq9OI/aicggOXj77af/pS8
	/yyHnMilC7Fhc3xZ0hR6LoX4rj9jwZBDNm4B8QvW/OpNF1MJvMWlhR/7bSJzRjVo+xkGlfvPJ2k
	n1VJBnPJe4//PwDFC10FwOYzm8CP2FBX6k1FKyZa+kRxF9/V
X-Received: by 2002:a17:90b:5281:b0:39e:6c6a:6580 with SMTP id 98e67ed59e1d1-3a4c004414cmr266504a91.67.1790709287976;
        Tue, 29 Sep 2026 12:14:47 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4bf1b73fesm271204a91.0.2026.09.29.12.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:14:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] gpio: mvebu: fix Armada XP per-CPU mask register save/restore
Date: Tue, 29 Sep 2026 12:14:46 -0700
Message-ID: <20260929191446.21127-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Armada XP variant keeps the per-CPU edge/level mask registers in a
second I/O window (percpu_regs) rather than in the main GPIO window.
The suspend and resume paths however read and wrote them through
mvchip->regs with the per-CPU offsets, which hits the global
GPIO_EDGE_MASK / GPIO_LEVEL_MASK registers instead. Per-CPU mask state
was therefore lost across suspend/resume, so a level line could end up
unmasked behind genirq's back and trigger an interrupt storm once
interrupts are re-enabled.

Use mvchip->percpu_regs for the Armada XP per-CPU mask registers in
both the suspend save and the resume restore paths, matching the
mask/unmask handlers and the probe-time masking.

Fixes: b5b7b487431b ("gpio: mvebu: add suspend/resume support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: rebase again
 v2: rebase
 drivers/gpio/gpio-mvebu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index c57758019e92..03e977c2a629 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -1028,10 +1028,10 @@ static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
 		break;
 	case MVEBU_GPIO_SOC_VARIANT_ARMADAXP:
 		for (i = 0; i < 4; i++) {
-			regmap_read(mvchip->regs,
+			regmap_read(mvchip->percpu_regs,
 				    GPIO_EDGE_MASK_ARMADAXP_OFF(i),
 				    &mvchip->edge_mask_regs[i]);
-			regmap_read(mvchip->regs,
+			regmap_read(mvchip->percpu_regs,
 				    GPIO_LEVEL_MASK_ARMADAXP_OFF(i),
 				    &mvchip->level_mask_regs[i]);
 		}
@@ -1080,10 +1080,10 @@ static int mvebu_gpio_resume(struct platform_device *pdev)
 		break;
 	case MVEBU_GPIO_SOC_VARIANT_ARMADAXP:
 		for (i = 0; i < 4; i++) {
-			regmap_write(mvchip->regs,
+			regmap_write(mvchip->percpu_regs,
 				     GPIO_EDGE_MASK_ARMADAXP_OFF(i),
 				     mvchip->edge_mask_regs[i]);
-			regmap_write(mvchip->regs,
+			regmap_write(mvchip->percpu_regs,
 				     GPIO_LEVEL_MASK_ARMADAXP_OFF(i),
 				     mvchip->level_mask_regs[i]);
 		}
-- 
2.55.0

