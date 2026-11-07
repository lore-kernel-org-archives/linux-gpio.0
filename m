Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794039180;
	b=EcS4+4vlVfikh5U+LGiAyuGZ7H3F+ywOGCz8IrGXcHINiuAQVAVMZcQGeR5ko2xfx5im
	 GDZxf4/xFaiOTQUbnbtYjIZGAARzEl2/gm6mNIPPaXFsEGQWUhEv9MLPCnnLv7FaCWe4w
	 qdwGzBxpx2KYvvQDtysdDJdW8ROZHppZS57LGRG7n4ewaC+TzTmnGKyf8k9LLFOJQWrOg
	 G0/auR8vHQeypn0xlf6evK6bRiqlvTKTItxOOE/i2c7LwEnLAQdiJ9vmJdIpmwQjPsESp
	 yzoPvghYYVjW3a9n7mozpiIDKCzmOel2a+lZHRxxYjR9rrR/J/fOgmjx4FK/hHFsEAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039180;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=FUQxplniV3XqQbTU1x3njSsIKxJzZ2Kl6zaiv8H9iYQ=;
	b=Tki0wHabAWimv2AIcyLjC2VknjmB3g3TvG4+Z2+NA1ufPDi6UDXhrqSjhG4bP6bN1KAR
	 c1VQc9qD9cjFIxk++pwqK6j97sDLCDkP4Sz43sivh+UaGCfbnMEr37aRjOk0Q963yfm/y
	 gC8VJTPv8YnaDRWTU1ve/JYIKA1QgZ6e8F1+lyrVXwRvJvZFW9lRdrIXTa2uSXNyWadBi
	 tPjIUlVBeUbAVEoo8be3sw8gmMitZrtJLlG+5UcaB9L/KS4YiSDqZ0BYyQl4R0SLBNlYt
	 NquFiXtVGeWZOcpn6jqZisme6287yyjCNlTy3vgeLeqApxP3foNENDBoeusCE6NnPYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A6F606A330;
	Sat,  7 Nov 2026 08:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7A6F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jM81Q30Bbz8XrrX;
	Sat, 07 Nov 2026 16:12:58 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 6A78Cr5c098744;
	Sat, 7 Nov 2026 16:12:53 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 7 Nov 2026 16:12:54 +0800 (CST)
X-Zmail-TransId: 2afa6aeedd86ea4-98a3d
X-Mailer: Zmail v1.0
Message-ID: <20261107161254042rp3ZKRkQGz2jfH-FBrmtg@zte.com.cn>
In-Reply-To: <202611071612471583hApcIRmqJX9mMWQtxmcN@zte.com.cn>
References: 202611071612471583hApcIRmqJX9mMWQtxmcN@zte.com.cn
Date: Sat, 7 Nov 2026 16:12:54 +0800 (CST)
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
Cc: <linux-kernel@vger.kernel.org>, <geert+renesas@glider.be>,
        <andrew@codeconstruct.com.au>, <wbg@kernel.org>, <opendmb@gmail.com>,
        <florian.fainelli@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>, <jelonek.jonas@gmail.com>
Subject: =?UTF-8?B?W1BBVENIIDIvNV0gZ3BpbzogYXNwZWVkLXNncGlvOiBwcm9wYWdhdGUgSVJRIHNldHVwIGVycm9yIGluIHByb2Jl?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6A78Cr5c098744
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sat, 07 Nov 2026 16:12:58 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEEDD8A.001/4jM81Q30Bbz8XrrX

From: Shao Mingyin <shao.mingyin@zte.com.cn>

aspeed_sgpio_probe() ignores the return value of
aspeed_sgpio_setup_irqs().  That function returns the result of
platform_get_irq(), so on failure - in particular -EPROBE_DEFER while
the parent interrupt controller is still probing - the driver carries on
and registers the gpiochip with no interrupt support, and the deferred
probe is never retried, leaving GPIO interrupts permanently broken.

The "interrupts" property is mandatory for this device, so propagate the
error from probe.

Fixes: 7db47faae79b ("gpio: aspeed: Add SGPIO driver")
Cc: stable@vger.kernel.org
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 4225261f61..9df0082270 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -686,7 +686,9 @@
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;
 
-	aspeed_sgpio_setup_irqs(gpio, pdev);
+	rc = aspeed_sgpio_setup_irqs(gpio, pdev);
+	if (rc)
+		return rc;
 
 	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
 	if (rc < 0)
