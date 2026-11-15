Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794749258;
	b=ljvlEVlpp89kc3UTHZni8QDqBvdfoqRlcgNgnItga+M+C2ND6Apm7xz7iBDpAImMxQ0U
	 S8/IB8cE3Y3xHE6mAQzKdMCKzGf8X3dr/+tkWEbn7/qJvdenMng4vvTMtP3trPnWhsGxp
	 vxDBVSqLJr8UW458YZddPNE8kGOOCgKXCrweLVtp9F0YWt20bRpY/MnjCEmeMy/cAZn0f
	 ZNV5R6Vbb6ZBLFZFScjiuh3mxugOi5DDtpXkOAer6JNgy2eGiF+tflMAyMMGMrYY7qEdh
	 mg7KDv9IMmaGjO7zjsQMVV5br/e9lvWsEvuHmNB4/O1EVtBpaW6YM2o3GKM4nSRBhdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749258;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sb54/HfUMhBOv9UuKIZwmzNEGKjXNVmRpC/pQQErHmQ=;
	b=jvx1kpx7KKlLYTWD1sHA6OE7QfwdxAmxOSW6e3FM87zXP9qfrlWXfaumUJTMTs3kvh5d
	 PFfe0JcvYlokrTHcdB5PWoMdGsRQLzZDFxTLgScFro6njAft7eL0u81CBKORws4FmaEHE
	 b1cZVOoPiQuK+jAZHS3517GNkwbEBhWN2Wfbykym450EbmU8qa0UKXVb0bEzo/v99h85b
	 879oWBwE4t2k6AxwPA4D/Unna8HF0AqBDce+GfahhPrjMW2geRrS3Mv65zhTOJU2WtsvC
	 RDEX4S4/GtlV46gu9O2U5cIwvEi+yLxo1P0idHC/cvItuSJlMV1wC7aUU+Dgg2dpANA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FAUEJsYh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AA6606A89F;
	Sun, 15 Nov 2026 13:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FAUEJsYh
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794749258;
	b=ZGaquQX7rVqEHpCVHwHdi8wB+FJ1rpjAeHco9Z3A0aJDaDg+fqpOKttQCzLp9GkkWIXq
	 NWCCowqEp4eULN9a+sRJe0hX8t+cy0R+DmYjjQGRQ88FI7cxltaM1cyRj3cZenG1fYHKA
	 OX8zLvLunLFd411nacm39jJR0GKsepZxtFM3viwivKMwOhz5Vr8YAWPGxuWLPyJhD2DCL
	 XdGvQu6+3mGEyRUGYaH7zJVr+lIaJnW118AdZU56ar3qLv+E7yQs+aa+fF7mWwazYL2op
	 B+pWsAX4uuuKEvy8LEujQAPVAJA1+BDTsCINwSg+KxOtGOnoJSLLhVVCi5GPajIhcVA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794749258;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sb54/HfUMhBOv9UuKIZwmzNEGKjXNVmRpC/pQQErHmQ=;
	b=P1V///C8W6b5UOr8JRhgvp869FAthaDRy1KhK38+zIVF924Ks/U86k1KdHud6GydHufC
	 eUeIa7zDsegdVGFUAjNALeEdlZLRSzNWNkb6EKvA4abkajLXYgXO2j/D+yAEZcuZhHqEs
	 SYe8MjF+CQchvqwGQ+dhpUQP+1kbQecCFzljQbpCeytOrCHXuL+OUgl/VEcjQ1aZV/I30
	 v7kIMx97qhnW9pMwB2vmzr1YB1Vq3zYl+0xVc7CQ1V7ctFoX+9N4XjN5LFqFI45ORjb9y
	 LiR5VXaxKTiiiI2CgF9PyDIBpJaTgOagNkP60u061XOCgaUlDN2W3XORtmYeqdA3dGg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 85BD21F000CA;
	Sun, 15 Nov 2026 13:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794749258;
	bh=sb54/HfUMhBOv9UuKIZwmzNEGKjXNVmRpC/pQQErHmQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FAUEJsYhImfR1j9z0crm9coGqaKAnGfqRcG/UIicFmXcFZ+Fzba8HmvSsmTsCNdiK
	 ekC4EyhpuIM/vvlkzhg61HWki5vjcD1qx1BgjumYZ/Y8y7IQrwrEupx9DwNm0J3IOi
	 ZNwX6WZZVBYNfT9rUbWLgBvCnFbB0t7I01NXSiOkA9Y6G9xPnqWFEJ0I2ILc2QNtRA
	 CkTmwsr92NvHGqsFP3ryJrxtp76zNbjgx+DLozgjRc0cZFw8qJAh+qN7Hy5JGemJxY
	 b84If85quqVktbiuN+E3UCk1GO19hQbMDUh/LDvTDHIW5oRaWF78eel3g404g+ENjL
	 3cz9itzOgvE6g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0F41E4A0BB;
	Sun, 15 Nov 2026 13:27:36 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Sun, 15 Nov 2026 14:27:33 +0100
