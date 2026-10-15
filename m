Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7627C25B0B9
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 03:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036291; cv=none; b=YvP2pZQ9SKyv14RPpLt8J9S1pRglABojkBKFG8yEJ998j5xFoDKM2olvdH5QgH0rAA0QJdwxJ0/kbwM307ErsurOKU6Ng2W9cjpOrg0BLEYA3kZDO6XX1sYFC0GXzY4M+YTH2oi4a7ZLNZMko4AMDWMRFzhrNMP/f4Jt+sBFl/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036291; c=relaxed/simple;
	bh=YT1WZ4aUH4YamIzbWTmEjrHn+LsOyyoZMS+r27Yi+Y8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i9BcoIytDJreZ7XXViQYLfZorkJOvTRU7hVYR4Lpa79QRuYLZjpy17sGuyuAv8bSZ51T3Qe8eOOiO3kyaOSepqp5qkj4IUGyBPtH+4wVcDDVn2TPQq27FOYwq2mk4z2H4T+ZWUFK9x1VFprHvakMgM+eO+On4TVDbVgLtpxKmpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o8gujTDv; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o8gujTDv"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35b2c599f43so45677eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 20:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792036287; x=1792641087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Brhdwqnp+zrXya+pAYQZ+kocBKTR7q3OUom2Y3/V6I=;
        b=o8gujTDvAyNKpUn8PlqFCzqtcCpGNrEQC5uAfCdEXFvKqPFjFeOd//yxmrS3P4rCyk
         HocSFyaFv2ygMeh/I65D/BEmYOCR3mlXFRT7jpC9H1FFrjfFiPOqgAJZeXecPT60XJ9c
         nP5EZVCHZknj5wpReaR0sZUzbvBJk8lxCWsSljReiRwhOngrPXhj0c/Wr4mIn9wTXsT4
         WDsFfMoWa6yy/Yj5XBuDd0TXXs2pBJe7RGSUhzKTz3zeAUQcRg5wYSWK7qb+JNq8mJ8J
         AjJ7dU9sli8CvU7d8ey6FdNCTxrkbHQOo5mj7tCigeEPHjSw0xvrOVlS8JshUnzArUpN
         1wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792036287; x=1792641087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Brhdwqnp+zrXya+pAYQZ+kocBKTR7q3OUom2Y3/V6I=;
        b=wORWWsv5LJibdw8/o81YldotsKPc4uP8t4nGUluE3zVfAyR2xb8uj4Q6BQBnJ1zT8y
         +5mZySiTvqEhHZGXrjZDjIYQSqcXh+dqxQ0wu9mBQa5q4V3RBkb9HwjnDFAhLM5A7VFr
         p5fLz1B04+3Q268tetehLd+Xmz/i1QJtj1A8ftXrtjFKnJLaOj3ZG4OQgn4p/to7uvRp
         OAVP7Y72nf11d5jWthochsq1dmsOBjpw8694Ey3KvnEJac1hiLhJbAB7xMsQKrjseZ1M
         sV2MtIMGa3hUOTnbPQV28AUqQ+vJ5jDkcbUkpzQQa+ZmiunypG62zZfk9p/krlVD6n1M
         msQg==
X-Forwarded-Encrypted: i=1; AKwUvByY7z0o5lvgtdGqo4NESKKZuYcV0lC7r+EAaK5DpMIlWqy31V76JpTN7Dfai7vTbpJqRKqQhKy/LigA@vger.kernel.org
X-Gm-Message-State: AFq9FYKYyAKlKgJ+EZEritdCVZiudNqCLgwVK/YPYZGa3Y22xSS0yv6D
	cBS4FAO3UNbLFk48tDWM++it2JYz4SxT0+qtbBQCPHNtOW2ZnmkKJUVs
X-Gm-Gg: AYBFou2rJEx8ewmTTEtL9op/HWhfC6SEhdw24nctLpp5gXRtsAU8aGyVX2rp8rEmcgU
	/Y9FWMAbxLh0y4DyGikbWeba2a+u/I1bh4yKwHeePPlbMykqp0El9Q30hCkrMfPdiL52DxRQPjf
	IsPyOmftl+Z8Jfoc5fJZzNKWC1PdIXOzLo576vaigakyRuok4H/PVJVTafAAND0XxNVELlaRj8Y
	AsfASxuxTSlGWqLkBjz/vFZab6JN0GT8RF5VBOWOwLVvnf3VdL3vXaibIMXN3mgooF5DoSzycFx
	+/5lE7rJSoZA3ZeXHg/BptiyAfEjCk456s3xyPgbkuqnhDuSPFrslbwTM4KI2GqnncsRGiMytMu
	Ae5MdZQFTi6c+E7xqKrFnLBSjnvN+UdZLC2kd6DAnR7acTSVW52Sl8fhLrgimG8N1IH10ryNLx3
	lnjpvjyNr4GZqEreb/qe8F/kK5Z9CNltGkQFxxNRhKpebLqiE1q7KZiytoe/U4iqcGV0rKwoxyJ
	lRbIXeyKzeHRAQq
X-Received: by 2002:a05:7300:8b14:b0:35f:f0:8edf with SMTP id 5a478bee46e88-35f00f09f07mr2511567eec.13.1792036287168;
        Wed, 14 Oct 2026 20:51:27 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a279sm56719830eec.30.2026.10.14.20.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:51:26 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: andrew@codeconstruct.com.au
Cc: linus.walleij@linaro.org,
	joel@jms.id.au,
	brgl@kernel.org,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [RFC PATCH] pinctrl: aspeed: Handle GPIOZ6 pass-through strap on GPIO requests
