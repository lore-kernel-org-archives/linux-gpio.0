Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015555;
	b=h5d6CHGzC5UpdsQJ0xpLRgsLRsJqAu7AfQsThXXdyl8JpY0KUKdeIsz0+metdHQSSR3m
	 yO4bJokmOs/ykDEPG3kC4LtBzd4nB3x+zBFHSSxin6Pm+kNPMvp4N81V2RO1NYJA/Y+Wd
	 gP5Hx7Ufzxx9Jvx1p/brkmZRftckmIWZp1PgmqXRHvUUZGLiO4r95BhIIrygisNjZ8NFy
	 Hu4nSjq9VvgCIGwm+ZlkLOBE16vlEZI4sazWZnrLB2t5YIdtiTo1vNCV8J98YDKMj0oXd
	 +hfRD0D04lRawjHVYa+XRU0NO2rJiTrxQLsCC20HnFogDkKOPFQLAATtsf/ev6+Vydg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Vt/79XA/yWxO2ogj1KSk8egFEeSfwKKUg9yTYHPXecQ=;
	b=1nC4bknozBYAtq0mCBlxbDmfw4tzY+XAMnTsJAxlWV6n6YP27PbPirbnsadRW2vFvdKZ
	 yqURJm10Sos0hLc9bw+p+xp5HrWp+kshibtY/Gv1aJ/0tniilVoGi9DDU65NjJ9/S5Y8X
	 os3d2fKIC3HIz9tspWSo1rH7QEUcJydpHMrCauDGVrP0gXKXSzhH+wLIKVtfG/tTtdgXZ
	 q+jM0uh1gzx1oyCcseqQgVVnEY008dIq9lp+j3VRI10KrV8RuDMN78C1O0hLhoUtLpLRo
	 HFkIhjRTWuPbF1fcIBme7cEb6omU25lKvJlZG3Y/13v9Qb7CvhErxf+lY073HP+WT/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IsWxLjyv;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D37F60A2610
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D37F60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IsWxLjyv
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a070755c8cso1253911b3a.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 04:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793015555; x=1793620355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vt/79XA/yWxO2ogj1KSk8egFEeSfwKKUg9yTYHPXecQ=;
        b=IsWxLjyvSS+yJR2TrqdixNFLlM5rTDb7uGtRIyBFo7Hkb3usvDA6pa/LO7PUAFYFm0
         jL38qgPpgv7tHi8v89bgFJqnUY1Cb5oudLNTw9Z9i/L1MOPyrevjKh5uO/m5w5OWIKZD
         yVSwWSrA3VEE/eKsrUv45Aw7PuG+L+0XAuCtpt9Ppm9VjKRaHh6dca1MFxfhriz9SHXT
         NKWMp/2+cHiGiYxdlCoJCmwdkzPp7cbleL9PvimiNxdhLHildiwD6tJL+vKrgom4h/Mz
         lFjOiTkcr/W71Re3NYhieMIM1wukkhA1IjrlnCWOYkGqheQSYffVJOohK4+bTpdYtWDn
         3lhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015555; x=1793620355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vt/79XA/yWxO2ogj1KSk8egFEeSfwKKUg9yTYHPXecQ=;
        b=qxtrvOYoqk7ZZD4+zjc0iJTRak+flRLWo4NbG+Xx/8s1y0nnFsnl35GWuA8QaQjqks
         8BMicY3EnrJE0jr6VxWo9jKpl57Up7LtsvVT/LiAwrxMoU3sQKfeBZCbMKhaSJ4I9wiM
         VlxeyAHVGRL/Nd124YHMBsw9681iBm33N2M5cqgN1+Iv71S3w86uzChwTdi/agb5D+Pt
         E1fmG6mNzYhDUDL0gIrCDVWomsjD5u9InngGETH2HmmAJekAoXMM2bBuGMb7FK4+89oh
         7qGSIOtV9dDsDeXBK/ddWi/CYIZhu3UpWw5T6cy8aKYkPXnt0+Xkmo8E3g526ZdtQu3I
         zy1A==
X-Forwarded-Encrypted: i=1; AKwUvByjfVIseLmU/iQ9sKea530hWx7tQ4ixPZaf2smgAzWyW0w0wvXir2cE3mqbC66cepYyuFziFCxptAPK@vger.kernel.org
X-Gm-Message-State: AFq9FYJN35AMnD+g0q1TdA/2JIZsD7CHkrCgMIqxIPa2PdGlULmdYjiZ
	ncGp1PRHuVG9FOpXSygNcrKysxQikbV6APqwvJOWbyjDEdoxKusb9KGr
X-Gm-Gg: AYBFou3zQiL//qwCUOpLiahrLXar37/ZwSKXD4xotWrJxcridQ89kqBca14fDe6B74Z
	6w7wxOaMbJzmIu00U7CckUGZJwPZj6UL41SnfBhA56THOq37fZe0IfiQMGhugr6SLdaHoHX5XB0
	uCUeFDJkCrjINOAzgbOtFyaBHudThmzTZr2OXNycTd8E0kyAbOj+4zmgDWekvBs5M3urTxrq1Cg
	1yvoyJlidapq7xBuOV9PvT8LEWsF2UtpzILgmGjb1gGI/eD6p8VOFeeol5m2Uoz+VRrObbfC0eo
	ZUAz4RoqlqAEpzEZp4Ut4EPoEW83onLpP9jMOeTxb2uePjekOCU6/ttG8bhZZMJsJS75eTzSJPD
	8t/1WsC/TSHys+regxcQCGRtv8ccqOlIsxHhDPip36K7pwmBq9hlNJyVeKZmDyy2yQ5dcUrma9P
	mNKgCQkZv0KtWOueGProTWfiZop/PQ5hmOk1zziEssQUQmH2V1zpiFDPVtS97tOD+nUPLaTkkKJ
	x1ENjhiNRc88iTY92VjWP9Ug3/7gsJ5GkO0i9QaQtNItRQrpTd7Cg==
X-Received: by 2002:a05:6a00:1808:b0:87d:ee98:606 with SMTP id d2e1a72fcca58-8a367f0eb74mr4959061b3a.23.1793015554801;
        Mon, 26 Oct 2026 04:52:34 -0700 (PDT)
Received: from lgs.. ([101.76.249.61])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36ada2805sm1233497b3a.12.2026.10.26.04.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:52:34 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Gregory Fong <gregory.0xf0@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] gpio: brcmstb: fix UAF after IRQ domain setup failure
Date: Mon, 26 Oct 2026 19:52:26 +0800
Message-ID: <20261026115227.41779-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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

When devm_request_irq() fails in brcmstb_gpio_irq_setup(), the error
path removes the IRQ domain but leaves priv->irq_domain non-NULL.

The probe error path subsequently calls brcmstb_gpio_remove(), which
checks priv->irq_domain and attempts to access the already-freed
domain through irq_find_mapping(). It also attempts to remove the
domain again, resulting in a use-after-free and potentially further
memory corruption.

Set priv->irq_domain to NULL after removing it so that the common
cleanup path skips the already-freed IRQ domain.

This issue was found by our static analysis tool under development.

Fixes: 0ba31dc201de ("gpio: brcmstb: consolidate interrupt domains")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpio/gpio-brcmstb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 44ca798cf832..3b1aaea63951 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -513,6 +513,7 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 
 out_free_domain:
 	irq_domain_remove(priv->irq_domain);
+	priv->irq_domain = NULL;
 
 	return err;
 }
-- 
2.43.0

