Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96914497380
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 23:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686419; cv=none; b=mlV3z1cvlYEkUYmlFVvdWhVv0Vk9QriQXzNnpuZ5/B13XoSFtRXPlKPqKBBISLkOEirVjH1hdzRz3UBZfSHm81ZRr1WQP44Ckk1CydF9zkOW2X69ttnNxHVagFpenjJw4f/zI/yX0ibgQujnJKKGn2t5gbDqwbmrxsbm6Tw+uA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686419; c=relaxed/simple;
	bh=VSx21dpxUhIIA4lpOrFPg/4jNiVhr9XfnhyjQnpuBPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O3JDZSS7yYEXqbeVSczrom/fghpiC/K72n57S0ZgRUoxS+yCAGceW/Nycg6E8EEkPY4AiWqOqOkN3p4X1sA4+9RI4N+8sZOBLl7GwrCoiRmR2DPKQ36IiL6RhEtwqdZgDNGKFGyaQIdmZydHYUv9rrqvU9QKTu9m8M+oVvsgPck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3t0ArlP; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3t0ArlP"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so142444a91.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 16:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789686412; x=1790291212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mq0fKELxNSd6gVZID70uil6xvUxTojj4D/0/Wv6m+2s=;
        b=d3t0ArlPheTeGf32qgzPKvkTHpZzyxzkqRPtGoAYb/hwf8nVMW7mPyvBpHTYP76cWG
         ZRuLGgOgEatUQdF/pY1mwsJDYscGRDIbKjTYbhYS5Guqffi/e1aWEKx6Me4uih34oO1B
         /cilRwD2akAj+B2ftccGU6mLi2FccIxGZ4nA0GTXx5nFEmGmiqwNPZvtxmXOz0N9afdH
         6CJYmm3D1JQ0rEW5FUCuff+zSf0VcbcfUypfY93ic7D0A+BoVQrFS+iIENCUTxtrkxhH
         iyQzktqKvg4t2v6OVNqmPKteKJ33B4waFfZR6MDyMuAcikrrg2qMAikAMUO11JQw0SPg
         kWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789686412; x=1790291212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mq0fKELxNSd6gVZID70uil6xvUxTojj4D/0/Wv6m+2s=;
        b=U7LPDFgPxchIm7MHUuFS3xP9u/64md3FKuaMNw+rkO2Yc/+tD8eenz7DmRHm3KDs6c
         pi2d9ma9yxFvEVjPfSC8U79Q5tFJpNCEGj0IIqJCpsWMRcwrMxkZRbhWmq2Wx7piP+PM
         8igloPmpDelMY9OV9Vic2fUmaRGf14h+TZMh0R09IBO7PK/s0eDHEES67+/9d5eJ/yAD
         xqBiHliXoxjlbuIUjFykcT5sBSmcRAYv5fbeeqsPN/KXwckARd8mpGlfwIiZX84Rc3BN
         6J79Pbc04IqbrAOc7BatpVX4Xdr2HxZeSUIqK+rYDa3x1eBOWruvCuKz4eC5kmGSwSrX
         8XNg==
X-Gm-Message-State: AFuF++lMTW1ZiH4RrCKR7jvGE57yKogD7bsS/+OTKu1wDyk4KAuimNJP
	saaTRj4JddDl27Q8PkQruhiQNLgjId0mcJFLESRtP6aPszVbYtcZgVWlbteZVw==
X-Gm-Gg: AYBFou2PMbh27QQZE/R5WzCZ8ECxylhH+YrrTyaRD265dgER/8Iz2DrXK4louxCNA+1
	IwyWedMTgvnhe4Yar0ZCUT/RtbfyCg+4O/uwC2meOfpmYAoBEtIyoTgzYJ2UhW5H6WB/mdD0/2h
	Zt1C1fZ39DnqY48FWHg2f+qCJHKbVNxk48ywHArs01R48kykDISLQ2gd9m+FCxsaZxaW2rQzJDZ
	oS+QqQTQKa2TaI/bJYlao6kSUmZW2Tt8YlL7uVc3AunWdDty36HUowRfyV4V9tDiv1GVhw7uW95
	pv+NC7v2c+/H7kh3ThqIrHCRErypJjnVoQHk8Hq8JnLFvaw7qUA7Ek5m7XOIvlct0fG1IAOvT8N
	Fr8Tgg7fpuFrmwsgHcN6obTEZutHGLl0cMhvoDtFkai7pI4G9jfcpI5Sj8/rMnr6C1FgwyItBpy
	2AuyuaoQ05LJj3J6s2vzELWZjkU2FdqPN5vzAOLKzKrgYhkrwD/rmHPru9EBZ2nwbP4ziKefEl+
	IyDBAl/ovW77jRF5wKFAJqDBP1n1EdfA7GlUfM0ISeK5bCLiWT9BpaDsPYFw8jT/MsdzujC0i9w
	hgZM9pTp8aP2ooOtSItTzFbK5iH1zkzIRMqmkKUWxmSIyomb
X-Received: by 2002:a17:90b:2c8c:b0:39e:433:23b5 with SMTP id 98e67ed59e1d1-39e54aa1442mr1380617a91.5.1789686411923;
        Thu, 17 Sep 2026 16:06:51 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e360ddfc2sm7079782a91.16.2026.09.17.16.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 16:06:51 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] gpio: mvebu: fix Armada XP per-CPU mask register save/restore
Date: Thu, 17 Sep 2026 16:06:50 -0700
Message-ID: <20260917230650.117403-1-rosenp@gmail.com>
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
 v2: rebase
 drivers/gpio/gpio-mvebu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 267e6d5bacd0..cdd918581540 100644
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
@@ -1101,10 +1101,10 @@ static int mvebu_gpio_resume(struct platform_device *pdev)
 		break;
 	case MVEBU_GPIO_SOC_VARIANT_ARMADAXP:
 		for (i = 0; i < 4; i++) {
-			regmap_write(mvchip->regs,
+			regmap_write(mvchip->percpu_regs,
 				     GPIO_EDGE_MASK_ARMADAXP_OFF(i),
 				     mvchip->edge_mask_regs[i] & edge_cache);
-			regmap_write(mvchip->regs,
+			regmap_write(mvchip->percpu_regs,
 				     GPIO_LEVEL_MASK_ARMADAXP_OFF(i),
 				     mvchip->level_mask_regs[i] & level_cache);
 		}
-- 
2.55.0

