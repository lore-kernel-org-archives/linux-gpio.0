Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293849;
	b=e34cF944JxUqhb6yyGAZeWD263yAxJ60oxkX8x26kYGqgtYySmNHpyo0UZB+P8+0na+k
	 glB9IGiYOHcQRwCDJgqSUNyDnx3uDCjXp80o47IkEdZZpWJVGuaQaXOJ955HSW+TPWjsL
	 tJoqM5MkpJU78xjnWqvwtE3bPyoZGFd+J2uC/r8VBUz8LqSv9NHybzJ8gS8XdggyaCBeF
	 Mtj4mGwjFRbZJ0fj/3rPckUtxzMmcpdEvy2ZG2EpFYRtSILvaZO/vDpg1rxaBoUU4HQLW
	 OUcRo70lkDdQMgM5Q4clCOozd7UkvWX+ypiVgBvWwuFsSaAGNv0MCEnlpsn7s+dQwag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293849;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bpVRLFMzHhIoyUyMq+dANt1oSPhjof8tBITrqS0xxdU=;
	b=x/N4sh1KWWmG5W4DFU61XeVspj8u+zJtyFHXEQb56Z6tG2P0Yg0vK4Lhct6EgXsm9m46
	 ncf8ex/3+ZXu/mTWBZlqMlV3qU3pBWC8LsitUvlS3f48iFMbWfRIlOFrNRCRaWfdhO/NA
	 5qriSzYobLEpzJbnTd+fmmoqUmsI7/NaNTnhHPD7hUgYBtJUnN8/GRxfrJ0VK3PkfLT4b
	 OmIyWfBUGejUiVw+A04lGhFewd7KW3z8hfzbKPIn1mWAjSO0oR3whwHjS5DETBTx4u06e
	 cCxiB6jzLgwsy/mfZ03bVQegWanOSk7/gTEJ7Y0/guCBsfhqY4jraazawRWmcpVXaYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=UxTZwwa2;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3690E606A321;
	Tue, 10 Nov 2026 06:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3690E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=UxTZwwa2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=UxTZwwa2kcsck/w/DxU6mG4Dms2Qn3adupOJqQiZlhAeGNoYL3bYWYck/soF8cbzbqxSjOUHK2tXg
	 QUCuoTPwxaiHGT/GliFIc/bA3kw5KfGXG19Y/qClJUc0QfNEyOe14CkBMiGVNf4u2biuh+Qf8RvtvO
	 3eszaPQBkqUFQCV0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af2c055fa8-d1282;
	Tue, 10 Nov 2026 14:57:26 +0800 (CST)
X-RM-TRANSID:2ee96af2c055fa8-d1282
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af2c055a94-aa7e0;
	Tue, 10 Nov 2026 14:57:26 +0800 (CST)
X-RM-TRANSID:2ee86af2c055a94-aa7e0
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] pinctrl: stm32: Fix reset control leak in stm32_pctl_probe() error paths
Date: Tue, 10 Nov 2026 14:57:22 +0800
Message-ID: <20261110065722.1340-1-laixiangwu@cmss.chinamobile.com>
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

Fixes: bb949ed9b16b ("pinctrl: stm32: Switch to use for_each_gpiochip_node() helper")
Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 98cf9c6f4..49a8dcc9e 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1966,15 +1966,17 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		bank->rstc = of_reset_control_get_exclusive(np, NULL);
 		if (PTR_ERR(bank->rstc) == -EPROBE_DEFER) {
 			fwnode_handle_put(child);
-			return -EPROBE_DEFER;
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
@@ -1984,7 +1986,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(dev, "failed to prepare_enable clk (%d)\n", ret);
 		clk_bulk_put(banks, pctl->clks);
-		return ret;
+		goto err_put_rstcs;
 	}
 
 	for_each_gpiochip_node(dev, child) {
@@ -2009,6 +2011,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
 
 	clk_bulk_disable_unprepare(banks, pctl->clks);
 	clk_bulk_put(banks, pctl->clks);
+err_put_rstcs:
+	for (i = 0; i < banks; i++)
+		if (!IS_ERR_OR_NULL(pctl->banks[i].rstc))
+			reset_control_put(pctl->banks[i].rstc);
 	return ret;
 }
 EXPORT_SYMBOL(stm32_pctl_probe);



