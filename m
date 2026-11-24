Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540282;
	b=qcLRnIuNKOnTkcjV0Nm4MtQED4Y4B+p6wkgPDLP98nA+2v5sFI2lv0O9NkxDBxNYxsBX
	 2nj4IcHyFu6fnjtA8qj8midurLr4Rk10j6sTBefi1bmbuKM0ajxM9GkAHzgpEIBqLrheM
	 m0olkyTzFvifL34p79OFYbxuCv6rIuXuJ6l3zqctZHPxhaIuyiIWtOT9pYHJ3D5kcsBWr
	 C+9XwJxkFQ4NyAfq7774YzaiZ2m6Lzw2n6YggeQ+H+9/fP920c4oOpp8NvJLryo6zEDtg
	 PQrsRaZnNxJp+OsOFoyF0KGIorhZL+A5orzZZozJ++WenBNnPSMlIZpoB1/UdCZ42uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ihyCWaQSe8/33b641CrQpm2QKnFFCoRtHpVnDp2/vYU=;
	b=rr1YOeqLgJsmduB7x2QyLgiqntgy9tuMcQhhab7wOPL6bLKVbsdHJObwZW5+yIAbFCvw
	 ZlLX1KDt/3MfB4xMImts5RYsDEcANI9h6bFjV1q1OZ8zmap0HbYdZ0vbmEO9heiCBsYfP
	 nbHFkVzM9Q0SbJnRW2SCsyPcwJasfpEgzF0mbY5ODr1J0dz4AG+uBzF3zDNT48hEK84r7
	 6nomh795wvtuk1v3TqJek/W8hnpnFbfsuhWhvA4oIa+37ro+G9iqiFtCxiyYBcQcVwOzS
	 mBEl92GI4MR8hxrhh1baxmZVAs7NkZATsApysbCtxK4TX/kAlYsIB51T60FJI1yycCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BBDdQ4yK;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BB9606E170
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 17:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69BB9606E170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BBDdQ4yK
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-84a248254f4so2938718a34.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 09:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795540281; x=1796145081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ihyCWaQSe8/33b641CrQpm2QKnFFCoRtHpVnDp2/vYU=;
        b=BBDdQ4yKiLrdEPoB2VIEm+j5xGV+HluV5UB68gIn4K71QRvfEsiffrRLn+oaI2uqHV
         ZDCLZkw3lCe35+bDvylrY02CWuEE/Xth0fSoD9yCWHUwh/TTr0I+liEAX2gF0OS3/LKh
         qdIA4VDFDC0AlcuvFXZ3Xht63Lz9hkLeAeN/mdKW8CjZa41TE4zJn91no7s2rQNU75MW
         7RB+be4tLJqNry9t8pDKmtVOAVYpjTim/DS16KBe3aBPg8R1kc8FI9vFuIrH177YLSDm
         hPMXLHP440qxmAYOWGdZ0iqDaP2jFkid/lPxVxNt8ZeYyjQ/y+fzP0ewFed3Q8mkhXnm
         kFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540281; x=1796145081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihyCWaQSe8/33b641CrQpm2QKnFFCoRtHpVnDp2/vYU=;
        b=Y6Bs+/QOPcksB8MUy+0NMZzc43pmUGWbAYbP5DbtdXCR5d0zM5W9BbXaxK2P3VNTOQ
         Xp3zEDIoYnf+enl80/EoAx7sAVtfPcJmU0ky7/gKXF1ITXsL7i5buy+PRjCeKL8KjkJ2
         WuIAaCK3JP53rMl+bhJEcAWFALx2bheB3fEDcvWn7SR7Zl+G/hhDtDxhgGQhupvB385w
         Gf2QYEj+MOUPDWoAgPLFyEV4oC/QxR8nhLMdlcntFxnlhDmUqA22Qdpx7e8oY7h5WHiS
         YXyyy0vOlZBWwiTd1vq/m8rmBAfVpU6a13Bx79Ml8RPnGnd9VmW52ak9eFAb/yV6JDkv
         n58Q==