Subject: [PATCH v6 3/5] soc: fsl: guts: add the RCW override of the pad
 muxes
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v6-3-fbdce4565a5c@free.fr>
References: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v6-0-fbdce4565a5c@free.fr>
In-Reply-To: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v6-0-fbdce4565a5c@free.fr>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ioana Ciornei <ioana.ciornei@nxp.com>, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794749254; l=6998;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=EAfTlIXXJf46NHWx03xdq8COiXE++rPvoKlxWRz+NgM=;
 b=/0gJi+K6iiXORtVxdtibtry4hK1WWZmICUgwRxtrwDv0rLkv/MYzrejM8MCv+e5MbxWQ9z0HN
 KBn4WT/kBJABZ8u4hJ6bwv184LfFYxIi08MSVbFXTZr3CvEn1JsUNv4
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr
Content-Transfer-Encoding: 7bit

From: Vincent Jardin <vjardin@free.fr>

fsl_guts_rcw_rmw() only serves the SerDes lane modes. Export it for
the pad-mux fields of the RCW, and for them only:
 - fsl_guts_pmux_read() reads the pad-mux fields of a status register
 - fsl_guts_pmux_override() changes pad-mux fields of one under
   rcwcr_lock and waits for the status register to follow
 - fsl_guts_pmux_override_supported() tells whether the SoC has pad-mux
   fields and whether the DCSR view of DCFG, which holds the override
   registers, is mapped

Each SoC lists in its fsl_soc_data the fields that can be overridden,
per RCWSR: a register or a field outside of this list is refused, so
the SerDes protocols stay with fsl_guts_lane_set_mode(). The LX2160A
lists the pad muxes of RCWSR12 to RCWSR14 and of RCWSR27.

Suggested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 drivers/soc/fsl/guts.c   | 125 ++++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/fsl/guts.h |   3 ++
 2 files changed, 127 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 28361c63e26c..a4b767f1e297 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -53,6 +53,12 @@ struct fsl_soc_serdes_rcw_override {
 	int val;
 };
 
