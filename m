Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0FC45562A;
	Mon, 21 Sep 2026 12:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992816; cv=none; b=TfaeobPjvb+Wff96Q8nUfmV5KGvl1L2yM4dimuslWL8m2REAEGBwSEZRdFWvjXM1m3UrM29zEc2Nfd2qMPHZbaqARHxaX3b3o5scfM8qd69at8QCWEZzJyawwK2hdujJnSq8TZRRxVTFOk0d2k2L576XAeIa7CsHEM38Nu98wgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992816; c=relaxed/simple;
	bh=GuGwr/ANtgzj612qSKzhrgnI1VT0+mdLCMwsK6iwPXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eX00SL6sdLEUsDjLpp+pZEZZP844uECqS+Ux9fZZkfrEqhw8aOEE2KzbVwENRm36MVZsyA7WYJUd2LHpoNRZvyY9VlVJeaHU4DI8MuHGSQxBVCUbWgexHu/pMyvEcH5sivs+RG2B/9LBwDjJWxSmnB+yQxhtMfBcdhQTaBPEzcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVLiyci0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVLiyci0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 580F4C2BCB3;
	Mon, 21 Sep 2026 12:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789992815;
	bh=GuGwr/ANtgzj612qSKzhrgnI1VT0+mdLCMwsK6iwPXc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=NVLiyci0jC/AVn8R/iwqjsJCXdl2rx1YgW7BLy0uKklngsy3VwTEeO+G9nq7FvipF
	 NAWU4XWFn/220723i/A3qCKNVVwDiAGulkou5pYbJZiasRCIMfUW1+C607BOFMD70a
	 Rbf1/URpBE0OBRdugkD4JKjrb6ko9acEJ2QFkTfWq5QF1JfXonWE/04ca5LVpU762j
	 hIw3mtIMvmu3D20s3QWEqfPhWJ2ArUl3zYqLkTsqHjibELckYhAXRtyqYXiiK4yjA4
	 mTkjNpWEorz1LpZNhaxiMk3z/yZxh68q9EC/4s5+2/M8yYMAFHeQRlXCmI6yH+oQK6
	 SuTmQJ93Z5/9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346BFC982EE;
	Mon, 21 Sep 2026 12:13:35 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Mon, 21 Sep 2026 20:13:33 +0800
Subject: [PATCH] gpiolib: regmap: document gpio_regmap_get_chip()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-gpio-doc-followup-v1-1-618738124f4c@ambarella.com>
X-B4-Tracking: v=1; b=H4sIAGwfsWoC/yXMQQqDQAxA0atI1gY0heL0KqWLMUZNETPMaFsQ7
 95Rl2/x/wZJokqCR7FBlI8mtTmjLgvg0c+DoHbZQBXdK0c1DkENO2PsbZrsuwZsqHHM3t1a8pC
 7EKXX3/l8vi6ntX0LL8cI9v0P19YZnnUAAAA=
X-Change-ID: 20260921-gpio-doc-followup-8289cca93b2a
To: Michael Walle <mwalle@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789992813; l=1526;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=Y+L15bNZYFOa//sDZ7xQisO9fFHkBPK80aO8x+9P700=;
 b=6o98tZCvmhWBfOc2PDA4G7UaGMEcvfBdQp4oM4O2udMZUvTLl09SMB69+0SbdViydUZhy39m7
 HcTo7EYJFRTA+oRFa0N2seY7pHF8+UZQv3947OJjMiHiVGforSgNWIr
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

From: Long Zhao <longzhao@ambarella.com>

Add kernel-doc for the new helper and state that it is only for GPIO
controller drivers, not for GPIO consumers.

This is a follow-up to v8 09/18.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
Follow-up to v8 09/18:
https://lore.kernel.org/r/20260921-cv75-v5-v8-9-42de52d636a0@ambarella.com
Add kernel-doc for gpio_regmap_get_chip().
---
 drivers/gpio/gpio-regmap.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 21e0993b89e2..8ba7263729a8 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -295,6 +295,19 @@ void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio)
 }
 EXPORT_SYMBOL_GPL(gpio_regmap_get_drvdata);
 
+/**
+ * gpio_regmap_get_chip() - Return the gpio_chip of a gpio-regmap instance
+ * @gpio: Handle returned by gpio_regmap_register()
+ *
+ * GPIO controller drivers that register through gpio-regmap but still
+ * implement a custom irqchip can use this to obtain the associated
+ * gpio_chip after registration.
+ *
+ * This must not be used outside of GPIO controller driver context,
+ * for example not by GPIO consumers.
+ *
+ * Return: Pointer to the embedded struct gpio_chip.
+ */
 struct gpio_chip *gpio_regmap_get_chip(struct gpio_regmap *gpio)
 {
 	return &gpio->gpio_chip;

---
base-commit: 4b54e79ffe453959073b81638c3ac6c04177639e
change-id: 20260921-gpio-doc-followup-8289cca93b2a

Best regards,
--  
Long Zhao <longzhao@ambarella.com>


