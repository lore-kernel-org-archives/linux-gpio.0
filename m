Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9570A2D0C62;
	Tue, 26 May 2026 17:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815470; cv=none; b=TUFuEWjzdQiS7XT1Vbyc/qLIV9YFPv+I+cOeTHbh/P+Sr7iQjwCYc3VhQ3gTr5kgIv+jiK1+F4sfMKokmK4uEXgjaZh3jq8dzYrgwUA+giace5rhRBoexN7xNP8ZNcUt0bRfxRZgGV2AR+ZhieWdls7maRl/l2CuJF3Y8OGTrYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815470; c=relaxed/simple;
	bh=XdAOWq8GGsIdFr4SLIxKKpxOgKgyrzPl7v4EErdEiPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mXTdY+yBcCn9f4DImjIZdGRTj6M7cDiKUmhK+mkq0nfC7SlwlNp2lGch/SxfBhrnasxhN+EBx+HoXk1gJVpKfOCN5/CCfMM5bHxkOL12pvbcIougN0FH1CxNh2TdDBnhTT/z0AnovCUQM7uKmgg/PojaPAcAGXEj3Lq/VYKgxsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=YvY47lyb; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="YvY47lyb"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4AD0F26F8E;
	Tue, 26 May 2026 19:11:07 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WwX45KF2v4_W; Tue, 26 May 2026 19:11:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1779815466; bh=XdAOWq8GGsIdFr4SLIxKKpxOgKgyrzPl7v4EErdEiPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YvY47lybVuABgoIIJo3mtGYHdx+Dhyl7GsDFT6RCpU/MhGw4R7FYyC9XDGQd4peCX
	 cJ08ca/3HaJP5VXxBKZLSz9A4pgR7yjHyXNhsQksk/IZo7OH/cInX4r/Yu5ho/IFxa
	 Z74y/Ye3RO1BVUDGDFtgf5KKEx0oXD0zZ6pvd+Oj49WaN+ciZ1/1Pal7CKiOND0wkN
	 Tipb0bqz13qWVhMMYCk47hr2kbSGymDNldymyi0M52vJ85KPAPkF1nK8Ipk7aH3cEw
	 ZW4cTgnHzk8HgSVPpOWNAt+IwMZ8DRqHFepe7+HK040S5Pe6wWIyOCFT41quzGubGy
	 orjbUFwVNddLQ==
From: Marco Scardovi <scardracs@disroot.org>
To: brgl@kernel.org
Cc: heiko@sntech.de,
	linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	scardracs@disroot.org
Subject: [PATCH v2 1/2] gpio: rockchip: convert bank->clk to devm_clk_get_enabled()
Date: Tue, 26 May 2026 19:02:45 +0200
Message-ID: <20260526171050.12785-2-scardracs@disroot.org>
In-Reply-To: <20260526171050.12785-1-scardracs@disroot.org>
References: <CAMRc=Mfk9tP091DN=5kjb8fvFhj1=MiBZSq4NJ7+k5LNCVy9bw@mail.gmail.com>
 <20260526171050.12785-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bank->clk was previously obtained via of_clk_get() and manually
prepared/enabled. However, it was missing a corresponding clk_put() in
both the error paths and the remove function, leading to a reference leak.

Convert the allocation to devm_clk_get_enabled(), which also properly
propagates failures from clk_prepare_enable() that were previously ignored.

The GPIO bank device uses the same OF node as the previous of_clk_get()
call, so devm_clk_get_enabled(dev, NULL) correctly resolves the same
clock provider entry.

Fix the reference leak and simplify the code by removing the manual
clk_disable_unprepare() calls in the probe error paths and in the
remove function.

Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/gpio/gpio-rockchip.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 44d7ebd12724..33580093a4e7 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -656,11 +656,10 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 	if (!bank->irq)
 		return -EINVAL;
 
-	bank->clk = of_clk_get(bank->of_node, 0);
+	bank->clk = devm_clk_get_enabled(bank->dev, NULL);
 	if (IS_ERR(bank->clk))
 		return PTR_ERR(bank->clk);
 
-	clk_prepare_enable(bank->clk);
 	id = readl(bank->reg_base + gpio_regs_v2.version_id);
 
 	switch (id) {
@@ -672,7 +671,6 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 		bank->db_clk = of_clk_get(bank->of_node, 1);
 		if (IS_ERR(bank->db_clk)) {
 			dev_err(bank->dev, "cannot find debounce clk\n");
-			clk_disable_unprepare(bank->clk);
 			return -EINVAL;
 		}
 		break;
@@ -751,7 +749,6 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
 
 	ret = rockchip_gpiolib_register(bank);
 	if (ret) {
-		clk_disable_unprepare(bank->clk);
 		mutex_unlock(&bank->deferred_lock);
 		return ret;
 	}
@@ -792,7 +789,6 @@ static void rockchip_gpio_remove(struct platform_device *pdev)
 {
 	struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
 
-	clk_disable_unprepare(bank->clk);
 	gpiochip_remove(&bank->gpio_chip);
 }
 
-- 
2.54.0

