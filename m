Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3AE322B72;
	Sun,  7 Jun 2026 23:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780873529; cv=none; b=GFA4CGjD6rE+2HMU2d29he1htgVt3kzvDfh9DDhH8paTyuqIX5cgkBoO52gc34TJoMdz7zeFXX+S4JkqugZJI/+YbBQffm4geDz+yw07lGu0nuy39xCFb1REp9FrSzeTT8sJnsUQxhFotknW6yBbPGZT9uY2Wu7cZ2+/CZC5UEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780873529; c=relaxed/simple;
	bh=Zz4Hn5p9Yljerh3+9LIY9ZhIchk/XuvhmnwJB0hVIoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XjUv0cK2y2ok5ADM3LfwUrXiajc+4OCauBoeSmkIxEAfO8avlBz+TOsMMlL2dMe4/gmme5N4bSEisbMb+pQ6FkLqqz9m/LtOB1dcbfjdOfMw0kuzmg28vL2YFeOA17qUmS4Knq8k/cpF+f5W6Dd9uuYH0aUNhEZlmd8q9e1ggk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=AYvx/miQ; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="AYvx/miQ"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0035B26FB0;
	Mon,  8 Jun 2026 01:05:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MEYT4_UcjqVS; Mon,  8 Jun 2026 01:05:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1780873518; bh=Zz4Hn5p9Yljerh3+9LIY9ZhIchk/XuvhmnwJB0hVIoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AYvx/miQSqHwHn3q556VCXi54+QdXIKgTNJfmMg7zfoxRbBU1uLP1WX7LD3UASm7i
	 T+2GTpK0YYT61UJ3OvbU/3Un74vK3O4TV+97y0SJS4AOoBMY+x9fPtHI2pNlXOeWId
	 Rqljh8C7JfLTt+mNVWtolI1nVN/3siCR1WZ2sy0QaA0E3SsF//tpuSTM2ardpLSGJk
	 QUbYZDyKRvsOa8B/h10J4kCLljeH4U7sGpdnZDhIhVz7ULWrlWbS63vr2isAtRZnUa
	 nTzHv6R7hbl2b/qkOLUnTK4nOt6xqF3BpaEURHCEoWQgHHgXjr22O/NBytDTuy73TQ
	 rvM7x/kLSUNFQ==
From: Marco Scardovi <scardracs@disroot.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jianqun Xu <jay.xu@rock-chips.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] gpio: rockchip: fix generic IRQ chip leak on remove
Date: Mon,  8 Jun 2026 01:05:02 +0200
Message-ID: <20260607230504.35392-2-scardracs@disroot.org>
In-Reply-To: <20260607230504.35392-1-scardracs@disroot.org>
References: <20260607230504.35392-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver allocates domain generic chips using
irq_alloc_domain_generic_chips() during probe. However, on driver
remove/teardown, the generic chips are not automatically freed when the
IRQ domain is removed because the domain flags do not include
IRQ_DOMAIN_FLAG_DESTROY_GC.

This causes both the domain generic chips structure and the associated
generic chips to be leaked. Additionally, the generic chips remain on
the global gc_list and may later be visited by generic IRQ chip suspend,
resume, or shutdown callbacks after the GPIO bank has been removed,
potentially resulting in a use-after-free and kernel crash.

Fix the resource leak by explicitly calling
irq_domain_remove_generic_chips() before removing the IRQ domain in
rockchip_gpio_remove().

Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/gpio/gpio-rockchip.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index bc97d5d5d329..9478a58f1caa 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -802,8 +802,10 @@ static void rockchip_gpio_remove(struct platform_device *pdev)
 	struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
 
 	irq_set_chained_handler_and_data(bank->irq, NULL, NULL);
-	if (bank->domain)
+	if (bank->domain) {
+		irq_domain_remove_generic_chips(bank->domain);
 		irq_domain_remove(bank->domain);
+	}
 	gpiochip_remove(&bank->gpio_chip);
 }
 
-- 
2.54.0

