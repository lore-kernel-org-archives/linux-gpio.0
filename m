Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6A23D9DC4
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 03:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789441951; cv=none; b=DeLZ4AH8UPDuP3gaHYjiMumtveipUzejoe74wtTB02np7TrcI78yica+11ALWY12gFLua+l0ngzqY75hsSy/9rtlpgtFLLcv7jKyRDSgTpglXINYAcaqwhTW1hB0fX+4919BPYsqYGT9gIUx05gRz2OrvRpGRV1q5kmTQ/N0pLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789441951; c=relaxed/simple;
	bh=7HSiTV7myQNpDbMgmxOBMHLDS7q41H3tNzEvTvOU3Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XDmWdyuWpDLmB5t27HazaNsLu3n1W7oQhCisXOc8TLpbkSXxU+QjrkrY46h5S4c0wPIpLM2t27REa6JnsmZc2ZpWbLhekmrUHUPUYsT83mFuggYDSXeY8o/ek7WDX/ElVfr6j6CtL1A6DPd1wpkBIdEZUHfN3F54UgLuI2VgEPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJ5XuZMa; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJ5XuZMa"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530e2f50d01so34122651cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 20:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789441949; x=1790046749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OQ4qgoQJawve6Z4eBo5Wf+Avqlqptweex0fGWX2xssc=;
        b=KJ5XuZMauCcogTvb9T7KdMiNdWZeAiBLsxSdFOjINE7TvS0cmudFiVU959muCnKNuP
         6vkLGS9E3dN5xdyKUsr6e0Td4akdZipIEekTmTeX+8bQ+5/ElemyMC0C1rfiFK7mV/Pp
         s7BYBddC/fJXnc3nOTzjYemCYpaqHEpS9J2L3n3DwuAS+Yxir6zMFxpStMr7CaSMJI3J
         lfOT9hSpkfCFWswY5iIlyJALUTRcm5vOlVnw6n1kkx0EpoeQaCBTBfK+QJLAFKMeVYhe
         skeCjkIe5kaOFCZPBMIeBIqOX3MAjodLFm9Si2VEFuUwnEc/sdVtNiNb6o2UAJbIduBh
         Dhmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789441949; x=1790046749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OQ4qgoQJawve6Z4eBo5Wf+Avqlqptweex0fGWX2xssc=;
        b=jkQPNcbkxd1x52v+o2ohgSQS9Mk7VH6kwP+9Epu+KCmq8rGXDBO9DF5b/X8ENbZpI+
         pqQHro4KLAekCrzkLOfmiSK6Iw80LZuoYwzOpX1BfX4gwIxR6DEsWJbmUiscWnWfBoOc
         wbORF1LTKca9PpM/V6IZMxblguD4i+MEo8qOBn6Q4cHvvmwl1/tz02sMxGc207ch6/vl
         xjqBHYdO1suhdfmVNqK3fjALwysY+BxgcDiv27/X+K8Z8CqPTuMpSt/Ol3pfQ+6pIQFU
         b33EOyz8Db9lBt1YpWNXDVck+pYz8nklMsZxlo+y9oaVUeOFEwX38Sm2SDzOXJacs0f3
         ZFpw==
X-Gm-Message-State: AFuF++mfQgNxpyRtiMAAALH/XP+bBAuFL+IzxjGBJ8o5OTJg9r+OxAwi
	2JHV6ZxJyqoZQoxL+YEHKCp0wGkevD6gp0Zg95vy8JcKYCLm+eyjASP84MSqRA==
X-Gm-Gg: AYBFou13eW5CgzeNN6uAXBc0alD4WTNketrmIvFZX8J+PG+4/G7lhtAIsB4SC8OcohQ
	rMxG6EKpSIRLP5hvChkodOP8Qgl4IEg/YUFjXXu6ET2GRmcPHQapwxBnuIsC3x3n+2AMWZR0OM0
	IPujkvhT8uHOWu7uM1qyYAdHu1JnC5zkZwwq5NA5as+LfIRegBww8lwG1iJyIWqwmAVrybABuD8
	EKGo68vn/nbQ36DitAyLowaJWGgFydk+28IiL/o8CvQrANwkRzsNr6PUPK9UC2TBG1m+bCTW8E0
	uhASl0yE59k4Tn1PIzohBrs74hkaGPKWNbUgtrYnBNsc76+wTQL1bfOnkUZfU7eKc8fx4HSc7pi
	drMie2fh1oKzBXNhpGSSWf1bjZqQiZ5UdY+lzjRp+togCNNwqR8wzjHihrmK+/UIN9zgG+fP8z7
	kfABhZP2JJcPn9IKY7sfASEVzCyvNca2FXY6z9UUpNBYQ/L0BphZFiliUf9KodofAXWjiLWmYfl
	GYn1QBrj3whS7Y8O3dONwJxxzRdkxYLFd9CSkQjvIdeUNmu8yTjzK2nf2xlcaFnl2ss4BuNGwK7
	Kntgnenqrv2Ao/qWRStHZ6SH49XlaOeopQ3u7zDhWL1nWYB+z9evZYl/sk4=
X-Received: by 2002:ac8:7d51:0:b0:530:e2cd:3826 with SMTP id d75a77b69052e-5310d0c529fmr83209071cf.62.1789441948804;
        Mon, 14 Sep 2026 20:12:28 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca460a32sm117097011cf.9.2026.09.14.20.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 20:12:27 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: mvebu: fix Armada XP per-CPU mask register save/restore
Date: Mon, 14 Sep 2026 20:12:25 -0700
Message-ID: <20260915031225.191639-1-rosenp@gmail.com>
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

