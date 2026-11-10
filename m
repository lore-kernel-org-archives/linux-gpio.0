Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=183.62.165.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324553;
	b=tIAJ9oZ77RwpF4ScBiM4IvUhiiECPBj1JopjC3q3TDEFED95SX6M8u5ux68J02wECaMf
	 yG9qU1PJC43WUrFWFBdlJ3EWIdNv5PYWaEp301yWQVQ+qgkJu2VpbbtLrzgyijEY3NDtP
	 HxLpt07xyU4gVRou3oFNRd8KtuPx4BFkqz2zFwrTAHCFSdNPScwZfZS5s/z+sq0ibQHy0
	 V/U08Ugy+zvTuwniAMt0Inl7qL4KgXmzgBGLuQZhOLshrH8z54ZUGQ4goOcRzyvVBQMSn
	 mokM63/C5PL/ClUHVOFwsmYENSVqa+WjifosVwvjpDTaLAyg8V9U8wpQvwSe20bXxbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324553;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:In-Reply-To:References:Date:
	 Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:X-TLS:
	 X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:X-Fangmail-Anti-Spam-Filtered:
	 X-Fangmail-MID-QID;
	bh=dxLmlYIUn4WoKTC3F7nCpQ6smXsuL9ITX2bd4g7e+Uc=;
	b=VgCGRQnxKYxz0x7XN7vGpPfRiQJFqShwNeggyQSS0RFROSKNVfilM2D1t5OGHgEjndIu
	 xcNm2qflzGq7noJKjOlBvsj28b4GLwmNM1BIUljNUrJXY44cV/BQ8WKsYsuiIpgguGZA9
	 atzJ3jFR7ECAEGnHH9PsF61DiFlrYH5Bk5ZyFY+Mzm6whVj1Af1xc/S6vFvxJU3daEuYF
	 s4vLFTvW96iZAeN68/19nRqCqH00PiQHWVJ+TNlDEqr8uCmsKOkoNEJtObBouUTUA2tKK
	 CqWCPwDdogISQ+po9L/9Bfb3CMnKqfUS0ttq1Wxegp0eqLGe9u1tsEW0rm/1Yso+vYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=i5n0RWE1;
	arc=none smtp.remote-ip=183.62.165.209
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6327F60A262D;
	Tue, 10 Nov 2026 15:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6327F60A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=i5n0RWE1
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jP9YG252Pz57HS6;
	Tue, 10 Nov 2026 23:29:06 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794324546;
	bh=XizvBbNzKRSCBjnjr096c0vhXTifnuV/sSe5ZPOGOj0=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject;
	b=i5n0RWE1BLFwnbQvIEkNIZ/IbQDKpwluhxCUr1AvcKw6z7aV7eEhx1waf5Hp9L5S+
	 TfOvGpwdam/uBf6Uo7vDsbbnY4CywzzrcVAq6zd2uZRk5iu5tptEr2ejRLh9yFC3ue
	 8v4POpib2aR3qa0mE1PVccdjCkAyxWjlasDxo/snKncvI05XF8T2kDIHo3ckBsOpTt
	 B0oqIRnB85dtqbsx+SCYBRjuUkkiUg2//xfhWrwkKFcOtEp/n7qS6mpTV+59AFsctc
	 ADpTl1k32kt+uLXGr47ArnpePtuAW6NEAu3DSWCPOrk6vWnA7YUxW4EMMt9jmJ6v2v
	 RdExwExaSFw7g==
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 6AAFT3CE043061;
	Tue, 10 Nov 2026 23:29:03 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 10 Nov 2026 23:29:06 +0800 (CST)
X-Zmail-TransId: 2afc6af33842c75-1c29f
X-Mailer: Zmail v1.0
Message-ID: <20261110232906369ZLuAsGK5G-O-TMm-__xu3@zte.com.cn>
In-Reply-To: <20261110232858050VtOdBBpXCW3UEgZXA69mH@zte.com.cn>
References: 20261110232858050VtOdBBpXCW3UEgZXA69mH@zte.com.cn
Date: Tue, 10 Nov 2026 23:29:06 +0800 (CST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <linusw@kernel.org>, <brgl@kernel.org>, <linux-gpio@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <andrew@codeconstruct.com.au>,
        <wbg@kernel.org>, <opendmb@gmail.com>, <florian.fainelli@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>, <jelonek.jonas@gmail.com>
Subject: =?UTF-8?B?W1BBVENIIHYyIDMvNF0gZ3BpbzogYnJjbXN0YjogZG9uJ3QgdHVybiBwbGF0Zm9ybV9nZXRfaXJxIGVycm9ycyBpbnRvIC1FTk9FTlQ=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6AAFT3CE043061
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Tue, 10 Nov 2026 23:29:06 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF33842.000/4jP9YG252Pz57HS6

From: Shao Mingyin <shao.mingyin@zte.com.cn>

When the "interrupt-controller" property is present, brcmstb_gpio_probe()
maps any platform_get_irq() failure to -ENOENT.  This swallows
-EPROBE_DEFER (the parent interrupt controller may not be probed yet),
so the device never gets retried and the GPIO controller is permanently
unavailable.  Return the original error code instead.

Fixes: 19a7b6940b78 ("gpio: brcmstb: Add interrupt and wakeup source support")
Cc: stable@vger.kernel.org
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/gpio/gpio-brcmstb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 3b1aaea639..e23e8f267f 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -655,7 +655,7 @@
 	if (of_property_read_bool(np, "interrupt-controller")) {
 		priv->parent_irq = platform_get_irq(pdev, 0);
-		if (priv->parent_irq <= 0)
-			return -ENOENT;
+		if (priv->parent_irq < 0)
+			return priv->parent_irq;
 	} else {
 		priv->parent_irq = -ENOENT;
 	}
