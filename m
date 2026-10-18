Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E76388895
	for <linux-gpio@vger.kernel.org>; Sun, 18 Oct 2026 16:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339806; cv=none; b=NAL+dfadeQCDoy8D+1TaA0RM11KIw6/tfTf4VCWfvyGdQWHRkDfOlDtZQKURaXS0hc4Zqi6tq7pErNozM/3lSuKGk4V2lhXeVJ7uCVWgWe53OQw0k5q0HBVU5Tq1XQjb7ujUu02JojKbB5Wq2Nbif3vnauYyWBmZKxGDQHbevjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339806; c=relaxed/simple;
	bh=VQitwW8668axt1jlAMynhfzocbSvfmdtsxX5ALSir2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ouLC+Sls2xsE04jGCMHnG7tUhoHC03jDGQfTxyi1iQXPq3b2jotE0awIzx1w25+GS2vEX8noyPIa0dhTaG8hR8343NcSGg9hpOnqJ/iDMFcqEBdZwnHy1glLQTymx0O476HwndHhrAlUZNMwMthHZPVhUNdwpd9eIr0aHir8VOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1PVo9xn; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1PVo9xn"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so1593097a91.1
        for <linux-gpio@vger.kernel.org>; Sun, 18 Oct 2026 09:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792339804; x=1792944604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jRGX2ggnqWrM9pq9wLLTaVpGHvzzAa1T5Vqo2gzWucQ=;
        b=K1PVo9xn06aMOl37Uc+kPUxjdQafE81WvXpzeWNYyRQ6buJRAsxVRo/il6bF6n7771
         Ui6Ab84DwJpflwu+kSm3uYdaMMr4ZORlfsSKiYBaJhrx6FcAcMymiKxQNAVS1+cToVnt
         bVd6wLdMYtUqUOSgaUa2dmqeYVA3zPTUlHnaqMj9kmK/yttG+5Kd3ttr+IsRppAe4ybk
         wY4yNS8ioFxNxMAzMwFF0mS7mcyRIuKnVyVhilE/qnKv3RhSXlhwdEQBKb/ejZmtNuRj
         EpAmZelb5IIre1ztSY1AP2Ar6EsJ7QMFcWBXmIIU3eQGga3y34N4VGSiqj/bkb9vCQPa
         55gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792339804; x=1792944604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRGX2ggnqWrM9pq9wLLTaVpGHvzzAa1T5Vqo2gzWucQ=;
        b=debNIbbbadHGHIBblTSnHtsUj+NvDJ2hrKm4KIeo6QhLrLuUnZGfHXH5BQNDHsmeSV
         cNjBOhUek04Ea10xLL9jgT6//WwJBV7E4f7bMmTg/0IQQxuudCknf8fPXFVzU9osBeSe
         LtMOYQMpsWItn70HXmD+krWYWQ9H/KCFuoDvd9s3kckwOlyPBxxXjMRr4SPM8QG9oZwG
         5UoxYMVxaq+RoYFRB7+VktddOAPzANsawuu1+N3kANHE3oYoZgr2uG7Fu3YQCxBbc4SG
         2l2EwiXLqKlq3vLU4HQO4ihE2BxKAjAp3id1SBJyvHmPW+t9igsqTjwnUJZsnfO0Kly9
         v3vA==
X-Gm-Message-State: AFq9FYKBLCxUgwtw4RjultUuD1qtU4aG1EBX72AfmS4bYyQwb4h4qHGG
	mmVbZnpmv3Xx7pm8D+YWjLyKnzMDtyOvzi2REOw124g/VEdFVly4KNA7
