Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=183.62.165.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794039180;
	b=yxcCXtoOvpI9CAnfHmWH8qvEPts7W3PcHmRzCi7wRPu0M8vHAQ+6RxzUp7UTg1/+XGED
	 4iE18XPt8fbnZ8iSSan4aWxfjycHw5OntNQTg7t3KBYtKHMdbDMjL1NYQus50cckp7MJD
	 BW5+C+QRXDj6+iIBirqCUZMKc93+53OK4BzJG7WuFZ+yhXN0LSZdYefHjryYJT2JAUdCC
	 1uoaAKeNJ1ewhCtt/ARnthUsDwrpE1gGZ0b/4IefirsqE/C+3lyNBpLj+sAPE/rz9LJFn
	 +EZRzGTO6d95nFXa6zwpUvMYrEJwTSFoXip883nSMJo3lrthejrM8r+oSt9L4reHe4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039180;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=0dMcGIrClBRXSilC9u6sG/X2FPAj9hcjI/15dI3yqZ4=;
	b=w39N7i4lxveXbREy8bgXCXMcLpruERRf5GRg3ajrR0oPWywEFYDnBiZsgrf7PX4OMmoX
	 4y/CAbkvLDC28qK4GLD8ei+lUzmw/5LgVRQJLQvkAY7TVGoclTus3DyeU304ja41elJIi
	 lse3KXm2T1u0D9GAtL5WxlJ86aieK1DPzaAXeiZEKd71PtdZ4/zTFroZ29WjCM5x99lzR
	 dpfrNU5r2KwziOHReG6NILXrJ/2aGNKBMLnJLPxpca1R9HVBIKtCHhll4Y1r6v8QivcqL
	 kzFZ5r1kBebtOU3y3v4DPuuLW5355FTokcVA1WtPineCXB4YPdMyAczXs5Qx64ki1Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=183.62.165.209
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A75F606A334;
	Sat,  7 Nov 2026 08:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A75F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jM81L59HLz57HS0;
	Sat, 07 Nov 2026 16:12:54 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 6A78CoH8098737;
	Sat, 7 Nov 2026 16:12:50 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 7 Nov 2026 16:12:52 +0800 (CST)
X-Zmail-TransId: 2af96aeedd84159-86d03
X-Mailer: Zmail v1.0
Message-ID: <20261107161252647FthWsffiqzpLz7zrKd2ux@zte.com.cn>
In-Reply-To: <202611071612471583hApcIRmqJX9mMWQtxmcN@zte.com.cn>
References: 202611071612471583hApcIRmqJX9mMWQtxmcN@zte.com.cn
Date: Sat, 7 Nov 2026 16:12:52 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIDEvNV0gZ3BpbzogcmNhcjogZG9uJ3QgY2xvYmJlciBJTlRNU0sgd2hlbiBkaXNhYmxpbmcgYSBzaW5nbGUgbGluZQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6A78CoH8098737
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sat, 07 Nov 2026 16:12:54 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEEDD86.000/4jM81L59HLz57HS0

From: Shao Mingyin <shao.mingyin@zte.com.cn>

gpio_rcar_irq_disable() writes ~BIT(hwirq) to the whole INTMSK register,
which clears the bit of the line being disabled but sets every other bit
in the bank to 1.  Since a set bit in INTMSK means "interrupt enabled"
(gpio_rcar_irq_handler() only handles lines whose INTMSK bit is set),
this disables one GPIO interrupt while collateral-enabling all the
other GPIO interrupts of the bank, which can cause a storm of spurious
cascaded interrupts on level-triggered lines.

Do a read-modify-write to clear only the line being disabled.

Fixes: 119f5e448d32 ("gpio: Renesas R-Car GPIO driver V3")
Cc: stable@vger.kernel.org
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/gpio/gpio-rcar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 1192e1f1c6..239d78a2ae 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -129,7 +129,7 @@
 	struct gpio_rcar_priv *p = gpiochip_get_data(gc);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
-	gpio_rcar_write(p, INTMSK, ~BIT(hwirq));
+	gpio_rcar_write(p, INTMSK, gpio_rcar_read(p, INTMSK) & ~BIT(hwirq));
 	gpiochip_disable_irq(gc, hwirq);
 }
