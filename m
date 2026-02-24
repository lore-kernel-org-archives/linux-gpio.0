Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340A2368285;
	Tue, 24 Feb 2026 09:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771925064; cv=none; b=YNCUo+qbkLmhBsUoyx0tTufaEtwCEYHrQJlAtNRDGB+aze7g92wvjdEiVJCFFAQGmQo4TKuYWmvYhKp1RSomiu58ggAaewllvffjLeZi7b9/i8rqV9pf3cl239tmWqkF+igRlV+CuabUdqShT7o3sKqiqZQwZYXdCqxTZ518gZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771925064; c=relaxed/simple;
	bh=uQkHCoaVMsbIow9DIRdiKl4dMdChJyAoiW4v51+fGJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=djBDzJgAHD75qHTacCPivD+s1+CABq0rlqNqiZwOc+edc9Qq7CZ1YIdZUfDT6hk/gBsoqbebrm5YKHCf8CkxAHKU7EujJ1mTguDZkcsPO0QFxafSbh78M89MzaiPp9kmnA+5DQtsc20pj9x4MCiiQavUVn+NjXf77rjIsYyDPnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/BBUPbG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/BBUPbG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9754EC116D0;
	Tue, 24 Feb 2026 09:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771925063;
	bh=uQkHCoaVMsbIow9DIRdiKl4dMdChJyAoiW4v51+fGJc=;
	h=From:To:Cc:Subject:Date:From;
	b=Q/BBUPbGuivU/3KKIE3Jy009WbSHgigc9tzUhfXD5AOsueekvSOFTbc0A2s1MUp7i
	 lryWg/g4w5eN/lmhswpUBFdodqS8G4UP+qsMNg86mnXGA2fGeESRQUHHqGcUFsr5zX
	 LnRgsEZr17xE82K1ddsemEhxLDV+foTmbBNEA02SojkqAQO044nw3tlNCDcuXgPchg
	 WzEtyW4VKVTQ0+EZpqfnn7jGlmViQCneCqhtOT7oArSsWzoBnL9W269bTtMxvjd1n7
	 Q3xwG/PlAzAHVdY+eZ/Qo2iNEvV1QVLKDc2HPWQZezKf/fTku6QD8iHeghnFD7UMC4
	 K9FXLQQM8/hCg==
Received: by wens.tw (Postfix, from userid 1000)
	id 0051A5FD2E; Tue, 24 Feb 2026 17:24:20 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linusw@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>, aprizel@wens.tw,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2] pinctrl: sunxi: Implement gpiochip::get_direction()
Date: Tue, 24 Feb 2026 17:24:18 +0800
Message-ID: <20260224092419.1275016-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit 471e998c0e31 ("gpiolib: remove redundant callback check"),
a warning will be printed if the gpio driver does not implement this
callback. The warning was added in commit e623c4303ed1 ("gpiolib:
sanitize the return value of gpio_chip::get_direction()"), but was
masked by the "redundant" check.

The warning can be triggered by any action that calls the callback,
such as dumping the GPIO state from /sys/kernel/debug/gpio.

Implement it for the sunxi driver. This is simply a matter of reading
out the mux value from the registers, then checking if it is one of
the GPIO functions and which direction it is.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Please merge for fixes.

Changes since v1:
- Corrected commit attribution for the warning
- Add example scenario that triggers the warning
---
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

