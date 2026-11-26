Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795652007;
	b=q2+m7yDEODELdHF6dmhGdh1+6DEwBgPCPysy5Wj4qANIjYtrxGrNoBgdtJByM3tlNzM4
	 aaBdndYLQ4PzjImZ9P3+Av48VpZUIjmRJgEq6L0ukFiU7a2Kzd8OZBFzug7CDW0+cDbgi
	 q6PQ7T8+86S7T+8epnuFtIvpP/rFyyiEEZLSXdRr7RJPbA7Zl19qctBGJyO+mCJwkLL5C
	 dabCP7koSMFK6gHRS4LhKTS8hfJTwouoCrRj/hAWm/aJIVfglCLF17FF539F1WT90QD/h
	 NydEky7WrOV6IFUvKquJ0UXwnNpENukDjsY0A5BopLDGvlvZ07aciJZXEBOltGlykKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795652007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pXPp/90lX1YkR24tu0x78bsF0BUZZN7MTybZBzP2dMs=;
	b=v+zmBAlpWFKtvipNfj2uE58gEj+n/0MMZJQ3963L45qVlBcwV4kI+n5dh9eMtOzy5lml
	 KRwz3G6k8Xk/w0JbWMl9vGR/mOKVzkHN1AxfMbULBr6aMqLA96acMnFfaX4Q2IrQ+AGPJ
	 ZwZN8pAvSC2fwpS42dxtbqO9HVLqEFkt3P9ZIfpJPpTX25X1qNXPK3Um/uv1UoETf9HGr
	 o/v7B3brXSVk1RHF5Z41bsmTv1ca7baZ5CuM9HfJWoMJT/HT4ryn8nwED/M8fRjvNII37
	 A1m5wedGmKIecU6Oanx/0ynjU0hj4SXnN058gWbpvtw9shPWT/W2/O+GGs2D+xF3e6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dkT+0a29;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B126F606A31E
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 00:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B126F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dkT+0a29
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b405d8f1cfso3246168a91.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 16:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795652006; x=1796256806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pXPp/90lX1YkR24tu0x78bsF0BUZZN7MTybZBzP2dMs=;
        b=dkT+0a29FJ4KfjvyHLjIEAXn6G8GuDTS0bICdbFQKUJoozqkasEpK8Y2aPFOU7Zpvh
         mU4mqgChrO/meJvCvYcGqClVGpB5vNis42ubJwfYRWzXEjRkm4YQzgSQPCjmPAvJTuzv
         uQ60CnBm+jlSIT7LVAH/7bH8Qz3mQLRbUt1Ij/hc1anuF/Hqnuu34gt8b8PfAoGuu9VX
         JOxaLBHoI+ZCVMS2O0VbXOTYhY0hn2CoUcWXrUYg7OrcgeMqhR4a/xmd3JxzpqZ5PAAE
         Kfr0YFrGpVMtJYxb/zGvzgKsOLnAwn0bk0rPs8ugonHMHtpdmGUdUTHQIT6cfv6zHuPq
         dyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795652006; x=1796256806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pXPp/90lX1YkR24tu0x78bsF0BUZZN7MTybZBzP2dMs=;
        b=wqG5u1Pzso6y4WDs9J4hzxdCYIz38ULe/TCsoqHWy4DfeYVXKyH0vxgePF/rYXl19g
         hs+zGHqDTyLWXMHRppURwIf5QDIp6saXGdC1Wvqifqe1+teLaFbZodw5ja7AJk3zhJjD
         WMTJC/ekdZtUxylrmGD8UV7mGvotP7yq0fS5rX0r1tLBBQLOeU7RRT/Bnl8KGxrfk5wM
         r+KagY95pOGIQUSeRYJsfn4L6Q8taHrmH9e0anoVvolF6IPqEZ6X2aAxJ3gbQ+b22N4X
         0xIkq4fkIe//GXJMF4dHeuL1BqyEoEaZKFgDyzJ8GN6bXlc192hp6I+UBUXUp8MjTMgF
         3nTw==
