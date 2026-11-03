Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793699528;
	b=LHZ55uyAayZKnqO6nhc37/51Ibjh7XvuQ5ETNcky77DWOwwvloHCUp+oySdAesyhKRxt
	 bVFoEXoOLL4QLKPxrdi8LRh59FtGAR921BoBKRfWJ7MTXINyKe+hNbxoCcAANDLW2AMV4
	 mEXIzLCYHW8AndSXAJ2F/nwFYtu+AL/YVVLlnkQPVMLUEMsAv5RhssMvveKKzglsKl6wp
	 +2tYlo9HVfXshQD+7lONiesj5XrGviWHYPOHFmLpIOIfb0FOdcSCzNeUT1WXEk6RPJ6Iy
	 UaYflIUH+7I7LPydPNL+iOy6rNxonxFLOJAhz90U0mw6D27RSFXH4PFYwFYBvWiaTfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699528;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=g1GO0N9RZa7XxF5IhvFVAct0JfNThmJRb5rQhjdL3DU=;
	b=bjThY44x2pn79S1JcxSHRq0QAQn8q2UV0+j14R2I/cNFLB0z9tKUSCx/OdnZjXcEAvm1
	 cfVZjAvlJhojF28+L83WlaMXXelpcAusMajf6ZDCv1/YXviAl6KsTaHpERgWOx3poGmhg
	 vBNei5rUl738vi/ZN6LzFFMEZaIp3puzGl57KyPcDJWapvOfVwCrNb79eopX8mWN+gtqS
	 jEBjq/y+twCVoaNAphHIulBKh+v75YjaBRN9R6m0Nq/GLufZ2a4WHN6tHitGXmkjCE66v
	 qNt1la+6dH6wLQPmmyp+BxWDX+lArjHBBFcb/D6tlmocnHlQxnZttBPCDgUJmuGmupw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tv0ZGqnZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAE9606A324;
	Tue,  3 Nov 2026 09:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tv0ZGqnZ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793699527;
	b=GCTJLHb1jSBmQstQpF52ZLBYadA9wvzJCsp/W/KrAxOd0ymZW2Y5I/MtxuEHExS72iJU
	 dHNk7IB20CYYib8RtF7b7zi8vXKjEcIAuMkHJB/T2mDU4WkLHKr29VEJ5fXOivnYu5JZY
	 X8mv56VKrP20PzImMFEFE2H95to9s8FC5GAm87PsZA3BCQTX0mQGQg6a4a5M3p6XhaE51
	 kR12QjG+MNhXsYxndrBhe5hCO6R2ZMoAwnRwBb5u5iOo2NG47lsz/wu9GmFqg+YpW1JlC
	 hQICd4/RFFZiPRW4qv1DDbN1sgquIA7csd2lnWQn/jEkLp6jOh7KqktihEQ5+u3bUMw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793699527;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=g1GO0N9RZa7XxF5IhvFVAct0JfNThmJRb5rQhjdL3DU=;
	b=ItgsF+iQ2b7ly7ITdykIgYSn4yywpW+ouiwQCEgdIXIvP8hGfYH0Y2IxcOswnjPndwvt
	 XbZ6id9rABcpttH0T0Jd01rqDSqz9AdMD72gtfwAXV91241VX7ZPB6mmLAOc38JzKHhA1
	 fjmRItbafiyOuHXfBMXPA8FpchJ5k18p+MBQKF7TnLv5gnw8mqWDr8YOy1yqhJEodhTr7
	 Q3EeEb2pnSfFoEMvDJU7E2g3yEBM9N/7r9OcbOItjBMeD1mF0F1BG2CTQWwYMM7pOOWBL
	 99F3/QEbbUlev/EcnFW8uH2ByaPj54OpdKel7zPyCPPJG5uxqqAk9iNO9rX0p4cL7ZQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DAAA41F00A15;
	Tue,  3 Nov 2026 09:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793699527;
	bh=g1GO0N9RZa7XxF5IhvFVAct0JfNThmJRb5rQhjdL3DU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Tv0ZGqnZBuTLMRNNUmn7WT0dJEKqFHBntVeuTU5no9Y2xb1RonAxA8nRktpBZfFfP
	 ahcUS3vvEwz5gZoc7yJ4E7wY3iORiuXT+rpaLkLC+GshC77GUUJ/O3T9CPgQkh73Xn
	 RkhJsT1PB8NHDgCkPU5xy/vpte9ghvgUrT6Yvi208YUpeVIjz/D5E9csTxBlH4oJJ4
	 9snzZF2xXnxtTcYQnAhM0GIB7v44hXfdJiBBBbESUpAsQCVABBZqBcjZWRVPdQhJUW
	 b8GoJD4eQTW55rzYpyD0lt7ahVJhS/JpkyHouq59bkDoU9zHyZh2/wIVZEdi59hYwf
	 aIQNM7OxKWVfg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 658FF4687E;
	Tue,  3 Nov 2026 09:52:05 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Tue, 03 Nov 2026 10:51:56 +0100
