Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792936704;
	b=PtiNP835rPIczJwhru+wCq+q9aqnIF7Ex8s5/eAX843F6k7l0V+o4WTbMQKvsKq3uoUM
	 +KvoaTEhrMTKHO/wsycsei3zgs6xfPK5CHSrpJwA5YgkPs8HpvdhWv64ttrIN1i8iZrbz
	 5O9dr+UXLSXmd3cYANeu8JzdNVdqhQy1qPq3gYYPj2D6j9j/93RqBEXRV5L5QG+WEr4ln
	 +GXNl5jH7H1oaPozt1sTwYl5O2QgViZRp13td/YCqQyu3lDq7hWGtyeM/c/0PW2/myg/7
	 0Q6SDXKynhzyJ8JYCVK5dGUK48obf6SPCQvtBKs7pU4Ihc9euAxUim2z5fVZwd8F9UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792936704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OmYTsZXrMj8ReAJU3eWsqneDCYu2+oiuB4uylitXZlM=;
	b=Gx6tJSfvclcm5NOCMZi4ckU1OrbvX0blcltAW5EBviVJWBjKJvp/jioACzyvqvjJjJXt
	 upLMqGkJMTfiUu4Na63ZjE06eQ5kbckRHvF5SopVJlsciQAsFKONfoUyyxhJ7Ng/qa1Y5
	 asWfQUEojiP+M5e0MPzFX0oxouotPjRaFEaTnSdrotL2dJs+bJJX5MYJXFqWXJKRrEHIg
	 ItOJYUlyfH3hgWfTxVtx0Air/7wToi2VixeJ8F3eeQ0cY1GW0VrJcc5zckMg+0A1WiAx5
	 FlD2BEuv1WrWGRv2jSslH18n8qQvGH7XCvQSWHcEcxZF0eL40+vIZQEY4iZv85kLFOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IYD++605;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181AE606A31D
	for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 13:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 181AE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IYD++605
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e4831c028so575130f8f.0
        for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 06:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936702; x=1793541502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmYTsZXrMj8ReAJU3eWsqneDCYu2+oiuB4uylitXZlM=;
        b=IYD++605dYoR3p9j52HLdR2zq6SGcjNmCJRZ4AJzlFz/vRe+BzFwQSwd+F6PJPsDwu
         RSx8lTsYfggPu30+CbdRFzzv/uU62VklN9yGoUFUYjFHs7Hl4MqqJ+8hb4nZEQ4iKbHO
         9Xt+afvevdi3btEPpMiDD3PHU8N0FQ8SjMWG02l4MUuCwzyQSz/mdN67RKKK3pNqzFkh
         s1aENc5qpIB7mk+t86HWY6A0vDVTD1PYDJiKtK6PMseI8gFbR8pIz1qfilZnQGSHMdFS
         Cl2HOWGM2ZWb8K7z2+65qorwxe1JWcbk88NvOymMLVOlqCsSbKpklY7wO1gKEA85ZPtU
         2rkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936702; x=1793541502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OmYTsZXrMj8ReAJU3eWsqneDCYu2+oiuB4uylitXZlM=;
        b=Yx7DWw+xS8QqUt2/nizenQpH61Hs4RwLC2M6iQTJY4hUQ7xaJtrrvTyiJCjxxqwvq0
         WVcanXcinXsOhbDtWBa1lBbqrITMlypGSTY4ANib1WJpKPIltJthHcvCgiLYpIuH3mCe
         18ITzewVbIeCqtAa24mxkhW2j59kpZ2daP70t2c51K4gKjV9otADhTz4CiIoMO9IePpm
         p9iV/QaV7420p/AIQzOYvkN5ixv2nRgbv48ZoiSWaxqwR4K1yrM4YL5chgm1WJE4WFXS
         ycddhD46o4X1aMZlIliMDTsn1UEYynYPoqmbjwKZnX6oArclQgX3mRbc/Y7gy8Y5iRQj
         0kZQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5q80/p3rDJslbhcRXckO26qrz4tIEP0RgkqHYpwc4foJ3jQW5VYZIUHRk3QDolFR5GpU+L+hZa7N9@vger.kernel.org
