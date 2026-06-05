Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD16350A18
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jun 2026 01:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780621283; cv=none; b=rmHWuvzCuW2Oaf67fhBTa9nAoSnLLx204CxTl8r4lYguh0ipNmYF2AsnGEdZfbcFKo9UAgDtjzulVa8K5PfckOWqIL8MH9AI9W0FjFfqM++W8USw6/v4lzWsHKgUweRKrzGZKIRooVPJQHe/4uAU60ECDELo3GRI2WfIOhDOWws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780621283; c=relaxed/simple;
	bh=jVce/FGPrlppCYirHntYfI3PY05wNfUxhYZHb68/6qI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ofdXejtLb/Sr0qLRLNSsPIP6GEE+qvMzxJxBN1M4dI0CoG0qfKohQqzlcjo013Ahphmqt+TsOxt4qb0tl8u4swsbAS3ehuhcJCI73/eQ1FNTskjx1Rcnr/ANjExKrepKBdiVwJajJqWzg1o1/TFfw/qaUNzf2TAAd5R6Qr0MrUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=w06WhaNI; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="w06WhaNI"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-48611862583so603211b6e.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 18:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621257; x=1781226057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bUHKe8xq0j7moOuD73/H9vKbxT6KczY0fAxl1satXM=;
        b=w06WhaNI0tK9parGISgOsJDUgg+EH1tx+BYvqyGqjEyDScU7oQ5LFXfdFTmN9qLEDv
         caBecHYIXYjrjf2Sn2SgFaStgF1VLff0gRuWMFURgGC421uIEkqv4gdodYzxuTPzXx51
         13LcOwmJxFqIjIs7qAN8vqorYhukvfBmn+1E9sxHZrcX7F+AarmSklfOEHAe1vn5XJaC
         6j6fWSH74qW0899k1lxAmiaCkEfuSa6ytGa88CR2yu0QLd/kgLagO2d3EA4/yPIXzAIv
         /SGRe4HmaZIpK3U0yHWTN24SZkn/qkdEQbFbGjeVoYdk1XMmfr7tFaOJrgHfj6YwIJ4k
         S47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621257; x=1781226057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7bUHKe8xq0j7moOuD73/H9vKbxT6KczY0fAxl1satXM=;
        b=g8YdjNGDoK/UbrHjOY3Ulbi//C//9G/6bWDAIymS77QLaBQXtXRZiLIe+NdOju3t51
         c00UA8hK0b0wE4UNroHs8ma6wTYB9slQokQYimcfxcALWS6Vyn/RVvfkCjbrUQkwqb8r
         lOd8+jEug4BCcP2fyzjZ8BvT58StraMxorEZMgw8XqZ/5Y+ztT2LXS3tJuwMP/7UP5I8
         8/umgpyOG7JWt/pD5Z38pmX3Dil+wiD0ji3CEFTJcKI7NZS2mD3z+U5uY3myhRzh54OD
         p17MMKeJGUPU07vkGzEeilK8omh62cRRKHR1q5F44DmiC6OPGH8vVz+sY5NgXk8QjMmg
         +Jtw==
X-Forwarded-Encrypted: i=1; AFNElJ9qNSz5cILZ8k9KyzW/lCB/TwcYKPaHszKkkjyIvAydeZSSbVsvDB4l9Uzo2BTFPolwEEjP2cBIvHsF@vger.kernel.org
X-Gm-Message-State: AOJu0YzsPKFQY5mPJReEdDSFMpdOWcpxTzC5zQZJzZuvhE4+ONMmwGwl
	4cfdfVenaAN99Chq9dPItq49B1mlsshM3+NOf+xVEK647e9uOihx3eYWi7lOa4IuGSo=
X-Gm-Gg: Acq92OElZ/ybG+vWtUiG1RuCPbh+E9YxYbfP9MQ0Ep+PGBBrFioxqHs9Hrz3stateed
	xD1v7za93aFEJ+sAnNUaOJzD+5iTlpxieiKXgQf+3yQedAnLif+k2fmjElrl/fvX1fn7YKHDoxV
	lMcNtjAl23sF0fUYPrJw2K9pipf6yEQiIXLUBZPJGH/P3dXHUMmnOIVeh+CjmjGBqMNNfEt3QLW
	CBwXi5GRse4K5tTgrQtdntgUZWgDbeH60VTOsxX5x1yx/6U12eZZ0il4hxeOSkPfA8RXGDluq00
	z7jHjnSYsdd6XfJpvCR+GqxGq81iYV44Us+GvUKwdMoZhhQAcujiWJMo++PcjOOcPd49of84PUD
	YBoXmSxN2GNrhwayxpVvVYrOdtvXdcF9lqfyLi8bctCi76pXWBwJInPt7OlzBfm1MVag00Mal4R
	OaIn7+5eXRNcNycO2AUFLmko0xp7sK02Qf7SwLFg==
X-Received: by 2002:a05:6808:1794:b0:486:3537:2193 with SMTP id 5614622812f47-4868dc58812mr926917b6e.11.1780621256480;
        Thu, 04 Jun 2026 18:00:56 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:00:55 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 09/14] net: stmmac: dwxgmac2: export symbols for XGMAC 3.01a DMA
Date: Thu,  4 Jun 2026 20:00:16 -0500
Message-ID: <20260605010022.968612-10-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Thompson <daniel@riscstar.com>