Subject: [PATCH 3/5] soc: fsl: guts: add the RCW override of any RCWSR
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
Message-Id: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v1-3-0a61a9837744@free.fr>
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v1-0-0a61a9837744@free.fr>
In-Reply-To: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v1-0-0a61a9837744@free.fr>
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
 Vladimir Oltean <vladimir.oltean@nxp.com>, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793699524; l=4011;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=zMby9g9Gw8IHCSfvPJh/Ob7NvLFrXegdSthe00uEpLg=;
 b=WXIVsl0OMnRZC6hYqOFrKmRcM6JFeQ4eYOtz0Ci5hYAeektrwbpAJTaThm7kuB7NwbJgwd4uS
 ML6ONdDW7WBB+kibyCVgX21s0f2kf1B6krqx2l2vwemGp17YtJVRNvf
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr
Content-Transfer-Encoding: 7bit

From: Vincent Jardin <vjardin@free.fr>

fsl_guts_rcw_rmw() only serves the SerDes lane modes. Export it for
other fields of the RCW:
 - fsl_guts_rcw_read() reads a status register
 - fsl_guts_rcw_override() changes fields of one under rcwcr_lock and
   waits for the status register to follow
 - fsl_guts_rcw_override_supported() tells whether the DCSR view of DCFG,
   which holds the override registers, is mapped

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 drivers/soc/fsl/guts.c   | 73 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fsl/guts.h |  3 ++
 2 files changed, 76 insertions(+)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 28361c63e26c..d2e3f66d0da4 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -369,6 +369,79 @@ int fsl_guts_lane_set_mode(int serdes_idx, int lane, enum lynx_lane_mode lane_mo
 }
 EXPORT_SYMBOL_NS_GPL(fsl_guts_lane_set_mode, "FSL_GUTS");
 
+/**
+ * fsl_guts_rcw_read() - read a RCW status register
+ * @index: one-based index, RCWSR1 to RCWSR32
+ * @val: the value read
+ *
+ * Return: 0 on success, -ENODEV before the DCFG block is mapped,
+ * -EINVAL when @index is not 1 to 32
+ */
+int fsl_guts_rcw_read(unsigned int index, u32 *val)
+{
+	if (!soc.dcfg_ccsr)
+		return -ENODEV;
+	if (index < 1 || index > ARRAY_SIZE(soc.dcfg_ccsr->rcwsr))
+		return -EINVAL;
+
+	*val = fsl_guts_read(&soc.dcfg_ccsr->rcwsr[index - 1]);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(fsl_guts_rcw_read, "FSL_GUTS");
+
+/**
+ * fsl_guts_rcw_override() - override fields of a RCW
+ * @index: one-based index of the RCWSR and RCWCR pair
+ * @val: the new value of the fields, in place
+ * @mask: the fields to change
+ *
+ * The fields outside @mask keep the value the status register shows. The
+ * override register is written and the status register polled until it
+ * shows the result, as fsl_guts_lane_set_mode() does for a SerDes lane.
+ *
+ * Context: takes rcwcr_lock, shared with fsl_guts_lane_set_mode(), and
+ * busy-polls the status register for up to RCW_TIMEOUT_US. Does not
+ * sleep; must not be called from interrupt context.
+ *
+ * Return: 0 on success, -EOPNOTSUPP without a DCSR mapping of DCFG,
+ * negative error otherwise
+ */
+int fsl_guts_rcw_override(unsigned int index, u32 val, u32 mask)
+{
+	int err;
+
+	if (!soc.dcfg_ccsr)
+		return -ENODEV;
+	if (!soc.dcfg_dcsr)
+		return -EOPNOTSUPP;
+	if (index < 1 || index > ARRAY_SIZE(soc.dcfg_ccsr->rcwsr))
+		return -EINVAL;
+
+	spin_lock(&soc.rcwcr_lock);
+	err = fsl_guts_rcw_rmw(index - 1, val & mask, mask);
+	spin_unlock(&soc.rcwcr_lock);
+	if (err)
+		pr_err("RCW override of RCWSR%u failed: %pe\n", index,
+		       ERR_PTR(err));
+
+	return err;
+}
+EXPORT_SYMBOL_NS_GPL(fsl_guts_rcw_override, "FSL_GUTS");
+
+/**
+ * fsl_guts_rcw_override_supported() - can a Reset Configuration Word be
+ *				       overridden?
+ *
+ * Return: true when the DCFG block is mapped with its DCSR view, the
+ * second reg of the dcfg node, which holds the override registers
+ */
+bool fsl_guts_rcw_override_supported(void)
+{
+	return soc.dcfg_ccsr && soc.dcfg_dcsr;
+}
+EXPORT_SYMBOL_NS_GPL(fsl_guts_rcw_override_supported, "FSL_GUTS");
+
 static u64 fsl_guts_get_soc_uid(const char *compat, unsigned int offset)
 {
 	struct device_node *np;
diff --git a/include/linux/fsl/guts.h b/include/linux/fsl/guts.h
index 8d5ffb985fee..7127de897c23 100644
--- a/include/linux/fsl/guts.h
+++ b/include/linux/fsl/guts.h
@@ -142,6 +142,9 @@ int fsl_guts_lane_validate(int serdes_idx, int lane,
 			   enum lynx_lane_mode lane_mode);
 int fsl_guts_lane_set_mode(int serdes_idx, int lane,
 			   enum lynx_lane_mode lane_mode);
+int fsl_guts_rcw_read(unsigned int index, u32 *val);
+int fsl_guts_rcw_override(unsigned int index, u32 val, u32 mask);
+bool fsl_guts_rcw_override_supported(void);
 
 /* Alternate function signal multiplex control */
 #define MPC85xx_PMUXCR_QE(x) (0x8000 >> (x))

-- 
2.43.0


