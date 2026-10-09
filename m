Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351F83AC0E7;
	Fri,  9 Oct 2026 04:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791519288; cv=none; b=OYXg/ensoHnpG2JVXnm15DhvEnFn73YshAc0Nam15/kbBrQMSW7fR5ohO/Dee/xIjukc6dpravAkR2OGyRmWA3j+PCEje6Dln6zt1HwiJaZZWbE/MHOX/3e8C22FI4fQmx/LB58fapV/W2jQXz3Rw0iGY9NZ7i4hO8LZSEYbHGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791519288; c=relaxed/simple;
	bh=Zn9YiIWM4CoWiDqy1p3+QNTaaPoQYnG3Cr0qF3WpYIE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YL18NpELSp2KtxJwzUQimy79iG1V/tLmLJIFB5vF1lIEBFxz0Ba0v6EW8slp6QcZa3WZH6nhDX1zi7zTIZm5VKAtiOlpHa1GGMM/b2kTuXN6pJ1rnp6wU+sOl7v3KOGK5JNw+bA9Y9bFhoyNB+cd1ePCRlwLd3tpUSaSYOZCjmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowACXljQoashqx4wbCg--.48197S2;
	Fri, 09 Oct 2026 12:14:32 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linusw@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	"Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
Cc: linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: aspeed-g5: fix device node leak on LPC compatible mismatch
Date: Fri,  9 Oct 2026 12:14:35 +0800
Message-Id: <20261009041435.3096107-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACXljQoashqx4wbCg--.48197S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur1fKw4xAFWUGFyDZr18Zrb_yoW8Xr4kpa
	y3WFWYvr13Jr4Y9rW8XFy0gayaka1fXrW5Ca97K3srZFnxtryftw13KFWjqrs09rWkA3WY
	qF1Uta4Durn5Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvKb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWxJVW8Jr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY
	04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxh
	VjvjDU0xZFpf9x07b8kskUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAQPA2rIJHz+tgABs3

aspeed_g5_acquire_regmap() takes a reference to the LPC device node with
of_parse_phandle() and then returns -ENODEV if the node's parent is not
compatible with "aspeed,ast2500-lpc-v2", without dropping that
reference. The function is called for every pin configuration, so the
leaked device_node reference accumulates on such systems.

Release the node with of_node_put() before returning from the error path.

Fixes: eaffd32bea0c ("pinctrl: aspeed-g5: Adapt to new LPC device tree layout")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index b0cba0f3e17e..6ab3ba89bd54 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2652,8 +2652,11 @@ static struct regmap *aspeed_g5_acquire_regmap(struct aspeed_pinmux_data *ctx,
 		np = of_parse_phandle(ctx->dev->of_node,
 					"aspeed,external-nodes", 1);
 		if (np) {
-			if (!of_device_is_compatible(np->parent, "aspeed,ast2500-lpc-v2"))
+			if (!of_device_is_compatible(np->parent,
+						     "aspeed,ast2500-lpc-v2")) {
+				of_node_put(np);
 				return ERR_PTR(-ENODEV);
+			}
 
 			map = syscon_node_to_regmap(np->parent);
 			of_node_put(np);
-- 
2.25.1

