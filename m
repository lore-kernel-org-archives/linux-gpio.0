Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D9D47DFB6
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 17:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170799; cv=none; b=nWybohBANc1MBmtfnHMoB1uOs/Xj0rdGYHSKY/SHdlSV5z7D+jACkB3+j/JjzizzVHvN9zOs069yOv94vHBSoE8KgJjc3dvMXg2v8yRcXIBGl60ughR/gIZpfuMMTugvZlTHpsH7IPqYZjie1dO4wbC6djJ+yy0NCjXWWQlnvQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170799; c=relaxed/simple;
	bh=Ffhw03pJWZx5YwKKOVgIbjsNqNJp5ei5sLxrIsdHJxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n/KnyVnYZT5P/MURiLqWR3qnUI0iY4+++R6b00VEcc2+nfgGzzNRfGpK9m7OjwBcGqJNR86bGyKd/CNRZwbs1sflQHXnq+RGCFZmn4wSzbIk50er6oGFYHWFykAXsOjrjiOVjjnWtLAr98Qt26ab46Jd/pHz4HPNaNZE3zABnrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UadHpK2h; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UadHpK2h"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 479EEC62202;
	Fri, 16 Oct 2026 17:14:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3E4236075D;
	Fri, 16 Oct 2026 17:13:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AABA210328720;
	Fri, 16 Oct 2026 19:13:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792170789; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=uap++IOivfHtiIyyanxsxKboS9+X0hlx5/e8EmjNQg0=;
	b=UadHpK2h1pRpY1TxLTbHTvGK09DxWESVNe7ES/pTTJcdEg+97YCDtV9bdJ25VnRIzYaLO4
	YHF8EyR60LHSOdWU70pMlYE4taEBik7rqYsZbeGtpGxAX1HWjyGAQNM3yfwfbGy58IVR29
	0Q6xz6eiVRHJLEUhOpXbtucB3z3iownaKGYoGjDV5y+9iVCsZBDDEFSFQM/pAAJfjNlaEn
	dZ+7PE7M9vLKyiXPcoMp9yIjUjF+sRwT3QpR9gCi82jHhzBE1lJHZbh2gH/EWvGYdPG2ZZ
	FXBwcqEDkQYJdIRd1PPfiPpJcYrcXPoAuLAl0Ny6PTyeVDJuRl895KssXHnanQ==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Fri, 16 Oct 2026 19:13:03 +0200
Subject: [PATCH] gpio: cgbc: Add init_valid_mask() operation
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-cgbc-gpio-valid-mask-v1-1-938202276e26@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAyA4VchPdtkQ1mIr2I8lK7MogJZlZgQ3
 t2Jx+/w/yuYZBWDc7VClkVNp7HAHyrgG41JUGMx1K4O3vmAnDrGNOuECz004pPsjuRaPoYmOjr
 1UNI5S6+ffXu5/m3vbhB+/V6wbV8z8fJbeAAAAA==
X-Change-ID: 20261016-cgbc-gpio-valid-mask-a08c365d0a4f
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Some pins can be reconfigured from the BIOS as alternate functions,
which makes the corresponding GPIO lines unusable. Add the
init_valid_mask() operation to mark as valid only the GPIOs which are
usable.

Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-cgbc.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpio/gpio-cgbc.c b/drivers/gpio/gpio-cgbc.c
index 84b5ed3c6e22..1b603d8eccda 100644
--- a/drivers/gpio/gpio-cgbc.c
+++ b/drivers/gpio/gpio-cgbc.c
@@ -18,6 +18,7 @@
 #define CGBC_GPIO_CMD_SET	0x65
 #define CGBC_GPIO_CMD_DIR_GET	0x66
 #define CGBC_GPIO_CMD_DIR_SET	0x67
+#define CGBC_GPIO_CMD_ENA_RD	0x84
 
 struct cgbc_gpio_data {
 	struct gpio_chip	chip;
@@ -146,6 +147,30 @@ static int cgbc_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 		return GPIO_LINE_DIRECTION_IN;
 }
 
+static int cgbc_gpio_init_valid_mask(struct gpio_chip *chip,
+				     unsigned long *valid_mask,
+				     unsigned int ngpios)
+{
+	struct cgbc_gpio_data *gpio = gpiochip_get_data(chip);
+	struct cgbc_device_data *cgbc = gpio->cgbc;
+	int ret;
+	u8 val;
+
+	ret = cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_ENA_RD, 0, 0, &val);
+	if (ret)
+		return ret;
+
+	*valid_mask = val;
+
+	ret = cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_ENA_RD, 1, 0, &val);
+	if (ret)
+		return ret;
+
+	*valid_mask |= (val << 8);
+
+	return 0;
+}
+
 static int cgbc_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -172,6 +197,7 @@ static int cgbc_gpio_probe(struct platform_device *pdev)
 	chip->get_direction = cgbc_gpio_get_direction;
 	chip->get = cgbc_gpio_get;
 	chip->set = cgbc_gpio_set;
+	chip->init_valid_mask = cgbc_gpio_init_valid_mask;
 	chip->ngpio = CGBC_GPIO_NGPIO;
 
 	ret = devm_mutex_init(dev, &gpio->lock);

---
base-commit: 7b47e2aec8d31ded7b996b7676d4d01d5e71736d
change-id: 20261016-cgbc-gpio-valid-mask-a08c365d0a4f

Best regards,
--  
Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