X-Gm-Message-State: APuU4Z9KSwZKklrXOLpAmtv4LX3YFjxg9/vR+XV1O/1DDAmqVJPmF999
	wtOlX3mNSKYGQLNtI/EqdYnS0Nh7oJ0U/DyTGlphmUu+qCuK24GccdX5BBwaaw==
X-Gm-Gg: AZFdTZcofqnj5RWAn3bgkjmXdASqCI5V1XjgJ7NYM/VExfjtpBd69mC64rTQjJpcAxS
	sDQpPHlymc7GhqqoOGNHo3ZSKpWyZELXXmGeQrWiI3ctdMFgMIYycS7thAN3F4Mus4snvgW+9f0
	bwh/seCmhaFhzGyNTUO5ANUQdjRTKYs2BpqYsJ3geFZ6xrlu+PieU8bcJs54gcX2B/mudb5DQ9+
	Lk208e2wA5JAG/udZeI4Xp/xZD1b9fzG4bPS4EArHVPBZBux//b9Q4iRPbjDiAjnzbearYcOkvL
	DxiopmIWaKxl6eRPNgcZg5Y9AKJLm/knTsLaupY/T4rTN9fnaG4+upQp7d8twdCrQZP9C9y2CPy
	OoXO1tm1da2VIhga+1ROny9Z9xCczd4V9rKzsPEjNbvb+4LXAOFkvxWnTXuKYrV4a5m4QspLD5t
	WBPDxXYelsh/vWddEAV6/Wg9h37UJ8cBj6MEP7lk6gmiC//3/h59phKwd0IqEYqGkQs1qSJttPB
	9r8Y/DKPa9OgUxMW+VI3IgVTHztUAae2Lejy9+R12/pKMVdMfwy98eV8mQ01apOFrO2GJLGWCel
	CvqoqY5/nOyNhv2Qv7jbK8J68xNrE9K28hERw8KMCA9ikc9+dFMItbUHeZx/y/ceBK7xjJe6Qgr
	FLwpeUtmUcfSNRQf6iIspNsmntkxa0sJfcodvUuNaqBIAGHSF3FYW7ktYnuLUI6MM/XGRsssI9q
	o6mQ==
X-Received: by 2002:a17:90b:4a48:b0:3b3:c675:d923 with SMTP id 98e67ed59e1d1-3b41c908109mr17235877a91.28.1795652005963;
        Wed, 25 Nov 2026 16:13:25 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d135e9sm32411110a91.4.2026.11.25.16.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:13:24 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	stable@vger.kernel.org
Subject: [PATCH v5] gpio: mvebu: fix Armada XP per-CPU mask register save/restore
Date: Wed, 25 Nov 2026 16:13:23 -0800
Message-ID: <20261126001323.583722-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Armada XP variant keeps the per-CPU edge/level mask registers in a
second I/O window (percpu_regs) rather than in the main GPIO window.
The suspend and resume paths however read and wrote them through
mvchip->regs with the per-CPU offsets, which hits unrelated registers
in the main window (including the global GPIO_EDGE_MASK /
GPIO_LEVEL_MASK registers) instead. The per-CPU mask state was
therefore never saved or restored, so interrupts the kernel had
unmasked could stay masked after resume, while the main window was
written with per-CPU mask values.

Use mvchip->percpu_regs for the Armada XP per-CPU mask registers in
both the suspend save and the resume restore paths, matching the
mask/unmask handlers and the probe-time masking.

Fixes: b5b7b487431b ("gpio: mvebu: add suspend/resume support")
Cc: stable@vger.kernel.org
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v5: rebase onto gpio/for-next (on top of 02af7eac17bc "gpio: mvebu: keep
     resume masks within the irqchip cache"); reword the impact paragraph
     since that commit already confines the resume masks to the irqchip cache
 v4: rebase again
 v3: rebase again
 v2: rebase
 drivers/gpio/gpio-mvebu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 46604093a01e..a9e6e7a63495 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -1031,10 +1031,10 @@ static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
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
@@ -1104,10 +1104,10 @@ static int mvebu_gpio_resume(struct platform_device *pdev)
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
2.56.1