Date: Thu, 15 Oct 2026 09:21:18 +0530
Message-ID: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the ASRock Rack B650D4U, requesting GPIOP3 through gpiolib does
not provide working host power control when the GPIOZ6 pass-through
strap in SCU51C[9] is set.

With the existing GPIO request path, SCU4BC reads zero, but a host
power-on request through x86-power-control times out waiting for
power-good:

  SCU4BC = 0x00000000
  SCU510 = 0x00000000
  SCU51C = 0x00001e80

The AST2600 A3 datasheet describes SCU51C[9] as an additional
pass-through enable for GPIOP0/P1, GPIOP2/P3 and GPIOP4/P5 when
SCU510[30] is clear.

A diagnostic experiment that cleared only SCU51C[9], preserving all
other bits, allowed the same GPIO-only power-control implementation
to power on the host:

  SCU51C: 0x00001e80 -> 0x00001c80

SCU4BC and SCU510 remained zero. No per-operation THRU1 switching
or additional userspace delay was required.

Add an AST2600-specific GPIO request callback that performs the
existing GPIO mux configuration and clears SCU51C[9] for GPIOP0-P5
when SCU510[30] is clear. Check register access errors and verify
that the strap bit cleared. Other GPIOs retain the existing path.

This RFC handles only the GPIOZ6 strap source. It leaves SCU51C
unchanged when SCU510[30] is set and returns -EOPNOTSUPP for
GPIOP0-P5 requests when SCU510[28] is set.

Hardware testing on B650D4U with this pinctrl candidate confirmed:

  - Remote power-on: power-good asserted.
  - Remote graceful power-off: power-good deasserted.
  - Physical power-button power-on.
  - Physical power-button shutdown.

These tests used x86-power-control with software button forwarding.
The earlier board-specific SoC driver, its DT node, custom sysfs
interface and diagnostic boot parameter were not used.

This replaces the approach explored in the withdrawn B650D4U
power-passthrough RFC. The new proposal changes the existing pinctrl
driver and introduces no DT binding or userspace interface.

Feedback is requested on two unresolved issues:

  1. SCU51C[9] is shared by all three GPIOP pass-through pairs.
     Clearing it for one GPIO request may affect forwarding on
     another pair. How should that shared control be represented
     and coordinated with existing mux ownership?

  2. The SCU510[28] enable path has not been validated. Returning
     -EOPNOTSUPP is a limitation of this candidate, not a proposed
     complete solution for every AST2600 configuration.

Is the GPIO request callback the appropriate place to handle this
strap interaction, or should it be modeled through the existing
signal-expression mechanism?


Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -40,6 +40,7 @@
 #define SCU4D8		0x4D8 /* Multi-function Pin Control #23 */
 #define SCU500		0x500 /* Hardware Strap 1 */
 #define SCU510		0x510 /* Hardware Strap 2 */
+#define SCU51C		0x51c /* Hardware Strap 3 */
 #define SCU610		0x610 /* Disable GPIO Internal Pull-Down #0 */
 #define SCU614		0x614 /* Disable GPIO Internal Pull-Down #1 */
 #define SCU618		0x618 /* Disable GPIO Internal Pull-Down #2 */
@@ -2747,12 +2748,56 @@
 	.nconfmaps = ARRAY_SIZE(aspeed_g6_pin_config_map),
 };
 
+/*
+ * GPIOP0-P5 have a global strap-controlled pass-through enable in addition
+ * to their individual SCU4BC mux bits. SCU51C is ordinary RW, unlike the
+ * write-one-set SCU510 register. This candidate handles the GPIOZ6 strap
+ * source only; the SCU510[28] enable path needs separate validation.
+ */
+static int aspeed_g6_gpio_request_enable(struct pinctrl_dev *pctldev,
+					 struct pinctrl_gpio_range *range,
+					 unsigned int offset)
+{
+	struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+	struct regmap *scu = pdata->pinmux.maps[ASPEED_IP_SCU];
+	unsigned int strap2, strap3;
+	int ret;
+
+	if (offset < AB22 || offset > AB23)
+		return aspeed_gpio_request_enable(pctldev, range, offset);
+
+	ret = regmap_read(scu, SCU510, &strap2);
+	if (ret)
+		return ret;
+	if (strap2 & BIT(28))
+		return -EOPNOTSUPP;
+
+	ret = aspeed_gpio_request_enable(pctldev, range, offset);
+	if (ret)
+		return ret;
+
+	/* In dedicated-strap mode, SCU51C[9] does not enable pass-through. */
+	if (strap2 & BIT(30))
+		return 0;
+
+	ret = regmap_update_bits(scu, SCU51C, BIT(9), 0);
+	if (ret)
+		return ret;
+	ret = regmap_read(scu, SCU51C, &strap3);
+	if (ret)
+		return ret;
+	if (strap3 & BIT(9))
+		return -EPERM;
+
+	return 0;
+}
+
 static const struct pinmux_ops aspeed_g6_pinmux_ops = {
 	.get_functions_count = aspeed_pinmux_get_fn_count,
 	.get_function_name = aspeed_pinmux_get_fn_name,
 	.get_function_groups = aspeed_pinmux_get_fn_groups,
 	.set_mux = aspeed_pinmux_set_mux,
-	.gpio_request_enable = aspeed_gpio_request_enable,
+	.gpio_request_enable = aspeed_g6_gpio_request_enable,
 	.strict = true,
 };
 