X-Gm-Message-State: AFq9FYJzwbLv7fP+zqTTERV9gPvB+Zv0yipUrB8bQzbgKBYmyerxKBAK
	tWhWiaSAH+AyIkcHyYPvX2M4TiVnxLKIv4VX5ho4kgqpOUBJRkW8H9CU
X-Gm-Gg: AYBFou0VS+2IxTKwe2ZtFgpkTd48750T22Tw8vzGpAuOyQMOawpkVD6eabYjMu1ThLd
	Zl0sM43QwD/3vApYuMUTCYWFTMLaKzzZ7pjbnQZVvckQqb7Ga9AM+ZtKw3cdhQvpmTJyKl3KObT
	p7SCC9HX5sFwr3Viy0T/RHTnXBe3LAUjuZbV9Bgs56cif/01NC56JrRZ5pjTIuGKQcvjrkxSlXb
	tTLJROMoZCrMluxDtpGMt9Y8MHaFw4aWu/kZ1J7GdHUKeCcQrSnbOxL0UF2hvK0j6z+dnblKbTg
	1y6VNX/ZX6h0FCLhcDpqH3pNEA/NXh1GDg2VGFSc1eB23koLcIVkSbaI2NpBZRKFGrlZC/XCXde
	LbFuJqBttKib7q3qlqwX8AwEO3aCurVqFZtTFFSUank8Bf569cOhGPXJv4qhQpzMosq8b9uEYR6
	ZYP9dXhMihV5ya2LRhnTJJp4n67RXqlO5w8pELhVf8ZQYGlsL5q++fSrPVNSO0UALGzg0fGkX3e
	7IEpEaFR2YyqN9MJvI1xe++8YuqUujse0rWy3zE4mB5dfjHVBKsKB2eG5BHXm0Rtz9+NcyVrUqW
	Qy9nae/jRilB7A==
X-Received: by 2002:a05:6000:46d9:b0:48d:f498:91e9 with SMTP id ffacd0b85a97d-48e3eb615a0mr4599278f8f.9.1792936702426;
        Sun, 25 Oct 2026 06:58:22 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm5663415f8f.40.2026.10.25.06.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:58:21 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 1/3] pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
Date: Sun, 25 Oct 2026 13:57:43 +0000
Message-ID: <20261025135745.102970-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025135745.102970-1-pmazzini@gmail.com>
References: <20261025135745.102970-1-pmazzini@gmail.com>
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

prepare_function_table() numbers the IRQ banks from PA, even when PA
has none. The static drivers number only the banks that have IRQs, and
use irq_bank_map when the IRQ registers do not start at bank 0.

Do the same here, and give the A523 and A733, whose IRQ registers
start at PB, the map they need. This also fixes PK on both, which was
numbered 10 and written past the end of irq_array.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 5 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c    | 8 +++-----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
index 801f62abc93d..940942bf6f95 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
@@ -17,7 +17,7 @@ static const u8 a523_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
 	{  0, 15, 17, 24, 16,  7, 15, 20, 17, 28, 24 };
 
-static const unsigned int a523_irq_bank_map[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
+static const unsigned int a523_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
 
 static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65..3ebe926a1bc6 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -21,8 +21,11 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
 	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
 
+static const unsigned int a733_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
+
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
-	.irq_banks = 10,
+	.irq_banks = ARRAY_SIZE(a733_irq_bank_map),
+	.irq_bank_map = a733_irq_bank_map,
 	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
 };
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 50a16f3bd131..9c5eb21a86a5 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -208,7 +208,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 	 * The extra functions will be filled in later.
 	 */
 	irq_bank = 0;
-	last_bank = 0;
+	last_bank = -1;
 	for (i = 0; i < npins; i++) {
 		struct sunxi_desc_pin *pin = &pins[i];
 		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
@@ -221,16 +221,14 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 		func[1].muxval = 1;
 
 		if (irq_mux) {
-			if (bank > last_bank)
+			if (last_bank >= 0 && bank > last_bank)
 				irq_bank++;
 			func[lastfunc].muxval = irq_mux;
 			func[lastfunc].irqbank = irq_bank;
 			func[lastfunc].irqnum = pin->pin.number % PINS_PER_BANK;
 			func[lastfunc].name = "irq";
-		}
-
-		if (bank > last_bank)
 			last_bank = bank;
+		}
 
 		pin->functions = func;
 
-- 
2.52.0

