Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C8C3DD873
	for <linux-gpio@vger.kernel.org>; Sun, 18 Oct 2026 23:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792364483; cv=none; b=BV2O7lQDSvcbHXNMt3KJ0Jgdjnn+/P8iGt82KtbqZ+ItatSMx6SoaWFFqJF9Le8wRlIsdh5hbA9kc6QEX4ZdLTryLGU2MUikuhmRaO0SIk1aERrdsCS8Z6DKSUBtRkT8Ffa7PZxHzeaPh3Jh8QRX7SWUUv4/KypiqbFsDJy1HMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792364483; c=relaxed/simple;
	bh=VAAVgnyv25zFG+/2rW7vJvNefKZzWh2RCM8Fygu986c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YEbWUVsgVNi2EKLyOlJehHRMor6D/IvI6mBwhkDI/k1iMm7T9gbBXqbt4S6nIl0AJ6vAA1C6PZUXOmwiwaxs/C+SE96CI5JQvTIEUjp8ZgNC7z0zM8L9b7dp2o+CfMRoYJDCO46N60I4e7VXlMFgCTiuuwGJsCLu2K0frc6+vwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHa/ttRs; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHa/ttRs"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso880285a91.0
        for <linux-gpio@vger.kernel.org>; Sun, 18 Oct 2026 16:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792364480; x=1792969280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wcQqMGsW7EjVun/qknWTz0LgUBV6D0ub+c+QzohLAeI=;
        b=IHa/ttRsvnLGvoh+eYDMfRE2GcpDB/qzcnbZkOL/KVgklSrwaXij1A7c44MrhxhGlc
         vo1qawANapIP+fC4qX9QnLKQC92B65v03khpMHpbZvSD1aeLX9gsT0e+Tb73BUMrb289
         ynACSgp6j4MQ1ydfSbu2NTDbqNm6k9mRu7gjy0KqbWbaBD/6yNldfzvFGx3wOw/WKkan
         Nn8AWJp/b/Lyic2G7jzeELqwW12q2II1ZrMaqtvvt8RjxfJ3iO9zTpv1T8tfLeeKp85W
         P0PZZrMrp6DMPlNU/Wa2F42ErKe+eNk/yI9u7PgWzRRFCeYIZv4RPGAzEKtadn/wHcvt
         pRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792364480; x=1792969280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wcQqMGsW7EjVun/qknWTz0LgUBV6D0ub+c+QzohLAeI=;
        b=jzmxt8TMpg9P2Eaj4v6YaZe3JJtL7nYpjMM+t5llBQHM4e0pHBJwi3u+siczibTiTA
         jRnCRxr9hQlLq+VoQBDyoc+H6V1jOuQ5BoScAD7CXILwYfddfi4H2GM1KWsi4oQqplzm
         +C+RF/imipV/n5g2K0Nl4uFmNcYSDMa4tkkU5J6CFzduLPDCC5fmltzKZBHIuZF18ZpK
         JQl70DwYISsUW/e9N1iuPE3gLtjO9ZZBugBxpHoipZF9Jfs+HJyybFwPpwGc+Vwr2Ziv
         3XGTIwvUqu8PDaU4qmtoaRe5TFNluI0S4KCE/Uq4mnhBUFvcadyW1L++ricl07+TiXJx
         eNjw==
X-Gm-Message-State: AFq9FYIQw5D7ClbvTx7kpaGO5dFkxP51MDIUWV4aPAJ7u5ZPrb/zjhk+
	uA49Cpxbr6Hc/LiBT8rm38FAaX9QvD+tUk8q6ciebQD12LrOly6z0hG9LiFYOdhS
X-Gm-Gg: AYBFou17JAyX88i80NClmAzpHZgQyFPUa2GOLFpfZGNoRn5EcLmxXfJO7UmKfwv0g3V
	AERKweQW8fCh/NOXOtjUGeV2PQ4KXaRFh/JDjiMkoujXT9ea1VN+dE0iCyO3YAUF7VwwwhXrDY7
	LBbLnhNbJbFhmJXo3Wz5KmkQ/NkbpVKHfrdikumkv6l4R3z0HZfZbYDlY/Ld3JlZrVAm5ApyMn6
	WlGdFZKv36vPf4b0BGCv0KFlabLiO5z8pfvQoNWwbwT/MnvvfbvdpPHs13kDg9HCWJ1IR7KPL2C
	GPp5OdiM8eU9oiIhAMmsG1yyTbbCe1C8w9Y9qV4rlJX0twlB/NaTgZ+N0wAxf7hG2g+DdhQnJJq
	lZz3BEV2m2PmufY7Osoi98i9uutYkAiQj7mckcRHyoELzXEv6kJSv2XxD3rgqTI7S6fqaqoaXP1
	NjW/PWLxSvL270ZNz8ZZ4gNULf+Oct+GWK4V5B3VAFyS23RQn7pWITJ76h7kaHihkSAa6fXS/yR
	NVq9Hqs2nTuMi5VnEOkG+JoQAg3X9C/9/juX4lE1HRnxlAX3A5pEWKXZ4iN9shU5lFeUo4+L6JY
	yzLlJ/tbPAMe56p0ebayrWWDunxFrEO3/GaXyu8Fotmei8jX
X-Received: by 2002:a17:90b:5743:b0:3ab:f38:2b3b with SMTP id 98e67ed59e1d1-3acef134c18mr5103166a91.21.1792364480253;
        Sun, 18 Oct 2026 16:01:20 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm6831641a91.4.2026.10.18.16.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 16:01:19 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4] gpio: mvebu: fix Armada XP per-CPU mask register save/restore
Date: Sun, 18 Oct 2026 16:01:17 -0700
Message-ID: <20261018230117.23497-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v4: rebase again
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
2.56.0

