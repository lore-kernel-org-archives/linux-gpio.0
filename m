Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798648;
	b=j9NqSryLoe+n2OMGHhou8MlPZlhFGT5/DBOb6G6Mq3uDYfXGTHb6NXUAS1t7HbKojizn
	 ALsMkj2YKZ2x70RMwcfqhmcFaE9LgA32nQ+v78cWjkFu+sR58f72VOFJI7MNHs4B1tHHg
	 KRgkPI0ATrdTzR7DHntTAYVlIx9ljv3C6Z6clSIXMBlVTjaZfna8Dvnirxy3pi7qcCxbG
	 fMMr5qr9RfxN6BX4S7G2ZFaBK08wk8uzJh9HtcOIr9Tqev47WF1paWFjTrnKXJM9LQ6r5
	 rqkIpBtrGi9poc3NhCJ8M5Da4DlitvqTBs2Zo//Y+Ao9H1mtxYaMUwkaQiacplTS1FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798648;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1boI632c9C/fcKg+l9a78rn9vI8twjKYya6RFg60Pek=;
	b=HQvVW8PQJ1vJDDQA0Ws5FXupA9r0BuzMzZ2Mii43bvz0Uf1OpbBmktGg2imb5EzCGPnO
	 uZA0/MTDWijXNhI6lxvXpSmu9syqxkRnxsHTqXPbJb29F54bGAWzZzY6ZXoIIbWxQeig+
	 ZWQ/VPEjtfbHwFCFGVsLCP5VYoEsIcv+UikbviQHdm/1jiYZY2nVGKQOBH3bcm9w/6Tz6
	 2dt6vzkjmPnfzP4HZe+E55wsjvJJepggZlk3ofPO9I5BhdtZ34wo5N+QDH5d6VYK1EWTn
	 fHd0aRjleOlGkdkBOO7YMQ1M6IswI8mAyS9bv54mErFW2Zls6KA16haoeeaDQROLWww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ShVug8x7;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C6B606A337;
	Mon, 16 Nov 2026 03:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C6B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ShVug8x7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ShVug8x7q6BZlBDCf2P8pHRb1N/x53L5AouUW7UO7Yie6PRBFxvE3qcN21wEFulUjhn1U/mGLbPnJ
	 IWTbJhesJdNfXIc601dNeb1HWO1QUfwLkRuLHAXIs9l9kOkbQb/45xm5KmkK+iWvP/mFQDCLak5gZL
	 3WuMFcPxRrQDSNCY=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96afa7435dea-004a9;
	Mon, 16 Nov 2026 11:10:45 +0800 (CST)
X-RM-TRANSID:2ee96afa7435dea-004a9
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6afa7433bf7-79dd3;
	Mon, 16 Nov 2026 11:10:45 +0800 (CST)
X-RM-TRANSID:2eea6afa7433bf7-79dd3
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
Subject: [PATCH v3] pinctrl: stm32: Fix reset control leak in stm32_pctl_probe() error paths
Date: Mon, 16 Nov 2026 11:10:42 +0800
Message-ID: <20261116031043.502-1-laixiangwu@cmss.chinamobile.com>
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
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
Changes in v3:

- Use the real name "Xiangwu Lai" for the author and in the
  Signed-off-by trailer instead of the account handle (Developer's
  Certificate of Origin), consistent with the same fix in the
  analogix_dp series.

Changes in v2:

- Point the Fixes tag at 2254e77665d5, which introduced the reset
  control acquisition in the stm32_pctl_probe() bank loop and the
  -EPROBE_DEFER return path; bb949ed9b16b only replaced the child
  node iteration helper (suggested by Sashiko AI review).
- Also release the clocks of the already processed banks on the
  -EPROBE_DEFER path, which was missed by dfd8259507c5.

Link: https://lore.kernel.org/all/20261110083253.1525-1-laixiangwu@cmss.chinamobile.com
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



