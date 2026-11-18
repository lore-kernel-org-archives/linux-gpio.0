Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985399;
	b=auPWkqm/l8LG7hYef7Cg+ksSet7kVl3ncpoGSBqOm2Yh/CKaINntNUI9rW3HVWabjJj3
	 aT7EXT+drksu6gY8KO29IZ/B4RmNdwfDITb/MbzV9EXWHz0CkSHRoMhfN9nIkGFiF6nOI
	 KJE+giC/whEXKi/4b6fpC6p35kvVv5NIQIYgjNixdJzqxDz0gYhAySYtUe/6FqEid3Qaf
	 yZbep24KXkK+zBezP8HrKfR5oyjb6dShFh9r6+YKeXQbKkc2S04DixLtEFBJ/1wP+Z/Ke
	 e6ci0KydDCu6tLuHHQYeMolUB+Fk9OaGcv2Q5oDyRrAbyp28zrUhzUWWRoCy0m0e/3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985399;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=AmaWeU4MO6ngVRRD6vG/r7mzdb6FLOu0b+ksQyR6+To=;
	b=ywVqKxPZY6Z7ghetxgQhuq/2z5tSyoJuOYeHKyXQ4+fPXTc80x8tTDxSa4TBP/HynFCB
	 o6WnlMioh/AjhV6rvC2JwORhu5tl8fT3VepRLKq3IOeF+ug3vdToJ1TIQsUZKS3Y5iYpU
	 H7sgl2p4rfdnZ/Nvwyn/Hmhp02x7DlzZFAvdGBDtn0VBHFRotrrN61p7Xcru7XCQRmCTz
	 xYD9knDcY7m3mZzo6IYBzUUD/rR80Jogi5VoVcmy1FJTTb3ys7xDKB/OYRPbUumZvAWGy
	 nJfnO3Amg2oB1vsUFJRjrOwe3h5x+X/dmzEPyFZJtWdUM9B9pLdCR806pddl6Uy60MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sellers.id.au;
	spf=fail smtp.mailfrom=sellers.id.au;
	dkim=pass header.d=sellers.id.au header.i=@sellers.id.au header.a=rsa-sha256 header.s=default header.b=GrS5LJ5X;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD4D606A31C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 07:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CD4D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sellers.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sellers.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sellers.id.au header.i=@sellers.id.au header.a=rsa-sha256 header.s=default header.b=GrS5LJ5X
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id TYiCxsOtVOOJnTZhHxOAdF; Wed, 18 Nov 2026 07:03:11 +0000
Received: from just2044.justhost.com ([173.254.29.206])
	by cmsmtp with ESMTPS
	id TZhHxETdnGh2BTZhHx6CdZ; Wed, 18 Nov 2026 07:03:11 +0000
X-Authority-Analysis: v=2.4 cv=Aszu3P9P c=1 sm=1 tr=0 ts=6afd4daf
 a=pynxHT4M0AVwz8ROpNtnNw==:117 a=tbVZtiplu92VKpH45hjydQ==:17
 a=zJRp6_cAMcgA:10 a=QzMiS2WfBm8A:10 a=IehRXGEb1GNWFAjnUyIA:9
 a=sW6rCsXrbcaOzks2YK80:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sellers.id.au; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=AmaWeU4MO6ngVRRD6vG/r7mzdb6FLOu0b+ksQyR6+To=; b=GrS5LJ5XcUTY
	n2g/MEjAXcU7Y3vqTsmUL3DBiGD0YKHKJ3BNJuehd0mMLdL3Zl2KEqMPmGBDdRXk6w2FDo9bst2Xh
	V6QMZjaSfKgaDzTlrQVSslBIDmydOexw0ty75JtsWCkoIo1LAchw+JyZi2Raom7mziwhYZRl9cgB9
	d6IO5ZU3TZDptwtQy+XrZ4YuLWKTmtrY6lqo/bBuWpitWrTcBSkT1satfc5motjJX8fo37jtBLJzo
	JJqCexU5wHS58why2WrdYcch1x1LzZLpOYinWbh4OXi4YQAF0cRNQPSdLiIrcONP5Gjok+DWEN0Ck
	aGqgU54vKXA+GFA1VY8UZw==;
Received: from n110-32-20-158.rdl21.qld.optusnet.com.au ([110.32.20.158]:46974 helo=localhost.localdomain)
	by just2044.justhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <dean@sellers.id.au>)
	id 1xTZhG-00000002TMc-0qX7;
	Wed, 18 Nov 2026 00:03:10 -0700
From: Dean Sellers <dean@sellers.id.au>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dean Sellers <dean@sellers.id.au>
Subject: [PATCH 2/2] pinctrl: sx150x: move wide registers in a single block transfer
Date: Wed, 18 Nov 2026 18:02:59 +1100
Message-ID: <20261118070259.2557570-3-dean@sellers.id.au>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118070259.2557570-1-dean@sellers.id.au>
References: <20261118070259.2557570-1-dean@sellers.id.au>
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
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - just2044.justhost.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sellers.id.au
X-BWhitelist: no
X-Source-IP: 110.32.20.158
X-Source-L: No
X-Exim-ID: 1xTZhG-00000002TMc-0qX7
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: n110-32-20-158.rdl21.qld.optusnet.com.au (localhost.localdomain) [110.32.20.158]:46974
X-Source-Auth: dean@sellers.id.au
X-Email-Count: 8
X-Org: HG=bhshared_jh;ORG=bluehost;
X-Source-Cap: cmVhbHN0cjE7cmVhbHN0cjE7anVzdDIwNDQuanVzdGhvc3QuY29t
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLFBvKX722uEx7H0xSDo4g+ChryZ6dn/vPcVuFCvDdYhc/2fyoLut208Z55t50metm2jKGHSkEvbv0c8q4iC0MmU0A2fMOBTOB19TE9kL6F1LUwotsIT
 FzuJis+tqTVeO2su3AnnN8uKhVKI1IPS5ELNlgIQ7XbCVaD/AOLNs0vOABfPmLr6P/E+BnAfMNLPPkjR/inbTOxKLqiMosXUNNA=

