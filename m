Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253711;
	b=QzMdGyt2X1emhp6mMFa1/ojevTyuhRlSSvpC1R/FDH0m1Om2dtJwlTYj71umvVQUlgZB
	 GtAzyKTHyoOnxObXQXrLfbbxo3keoyHVg17PoLxA+oMB+zXOImgvI2cKP7BWPdd78FEUS
	 kpsmU+ba5SJobgz7PBmArOVHQe81Uuoi4zxYc0pbd+ZqRGbm6qah8vvCgpffxCyWnRqlj
	 4DErTle7r/tOyU/fk+NxWzAOq6amHBlR1JZlvDc3JbG2NLGIA04qiy9SvO468gWvOa9rt
	 +ywy4SyPyKrVgtXJI7PZXxEux15tvIbzXhtb0EbfecWny0/gKUNq0sbIqMdysLhYkZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SaR5dI4b3/Avv5qRMJv+1R+v76FBZqVUZp4EUUEM99Y=;
	b=VSiKafamRE/nf0uw4iMUGiQM9d5RpS11rRnbzZk58K74u+wPLZiTnHDyQnE9cauADytK
	 Mh8hbCW0xfD8gW1PAdlZY1mq+yERmHTfINwED+SVbDOaQD+P0fFGT/bypbyfEWyKVBeIY
	 lSoq/KF4ih4/4IZwFHNL7JON38FjyqrUpoeWD7s1p4Zk2TasP8tEiK0iT0hzqejRDZWei
	 5n+ro/f07cHhdC1UqtsVQ0r3Jw5OHq/aVyhPuBqDnF9k8aBFEcP7jHR6KW5nsyKHb2f+0
	 ZONNowafKZ8U4B87ua2qSb2OOhBWBGIDnFeg4RwZjGTFwmR/iqB3EIOgBDi1FbgBcGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IKIbML9Q;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922B360A2604
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 19:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 922B360A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IKIbML9Q
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33fb4680717so2700271eec.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 11:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253710; x=1794858510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SaR5dI4b3/Avv5qRMJv+1R+v76FBZqVUZp4EUUEM99Y=;
        b=IKIbML9QoVHmXbOCw/sLvnmHHB9xNCpflfz3IKRPm9CrVGrDaaapS+GzvxDU4si6R9
         rVlO3a6ygJCfJqrzxX/LnDR4AJ7QN9NqpbwoKKZHoMBekbqk3xen/j7PLANsSJBknu66
         N0uZfJy4Rv0FxqKvbeAUUZmsHAgyBEotNmb1XHluj4Zu8hKKW40R2+Ge71Fb2d49BsNk
         LMhj/7NMN5VDJLmZl/mLHT/ST3bH3L875JRxNjBUN8droi5WbLmGM6Myf/jhxmNeHxQD
         EWwoRFwJYEdtIZTd5khSGNC2jNobEFbxMp2dvZEU4JZm4VSDcOjrUg3XlITqNkppEQ3m
         +y1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253710; x=1794858510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SaR5dI4b3/Avv5qRMJv+1R+v76FBZqVUZp4EUUEM99Y=;
        b=1fVUpM3QKmZdaFFPlU4K2ZmlTi3mtBpiYltHnUS9L8Zj96TDatZN7FB8f//LmVNC3r
         P1h7tNVumi5eF7ZhReLl4NnzdyM4gU+D9DR0PSp9MYlA4vgVAL8TFWli/GjtZbFqiCKr
         VYPpob6pnJYPi29Q47eY0M9g4Xk7TcLVkx88LXCmAxMB8fXWyNgZtiEFhpLtYsQqNKd2
         7M2hWoHpANuxFF9umjzvlsuG6OpI7hs9jY5v3PuoW94RySz7uZgNQIjD8iPWGw/ejGtx
         Gl6RUKCvaFFsR7IGmK9Vgvz8VVy/XbWgCPc9iTxjtosHZuNoWFVr8XMKb+BLD517ZO7V
         iSHg==
X-Forwarded-Encrypted: i=1; AL+hErFAEaCtOBH61aH2lGkDmWGA7QZfuIYhcWPOvehmF92FEqYtVwWKtPl6HK1h5xemCjDzsAF+yeaTzsd4@vger.kernel.org
X-Gm-Message-State: APuU4Z8x+nnFquXLDc3QZ7YLjZxjbU3dYDwbxI9WfMpGXjBJaMa/51r1
	4/2reQiswnzh77kpdyA9WMrchW1JIOZzxG1mQ1dUTd7BUpNNofg1VFXZ
