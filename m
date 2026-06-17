Received: from sender-op-o11.zoho.eu (sender-op-o11.zoho.eu [136.143.169.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF6F34DCE0
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 22:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781733931; cv=pass; b=XzHMDp8ChpB3fVALYIgeeAhVUO9JmRDpbgC43DSKYqtQfyLA1RfiZOuYLCFPD+LCjXvD9fOOu4UZmn32+h/u8rhFz86UiSTo7LGkwIfOTpfx+im908rjfhCBw2NFW2SnU8w7YDjO/+XNUDBxdiAlUXakvmS9BDu6znaQTGjXXVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781733931; c=relaxed/simple;
	bh=672BPjJDw34JoyYy7gjvo4tUK0OAv++fv9tFNK03o5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WUmOWXveIEDYxLdnxyAT+hiIwjLdcn5Fr+5XQ6bY1vUrKYHOpTG0hhvoG1ipvKdO9iXvjNL9lzw772sroRNqnZJVdo+IeVO5NvoNbaFVU97dsDsqq/2iE9tPx9d5XljlCt1GpKksVLH8tfGE8WIiTyR4Y+AMc0lepn1Byp6sU/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dragonzap.com; spf=pass smtp.mailfrom=dragonzap.com; dkim=pass (1024-bit key) header.d=dragonzap.com header.i=daniel@dragonzap.com header.b=X/j09m6u; arc=pass smtp.client-ip=136.143.169.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dragonzap.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dragonzap.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dragonzap.com header.i=daniel@dragonzap.com header.b="X/j09m6u"
ARC-Seal: i=1; a=rsa-sha256; t=1781733900; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=VoBW12IeSG/YFCRsIpOAw34h/PXpuszDABNyFeqrhtbl/I4ljPTKKm56s/4gqORumKxZZ6L4eRP5qfVzHEUx3s/WomoSOSKlZeL0q/atYT5kvPg5EFK4iVssgzKAWuINl8J/oqeh9xdtGCSvUEY+CcoI9o8tyjntPBfmSaWoFow=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1781733900; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cwLzgTxmd17MPMjVud2qLnK0Cd61KPIrOzasA94Klt4=; 
	b=B4AspH2QACy2j6PgvizBfA05OBmNVC2D1pGl2IWX+vPn0TiXU4uZugfvn8JHuVRwfeZ/2Yk0Dt2mpz6DgQSb71R9BjwmaKuGjmI7f1gt0q1Fu2HRaR7RrP50Co/aWDHB9E88FQlnCkg3ID0fRs1UHL47vHkYWobXWJvlU4WVUaw=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=dragonzap.com;
	spf=pass  smtp.mailfrom=daniel@dragonzap.com;
	dmarc=pass header.from=<daniel@dragonzap.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781733900;
	s=zoho; d=dragonzap.com; i=daniel@dragonzap.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cwLzgTxmd17MPMjVud2qLnK0Cd61KPIrOzasA94Klt4=;
	b=X/j09m6urwiiFXYm6GBH2zaOdOVbYQnCxx8aK6NUdd23LC7dhr4bCnwyvPY5Z6qW
	LAO1QoRJv23U3NLktZMuj7Xl9yDfN527XP5APUBj5cJtX+KQvjz7JDZ5Whim10k3Zgd
	BmNe9KSNrKAnFpCAWzRruJutViut6vN4n+pkiIJM=
Received: by mx.zoho.eu with SMTPS id 1781733898081206.27637502109712;
	Thu, 18 Jun 2026 00:04:58 +0200 (CEST)
From: Daniel McCarthy <daniel@dragonzap.com>
To: Linus Walleij <linusw@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Daniel McCarthy <daniel@dragonzap.com>
Subject: [PATCH] pinctrl: bcm2835: Don't remove an unregistered GPIO chip
Date: Thu, 18 Jun 2026 01:04:51 +0300
Message-ID: <20260617220451.15298-1-daniel@dragonzap.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

If the devm_pinctrl_register() function fails,
bcm2835_pinctrl_probe() calls gpiochip_remove()
before gpiochip_add_data() has registered the GPIO chip.

This means that upon failure the gpio_chip.gpiodev
 is NULL resulting in a null pointer dereference
inside the gpiochip_remove() function.

Remove the unnecessary function call to gpiochip_remove().
No GPIO cleanup is required because the GPIO chip
has not yet been registered. Without this change there
is potential for a kernel panic upon registration failure

Fixes: 266423e60ea1 ("pinctrl: bcm2835: Change init order for gpio hogs")
Signed-off-by: Daniel McCarthy <daniel@dragonzap.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index e7b35019a5a7..725e880ae086 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -1350,7 +1350,6 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 	pc->pctl_desc = *pdata->pctl_desc;
 	pc->pctl_dev = devm_pinctrl_register(dev, &pc->pctl_desc, pc);
 	if (IS_ERR(pc->pctl_dev)) {
-		gpiochip_remove(&pc->gpio_chip);
 		return PTR_ERR(pc->pctl_dev);
 	}
 
-- 
2.53.0

