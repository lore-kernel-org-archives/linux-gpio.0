Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB12633DEC8
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437699; cv=none; b=awYn/0ceC/KM84Yb4Gio2vsk6yZrK9GGDgnv25dNzuoy5vaEeLc4cHHZ/9ZNiSFJieK9/fCzILLc9YlgYlKooy1+y/nhzuMVg/PDc97FQzQHDWjm9ALqOAHKGnwn6r+LQ0nC/+8ZRwS9F2Osbk4/FgLjuOptHzyFKFEIJTVlfyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437699; c=relaxed/simple;
	bh=l8N3ra8bV3qnd3wmBNeV/jP62M40/0xSyaclNNADFyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y/4tF2Y3FVd2kOtnYcECFLOAoSK+HLwOFzubLeQGeUzqD+is5dQqfYS9EUotflMkUDieEDnXeLfbGgweiSVPfiocGfRBJBXt9/E0eLxoMvrDEQb2Pse6OyC532WmSxWCcfuzsDNg122QloZjnR7aW472jGrVPR/ltpv4udgqLy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vkNZe-0008IN-Ba; Mon, 26 Jan 2026 15:28:14 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Mon, 26 Jan 2026 15:27:48 +0100
Subject: [PATCH v2 2/2] regulator: bd71815: switch to
 devm_fwnode_gpiod_get_optional
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-gpio-devm_fwnode_gpiod_get_optional-v2-2-ec34f8e35077@pengutronix.de>
References: <20260126-gpio-devm_fwnode_gpiod_get_optional-v2-0-ec34f8e35077@pengutronix.de>
In-Reply-To: <20260126-gpio-devm_fwnode_gpiod_get_optional-v2-0-ec34f8e35077@pengutronix.de>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, kernel@pengutronix.de, 
 Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

Use the devm_fwnode_gpiod_get_optional variant to simplify the error
handling code.

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2:
- none
---
 drivers/regulator/bd71815-regulator.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/regulator/bd71815-regulator.c b/drivers/regulator/bd71815-regulator.c
index 8da57a7bb2f1..668714f35464 100644
--- a/drivers/regulator/bd71815-regulator.c
+++ b/drivers/regulator/bd71815-regulator.c
@@ -571,15 +571,12 @@ static int bd7181x_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	ldo4_en = devm_fwnode_gpiod_get(&pdev->dev,
-					dev_fwnode(pdev->dev.parent),
-					"rohm,vsel", GPIOD_ASIS, "ldo4-en");
-	if (IS_ERR(ldo4_en)) {
-		ret = PTR_ERR(ldo4_en);
-		if (ret != -ENOENT)
-			return ret;
-		ldo4_en = NULL;
-	}
+	ldo4_en = devm_fwnode_gpiod_get_optional(&pdev->dev,
+						 dev_fwnode(pdev->dev.parent),
+						 "rohm,vsel", GPIOD_ASIS,
+						 "ldo4-en");
+	if (IS_ERR(ldo4_en))
+		return PTR_ERR(ldo4_en);
 
 	/* Disable to go to ship-mode */
 	ret = regmap_update_bits(regmap, BD71815_REG_PWRCTRL, RESTARTEN, 0);

-- 
2.47.3

