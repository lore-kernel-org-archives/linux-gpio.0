Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810196;
	b=kvzT1Lbb4/HvmRWMHOF4wgf+NphPbLp26eIW8nQNo9oteD54C726X9MRJkSJJs0tzdCb
	 GY+qEb+2QxPxf9reGKh1EBsh4EGR7M81dDy4ZejRcnlQvwJn38pVPWz5IpyGP2XKZ/GDX
	 6dEJ+7wbWHhXiCBHbO6iOtLPykkD492uVN9fHRJaGsAL5jbxHN2MT+jbdfQQ/HP00tIGQ
	 aD4XLTIOA2hzfHLMI4dByQeT7A2sdZ4wWYPbSohMKtDIQlVWD3D40KQGGiOR1yp2FOMvw
	 oqJftk3gQHYVxAxUNEhXyIZtOGDVuhVJIphXlXveRStqnx9qOud1MhkDNVR6jFvWMIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JIsYAG/w26E6FxvUJAJzo1Ty0QYQDvImmexX9oITg8g=;
	b=bZkO1skr7EKERPM3JWbkC4t0JiFIHbtbgGINyRPSlZ+K/f2AdNpsLj9MOestLhbFBNiu
	 9NaQu7u1zmSKbZnXwAFjC/kik/KdHvVuLho0Z5+h4u44Rd76+48m045o3glbIcINOHfP2
	 0+Mv1rJD04pUtS/BOPqA3o+PYKoL4ewW1oIFC5g49DLLioCHdIo7hXfpSq+DYcmv2L3Ay
	 h6JxWx44MeVz2EGhC68fFBOw/p8CPmK2lU2iFpwikqVZv3384oz1AoHbuAZYvt157nKRu
	 vwyMYlaeLbQ6jCh3LCcQ6zXCa/h4rOiyw0G8mrQbff1UvshyBuQIsjNYHRDFIO9M1Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QU81oq6f;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D0F606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 20:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67D0F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QU81oq6f
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6b1afdf5196so3282248eaf.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 12:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810195; x=1796414995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIsYAG/w26E6FxvUJAJzo1Ty0QYQDvImmexX9oITg8g=;
        b=QU81oq6fTlpFdk3vUjuTftMB0IYJFT5KFeOmyR+gqnr7I+8ZRuMtV8mAft0y+pqHb+
         x9vUCYwZqszqFmfc6/QW/3xExMCe4qZtn3kU6B+bLzNvREYf+F+vHJrB0y4kEf3MHYA9
         OHSO6qkLLm7BS2vG3/eVJoBTKVgNMSNObZGQ6lNiUs4wVwRiBTksIDSzODEhEBKRUlgN
         mAtX03HCjDZFUeIIr22sE5p9CbD+t/EmouZ9qf9iBPrBWXGaAkAYY9nj+nrQx1NP0KE2
         WHzpHvxYspLKPIZFg5biPJxHaoMzOrW8uZBtjH6Qr+xxM5eXyy1DTeza4+M215KD+C4D
         iyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810195; x=1796414995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JIsYAG/w26E6FxvUJAJzo1Ty0QYQDvImmexX9oITg8g=;
        b=LCBKXT2S5w0TQAu5ZrnF+Fio5sEU+FK5x+Y+1Dpy1CtXUfa6nR8l/FtlW1TaQt3y2/
         GMyP4vNUYrmZtQqWf0WDOaWJsL+momGwLBqKff+P6cA0yjM/thm7v+iJca7p8eUo6y6Z
         0Cw3FOsIxG3rhBy3IgEJQL41ZKUYob2yEAjkvmNrglAZHVAg2VBUTS1kArQV0azUfvvM
         Iyc61EU7jfFBZDCGXb9HcPu4sQA1TyrWieldZ+VK+jOhD6jY5/bkR7kgfGHmr8Qhxpl6
         bnWl3mfIctPVb6IkiKW2waO8drqTc1VVKv9vHS4W00x7Hxdhz8xZnlUv8I4lnqZYjf/e
         q3Kw==
X-Forwarded-Encrypted: i=1; AL+hErFotzQ6UTQvVhqtW4wPy3AmXyYidPVDOW7leL7Af0sQpGS0GZxTeTzrskgcu4M7EUquLKBp4/hUJEZ9@vger.kernel.org
X-Gm-Message-State: APuU4Z8CknbGgeVqqhExvXYTPSoArf9LAi7Jy+8+ma4wIKQGF6J4WDS4
	yxIJ8cbSsrwcMw100Z0lQKQjmiSNXt6VgxkSJIb3cocEudBnMFsHPRiG