X-Forwarded-Encrypted: i=1; AL+hErFq/MPJStU8ZfR+/jc0SE5c8GDmlhmDhysU63o3U/woqQE20GieWhOzJCK2Vleq8sy+O/ETMqr3y+s/@vger.kernel.org
X-Gm-Message-State: APuU4Z+AWRDMBSpoZtDbkEMpVMDWTxWsSn7fPkvZdKpo9LEqQnVsuZWI
	44gJ4XkmX3WBRnl23GCBfhI1dg5/6WVfMtqI9joEE8FDU+KQwfxmsGMr
X-Gm-Gg: AZFdTZfIxrEH8JefLCK9JyiezVaoHgDOw2LP/MKd/C8y1Q0XUi6DBPB4p1IChdbJnu1
	eeh1CaPd7QH26Dy5U3N40SUkVNlGISUbtT41QesbpaL3t8FxkLJyrake5VhNA2fjT+b4+R1aLBr
	H7NyXyK68Z3NPdhE37LhzUagH52y3HGN2ARoMVLl3YFLp5BVO/6ZPeL8sLRcaVlYPg8csna+Q9i
	VvBGDUES3diGyo4B/0nyeeoZ6Sqz91Q7W1fX+uLsKsQKXnF37PZA32hm87MsNjXqyd37SqJeeOa
	hZymUMRitRkg623M+d46EdbL+uZfrCFF/1tLdN2Kce877nvkSwLWEg2NciqWXUplVuiqq4TYIK7
	i9sVpfi8Y9/QB5PEUF3PMfgSTMCtfeJGLBaOAeNt0E5uGwXYOoCPDr2VI7Xu3P18WcTY8o+SZqa
	nLmPOgYVmHfaHvxpQEKCMDpUIwJTNBHzR6GIwJXBSaLtL5cW/MlJU4yZyxDgKkHn94fxJafjBWf
	hl7ioC7Th3/Jrt3dfw/gM9YGdQpIVvvaPbVvPU0/lT5tAsLuwl/Eaw/6PH8gPbLJK8J1CsoyrFA
	aRQocFKYtLMjzwW2ieFXHS6PjM//zw==
X-Received: by 2002:a05:6830:903:b0:862:a48e:24c8 with SMTP id 46e09a7af769-86315944a86mr23180037a34.14.1795540281281;
        Tue, 24 Nov 2026 09:11:21 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6besm11131021a34.11.2026.11.24.09.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:11:20 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Wed, 25 Nov 2026 01:10:38 +0800
Subject: [PATCH v2 4/5] pinctrl: upboard: fix I2C pinmux-select set CPLD
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
Message-Id: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-4-c8079f8f569f@gmail.com>
References: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com>
In-Reply-To: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
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

CC: stable@vger.kernel.org
Fixes: dca2f73cf19f ("pinctrl: Add pin controller driver for AAEON UP boards")

Signed-off-by: Gary Wang <is0124@gmail.com>
---
 drivers/pinctrl/pinctrl-upboard.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-upboard.c b/drivers/pinctrl/pinctrl-upboard.c
index b9af6dd93c34..090316349331 100644
--- a/drivers/pinctrl/pinctrl-upboard.c
+++ b/drivers/pinctrl/pinctrl-upboard.c
@@ -33,7 +33,7 @@
 #include "pinmux.h"
 
 enum upboard_pin_mode {
-	UPBOARD_PIN_MODE_FUNCTION,
+	UPBOARD_PIN_MODE_FUNCTION = 1,
 	UPBOARD_PIN_MODE_GPIO_IN,
 	UPBOARD_PIN_MODE_GPIO_OUT,
 	UPBOARD_PIN_MODE_DISABLED,
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

-- 
2.43.0

