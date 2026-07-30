Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4952E3C343C;
	Thu, 30 Jul 2026 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785406197; cv=none; b=jFq6NIwKSZ1R+QQCPO47STZtK4DoJJ7Ulj74oYylwR9Mm9p/60lzcLs74gaDl30YS+EIU6cOzX6MYRdoapnWomq9GM6L3ylzO/SjDywJj9lauWUuFG+fV2jqw8Vp+qrMg3AIFqw79F5YZ6Cc0gopIBQAeAlExLJRker6Sch29CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785406197; c=relaxed/simple;
	bh=t4jN5WDxBUnYILBi/TUtcunD2+40jxQnux/VuTVXIiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YE5wbyZoCb+lkYHkwnAha/JONjXUYLmomK7xJkuduYXFdbjW9Y4xSF7iY9ycLc+UHNmDVg7YjsrsSDpCAKZYUKyBI4ZxT5BhcICNsV4E/V7/hFl6LN747B6Iyr5KWS5ugQ2cRLToJSCUP2t1MtDd/R0FZkxlewHBd8KJIgFfT1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVA+POSH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVA+POSH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5E1D1F000E9;
	Thu, 30 Jul 2026 10:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785406196;
	bh=hHXOv04DuMhM+9hs8qoLTNRU6S66RipG6LbigyuoqQI=;
	h=From:To:Cc:Subject:Date;
	b=mVA+POSHxQAZLN+oAZWAVt9cmwnWFvtoz1E1rRBi6l/LsKDcpaSIM13dY1xwRPS6f
	 wjuBRIviuLuhLECvrSOXsYVOAT226CczOgVnCBzYY55/oD75ugofZ226zNKdPAgjCq
	 g+EaPGsXzlrCsMxHAfvEIwPC3hBpxECMuPuDIFKyKbbBO0dsXk79yKGAuZKuVtQUr9
	 Ks/ydUVHrCTvUvLU2jRxRqpyWIejaUfyuVlGbjlXLX9/kF4JctAUd3CrFBCPFUOZyA
	 2rhyWdTfqqB6tbcW6GmkFTnZMkdk8hxE4A7aK2DvBt+CnqnOeggU2A29UEtGviLlXh
	 8QbsryWpEFFhQ==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: RAGUENES Jean Noel <jean-noel.raguenes2@cs-soprasteria.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] soc: fsl: qe: implement get_direction()
Date: Thu, 30 Jul 2026 12:09:40 +0200
Message-ID: <30b3f278a10b46252783458c81dc438df176f86c.1785405882.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1728; i=chleroy@kernel.org; h=from:subject:message-id; bh=t4jN5WDxBUnYILBi/TUtcunD2+40jxQnux/VuTVXIiY=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWRlK706cLh8n9izg9viW/Os8+8qGp2/ev/Rc4VTLE3rH MNOhiTN7ihlYRDjYpAVU2Q5/p9714yuL6n5U3fpw8xhZQIZwsDFKQATadRjZNh0aoo5z6fjy6/s 5ioK69db+M44VkaeP/Jx2797pzc9zbJjZOh9a2O+cPnF21qaahNOzHq062mPctv1RT5OPH+zDxy 6OpkJAA==
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit

The lack of get_direction() callback in this driver causes GPIOLIB to
emit a warning. Implement it.

Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::get_direction()")
Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 drivers/soc/fsl/qe/gpio.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 66828f2a3577..6d8f4d549fe2 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -135,6 +135,30 @@ static int qe_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }
 
+static int qe_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
+	struct qe_pio_regs __iomem *regs = qe_gc->regs;
+	unsigned long flags;
+	u32 val, mask;
+
+	spin_lock_irqsave(&qe_gc->lock, flags);
+
+	if (gpio < QE_PIO_PINS / 2)
+		val = ioread32be(&regs->cpdir1);
+	else
+		val = ioread32be(&regs->cpdir2);
+
+	spin_unlock_irqrestore(&qe_gc->lock, flags);
+
+	mask = (u32)QE_PIO_DIR_OUT << (QE_PIO_PINS - 2 - (gpio % (QE_PIO_PINS / 2)) * 2);
+
+	if (val & mask)
+		return GPIO_LINE_DIRECTION_OUT;
+	else
+		return GPIO_LINE_DIRECTION_IN;
+}
+
 struct qe_pin {
 	/*
 	 * The qe_gpio_chip name is unfortunate, we should change that to
@@ -308,6 +332,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 	gc->ngpio = QE_PIO_PINS;
 	gc->direction_input = qe_gpio_dir_in;
 	gc->direction_output = qe_gpio_dir_out;
+	gc->get_direction = qe_gpio_get_direction;
 	gc->get = qe_gpio_get;
 	gc->set = qe_gpio_set;
 	gc->set_multiple = qe_gpio_set_multiple;
-- 
2.54.0