Toshiba TC956x is an Ethernet-AVB/TSN bridge and is essentially a
small and highly-specialised SoC. Ethernet on this chip is provided
by a DesignWare XGMAC.

One consequence of the SoC-like design is that the internal AXI bus
(used by the XGMAC for DMA) maps the PCI DMA space with a non-zero base
address. This requires a translation step (happily just simple addition)
to convert the PCI DMA address to the hardware DMA address.

This is pretty funky so rather than push that translation logic into
the core driver we intend to keep that logic inside the TC956x
platform code. In order to do that we need to export a few symbols
to allow us to override some of the DMA and descriptor op tables.

FWIW this approach to overriding the ops tables is similar to the
mechanism currently found in dwmac-loongson.c (with the exception
that we have also exported a couple of functions so we don't
have to replicate their content in the TC956x platform code).

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h |  7 +++++++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c    |  1 +
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c   |  1 +
 .../net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 18 ++++++++++--------
 4 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index bcf59ad8a1939..8cecde1bef8a1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -468,4 +468,11 @@ extern const struct stmmac_dma_ops dwxgmac210_dma_ops;
 extern const struct stmmac_dma_ops dwxgmac301_dma_ops;
 extern const struct stmmac_desc_ops dwxgmac210_desc_ops;
 
+void dwxgmac2_dma_init_rx_chan(struct stmmac_priv *priv, void __iomem *ioaddr,
+			       struct stmmac_dma_cfg *dma_cfg, dma_addr_t phy,
+			       u32 chan);
+void dwxgmac2_dma_init_tx_chan(struct stmmac_priv *priv, void __iomem *ioaddr,
+			       struct stmmac_dma_cfg *dma_cfg, dma_addr_t phy,
+			       u32 chan);
+
 #endif /* __STMMAC_DWXGMAC2_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index f02b434bbd505..c9547dc6912a3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1556,6 +1556,7 @@ int dwxgmac2_setup(struct stmmac_priv *priv)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dwxgmac2_setup);
 
 int dwxlgmac2_setup(struct stmmac_priv *priv)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index b5f200a874840..cc67d8e1a920a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -368,3 +368,4 @@ const struct stmmac_desc_ops dwxgmac210_desc_ops = {
 	.set_vlan = dwxgmac2_set_vlan,
 	.set_tbs = dwxgmac2_set_tbs,
 };
+EXPORT_SYMBOL_GPL(dwxgmac210_desc_ops);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 584ab28d7f7f5..f564b9bd7d128 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -62,10 +62,10 @@ static void dwxgmac2_dma_init_chan(struct stmmac_priv *priv,
 	writel(XGMAC_DMA_INT_DEFAULT_EN, ioaddr + XGMAC_DMA_CH_INT_EN(chan));
 }
 
-static void dwxgmac2_dma_init_rx_chan(struct stmmac_priv *priv,
-				      void __iomem *ioaddr,
-				      struct stmmac_dma_cfg *dma_cfg,
-				      dma_addr_t phy, u32 chan)
+void dwxgmac2_dma_init_rx_chan(struct stmmac_priv *priv,
+			       void __iomem *ioaddr,
+			       struct stmmac_dma_cfg *dma_cfg,
+			       dma_addr_t phy, u32 chan)
 {
 	u32 rxpbl = dma_cfg->rxpbl ?: dma_cfg->pbl;
 	u32 value;
@@ -77,11 +77,11 @@ static void dwxgmac2_dma_init_rx_chan(struct stmmac_priv *priv,
 	writel(upper_32_bits(phy), ioaddr + XGMAC_DMA_CH_RxDESC_HADDR(chan));
 	writel(lower_32_bits(phy), ioaddr + XGMAC_DMA_CH_RxDESC_LADDR(chan));
 }
+EXPORT_SYMBOL_GPL(dwxgmac2_dma_init_rx_chan);
 
-static void dwxgmac2_dma_init_tx_chan(struct stmmac_priv *priv,
-				      void __iomem *ioaddr,
-				      struct stmmac_dma_cfg *dma_cfg,
-				      dma_addr_t phy, u32 chan)
+void dwxgmac2_dma_init_tx_chan(struct stmmac_priv *priv, void __iomem *ioaddr,
+			       struct stmmac_dma_cfg *dma_cfg, dma_addr_t phy,
+			       u32 chan)
 {
 	u32 txpbl = dma_cfg->txpbl ?: dma_cfg->pbl;
 	u32 value;
@@ -93,6 +93,7 @@ static void dwxgmac2_dma_init_tx_chan(struct stmmac_priv *priv,
 	writel(upper_32_bits(phy), ioaddr + XGMAC_DMA_CH_TxDESC_HADDR(chan));
 	writel(lower_32_bits(phy), ioaddr + XGMAC_DMA_CH_TxDESC_LADDR(chan));
 }
+EXPORT_SYMBOL_GPL(dwxgmac2_dma_init_tx_chan);
 
 static void dwxgmac2_dma_axi(void __iomem *ioaddr, struct stmmac_axi *axi)
 {
@@ -672,3 +673,4 @@ const struct stmmac_dma_ops dwxgmac301_dma_ops = {
 	.enable_sph = dwxgmac2_enable_sph,
 	.enable_tbs = dwxgmac2_enable_tbs,
 };
+EXPORT_SYMBOL_GPL(dwxgmac301_dma_ops);
-- 
2.51.0

