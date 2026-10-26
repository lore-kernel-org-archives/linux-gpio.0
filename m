Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793026136;
	b=MKTd6IfJLAVDTjYZ2rtZrl2JrXEwMACdptRFPwHJI+BR4QI4k5D6qDZS4vB68L0vXSna
	 gWuz6F1yHdPj5BX29pQ5nYTHWjv46gy9E+wCU7WPbj6tqkJnNqDyYYTf7c4G20PybHeme
	 kaKUI7fBfFG0H1HaPwEIpl9Moi/ecxDx/nVcaxe5EnOip756lHZ/ctH8g7lXTLjOEiNlV
	 O13AptZmOVR0ScC6qgKcNev9/QWrOuxHtxs/J6Gf5bv/Djaur7xpCprqE7c/XUUrdCdLt
	 8RyNcDfrifPMT3hnjo9EsuCUDJ35/03H3eU21bP1+g0MhPjWtk/J9GeQ6jN1d7edH+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793026136;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=YvL7WO9Qw1q6ibNOgJWDcAWvN4SLSOgyAvGF80Zshr4=;
	b=mIFdNDBnKpiJzZ0j+u/c2iIFdr4p9LxHweoPSVUi/IbqvaqACxePbbDnA5cGAYfybAnG
	 xaAbgTSrmAm9NPDMrdeodxopi/DljvIVa3657Fbr594xApFzsdA390W6iehG3yi0jW1BD
	 5q/ztB7WDUTEhMNVK24c5VSs9E9oIcZMbpcgcE8G8kdgHF6PCjRwhxAwjnCVRf2vSvIGx
	 4om4XM/Q1EpoElPHLbYe58hL/uQRgPCPLHruEp5D1xTe16hUlclvj9apYJ60BiNKrAsji
	 ZkDdVVzCMdz8uk5UVyU/i7hKSaamYjl1Y9Yvu5DIQwSy1sJcv0Rtpn0g+KTKzHw6JUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=jUES+ATa;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51770606A31F;
	Mon, 26 Oct 2026 14:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51770606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=jUES+ATa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Yv
	L7WO9Qw1q6ibNOgJWDcAWvN4SLSOgyAvGF80Zshr4=; b=jUES+ATay1UNY6Zu+4
	877kKgw2yEEO1AaQJzGqdbxkzFiFt7ddfiQfdLBN87IxnIu9Yx73HAWjjBAyPTGM
	S4/TfyoaZfCA96ynYMu8n8cG5xvBE0LdPNl8esffgPx54Y0bgQMvdkziRKKEr/BM
	3FGoHnjBJmDZvR7IcvUFDJGtE=
Received: from SYPC (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgA36gkvaN9qPCpOCA--.62724S2;
	Mon, 26 Oct 2026 22:48:16 +0800 (CST)
From: hsyysy@163.com
To: Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Siyuan <hsyysy@163.com>
Subject: [PATCH] pinctrl: sunxi: skip unused per-bank supply on controllers without IO bias
Date: Mon, 26 Oct 2026 22:47:51 +0800
Message-ID: <20261026144751.1392715-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.0
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
X-CM-TRANSID:PSgvCgA36gkvaN9qPCpOCA--.62724S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr17Kr1xAw1kZF1ktr1fWFg_yoW8ur4rpF
	sxXFyayr18XF4aqwsrC34ayFy3Gan7G34fCF48KryrXFsxCan8ury2kryrKF4kGrZ5Xr4Y
	qrZ8ZasFgFn8XaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi2NtOUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7hC47GrfaDABZAAA3i

From: Yang Siyuan <hsyysy@163.com>

sunxi_pmx_request() always requests the "vcc-pX" regulator of the pin's
bank, but that supply is only consumed by
sunxi_pinctrl_set_io_bias_cfg(). Controllers without io_bias_cfg_variant
never use it, so the request only makes the regulator core warn:

  sun50i-h616-r-pinctrl 7022000.pinctrl: supply vcc-pl not found, using
  dummy regulator

The H616 R_PIO is such a controller, and its PL0/PL1 pins drive the
R_I2C bus, so every H616 board hits the warning during boot.

Return early when the controller cannot configure the IO bias voltage,
and teach the free path that no supply was requested for that bank.

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 70099052d..a5222cfbd 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -924,6 +924,15 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
 		return 0;
 	}
 
+	/*
+	 * The per-bank supply is only used to configure the IO bias voltage.
+	 * Controllers without bias configuration (e.g. the H616 R_PIO) have no
+	 * supply to request, and asking for one only makes the regulator core
+	 * warn about the missing regulator for every bank in use.
+	 */
+	if (!pctl->desc->io_bias_cfg_variant)
+		return 0;
+
 	snprintf(supply, sizeof(supply), "vcc-p%c", 'a' + bank);
 	reg = regulator_get(pctl->dev, supply);
 	if (IS_ERR(reg))
@@ -959,6 +968,10 @@ static int sunxi_pmx_free(struct pinctrl_dev *pctldev, unsigned offset)
 					    PINS_PER_BANK;
 	struct sunxi_pinctrl_regulator *s_reg = &pctl->regulators[bank_offset];
 
+	/* No supply was requested for this bank (no IO bias configuration). */
+	if (!s_reg->regulator)
+		return 0;
+
 	if (!refcount_dec_and_test(&s_reg->refcount))
 		return 0;
 
base-commit: 091b06388b117fefdcb63336ac09956a4914b961
-- 
2.56.0