X-Gm-Gg: AYBFou36PtwYX5xhYvqBhoUTTxt/hrldY5mJuDM7VR9pwTsvCbk5Y1uXOIBw0iMlqd6
	kVIH4kOATUYOoSef2iPenu3R3UZBQmfZxh6hXptzGArMs4gq7ibjIvz1H/1VZL9pYT2T5mpXJiq
	V19CGre02+9qLupIKtZU4AFH5iOPWenXBe+u4wBYgB2+cdPLuQKc9fG/B3HxNm+r4U2h2uqFlu1
	5mQkYLyNaZRFoRU0Z+rykb9zz/uzNk8ASN8vi/rZdANjDqWh49ls9JaRcqT3QpO7ZBl6wnl0Nzt
	bDXBDrsd6z883yH+YUBavBTqyGBAQZo6/3gGoFfg7+khbNKizATDs+DR0Hen0AnaNBgEEciB+Sp
	eKcepVMb+YBBFEi4fayZxcaoNDEWJ/lKctnFzC7c1vwz6ryaCtn+iXVCZ58d19dTMjw2HXc98/p
	3OS9rShVnm8FMMCOqAonaa4wdYgHQ7+1uJwqkodl7dnEGpw2jya9W/v5ZohAVCJVEudgb8hlZXH
	ofnbLEaAGyRjp9iv/sU+u6aQe+O2JGReGFxxI0NoRe7ruW5pA==
X-Received: by 2002:a17:90b:6cd:b0:3ac:a6a5:5757 with SMTP id 98e67ed59e1d1-3aceefbd2fbmr2879731a91.11.1792339804188;
        Sun, 18 Oct 2026 09:10:04 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([136.226.232.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc487e509sm12140533a91.9.2026.10.18.09.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:10:03 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulfh@kernel.org>
Subject: [PATCH] gpio: pca953x: Preserve wakeup accounting on parent IRQ failure
Date: Sun, 18 Oct 2026 21:40:42 +0530
Message-ID: <20261018161042.3298045-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pca953x_irq_set_wake() updates wakeup_path before asking the parent
IRQ controller to change its wake state. If irq_set_irq_wake() fails,
the IRQ core rolls back its wake state but the driver's counter remains
changed.

A failed enable can therefore leave the expander marked as part of the
wakeup path when no child IRQ has successfully enabled wakeup. A failed
disable can make the driver stop retaining power even though wakeup is
still enabled. The suspend and resume paths use this counter to decide
whether to disable or enable the regulator.

Update wakeup_path only after the parent operation succeeds, leaving it
unchanged on error.

Fixes: f70fbc15bae2 ("gpio: pca953x: Configure wake-up path when wake-up is enabled")
Cc: stable@vger.kernel.org
Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
Testing:
- Built the ARM64 kernel with the TI SDK, CONFIG_GPIO_PCA953X_IRQ=y,
  CONFIG_PM_SLEEP=y and CONFIG_SUSPEND=y, containing this fix alone.
- Signed the FIT through the existing development signing workflow.
  U-Boot verified the required signature and RAM-booted the kernel on
  AM642. Confirmed release 7.3.0-rc7-00012-g1b4d5b76f7e9 over SSH, both
  expected expanders bound to pca953x, and an untainted kernel.
- Ran the isolated exact-function harness on an AM642 CPU: seven checks,
  two failures before and none after. The same isolated checks passed
  host ASan and UBSan. This harness simulates kernel and hardware APIs.

The boot test covers boot and probe, not the wake failure path. Neither
expander has IRQs configured in this board's device tree, so the parent
wake failures were exercised only in the simulated harness. The board
was returned to its original signed kernel after the smoke test.

 drivers/gpio/gpio-pca953x.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index aac9ea7520b6..869ed4264d48 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -838,13 +838,18 @@ static int pca953x_irq_set_wake(struct irq_data *d, unsigned int on)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
+	int ret;
+
+	ret = irq_set_irq_wake(chip->client->irq, on);
+	if (ret)
+		return ret;
 
 	if (on)
 		atomic_inc(&chip->wakeup_path);
 	else
 		atomic_dec(&chip->wakeup_path);
 
-	return irq_set_irq_wake(chip->client->irq, on);
+	return 0;
 }
 
 static void pca953x_irq_bus_lock(struct irq_data *d)

base-commit: ac46dac1613a7c971e28e16d3a7a6ad4b1ae6c5a
-- 
2.43.0
