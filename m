Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957532;
	b=vdb3ZC+uoFG8eBWBTojqZVCWsuk7ZtZTUGi5PO6HH1PUEubpK3gPMZMd0RBlICxbAwyh
	 0t8BWu/h4C0WeX952OKUWxpgMovZaPU7VyiM2Oqb9w4Q1wG/W2xvpGyAmCdjX6/XIC7lX
	 ODaZVtTjIL+oVi1f0EWA/3sx6osd+9rTWT9bwmJXYJRwETT1jxDH/onKUSGDkogAqBPHd
	 uKXzsDqF+4dncBVr2GlXLyXCLRjDz8W/UiDayZEDGHr52dVdlXnt3MUueIe9BmMgip9Rw
	 rQiFOPdhQjmn0XrnB7wvtIoMKLLQFj2k7JTp5HsN8U73u+pqGKyPzReu/YsNhkzzRMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957532;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=qfG8+HNjWNjgKY/1LVDEwnEFGbVLXME85VZs5AOT4/s=;
	b=pQj33VndV5W43qnV7QRVo+loJeGP6g673YLY2VlCchtbX8iGrwXXx0E2ayg48UZWnY72
	 Tuoafn8mQQn07+vpzugk+oFQaRIKAZVSVt9dnS2LgWcA+3/W1+KToH+HDNd/fRaDiyI8a
	 tNdQYI1hcZhFrG5dhi44ovI5TCpNPLLbchqvOaKKBu+p4u40pB/87KijYfyyftA/YOcTH
	 E93LQnvCA0k9M//ggeI/V3DXjRjeFCzJes7w6Vi/aoFkWdbjCILGFQgC+El01QZJU59/m
	 /xTJ0GSQ/nAEW1sqBqi22aEAIlD88G2rzoYx54SkvjB4iTpz/IMIPXZYWHrgEKZeFmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=D+3yX0wV;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D98606A32A;
	Tue, 17 Nov 2026 23:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8D98606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=D+3yX0wV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=qf
	G8+HNjWNjgKY/1LVDEwnEFGbVLXME85VZs5AOT4/s=; b=D+3yX0wVYBhvGBXf88
	nxmOrOsC0UVwZ95uwemG5wZI/zzHFewQ6NxwPgKFi5fMQ83yHImsxbk6km0ePDOh
	DcovJ3SWSzeaftSd5VAHUWNjzpMfqvIX7qEpTKmVUY9XW6ewAQKmw+t9U51CjxaC
	GKeSSFY8OqLDU1d08BXXIJmHg=
Received: from SYPC (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXt8a_4PxqUebhIw--.17204S2;
	Wed, 18 Nov 2026 07:18:24 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] pinctrl: sunxi: request the per-bank supply optionally
Date: Wed, 18 Nov 2026 07:18:07 +0800
Message-ID: <20261117231807.264348-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117091944.12082-1-hsyysy@163.com>
References: <20261117091944.12082-1-hsyysy@163.com>
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
X-CM-TRANSID:_____wDXt8a_4PxqUebhIw--.17204S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFW7AF4rAFWrur45Zr4kCrg_yoW5try8pr
	sxXFsIkr4rAFyxKwsxuw12yr1S9an7J343CFykK34rAFn8JF4fXw12kr4YkFs5Gr4kJr4Y
	vrWUZa4xGan8X3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Ul_MfUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7QBCdmr84MADPgAA3S

The per-bank "vcc-pX" supplies are optional in the device tree: the
binding documents them, but notes that many boards do not describe them.
sunxi_pmx_request() uses regulator_get() anyway, so the regulator core
falls back to a dummy regulator and warns for every bank that has no
supply:

  sun50i-h616-r-pinctrl 7022000.pinctrl: supply vcc-pl not found, using
  dummy regulator

The H616 R_PIO is such a controller, and its PL0/PL1 pins drive the
R_I2C bus, so every H616 board hits the warning during boot.

Use of_regulator_get_optional() instead.  A bank supply that is described
in the device tree is still acquired and enabled, as it powers the
physical VCC-Px rail, but one that is absent is skipped without a
warning.

The OF-only lookup matters here: regulator_get_optional() also falls back
to a global regulator-name lookup, which could bind a regulator that
merely shares the name with an absent bank supply and is not the supply
of this bank.

Skip the free path for a bank that never obtained a supply, so the
refcount is only decremented when it was incremented.

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
Changes in v4:
- Drop the supply_absent flag and the early return that tested it.  The
  result of the OF lookup cannot change at runtime, so repeating it for
  every pin request is harmless and caching it only complicated the code.
  Suggested by Jernej Skrabec.
- Link to v3: https://lore.kernel.org/linux-gpio/20261117091944.12082-1-hsyysy@163.com/

 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 31cd142..1fcab0d 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -912,6 +912,7 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
 	unsigned short bank_offset = bank - pctl->desc->pin_base /
 					    PINS_PER_BANK;
 	struct sunxi_pinctrl_regulator *s_reg = &pctl->regulators[bank_offset];
+	struct device_node *np = dev_of_node(pctl->dev);
 	struct regulator *reg = s_reg->regulator;
 	char supply[16];
 	int ret;
@@ -924,12 +925,24 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
 		return 0;
 	}
 
+	if (!np)
+		return 0;
+
 	snprintf(supply, sizeof(supply), "vcc-p%c", 'a' + bank);
-	reg = regulator_get(pctl->dev, supply);
-	if (IS_ERR(reg))
+	/*
+	 * Use the OF-only lookup: regulator_get_optional() also falls back to
+	 * a global regulator-name lookup and could bind a same-named
+	 * regulator that is not the supply of this bank.
+	 */
+	reg = of_regulator_get_optional(pctl->dev, np, supply);
+	if (IS_ERR(reg)) {
+		if (PTR_ERR(reg) == -ENODEV)
+			return 0;
+
 		return dev_err_probe(pctl->dev, PTR_ERR(reg),
 				     "Couldn't get bank P%c regulator\n",
 				     'A' + bank);
+	}
 
 	ret = regulator_enable(reg);
 	if (ret) {
@@ -959,6 +972,10 @@ static int sunxi_pmx_free(struct pinctrl_dev *pctldev, unsigned offset)
 					    PINS_PER_BANK;
 	struct sunxi_pinctrl_regulator *s_reg = &pctl->regulators[bank_offset];
 
+	/* The per-bank supply is optional, so this bank may not have one. */
+	if (!s_reg->regulator)
+		return 0;
+
 	if (!refcount_dec_and_test(&s_reg->refcount))
 		return 0;
 
base-commit: 091b06388b117fefdcb63336ac09956a4914b961
-- 
2.56.1