The regmap accessors build each logical register from one SMBus byte
access per byte. On a 16-line part every register on the interrupt path
is 16 bits wide, so servicing one interrupt costs six i2c transfers: two
to read RegInterruptSource, two to ack it, and two more when gpiolib
reads RegData back to report the line level.

Measured on an SX1509Q on a 100 kHz bus, each transfer costs about
0.6 ms, of which roughly 0.36 ms is time on the wire and the rest is
fixed adapter overhead. The transfer count dominates interrupt latency,
and it is well above the minimum hardware debounce period of 0.5 ms. The
longer the latency, the wider the window in which a second edge merges
into a latch bit that is already set and is lost.

The 789 parts auto-increment the register address across a multi-byte
access unless that is disabled in RegMisc[1]. The bit is clear out of
reset and sx150x_init_misc() leaves it clear, so a wide register can be
moved in one transfer. That takes the interrupt path from six transfers
to three.

Enable this only on the 789 models, and only when the adapter advertises
I2C_FUNC_SMBUS_I2C_BLOCK. The 123 and 456 parts stay on byte-at-a-time
access, because their datasheets do not document the same
auto-increment behaviour.

A short block read is reported as -EIO, so a truncated transfer is
never returned as a register value.

Signed-off-by: Dean Sellers <dean@sellers.id.au>
---
 drivers/pinctrl/pinctrl-sx150x.c | 44 ++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index c97e9bc3a33f..970f9d8bd809 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -38,6 +38,8 @@ enum {
 enum {
 	SX150X_789_REG_MISC_AUTOCLEAR_OFF = 1 << 0,
 	SX150X_MAX_REGISTER = 0xad,
+	/* Widest logical register is the 32-bit RegSense quartet. */
+	SX150X_MAX_REG_BYTES = 4,
 	SX150X_IRQ_TYPE_EDGE_RISING = 0x1,
 	SX150X_IRQ_TYPE_EDGE_FALLING = 0x2,
 	SX150X_789_RESET_KEY1 = 0x12,
@@ -105,6 +107,8 @@ struct sx150x_pinctrl {
 	} irq;
 	struct mutex lock;
 	const struct sx150x_device_data *data;
+	/* Wide registers can be moved in one i2c block transfer */
+	bool block_xfer;
 };
 
 static const struct pinctrl_pin_desc sx150x_4_pins[] = {
@@ -1065,6 +1069,24 @@ static int sx150x_regmap_reg_read(void *context, unsigned int reg,
 	 *		reg + 3 [ 3 3 2 2 1 1 0 0 ]
 	 */
 
+	if (pctl->block_xfer && width > 8) {
+		const int count = width / 8;
+		u8 buf[SX150X_MAX_REG_BYTES];
+
+		ret = i2c_smbus_read_i2c_block_data(i2c, reg, count, buf);
+		if (ret < 0)
+			return ret;
+		if (ret != count)
+			return -EIO;
+
+		for (n = 0, val = 0; n < count; n++)
+			val = (val << 8) | buf[n];
+
+		*result = sx150x_maybe_swizzle(pctl, reg, val);
+
+		return 0;
+	}
+
 	for (n = width, val = 0, idx = reg; n > 0; n -= 8, idx++) {
 		val <<= 8;
 
@@ -1090,6 +1112,17 @@ static int sx150x_regmap_reg_write(void *context, unsigned int reg,
 
 	val = sx150x_maybe_swizzle(pctl, reg, val);
 
+	if (pctl->block_xfer && width > 8) {
+		const int count = width / 8;
+		u8 buf[SX150X_MAX_REG_BYTES];
+		int i;
+
+		for (i = 0, n = (width - 1) & ~7; i < count; i++, n -= 8)
+			buf[i] = (val >> n) & 0xff;
+
+		return i2c_smbus_write_i2c_block_data(i2c, reg, count, buf);
+	}
+
 	n = (width - 1) & ~7;
 	do {
 		const u8 byte = (val >> n) & 0xff;
@@ -1150,6 +1183,17 @@ static int sx150x_probe(struct i2c_client *client)
 	if (!pctl->data)
 		return -EINVAL;
 
+	/*
+	 * The 789 parts auto-increment the register address across a
+	 * multi-byte access unless that is disabled in RegMisc, which
+	 * sx150x_init_misc() leaves enabled, so a wide register can be moved
+	 * in one transfer. The 123 and 456 datasheets do not document the
+	 * same behaviour, so those parts stay on byte-at-a-time access.
+	 */
+	pctl->block_xfer = pctl->data->model == SX150X_789 &&
+			   i2c_check_functionality(client->adapter,
+						   I2C_FUNC_SMBUS_I2C_BLOCK);
+
 	pctl->regmap = devm_regmap_init(dev, NULL, pctl,
 					&sx150x_regmap_config);
 	if (IS_ERR(pctl->regmap)) {
-- 
2.43.0