X-Gm-Gg: AZFdTZeYgjVm/uj1ftZzdUqqJYtvJHQ/7C01oTmPBL+eiDaWLTclV6a032RDm35Joio
	+chVmnoogocEOten+Vv49zWm2ujG9WQbjScfGs+Ik5G1gx00sIB3E77v2dZwBfmjD9pgz6y2m4t
	6waXEWqmXAWjan7+PuEMnrmGMYxxcwN2rD0MSusFDVJBjepJoncZi6TKRWQ/HT2eU6yiJ5rcLq5
	NmmyrQHKbBrKBWhEGjT+Psi1C6h8tfdOeQwsqLUe1BPKGB0i7izJHB1WGyvsda7KLgv5dMj6Rn4
	+eNtg/bp1vR41E4G9lMlWw6E4xO+6q1A5VycRAW3k64DCyEEib6U3xVL8AJb4SVaK0xLdSRZ5UK
	MFMlXrZw/VlY+HBP9Yd/7NBm9nvj7Q0GnTSXn56YrS9u1eBr1CBW1CwGLku7Tr1lXQXGza/M7Hp
	OHtZrwWxpKXbRLwITg5qrd7H8AfLw0YUcYA5mg9h0ZIxmR4yJBQ5RoCA9/Cnu7DqSVlI/NlO58k
	+DxJnZj5rxyxPdodI7hL004nVy90N4P+ySZoqzsHWdTSxIl27WAK/mS/xZ9BS4xl8wE6ufs4zX+
	LVuDp7mO/39HJvR+Ox3apicQnzYM5w==
X-Received: by 2002:a05:6820:c30f:b0:71a:ecfc:442c with SMTP id 006d021491bc7-71b3955e035mr16217300eaf.71.1795810195459;
        Fri, 27 Nov 2026 12:09:55 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b8590ba0fsm4834662eaf.2.2026.11.27.12.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:09:54 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Sat, 28 Nov 2026 04:08:33 +0800
Subject: [PATCH v4 4/5] pinctrl: upboard: fix I2C pinmux-select set CPLD
 GPIO OUT not function mode
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-4-029071f417d5@gmail.com>
References: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-0-029071f417d5@gmail.com>
In-Reply-To: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-0-029071f417d5@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 BillyChou <BillyChou@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gary Wang <is0124@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

The CPLD I2C pin mode setting through pinmux-select is not correct.
Should be set UPBOARD_PIN_MODE_FUNCTION on AANT0F04 devices.

Change UPBOARD_PIN_MODE_GPIO_OUT to UPBOARD_PIN_MODE_FUNCTION for both
i2c0_grp and i2c1_grp. Additionally, replace the check variable `mode`
with `modes` to prevent the value of `mode` from being 0.

Cc: stable@vger.kernel.org
Fixes: dca2f73cf19f ("pinctrl: Add pin controller driver for AAEON UP boards")
Signed-off-by: Gary Wang <is0124@gmail.com>
---
 drivers/pinctrl/pinctrl-upboard.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-upboard.c b/drivers/pinctrl/pinctrl-upboard.c
index b9af6dd93c34..bcd2dae9969f 100644
--- a/drivers/pinctrl/pinctrl-upboard.c
+++ b/drivers/pinctrl/pinctrl-upboard.c
@@ -289,8 +289,8 @@ static const unsigned int upboard_up_adc0_pins[] = {
 
 static const struct upboard_pingroup upboard_up_pin_groups[] = {
 	UPBOARD_PINGROUP("uart1_grp", upboard_up_uart1_pins, &upboard_up_uart1_modes[0]),
-	UPBOARD_PINGROUP("i2c0_grp", upboard_up_i2c0_pins, UPBOARD_PIN_MODE_GPIO_OUT),
-	UPBOARD_PINGROUP("i2c1_grp", upboard_up_i2c1_pins, UPBOARD_PIN_MODE_GPIO_OUT),
+	UPBOARD_PINGROUP("i2c0_grp", upboard_up_i2c0_pins, UPBOARD_PIN_MODE_FUNCTION),
+	UPBOARD_PINGROUP("i2c1_grp", upboard_up_i2c1_pins, UPBOARD_PIN_MODE_FUNCTION),
 	UPBOARD_PINGROUP("spi2_grp", upboard_up_spi2_pins, &upboard_up_spi2_modes[0]),
 	UPBOARD_PINGROUP("i2s0_grp", upboard_up_i2s0_pins, &upboard_up_i2s0_modes[0]),
 	UPBOARD_PINGROUP("pwm0_grp", upboard_up_pwm0_pins, UPBOARD_PIN_MODE_GPIO_OUT),
@@ -710,7 +710,8 @@ static int upboard_pinctrl_set_mux(struct pinctrl_dev *pctldev, unsigned int fun
 		return -EINVAL;
 
 	for (i = 0; i < grp->grp.npins; i++) {
-		mode = upgroups[group_selector].mode ?: upgroups[group_selector].modes[i];
+		mode = upgroups[group_selector].modes ? upgroups[group_selector].modes[i] :
+		upgroups[group_selector].mode;
 		if (mode == UPBOARD_PIN_MODE_FUNCTION) {
 			ret = upboard_pinctrl_set_function(pctldev, grp->grp.pins[i]);
 			if (ret)

-- 
2.43.0

