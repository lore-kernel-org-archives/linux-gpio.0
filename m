Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D2BA59;
	Sun, 20 Sep 2026 03:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789875351; cv=none; b=DlDC5Yd1pvvyoQl4QXA0awLMWXOBK9PEcPJetQPMoNOVtm16A28v+k3+q8ZTRhcjagaCvbbflpX7fzsIjKHc6nIWGBssXY5cNjNJ06fAn1uScY/BxDe6grTA1JFkd6apCFSE5ycenHsR5GVTOfqw0dfqviKM0KHdROD6084nTkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789875351; c=relaxed/simple;
	bh=7Csf4nsdjk+ifGoTeDdw4ELIw3/sxV0Un+Zr5ldWLq8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B/7rwXuWl/XlrymZ1bOWAWA+ir8J8swS7QQJdleP+G/qbDQQFeUwSlAq4Ep3I0LK/PwQZ/g224tGvLg7xmo6BLjpDiAp7VImKOO1tKBWObx70Z76ZbS069+36BFQygvFB4FTNwpJw5ugGsAdI/vcRbIo0DjTiDBKlZCchgDYSTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ppwvM48w; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ppwvM48w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=lP
	w/wWSXo2eJSdLz345sTFelGNjA90qbx0vbS56uV6o=; b=ppwvM48wDx5RbIyy59
	LXcgGSH6eAs8/QrjIuESzDuxxdKa9cCxDShcD1udcRjiwegiwVxCaZtFMRCPyyqP
	sz2I6sOh5YHXCKdaHkqXL+RRm9rRav94xl0paSOEPim+l5e6/OclfXWaZKSnp4oP
	74dZ8NulvOJz5A3xm2DttYEUw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wB30th6VK9qTwjXBg--.53646S2;
	Sun, 20 Sep 2026 11:35:23 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: james.tai@realtek.com
Cc: eleanor.lin@realtek.com,
	afaerber@suse.com,
	linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tychang@realtek.com,
	hppiscas@163.com
Subject: [PATCH v2] pinctrl: realtek: rtd1619b: publish the OF module alias
Date: Sun, 20 Sep 2026 11:35:20 +0800
Message-ID: <20260920033520.12924-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB30th6VK9qTwjXBg--.53646S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CryrXw4UCF43ur4DurW5trb_yoW8Gw4kpF
	W3t34Ykr1rWr4UAFyUKas3uFyfC3Z7AryUK343K347ZF15uFy7Aa47KryUCrn8GrWxAa13
	Krs8tr9ruF4UXa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziNzV8UUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7Ru5gmqvVHuAVQAA3y

PINCTRL_RTD1619B is tristate, and the driver uses the
realtek,rtd1619b-pinctrl compatible to match its devices. However, the
OF table is not exported, so a modular build does not advertise this
alias for automatic module loading.

Add the OF export without changing probe or registration ordering.

The issue was found by our static-analysis tool.

Fixes: c7910f6aca56 ("pinctrl: realtek: Add pinctrl driver for RTD1619B")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
https://lore.kernel.org/all/20260905134418.67619-1-hppiscas@163.com/
Use the full author name and regenerate the plain-text inline diff
without embedded carriage returns.

 drivers/pinctrl/realtek/pinctrl-rtd1619b.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd1619b.c b/drivers/pinctrl/realtek/pinctrl-rtd1619b.c
index b07e50d6356d..e03e1fb09899 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd1619b.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd1619b.c
@@ -1575,6 +1575,7 @@ static const struct of_device_id rtd1619b_pinctrl_of_match[] = {
 	{ .compatible = "realtek,rtd1619b-pinctrl", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, rtd1619b_pinctrl_of_match);
 
 static struct platform_driver rtd1619b_pinctrl_driver = {
 	.driver = {

base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
-- 
2.50.1 (Apple Git-155)

