Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C593731D735;
	Mon, 16 Feb 2026 16:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771258193; cv=none; b=sJpUGL8hIYMCYwbV2r9WD6LCyR/rrY0S6Klbw8LnovTdXLsG5NCg9St9ZABCS+BLF4VPl70b5lGsV4mLmMB+IWCkyVHI0H1Oj8xzNVQOf2/ssw6pq8Uoyt5aLBc0CzE6Awpu/QURTjIF6uPXeP7pcq/0rpEbIG7EE5RmDDsG9CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771258193; c=relaxed/simple;
	bh=UqDRMXV5CMeqJBNwQ0YkRTV0b+lq3bdiw6cfPXkbP64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rY6/MYXs6Iuv0IBsmrObQHKgYQhGuB63MzJgxYbPm2n+eCWPbiz7ucJWvCawGqlOMR+uojN7iKaPM9RiaI9nY5xlHaa6ZsLxC6Q4jbULoTCBmG2TOgO7HkQzNBsumLZrK+s2b2v6T6DqagQ16U1VghrhEvJ7chgh8ZK7xAwV8Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BBDPV3eH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BBDPV3eH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C6EC116C6;
	Mon, 16 Feb 2026 16:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771258193;
	bh=UqDRMXV5CMeqJBNwQ0YkRTV0b+lq3bdiw6cfPXkbP64=;
	h=From:To:Cc:Subject:Date:From;
	b=BBDPV3eH8Q/jbeyyBHiwVTpfeb2mNul2+YX/xPSgJoTjEucI1HanEqbx50xf7Yn5m
	 xJ+yX0mboUAw3Zp/EujV1LWAEUgvcvRX7CnsnSL8rRxmWt+9VxxlzVnVb6JW+U29a6
	 i4M8Jl2rU+CJWazDcoTepInW0QtDkIFi4+lt0UeDNfr84jAyDjauQxpWHHlT5JugH1
	 HYjKkJxUtOriwv8C8SlbiP9X70uaetXyy3W/iwdWa3fys16FHpDpN/T3XI90q0b5lx
	 2XrafkqvDu3eusyLEulEx0rWeqyz9xRWy1UCfW7vzcJ+sBFlEYfjcB7A8Mfb5v/wSw
	 G+5IkUB5UBFfg==
Received: by wens.tw (Postfix, from userid 1000)
	id 654195FB53; Tue, 17 Feb 2026 00:09:50 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: sunxi: Implement gpiochip::get_direction()
Date: Tue, 17 Feb 2026 00:09:45 +0800
Message-ID: <20260216160946.2977985-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit e623c4303ed1 ("gpiolib: sanitize the return value of
gpio_chip::get_direction()"), a warning will be printed if the
gpio driver does not implement this callback.

Implement it for the sunxi driver. This is simply a matter of reading
out the mux value from the registers, then checking if it is one of
the GPIO functions and which direction it is.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
This is an alternative to James's version. My version does one lookup
instead of three.

 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 51 +++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 0fb057a07dcc..27b2a3e9d78d 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -204,6 +204,32 @@ sunxi_pinctrl_desc_find_function_by_pin(struct sunxi_pinctrl *pctl,
 	return NULL;
 }
 
+static struct sunxi_desc_function *
+sunxi_pinctrl_desc_find_function_by_pin_and_mux(struct sunxi_pinctrl *pctl,
+						const u16 pin_num,
+						const u8 muxval)
+{
+	for (unsigned int i = 0; i < pctl->desc->npins; i++) {
+		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
+		struct sunxi_desc_function *func = pin->functions;
+
+		if (pin->pin.number != pin_num)
+			continue;
+
+		if (pin->variant && !(pctl->variant & pin->variant))
+			continue;
+
+		while (func->name) {
+			if (func->muxval == muxval)
+				return func;
+
+			func++;
+		}
+	}
+
+	return NULL;
+}
+
 static int sunxi_pctrl_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
@@ -930,6 +956,30 @@ static const struct pinmux_ops sunxi_pmx_ops = {
 	.strict			= true,
 };
 
+static int sunxi_pinctrl_gpio_get_direction(struct gpio_chip *chip,
+					    unsigned int offset)
+{
+	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
+	const struct sunxi_desc_function *func;
+	u32 pin = offset + chip->base;
+	u32 reg, shift, mask;
+	u8 muxval;
+
+	sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
+
+	muxval = (readl(pctl->membase + reg) & mask) >> shift;
+
+	func = sunxi_pinctrl_desc_find_function_by_pin_and_mux(pctl, pin, muxval);
+	if (!func)
+		return -ENODEV;
+
+	if (!strcmp(func->name, "gpio_out"))
+		return GPIO_LINE_DIRECTION_OUT;
+	if (!strcmp(func->name, "gpio_in") || !strcmp(func->name, "irq"))
+		return GPIO_LINE_DIRECTION_IN;
+	return -EINVAL;
+}
+
 static int sunxi_pinctrl_gpio_direction_input(struct gpio_chip *chip,
 					unsigned offset)
 {
@@ -1601,6 +1651,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	pctl->chip->request = gpiochip_generic_request;
 	pctl->chip->free = gpiochip_generic_free;
 	pctl->chip->set_config = gpiochip_generic_config;
+	pctl->chip->get_direction = sunxi_pinctrl_gpio_get_direction;
 	pctl->chip->direction_input = sunxi_pinctrl_gpio_direction_input;
 	pctl->chip->direction_output = sunxi_pinctrl_gpio_direction_output;
 	pctl->chip->get = sunxi_pinctrl_gpio_get;
-- 
2.47.3

