Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324552;
	b=HJoFvyyn2nmCXzFWoCJ725+rct6Y9vKdxLcFDW1OIeKIeOUkBICR90cCJ7vKpfffWkJ8
	 sw17103JXvTJah6eGTCyYQLdJ/lZ3HAEiBlEKGrYtso+x7sG3kxtn28nfrtsIe+woij1Q
	 fody/4jyHq4tIGExXsEuV0sN0CnhC65FXl2UNfZlPH8M6vVKAg+yUfIq56ZhipxYIaRkQ
	 gL2jWwshAgU2uPY7JWcrvZZQpH7VhLuEeeZzMVHJd4/eCpnms8jLXbqVJG/TdzSATzgAb
	 ecqFkurTAOT+sDA3JsFyuDD7qBUwXA9QecKWHSZ+VYYb1y1HhxDSo0rF2U/O6XKCrsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324552;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:In-Reply-To:References:Date:
	 Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:X-TLS:
	 X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:X-Fangmail-Anti-Spam-Filtered:
	 X-Fangmail-MID-QID;
	bh=GmqmbJg/QkxwO/bwl6W5fBdufL9tIt9lNDa9+cm1DvM=;
	b=CUaOuKn+iIGDZBxNfAEMNxp/13FfrkbqFF8kNpd7QID6Nt3RK4bMlFlFn66JWwLUcIEp
	 pFYIWqtKvee3rSxt0wevzDhtZZvKc5fRoWJHD1T//urcRX97rwMAB+1w5qvxijqk1DSTj
	 Vtr+evJJfJ+ybtgSp+cFs4CQUuzkM0P8iKlgxthCPpk5n5NPELTMSmOOBWcxnr4/U9Kzj
	 Efy47Yg10+inaZpcByFrREhih9xYJHZEOogB5EtwFRzS/0XhIfKQpd9dPadXQZBMPRK83
	 36lP6drNtTA+7ys6w4ZiQ/jfON2zI/f8lj8vr2G8jmWw8Ooz2cljsQ1ucSD1VRtp7Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=usi4iwpW;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8082D60A2636;
	Tue, 10 Nov 2026 15:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8082D60A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=usi4iwpW
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jP9YK5jQ7z5BNRx;
	Tue, 10 Nov 2026 23:29:09 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794324549;
	bh=aywozNZPp0UgHY1UH6MT8Bc3EZhSD6qyQkkOcaTtus8=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject;
	b=usi4iwpWI+cA9DXiJDuXQb0k0kcCnEpwLpi5VqCa/kdA7/8zWC/WgsfPUTe3MaaVn
	 S7LHRl7yXEDVdX3QzNFWuyxYO/76Z89aEexQo3UUE/CLQZ3XhV1ETZSA5LXxLBCzZo
	 6uNWXn+7QftqBgWvYXcRSd/8Ox2Lq7b7DIe+VK0NKidLqt4XYnIHUBJVoyqjLYmHQ0
	 WqMcj9B5Hp41UIqWZZ6llSRUeijB+y4PnQi4UgMuOQJSTOCdMJF6iWkS7+EL98thgC
	 SmY8pn9CzwUhbPwE1J9+ZqoeZwtFVtO5CcremmQJ4dEeHdY3ZWJ3aC/NgopRagyxh+
	 lsLDuNvsghyGQ==
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 6AAFT0oJ043047;
	Tue, 10 Nov 2026 23:29:00 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 10 Nov 2026 23:29:03 +0800 (CST)
X-Zmail-TransId: 2afb6af3383f9b9-21fdd
X-Mailer: Zmail v1.0
Message-ID: <20261110232903548MKw1ilhZfMJtzbTnK9nSv@zte.com.cn>
In-Reply-To: <20261110232858050VtOdBBpXCW3UEgZXA69mH@zte.com.cn>
References: 20261110232858050VtOdBBpXCW3UEgZXA69mH@zte.com.cn
Date: Tue, 10 Nov 2026 23:29:03 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIHYyIDEvNF0gZ3BpbzogYXNwZWVkLXNncGlvOiBwcm9wYWdhdGUgSVJRIHNldHVwIGVycm9yIGluIHByb2Jl?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6AAFT0oJ043047
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Tue, 10 Nov 2026 23:29:09 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF33845.000/4jP9YK5jQ7z5BNRx

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
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
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