+/* Pad-mux fields of the one-based RCWSRn, the ones that may be overridden */
+struct fsl_soc_pmux_mask {
+	unsigned int rcwsr;
+	u32 mask;
+};
+
 struct fsl_soc_data {
 	const char *sfp_compat;
 	u32 uid_offset;
@@ -62,6 +68,7 @@ struct fsl_soc_data {
 	int (*serdes_get_rcw_override)(int index, int lane,
 				       enum lynx_lane_mode lane_mode,
 				       struct fsl_soc_serdes_rcw_override *override);
+	const struct fsl_soc_pmux_mask *pmux;
 };
 
 enum qoriq_die {
@@ -369,6 +376,110 @@ int fsl_guts_lane_set_mode(int serdes_idx, int lane, enum lynx_lane_mode lane_mo
 }
 EXPORT_SYMBOL_NS_GPL(fsl_guts_lane_set_mode, "FSL_GUTS");
 
+static const struct fsl_soc_pmux_mask *
+fsl_guts_get_pmux_mask(unsigned int rcwsr)
+{
+	const struct fsl_soc_pmux_mask *pmux;
+
+	if (!soc.data || !soc.data->pmux)
+		return NULL;
+
+	for (pmux = soc.data->pmux; pmux->rcwsr; pmux++) {
+		if (pmux->rcwsr == rcwsr)
+			return pmux;
+	}
+
+	return NULL;
+}
+
+/**
+ * fsl_guts_pmux_read() - read the pad-mux fields of a RCW status register
+ * @rcwsr: one-based index of the status register, as in RCWSR12
+ * @val: the pad-mux fields read, the other fields of the register are 0
+ *
+ * Return: 0 on success, -ENODEV before the DCFG block is mapped, -EINVAL
+ * when the register holds no pad-mux field on this SoC
+ */
+int fsl_guts_pmux_read(unsigned int rcwsr, u32 *val)
+{
+	const struct fsl_soc_pmux_mask *pmux;
+
+	if (!soc.dcfg_ccsr)
+		return -ENODEV;
+
+	pmux = fsl_guts_get_pmux_mask(rcwsr);
+	if (!pmux)
+		return -EINVAL;
+
+	*val = fsl_guts_read(&soc.dcfg_ccsr->rcwsr[rcwsr - 1]) & pmux->mask;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(fsl_guts_pmux_read, "FSL_GUTS");
+
+/**
+ * fsl_guts_pmux_override() - override pad-mux fields of the RCW
+ * @rcwsr: one-based index of the RCWSR and RCWCR pair, as in RCWSR12
+ * @val: the new value of the fields, in place
+ * @mask: the fields to change
+ *
+ * Only the pad-mux fields that the SoC lists can be changed: a SerDes
+ * protocol is changed with fsl_guts_lane_set_mode(), and the other fields
+ * of the RCW are refused.
+ *
+ * The fields outside @mask keep the value the status register shows. The
+ * override register is written and the status register polled until it
+ * shows the result, as fsl_guts_lane_set_mode() does for a SerDes lane.
+ *
+ * Context: takes rcwcr_lock, shared with fsl_guts_lane_set_mode(), and
+ * busy-polls the status register a bounded number of times. Does not
+ * sleep, shall not be called from interrupt context.
+ *
+ * Return:
+ * * 0 on success
+ * * -ENODEV before the DCFG block is mapped
+ * * -EOPNOTSUPP without a DCSR mapping of DCFG
+ * * -EINVAL when @mask is not made of pad-mux fields of the register
+ * * negative error otherwise
+ */
+int fsl_guts_pmux_override(unsigned int rcwsr, u32 val, u32 mask)
+{
+	const struct fsl_soc_pmux_mask *pmux;
+	int err;
+
+	if (!soc.dcfg_ccsr)
+		return -ENODEV;
+	if (!soc.dcfg_dcsr)
+		return -EOPNOTSUPP;
+
+	pmux = fsl_guts_get_pmux_mask(rcwsr);
+	if (!pmux || !mask || (mask & ~pmux->mask))
+		return -EINVAL;
+
+	spin_lock(&soc.rcwcr_lock);
+	err = fsl_guts_rcw_rmw(rcwsr - 1, val & mask, mask);
+	spin_unlock(&soc.rcwcr_lock);
+	if (err)
+		pr_err("RCW override of RCWSR%u failed: %pe\n", rcwsr,
+		       ERR_PTR(err));
+
+	return err;
+}
+EXPORT_SYMBOL_NS_GPL(fsl_guts_pmux_override, "FSL_GUTS");
+
+/**
+ * fsl_guts_pmux_override_supported() - can the pad muxes be overridden?
+ *
+ * Return: true when the SoC lists pad-mux fields and the DCFG block is
+ * mapped with its DCSR view, the second reg of the dcfg node, which holds
+ * the override registers
+ */
+bool fsl_guts_pmux_override_supported(void)
+{
+	return soc.dcfg_ccsr && soc.dcfg_dcsr && soc.data && soc.data->pmux;
+}
+EXPORT_SYMBOL_NS_GPL(fsl_guts_pmux_override_supported, "FSL_GUTS");
+
 static u64 fsl_guts_get_soc_uid(const char *compat, unsigned int offset)
 {
 	struct device_node *np;
@@ -579,6 +690,18 @@ static const struct fsl_soc_data ls1028a_data = {
 	.num_serdes_lanes = 4,
 };
 
+static const struct fsl_soc_pmux_mask lx2160a_pmux[] = {
+	{ 12, GENMASK(29, 0) },	/* IIC2..SDHC1_DIR */
+	{ 13, GENMASK(29, 0) },	/* SDHC2_DAT74..EVT43 */
+	{ 14, GENMASK(10, 0) },	/* EVT20..IIC1 */
+	{ 27, GENMASK(7, 0) },	/* EC1, EC2, USB_EXT, GTX_CLK, SDHC1_DS */
+	{}
+};
+
+static const struct fsl_soc_data lx2160a_data = {
+	.pmux = lx2160a_pmux,
+};
+
 /*
  * Table for matching compatible strings, for device tree
  * guts node, for Freescale QorIQ SOCs.
@@ -606,7 +729,7 @@ static const struct of_device_id fsl_guts_of_match[] = {
 	{ .compatible = "fsl,ls1088a-dcfg", .data = &ls1088a_data},
 	{ .compatible = "fsl,ls1012a-dcfg", },
 	{ .compatible = "fsl,ls1046a-dcfg", .data = &ls1046a_data},
-	{ .compatible = "fsl,lx2160a-dcfg", },
+	{ .compatible = "fsl,lx2160a-dcfg", .data = &lx2160a_data},
 	{ .compatible = "fsl,ls1028a-dcfg", .data = &ls1028a_data},
 	{}
 };
diff --git a/include/linux/fsl/guts.h b/include/linux/fsl/guts.h
index 8d5ffb985fee..ae245afeb7b9 100644
--- a/include/linux/fsl/guts.h
+++ b/include/linux/fsl/guts.h
@@ -142,6 +142,9 @@ int fsl_guts_lane_validate(int serdes_idx, int lane,
 			   enum lynx_lane_mode lane_mode);
 int fsl_guts_lane_set_mode(int serdes_idx, int lane,
 			   enum lynx_lane_mode lane_mode);
+int fsl_guts_pmux_read(unsigned int rcwsr, u32 *val);
+int fsl_guts_pmux_override(unsigned int rcwsr, u32 val, u32 mask);
+bool fsl_guts_pmux_override_supported(void);
 
 /* Alternate function signal multiplex control */
 #define MPC85xx_PMUXCR_QE(x) (0x8000 >> (x))

-- 
2.43.0


