Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6300F3B5F48;
	Thu, 11 Jun 2026 07:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781161854; cv=none; b=Df9AHcYnmV9nMHHXl6eBH/2WwQ9wul2R+f4gH8SzhRmUEEGY+b3+cOHkv6w07ODic64Ktkbl1vCoEDWU2EiPcqu1xe83KyZ4WZmFYXt2L1OGnKuDNsgkKEbw/tZiLvQX8wAf0jxCh5M6t2RqBAuSx1HXj+E9h9nqnqwiq8/wu8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781161854; c=relaxed/simple;
	bh=qhBBZEAVCALyM4DCU8LxY543S6inm7rJfcchpZ1VWHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RmJBvZFy7feeAcKyU5JiCoTAA4emFhuVRiUj9pIjnoTVhc/UAeJtZVNsB9LFx2YKHxf5tJJn2StBcqQzXRGAttN/nbOF64htFWB2F1Mo3nC/8cHQzdaT7XG5qKsTS4BYxJNK5a242XeEb5SAo9qsNnDBw5n7vzQj4h9om/y+MDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jtn4txwt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jtn4txwt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA2B5C2BCB8;
	Thu, 11 Jun 2026 07:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781161853;
	bh=qhBBZEAVCALyM4DCU8LxY543S6inm7rJfcchpZ1VWHI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Jtn4txwtcTCSSxH79Xj6iSRuqTYlC7MsakJrEbFokmjlRAH72MV/SFdEm+WfMecJL
	 vTJnmtHSsfXYtaYVJWh8ZXBQRKzFHAbSN3THqIqPLihbpaQXgv9fyZqiFVugYURHWT
	 HNqiweGh3NwL3Zkdmr8PSXA/SHkFPzvsK4OOXpu0G1kyX/lo/TjkUlbmMlIXbuAYBG
	 lVu943YjfLOVceIlxscZWbVdfkMKlAbQ2CtzJ6/ChcTasUfCUh4owMsLmycy+31HxI
	 7NIAeY2wHu02kdj2G7YwLhkngeuHBZtGmjIh+wCRE36EndB4gMUvioFh1Pk+jC252Y
	 A3GGzl133pRRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A6ECD98CC;
	Thu, 11 Jun 2026 07:10:53 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 11 Jun 2026 07:10:49 +0000
Subject: [PATCH] pinctrl: meson: amlogic-a4: use nolock get range
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-pinctrl-nolock-v1-1-aca022d4d60f@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAHhfKmoC/x3MQQqAIBBA0avIrBPUQKirRIvSsYZERSMC8e5Jy
 7f4v0LBTFhgZhUyPlQohg45MDDnFg7kZLtBCaWFlpInCubOnofoo7m4ctPonLJa4g49Shkdvf9
 wWVv7AMrLla1gAAAA
X-Change-ID: 20260611-pinctrl-nolock-2f93ff2d61eb
To: Linus Walleij <linusw@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781161852; l=2821;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=B12LCoxnKM4gE7bwAOpmRpB++boUOYzfC9tMY9iEY5k=;
 b=t04XysCtViNWE5rPnKdyRJ3YXjWnNiJOZGgub8aD7nHySJEuqplb+2E7cgiSO32Wx3UT4xMMm
 oWlwbKocpv+Cvz2IjZJxXbWHOX9T1G9tLO0PyK55FoVcIKmR3+Ka76b
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Use pinctrl_find_gpio_range_from_pin_nolock() instead of
pinctrl_find_gpio_range_from_pin() when configuring a pin or
setting a GPIO value.

This avoids taking the lock and allows the code to be safely
called from interrupt context.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Use pinctrl_find_gpio_range_from_pin_nolock 
when configuring a pin or setting a GPIO value.
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index 5ae0c19d007d..420f7915c010 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -300,7 +300,7 @@ static int aml_pmx_set_mux(struct pinctrl_dev *pctldev, unsigned int fselector,
 	int i;
 
 	for (i = 0; i < group->npins; i++) {
-		range =  pinctrl_find_gpio_range_from_pin(pctldev, group->pins[i]);
+		range =  pinctrl_find_gpio_range_from_pin_nolock(pctldev, group->pins[i]);
 		aml_pctl_set_function(info, range, group->pins[i], group->func[i]);
 	}
 
@@ -499,7 +499,7 @@ static int aml_pinconf_disable_bias(struct aml_pinctrl *info,
 				    unsigned int pin)
 {
 	struct pinctrl_gpio_range *range =
-			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
+			 pinctrl_find_gpio_range_from_pin_nolock(info->pctl, pin);
 	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
 	unsigned int reg, bit = 0;
 
@@ -512,7 +512,7 @@ static int aml_pinconf_enable_bias(struct aml_pinctrl *info, unsigned int pin,
 				   bool pull_up)
 {
 	struct pinctrl_gpio_range *range =
-			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
+			 pinctrl_find_gpio_range_from_pin_nolock(info->pctl, pin);
 	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
 	unsigned int reg, bit, val = 0;
 	int ret;
@@ -534,7 +534,7 @@ static int aml_pinconf_set_drive_strength(struct aml_pinctrl *info,
 					  u16 drive_strength_ua)
 {
 	struct pinctrl_gpio_range *range =
-			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
+			 pinctrl_find_gpio_range_from_pin_nolock(info->pctl, pin);
 	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
 	unsigned int reg, bit, ds_val;
 
@@ -569,7 +569,7 @@ static int aml_pinconf_set_gpio_bit(struct aml_pinctrl *info,
 				    bool arg)
 {
 	struct pinctrl_gpio_range *range =
-			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
+			 pinctrl_find_gpio_range_from_pin_nolock(info->pctl, pin);
 	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
 	unsigned int reg, bit;
 

---
base-commit: aca7f93a3eba55962d3448ed005f84daabe37c5f
change-id: 20260611-pinctrl-nolock-2f93ff2d61eb

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>


