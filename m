Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299578;
	b=UODA6I+c8xVqj7TFRb1fq4w+Fd1DxpzcEtEVoGQNdIohGTREWS1IazuffW58z1KIuzy3
	 uvPIgXxI+2S2FFnrdTRWjy5aN/7HqwoR9bIbWgANcsoPkcYsU4ZYKljBKrNHiyuSH91fq
	 OzeEEmBXeZXByXOMB+aqPhNbiSaE2xQeZaOQSv+0WiYCkXV6HNrJbysQuONFxi2aY5LGf
	 pM72psdWhV6OoLzfcXWwZDSqlUTsuOXL5GdNX8H3wniy4xHHQLLlIGWcedAhWff56H+Va
	 LjHj3lETh38rVB5P5qHK4FnSEebbFrufyQPp0/so7g2JPLJK67cJAp4AyLL2weNYIBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299578;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xh8F630yN77eRVLFRW+731lWzZ0fRCWqNCGE0dp/ZXc=;
	b=O7U3Y+0XmttZHK2hY0C4WTUvMKFtD4mssUEdOLAp2aSM4Gj3umba53atsLL5l6ixBCYp
	 uoL+ruAAkEay5SY2g90cDwKIE/fZ9pwfwqnK46Y3J52etDwevAhRK2tAC7LEsMs1vxpx0
	 pyqw6TqFysHVZEtoQ/eFKm2Rrz17oAC3R84QF98RoaiRUytE67erKxLyGnnI39uHy5Kyt
	 MeevctvzCXNyi5UpnCYVW6PtxN0TcI0NZlvPLNFH4O4j2pWNGq/IWqHhk3WHUy7tQ7HEj
	 riRSw0a0n8AnWmC+/NJv4r6h14GkFQTTZ/t2jy5N35/vRm2MzdMfrrQn5xur6QsgsVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ItYCH+sa;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BE2606A326;
	Tue, 10 Nov 2026 08:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3BE2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ItYCH+sa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ItYCH+sas3HlcRu2sLhhlP5SXir0JwIAk4K2qif0N60G2LLd13VUdHoBXVkn8YFW9VNnh48Hgb6Su
	 au7Pm9dN61xf5+hZecirANgBN87z3DYyaVvrHq5ABY+ieT5qv+7keswx5XmN1ZeW0JwLsiFVE2jn38
	 XEcG386r1dbxm8p8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af2d6b6447-cdcde;
	Tue, 10 Nov 2026 16:32:55 +0800 (CST)
X-RM-TRANSID:2ee76af2d6b6447-cdcde
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46af2d6b551b-ae357;
	Tue, 10 Nov 2026 16:32:54 +0800 (CST)
X-RM-TRANSID:2ee46af2d6b551b-ae357
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: antonio.borneo@foss.st.com,
	linusw@kernel.org
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH v2] pinctrl: stm32: Fix reset control leak in stm32_pctl_probe() error paths
Date: Tue, 10 Nov 2026 16:32:52 +0800
Message-ID: <20261110083253.1525-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

stm32_pctl_probe() acquires an exclusive reset control for every GPIO
bank with of_reset_control_get_exclusive(), but none of the error
paths release them again: the bank loop returns directly on
-EPROBE_DEFER and on a failed clock lookup, and the
clk_bulk_prepare_enable() failure and the err_register path also
leave the already acquired reset controls behind.

On success the reset controls are kept for the lifetime of the device
and are never released either (the driver has no .remove), but that
is harmless.  On a failed probe, and in particular when the probe is
retried after -EPROBE_DEFER, every attempt leaks another set of
reset control references.

Release the acquired reset controls on all error paths.

Also release the clocks of the already processed banks on the
-EPROBE_DEFER path, which was missed by the earlier clock leak fix
dfd8259507c5 ("pinctrl: stm32: Fix clock reference leak in
stm32_pctl_probe()").

Fixes: 2254e77665d5 ("pinctrl: stm32: defer probe if reset resource is not yet ready")
Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>
---
Changes in v2:

- Point the Fixes tag at 2254e77665d5, which introduced the reset
  control acquisition in the stm32_pctl_probe() bank loop and the
  -EPROBE_DEFER return path; bb949ed9b16b only replaced the child
  node iteration helper (suggested by Sashiko AI review).
- Also release the clocks of the already processed banks on the
  -EPROBE_DEFER path, which was missed by dfd8259507c5.

Link: https://lore.kernel.org/all/20261110065722.1340-1-laixiangwu@cmss.chinamobile.com
 drivers/pinctrl/stm32/pinctrl-stm32.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 98cf9c6f4..2a54a0176 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1966,15 +1966,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		bank->rstc = of_reset_control_get_exclusive(np, NULL);
 		if (PTR_ERR(bank->rstc) == -EPROBE_DEFER) {
 			fwnode_handle_put(child);
-			return -EPROBE_DEFER;
+			clk_bulk_put(i, pctl->clks);
+			ret = -EPROBE_DEFER;
+			goto err_put_rstcs;
 		}
 
 		pctl->clks[i].clk = of_clk_get_by_name(np, NULL);
 		if (IS_ERR(pctl->clks[i].clk)) {
 			fwnode_handle_put(child);
 			clk_bulk_put(i, pctl->clks);
-			return dev_err_probe(dev, PTR_ERR(pctl->clks[i].clk),
-					     "failed to get clk\n");
+			ret = dev_err_probe(dev, PTR_ERR(pctl->clks[i].clk),
+					    "failed to get clk\n");
+			goto err_put_rstcs;
 		}
 		pctl->clks[i].id = "pctl";
 		i++;
@@ -1984,7 +1987,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(dev, "failed to prepare_enable clk (%d)\n", ret);
 		clk_bulk_put(banks, pctl->clks);
-		return ret;
+		goto err_put_rstcs;
 	}
 
 	for_each_gpiochip_node(dev, child) {
@@ -2009,6 +2012,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
 
 	clk_bulk_disable_unprepare(banks, pctl->clks);
 	clk_bulk_put(banks, pctl->clks);
+err_put_rstcs:
+	for (i = 0; i < banks; i++)
+		if (!IS_ERR_OR_NULL(pctl->banks[i].rstc))
+			reset_control_put(pctl->banks[i].rstc);
 	return ret;
 }
 EXPORT_SYMBOL(stm32_pctl_probe);
-- 
2.50.1.windows.1