X-Gm-Gg: AYBFou0n7cxkgUfzI0uvBnJ8PYchYTKKvxEuxlxGklAe+XumaVBymVvmG0nCs6U0LsY
	Pz7QBXO66VucRmru7uMVPnuWrqq5OZKN4rnLq5GU7r+TryCj2Vup4AVW4LVfYn2HXBn4U7ana00
	+mvp/fmca58Z9JXq9i5DN02tgYYY+fcmhcO9Uwp51f/Pbn9xsoiijlE3D9w47EOSxU68j93R5wn
	XBz55k9Lr6lY19cLlwOORnPaK/2HG/lIVmy9EoF07WnUR7ae7pGxhuoepwUjbB9zMT16d9xCQ5I
	hnWVULCaurBVQoJ0NTWDTBZzVBrigRn5QenoMtmxiajBSLSYnLMUK2EZ8lHPGALOFDL03wIqP0y
	SW6L3L8PH431+VHLMKLzU/dI2mSCG/0aWaSJeojhyq78ZIcr5z3NuC5iOQfbmK9fzDDxlnGTfHy
	brvvZgZIwe2fUYO3R1Iy+Zc3/wTM17AuNoetjFCeqouiqSZiCYMUsZ60qoRGUwVh+2aLPhJ3yRB
	agrduY+m7/DVzjwH5eQYSdgQ1x5n6j+lM9+tWqx3ejpDGG51SbH7q2jJ4xTP0R9BcEUpH9SoDzF
	pWMGk5YNETT2FJ483xl8W5ruA1DNAH/KSx1xe+Lfig62raqrJZTFGK3uFI1NdHW+
X-Received: by 2002:a05:7301:5081:b0:36d:d0f2:7c83 with SMTP id 5a478bee46e88-3751fc35fa5mr358653eec.32.1794253709662;
        Mon, 09 Nov 2026 11:48:29 -0800 (PST)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm530164eec.8.2026.11.09.11.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:48:29 -0800 (PST)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: Sahaj Chaudhari <sahaj123.sc@gmail.com>,
	j-keerthy@ti.com,
	nsekhar@ti.com,
	prabhakar.csengg@gmail.com,
	avinashphilip@ti.com,
	sujithkv@ti.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] gpio: davinci: use controller-specific MMIO for BINTEN
Date: Tue, 10 Nov 2026 01:19:09 +0530
Message-ID: <20261109194910.2282454-2-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109194910.2282454-1-sahaj123.sc@gmail.com>
References: <20261109194910.2282454-1-sahaj123.sc@gmail.com>
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

The file-global gpio_base can be overwritten when probes for multiple
DaVinci GPIO controllers overlap. The later IRQ setup can then write the
BINTEN register of a different controller.

Derive the BINTEN address from the current controller's mapped bank
instead of shared global state.

Fixes: 118150f22d6b ("gpio: davinci: move to platform device")
Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
 drivers/gpio/gpio-davinci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index f7c3b644e0e3..caeecfc3df20 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -43,7 +43,6 @@ typedef struct irq_chip *(*gpio_get_irq_chip_cb_t)(unsigned int irq);
 
 #define BINTEN	0x8 /* GPIO Interrupt Per-Bank Enable Register */
 
-static void __iomem *gpio_base;
 static unsigned int offset_array[5] = {0x10, 0x38, 0x60, 0x88, 0xb0};
 
 struct davinci_gpio_irq_data {
@@ -168,6 +167,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	unsigned int ngpio, nbank, nirq, gpio_unbanked;
 	struct davinci_gpio_controller *chips;
 	struct device *dev = &pdev->dev;
+	void __iomem *gpio_base;
 
 	/*
 	 * The gpio banks conceptually expose a segmented bitmap,
@@ -588,7 +588,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 	 * BINTEN -- per-bank interrupt enable. genirq would also let these
 	 * bits be set/cleared dynamically.
 	 */
-	writel_relaxed(binten, gpio_base + BINTEN);
+	writel_relaxed(binten, chips->regs[0] - offset_array[0] + BINTEN);
 
 	return 0;
 }
-- 
2.43.0

