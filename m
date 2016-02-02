From: Krzysztof Adamski <krzysztof.adamski@sonymobile.com>
Subject: [PATCH] pinctrl: sunxi: H3 requires irq_read_needs_mux
Date: Tue, 2 Feb 2016 11:03:03 +0100
Message-ID: <20160202100217.GA7483@box2.japko.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from box2.japko.eu ([91.121.152.53]:47679 "EHLO box2.japko.eu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754216AbcBBKGy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 2 Feb 2016 05:06:54 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Rob Herring <robh@kernel.org>, Jens Kuske <jenskuske@gmail.com>, Fabian Frederick <fabf@skynet.be>, Krzysztof Adamski <krzysztof.adamski@sonymobile.com>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

It seems that on H3, just like on A10, when GPIOs are configured as
external interrupt data registers does not contain their value.  When
value is read, GPIO function must be temporary switched to input for
reads.

Signed-off-by: Krzysztof Adamski <k@japko.eu>
---
 drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c
index 77d4cf0..11760bb 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c
@@ -492,6 +492,7 @@ static const struct sunxi_pinctrl_desc sun8i_h3_pinctrl_data = {
 	.pins = sun8i_h3_pins,
 	.npins = ARRAY_SIZE(sun8i_h3_pins),
 	.irq_banks = 2,
+	.irq_read_needs_mux = true
 };
 
 static int sun8i_h3_pinctrl_probe(struct platform_device *pdev)
-- 
2.4.2

