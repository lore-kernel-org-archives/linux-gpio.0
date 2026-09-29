Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1392E8DEB
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 02:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790648766; cv=none; b=nmck/ODVtn+h3zWNiBceYaSSyU8Gq5rNhb7K303J7eJDAh3l4V9UZQwke11a2FO3kOrqzU2rTu9SHEY4MBDZ6vGnVvs08KdoysOVJyeD6JCibdGMT2YqNB2NwR51Ragnw1a+H8zOmrUyUsGG2pepUcG9hctgXNf0PKWgRbjXfT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790648766; c=relaxed/simple;
	bh=RGiJFRN6CzF76TeIenyTuivjmSYoV3fBSmXB6ndMUys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gpGCrsPamNVkgQ56wryI2wTpgfjwktf1/hLOBRhGyVCQdKHRuAAzftlHUkER9oVJaSVqnmSECrRDeKNMHxw5XlMUAY+zLgipW+CmqoQV6JedV5LcUy4qcTCA66uc6Awu+i8EDJLumNqBGkZKfbgSR1MgjcwhccgezbLk03jqxQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+iAp1do; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+iAp1do"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78dd412cfso1334342a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 19:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790648765; x=1791253565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLsU5PROWNjlhFWPCkRAR9UTl0+TaevSxI9W1D+sgh0=;
        b=G+iAp1domIGFLQ8BKHfppyahvre11JN+guuH2iGN4H42aJumvvSYwzZEbxS5DHSARt
         j+M4/Xx5Ahp/1vTkLUY9sdggV6ikUE/qkIg41lNTyMB5SYxm0bJ/RTXcpT5kCC1hOdzd
         kkaeYZvbAZfYIH7KlExU5/YqVQzNasvUyfWOd3m5VKYa+L78Yl8ulH3yTGA1x7tYeRxC
         Hu3H1mg47+ah00cbyAc0z+EsquBsIEMdIMr/TiYua3OzMB+IdhU7OfpUrZJkWB1+Fhfy
         vafoOIueZ2XYHy9eY3qQjH1cvz/XzHMBnosPdWQP6aBWUhAT35HgR6NbmOdXHP85JnGU
         EWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790648765; x=1791253565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLsU5PROWNjlhFWPCkRAR9UTl0+TaevSxI9W1D+sgh0=;
        b=nzP79HZi4jonnS6NPO3Hx+QR2/lC0Qar0seIiFI/kGx5qH1oaHUjL3zxlRNsqxztMo
         HqoZyH64NRupHQaqKsWOF7WSwt9Q+gl55OrgwLBwfrVqsHjX2WzCHdMGWaoUR7DxOIL3
         gVRI6LzBLm8ZOLhKdg1XF3Tg949mUHZ0IcwyZtTe6FQd5RMfRuW7R4pBLsPUC/3g4q5r
         BuvQmdrc2Ug+ZA2n6pSuSvvnIs2elgvGIJeu7Xn9Xc249in8is3Z7qeuOsGir6ukTZaK
         3BCyHP6cLXluTVVfyNjjHhMKNOiQkiRWFQkap7bpuy/tzCAnzznfo4+7cjY5e/7jQZBY
         PH8A==
X-Gm-Message-State: AFq9FYLQ2qoZ3e4mka6fnIL2eo84rfhpVhU0oQcBru/mrTxIqPcFSlbS
	WsOXEPWB4sysLNdMPGA3XuNRp3iZ2fRiDLSeMyunVzq81NspkrwhexoGFSu9RP0t
