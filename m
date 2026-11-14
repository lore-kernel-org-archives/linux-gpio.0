Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794647556;
	b=0p27xicvpYFfczvywj4Hw24ZoWZiHanxIjyBDhrIk2rMwmTLU+spw3h0xnP/Yjar5oWz
	 JpKOmC0bghOfjNtiMhAhm8aZhHDjdRx3g/FuraVRp2XqlzXc5ZqB1s7iehRFowmZ68Fee
	 /5kB+tnppLVPdOaCOpK8u5hShDoAjNQSOqwBllJeeWJ46fiMv/msaLwCOrzBnSziOfd7l
	 VHgiK7wZnvvEu7fKe/W8rdJ9WLxdw+t6OKe2rzBiYGnaF25Ceoh8Wx+7PzjoCaJ/XL4Vz
	 9fjDUtwGHQXSeQ8fMB++++BkWMI64MQwNbtbOIwAPkD+dmkAhQXNHMH91gcUQgm0bcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647556;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=K2e2n2f0dPZQunPWOM/IqDNSeCUqCz06+hLqPXwzTUE=;
	b=aSqPX2NhxJrZwGmL1GBO2b0F0s+JZcmTNayQvtnvnSJonrbWmXdmfSJNDq66v4y6/oe2
	 7pWg6vesEcw7LcLeVnRocKDONqqdjaCsSMjVGiRefSzStMwLoPEtFbURcm6UeZPhJ/tPu
	 x87BRhfqPJsJmlvTsxHxbdD/dVTZKYVyORDRQFQ10T1KIQGl9FvrYhouXIFChdu9KysAC
	 MBXWh8qzReVcgyv0Ij8pmpxOv6ofLFRu9q1wc+ogVQEU3L0Q71uO59tV7KiKMQZrXet/+
	 +waEZSbb0PBReqU085q18f+wxVT+c2+c30Xm5BRj2juxJ04JJMVcsWjq+zE1oWYSCsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KHR9iPT4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02956606A8A2;
	Sat, 14 Nov 2026 09:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KHR9iPT4
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794647555;
	b=zc/LBpqN1G+3d7xrHIjT8Z7b2j1GjBtDyi/t56VlY4aq9RRvyhvPZNLKXFdAl2YMsvBQ
	 qT9k/LaR1sW2k3OdzB8e4Useqpik63k/soQAjb7vZQzke9J5nQr8EcT+GRnYUQPzy9wvy
	 Pcam5grGbZMbq7TNbWO49rq94+5/YQyCFiYzllJPZkGB05TPsNiiCBYeXqpW2XeRn82RO
	 SnTj74h2KkjBS5qfZEt8m97ZDdQ4UPT68vb/w0a0SBe4WuDowHKEfXHb9rQWnUjptdZml
	 Air8y4DBKCY66R48KrsuVTyd++FK92z7GuHkj7jXfOnDqu3A05qG9wBg2ygvfMzPTow==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794647555;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=K2e2n2f0dPZQunPWOM/IqDNSeCUqCz06+hLqPXwzTUE=;
	b=qvhonCWSEHXD/6Tr6w35GxsqnsO9Tq7Yr7WCcrkVIEnwPmTvLoyCX1AE/lMKgdzN6wBD
	 uMNfrx/OLYDhm+qEL6JobW4HqMNcbe2l5lkhkeUl03HPitJfRtotze8qIP+mBuNtyENCZ
	 HDMXEgQA3URZ5cKsrGVQbNk9pXJdEVY4NFhECSaRvpp2mtj4rl3MIVn1lYQMSjMrCRepF
	 m0YRFmEW4+GKzvkJwEWF1Tn8LOLfeyEpiS3ZQpty9s37qOajohX5Bkt3cMcr1EnMyMFIx
	 oa/pT/WG0PivIj+jF62P14HsoRgF8dcZ+d6AiwE708PRHeO+rZhzlK5c48BzzQsHoSg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 77F011F000D0;
	Sat, 14 Nov 2026 09:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794647555;
	bh=K2e2n2f0dPZQunPWOM/IqDNSeCUqCz06+hLqPXwzTUE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KHR9iPT4curqjuwFLE8HR6YK68+p/ECg3twcfWygoBpfx8BnXcn+WL33KEVz6i0AI
	 HG4HKIbGUCcmRq9eJ1hTWSJi+8aHkRJSmZzq2eIrTz/p/lSbXPI94lRXoZW5dcUqCz
	 HXXKUOa70RYvumC84x4nzYM1x4OUjgH94vooDrn6YoleqxZOb9tG0VOjnuZ/izryDo
	 epWOMdRFueyB52QsV0b67H4+X/xAr71/GAi/ExINMJiKK1EdRInXl8+VZ7oqHHsE4c
	 jWXRGmxVk8Pby6rfrQ7XYacT+hDK0yXZRSmeVBqIoCAulkEbRwRih1cxdvtoT7Fhu4
	 VdXkKygm6+Bbg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EFE0649D1A;
	Sat, 14 Nov 2026 09:12:33 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Sat, 14 Nov 2026 10:12:30 +0100
Subject: [PATCH v4 3/5] soc: fsl: guts: add the RCW override of any RCWSR
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
Message-Id: <20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-3-eefcea066a55@free.fr>
References: <20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-0-eefcea066a55@free.fr>
In-Reply-To: <20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-0-eefcea066a55@free.fr>
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
 Ioana Ciornei <ioana.ciornei@nxp.com>, Vincent Jardin <vjardin@free.fr>, 
 Frank Li <Frank.li@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794647552; l=4092;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=qmpWO2UIwwok1/NH6X0xAVlyzqob0UppXneZjaDgtC0=;
 b=hxOYUB9ZLhLimfk2NjjY3amSsGbohxb3JnlDLN6cgdBXOOqU/2Vxn6ns1NRtLIxeFK+IiG+WF
 SD4h15yViRwAtH3/i2rim3wFvIys80FU54bSBqOfZMs4m6DwHLJPlT8
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Frank Li <Frank.li@nxp.com>
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


