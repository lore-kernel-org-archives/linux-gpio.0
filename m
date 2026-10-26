Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028092;
	b=tFanCdWOXWvq5Q/f136KHuNNooL/ZEonGA3LoJMNa7H/70h85MvR8kC4kJNCkcAnywSs
	 FKY/CCqTVZPnoW+35DnqwJP9XgKHp6jfT4jKyzExxM3KA67yRwaYE4C6Nz1GPJWitLpSF
	 UIhdSs/NI4oRRxJEoVAH7gMQntXroVYgOwJazik2MbE+A/kimeMJkjD4ftoCQII4Cb1TO
	 ReNMemQeNNWebsoG/LYoZGgg+26C2u+Ei5a/0B7wRWr9brCrTsxMu76DvMrVzFKLvvmEZ
	 3eIQQ8QXEz8mWBOEkq3mrw1f0+XGwBjxqKyB2pRGGowsuXnHrSeewsPu3L3Dzt2+vDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028092;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=NgUZou+QAUenodbqqsNTHG+MAZHRcJXPTQZv1JbHVys=;
	b=KjMVvh+zlRiztdj8G6JL7IgdvxlaS4NMxKF+IC5DzP2ioA+lTAfvQnfkcJ49tNIlNFIz
	 7+Dc9JjmEkAtG7cRC3wo6qKjbxo3JObh52txomrmx+Sg6pujVXtD9pnBUsShpkt8aXzER
	 NdaBEJnOLmPDQDmZIs2Ef7lskjQo5AI8P1ORbloVecjE03tk8IpmidNIN3fRbBZOhRQUw
	 Id19h2uAtlcwcUHizRRfDer2ILvxe0+UFsjvZ8wxu7dorPhCP3F2GgP6XW7ecPYtZa6HF
	 Yx1Lh+qSi9qLm7cNVtZs0HzxtoN7TlO//ZC0kyklRI5/YWQ18gxEk7ummkEpl1OwTFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Zdp1usVO;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A55606A31A;
	Mon, 26 Oct 2026 15:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4A55606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Zdp1usVO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ng
	UZou+QAUenodbqqsNTHG+MAZHRcJXPTQZv1JbHVys=; b=Zdp1usVO+wA1HyRZky
	ELohWUrb/FJ+Wz0rd8BNcMAJLR2AJTCopWLgYZjKLUQrhK2qtFJIp8OBGc82TKSJ
	XJDf45LKpo/wjE6WreuMLkMg14/R/8xSMf45Cc6Vrixj9BJddKRvmlWXk86cUPr7
	iHtijdSLB3Vlf6BkvdfoVPlxU=
Received: from SYPC (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDXXx3Ub99q1qL2Cw--.8607S2;
	Mon, 26 Oct 2026 23:20:52 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] pinctrl: sunxi: request the per-bank supply optionally
Date: Mon, 26 Oct 2026 23:20:27 +0800
Message-ID: <20261026152027.1417178-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026144751.1392715-1-hsyysy@163.com>
References: <20261026144751.1392715-1-hsyysy@163.com>
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
X-CM-TRANSID:_____wDXXx3Ub99q1qL2Cw--.8607S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFW7AF43XF4fAr4UAFyftFb_yoW5Xr4kpr
	sxXr1akr4kAFyfKw47uw1xtr1fuan7Ja43CFy0g34rXFs8AFs3Xw1akF4YkFWkGr4kXr4Y
	yryDZFyxGF45Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UH7K3UUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7RWj12rfb9XufgAA3T

The per-bank "vcc-pX" supplies are optional in the device tree: the
binding documents them, but notes that many boards do not describe them.
sunxi_pmx_request() uses regulator_get() anyway, so the regulator core
falls back to a dummy regulator and warns for every bank that has no
supply:

  sun50i-h616-r-pinctrl 7022000.pinctrl: supply vcc-pl not found, using
  dummy regulator

The H616 R_PIO is such a controller, and its PL0/PL1 pins drive the
R_I2C bus, so every H616 board hits the warning during boot.

Use regulator_get_optional() instead.  A bank supply that is described
in the device tree is still acquired and enabled, as it powers the
physical VCC-Px rail, but one that is absent is skipped without a
warning.

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---

Changes in v2:
- Do not skip the supply on controllers without IO bias configuration:
  the per-bank regulator also powers the physical VCC-Px rail, so a
  supply described in the device tree must still be requested and
  enabled.  Use regulator_get_optional() so only banks that have no
  supply are skipped, which silences the warning without changing the
  power management behaviour.
- Link to v1: https://lore.kernel.org/linux-gpio/20261026144751.1392715-1-hsyysy@163.com/
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 70099052d..23c1fbd46 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -925,11 +925,19 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
 	}
 
 	snprintf(supply, sizeof(supply), "vcc-p%c", 'a' + bank);
-	reg = regulator_get(pctl->dev, supply);
-	if (IS_ERR(reg))
+	reg = regulator_get_optional(pctl->dev, supply);
+	if (IS_ERR(reg)) {
+		/*
+		 * The per-bank supply is optional: boards that do not
+		 * describe it simply have no regulator to manage.
+		 */
+		if (PTR_ERR(reg) == -ENODEV)
+			return 0;
+
 		return dev_err_probe(pctl->dev, PTR_ERR(reg),
 				     "Couldn't get bank P%c regulator\n",
 				     'A' + bank);
+	}
 
 	ret = regulator_enable(reg);
 	if (ret) {
@@ -959,6 +967,10 @@ static int sunxi_pmx_free(struct pinctrl_dev *pctldev, unsigned offset)
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
2.56.0

