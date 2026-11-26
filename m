Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699685;
	b=CVsIzGnq8CJpZ0FkIg/T2gzkkMfog8Rvot7PoLJdWasl/aMPQHHt/X6rraVDb6sqUdfI
	 Vf/NFaLrUvvm9zVLs2rv0/hT0cOIJCMjD8MEmiM8CeWv+C0XzTedio2pGRispXRz+0dDz
	 dkfcdxnljFCN6hRi//XMh/ZWG7MQovuYNN0OgizHy7qrAQqYmiH3VhGyqjisG8dbQL47S
	 VxER3AE/ewS5RdRD1lIQWq6S2NSLj+5LggbZxn/ZXCptH8gvoXDJcnSiIAuwrt4GvLOA3
	 9qTPsWi4/BV7WdFhVKbSDVshuFIlrAdujaAYWyffV19feKB4EiaJaQz3Qs/dvHVCfnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699685;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=DiATayS2KmKYPoh8MDc6ESE1N2bYjQDbIVyIlvkFuuI=;
	b=MattLZREsFrJKEgkpp7BbgTww0lhebBhzzNWbH8zKQJdIxGDtZVZ0wiuFTsfgfLZ0RG7
	 BUjqnVK+Uc1esPalDoftglLJC38+osL5ZahAmKNWa7kDIlEX6h7iov0B21GtffAsJge0s
	 zIEHwFEfHQu38kfA3S4r0OoLUWLqAyimsOjvUDKwEfRuNGLfn+vSqaJ3grXdQUhrv1gsb
	 +W5/iQHl9BSDDEPCXUe/5FRsL/8MJEjjjBQHAPpM511l9aF+Rk2mG6Ampan8Ivsbmi/IB
	 BtLvE0r/Woog2kn8HbxhldoDJrukB0C+iuWr0spESglidueZQvVEBs0SWAp6EGu+xwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b="EgO/TYdM";
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD886606A331
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 13:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD886606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=EgO/TYdM
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561f6fcb1;
	Thu, 26 Nov 2026 21:28:01 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: xianwei.zhao@amlogic.com,
	linusw@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH] pinctrl: amlogic-a4: Fix potential use-after-free on cleanup
Date: Thu, 26 Nov 2026 21:28:00 +0800
Message-Id: <20261126132800.4091071-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
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
X-HM-Tid: 0aa2180aa71203a2kunma8fb47fc35d94a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSEtPVkIeTR0dTUNLGB0fHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=EgO/TYdM/cfEHmDU2jtUb+MzHUXmXo+V/N1mh1ygoae55Ir0cK79FSBJXfuFhQwVNvWNlX+CTsK7XfRItLNlG+cBVoB8foNMztRGN1S/oD0J6dLjS06iWmekorUcekbD3+JKsC+YLQhdBLsrj8/dNA1596xPaKbY6rOxBQRkaj8=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=DiATayS2KmKYPoh8MDc6ESE1N2bYjQDbIVyIlvkFuuI=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

A later bank registration failure leaves the earlier GPIO chips
registered while devres releases their backing storage. Successful
unbind also leaves the chips registered.

Use managed registration to remove the chips before releasing their
banks on both paths.

This issue was found by our static analysis tool under development.

Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index b258bd88d745..33b17a2db1cd 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -1209,7 +1209,8 @@ static int aml_pctl_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(info->pctl), "Failed pinctrl registration\n");
 
 	for (i = 0; i < info->nbanks; i++) {
-		ret  = gpiochip_add_data(&info->banks[i].gpio_chip, &info->banks[i]);
+		ret = devm_gpiochip_add_data(dev, &info->banks[i].gpio_chip,
+					     &info->banks[i]);
 		if (ret)
 			return dev_err_probe(dev, ret, "Failed to add gpiochip(%d)!\n", i);
 	}

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0