X-Gm-Gg: AYBFou2NfoI1izPJILF2eZfrT897XYYDfeTiNpJ7miTsVLEmTLB3sGTDX8vrXTFiJEe
	1lecWhDmFQwZ+6NAdHNIHWalKV0IwRc49IeHJOBEg5WsWkvS8hBViyZcWbaHv7KBycSpRiRRkku
	vunw0fT8hsidtplLcBPQVICbZpxF09J+JYr+aw7PKWVgqxrCt5CDAAexvdQVYPj+2KCCPepcvCG
	QVeNuFz8+JotSqqgf+ogpKkXH6FTyxSzukLmZ3FVpGMtB8VGqfa7wT3lTiXVDO8xqKQcUOWExmS
	cajyVCpGd46Bj7MwAohCjqJEIU7ZglTmSvvCfdz9R3D5IA4V/yZwoApOKWQ+16Yxuskn35Yy+9S
	BhjcF9E3rFFLzq0I4HmXcoj8dN1EqA2Suf3hmI2KPh2SuMlsV1m1EGJj0iTcyL7HMN/J3p1Ozut
	m3NLpThOovLSiaeqMXwYRf+Au+UI5HZ+nIUQDySfMK6K8r6K/krHdZY5CZWfMKjkMwqQNKMfI+0
	C3KsG2/2vndYJ7IviT7DeMgXzdHr6pS6wDq5ngAozkYkM5fGkec67HU3tSU8KCiTJ+LK0sasDmw
	QLciupiNU4F2V0dSiHW0HHIcxU2mqWvB9xoQ/miHLCVVVBUX
X-Received: by 2002:a17:90b:3c92:b0:3a4:7c19:6a0c with SMTP id 98e67ed59e1d1-3a47c196e00mr1691744a91.31.1790648764669;
        Mon, 28 Sep 2026 19:26:04 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985fd248sm2324879a91.7.2026.09.28.19.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:26:04 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] gpio: mvebu: convert to noirq suspend/resume to prevent interrupt storm on resume
Date: Mon, 28 Sep 2026 19:26:02 -0700
Message-ID: <20260929022602.23306-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver uses the legacy .suspend/.resume callbacks, but sets
IRQCHIP_MASK_ON_SUSPEND on the irq_chip. During resume, the PM core
runs dpm_resume_noirq() first, which calls irq_pm_resume() to unmask
interrupts, and only then runs dpm_resume() which invokes the driver's
.resume callback to restore GPIO registers (GPIO_IN_POL, GPIO_IO_CONF,
mask registers).

This ordering means interrupts are unmasked while the hardware is still
in its reset state, potentially with incorrect polarities, causing
spurious level-triggered interrupts before local IRQs are re-enabled.

Convert the driver from legacy .suspend/.resume callbacks to noirq
callbacks via dev_pm_ops. The noirq phase runs before resume_device_irqs()
on resume and after suspend_device_irqs() on suspend, ensuring GPIO
registers are restored before interrupts are unmasked.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: use NOIRQ_SYSTEM_SLEEP_PM_OPS instead.
 v2: add __maybe_unused to fix compilation
 drivers/gpio/gpio-mvebu.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 267e6d5bacd0..27894acf8d34 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -994,9 +994,9 @@ static const struct of_device_id mvebu_gpio_of_match[] = {
 	},
 };
 
-static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
+static int mvebu_gpio_suspend(struct device *dev)
 {
-	struct mvebu_gpio_chip *mvchip = platform_get_drvdata(pdev);
+	struct mvebu_gpio_chip *mvchip = dev_get_drvdata(dev);
 	int i;
 
 	regmap_read(mvchip->regs, GPIO_OUT_OFF + mvchip->offset,
@@ -1046,9 +1046,9 @@ static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
 	return 0;
 }
 
-static int mvebu_gpio_resume(struct platform_device *pdev)
+static int mvebu_gpio_resume(struct device *dev)
 {
-	struct mvebu_gpio_chip *mvchip = platform_get_drvdata(pdev);
+	struct mvebu_gpio_chip *mvchip = dev_get_drvdata(dev);
 	u32 edge_cache = ~0U, level_cache = ~0U;
 	unsigned long flags;
 	int i;
@@ -1369,13 +1369,16 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct dev_pm_ops mvebu_gpio_pm_ops = {
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(mvebu_gpio_suspend, mvebu_gpio_resume)
+};
+
 static struct platform_driver mvebu_gpio_driver = {
 	.driver		= {
 		.name		= "mvebu-gpio",
 		.of_match_table = mvebu_gpio_of_match,
+		.pm		= pm_sleep_ptr(&mvebu_gpio_pm_ops),
 	},
 	.probe		= mvebu_gpio_probe,
-	.suspend        = mvebu_gpio_suspend,
-	.resume         = mvebu_gpio_resume,
 };
 builtin_platform_driver(mvebu_gpio_driver);
-- 
2.55.0

