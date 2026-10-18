Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5A33EEAF9
	for <linux-gpio@vger.kernel.org>; Sun, 18 Oct 2026 16:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792342172; cv=none; b=EMN7e0H2TfXgkyBUW56cVJDM4HjWi09NyUMzVZIuYh8x0IleCMgl3y7vE0ovfGW/c9SzbLzuV9vi2KE2mBIjLz6JHfp1B8zRgzYFQOx9rvR+EKjulvk5+lhGUrNA0apjT7orQw1ciHIvWPbJl/5M7qo+Ps6E2VHfWA9llPSitLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792342172; c=relaxed/simple;
	bh=nigSKyk4TnxZ3aJHJc63V91xRtePvQ/VQifQk2tmR2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GCoSFR6tWzK0YJ6q45vhgKvYDqJtXdOMLEVyzNRkF319xmTKFOEP31hPjXt6yIilLPcsGwqpv2REnXVOC0pip2P0/ZmrOS2TXGLXsU7/cWHZI/BRKnNBRJeJxVVTaEC1E8bzBqKKPr5UXYelKu3080bqV4QZX7VVaMN13jaz34k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSW5eY+/; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSW5eY+/"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so127603a91.1
        for <linux-gpio@vger.kernel.org>; Sun, 18 Oct 2026 09:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792342166; x=1792946966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y5fE8Lslo5prpIPlzBnw8CBP8b/bdGGy/PtlPJV/98Y=;
        b=DSW5eY+//Jkyq55cFFPzHVMoSBIAIQv0tUxrgtXCM8c3eGs4uXmTRitsE9uG/RQ3/o
         YI5TEK07PMcNt0ZjAcachiW00Pb1YaQvaHCyqd6jJ66MYV8DlyG72OsF/JNZQwJZg1bH
         /WouFAMUi58nM6CcgMR3P8q6IHLEOflVPhan/EEAZ1/IxvXIs3cHDNniRiQUZP+qhf2e
         lt5usV2DYDp9zc6Pftkf4skeawHxY3SpFid4n2Cft3Cg1sGF9d0jwDPS4+wrXHMOC7gW
         Nq3mmiwPXLzc11VyLU0m5bIWQaRjPM0isvmifCtU8vEc9YjAPzI1MSL9QiRLbJOKMjA5
         A6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792342166; x=1792946966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5fE8Lslo5prpIPlzBnw8CBP8b/bdGGy/PtlPJV/98Y=;
        b=p7CGOeNCWzeuoBCfIrIg/GRFyMwk0UUx6FaM6PWPNzNrQbvV6wLs5czf0Vsi4mdF3b
         Qd1Zn8hhv7JildOGWrm/4tmhCUrM0xupMe9/2DtkmVW4D8JZ2+q+MYdOQ8FO+ktvlHsW
         RR1Lm3nE/keZYfcUOOrkgyFU9O/ETbN9BsGCQzGUNEpRLXY9YdHwx095pLaRQCYGhprX
         Jsh93ywUHUPw9Hgn8Nwisb/OQ9+t4rhQ0F381pJqvo6lrXpKNLtNfG37cQ+nu6w/kjaj
         88pM5KbyphhIY8+dujwDu2nMPv6rhZ1fN6FkoEqL2FjDytMBoCK5gfP/fAeuRU1EKL0x
         NXsw==
X-Gm-Message-State: AFq9FYK9MzxwiZF21rvZdc4VxzroGp6pxs6r6I/8fad56BPe5al3uUB4
	8njyb43flvTz8osqaCRH4MSwVxL2uolXB8e25uMEyrWyZzTxSWtlTDMhZi1hhc9y
X-Gm-Gg: AYBFou3cW3vRMHfkfYnplW5Qotjqkwe71+fNGcEjm+uoLgIlAy+Xu4tAO7emOPKltap
	nyRWq+IrNYPVIW/qp72O41z3rxyKmt22M5oEapPVX7G0qnEP59BpUvY0B4xfSI9RcyXlXRTYU2s
	aIkMsV8rmOuw3u/vU+r9pEUEWNnXkvFFYLbLLLTC2e2FV3yK8L13O6Kd588gGU+tb7Bp+idMPrI
	jdCRUrYio7n3VPAKMWvo7Aez4OTliqYfizvd5bnNvQFSJrcFdrErviT7CAlzF/dPLv+O/wgHI/E
	bpvotuDqfGC2gc1LNuoMdUIHGnGAI/F0DbyOv/zsx7ji1dzl8KAO2zND83u7GEc9DF/V3tlUv/Q
	SGuYnTZvmckjdr4dVDOTXP+mmdP1hTqyJ98XisgGWCBwsY6uVqIDXMTlFtTqXI1tpUkyMKbYUYt
	pULfTV1PgaJiD84aTmIGo6XLuR6geDSzrbd0Bi2ALT4jpnEj/59FLgws4uItXlyr3icMhFIDaBx
	SqUsPZAWMnLNoi5rm+Z8Xl0UBq9Bq75oZinchc=
X-Received: by 2002:a17:90b:5743:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3acef13e5c1mr4453029a91.31.1792342165209;
        Sun, 18 Oct 2026 09:49:25 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([136.226.232.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad335ca338sm744527a91.10.2026.10.18.09.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:49:24 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH] gpio: pca953x: Handle direction register read errors in IRQ paths
Date: Sun, 18 Oct 2026 22:20:03 +0530
Message-ID: <20261018165003.3372368-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three IRQ paths ignore the result of reading the direction registers
and then use the destination bitmap. pca953x_read_regs() does not populate
that bitmap when regmap_bulk_read() fails, leaving the callers to use
uninitialized stack data.

This can select incorrect GPIOs for direction changes during IRQ bus
synchronization, corrupt the saved input state during IRQ setup, or
produce incorrect pending interrupt decisions.

Check the read result at all three sites. Release irq_lock without
changing GPIO directions on failure, leave the IRQ history untouched
when pending detection fails, and propagate the error from IRQ setup.
The read helper already logs the error.

Fixes: 0f25fda840a9 ("gpio: pca953x: Zap ad-hoc reg_direction cache")
Cc: stable@vger.kernel.org
Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
Testing:
- Built an ARM64 kernel with CONFIG_GPIO_PCA953X_IRQ=y,
  CONFIG_PM_SLEEP=y and CONFIG_SUSPEND=y, containing this fix alone.
- Booted it on AM642 and confirmed both expected expanders bound to
  pca953x, with an untainted kernel.
- Ran the isolated exact-function harness on an AM642 CPU: 22 checks,
  three failures before and none after. The same isolated checks passed
  host ASan and UBSan. This harness simulates kernel and hardware APIs.

The hardware test covers boot and probe, not the IRQ error paths.
Neither expander has IRQs configured in this board's device tree, so
direction-register read failures were exercised only in the harness.

 drivers/gpio/gpio-pca953x.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index aac9ea7520b6..b6f0849d3bdf 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -862,6 +862,7 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	DECLARE_BITMAP(irq_mask, MAX_LINE);
 	DECLARE_BITMAP(reg_direction, MAX_LINE);
 	int level;
+	int ret;
 
 	guard(mutex)(&chip->i2c_lock);
 
@@ -880,7 +881,9 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	}
 
 	/* Switch direction to input if needed */
-	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
+	ret = pca953x_read_regs(chip, chip->regs->direction, reg_direction);
+	if (ret)
+		goto out;
 
 	bitmap_or(irq_mask, chip->irq_trig_fall, chip->irq_trig_raise, gc->ngpio);
 	bitmap_or(irq_mask, irq_mask, chip->irq_trig_level_high, gc->ngpio);
@@ -890,6 +893,7 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	for_each_andnot_bit(level, irq_mask, reg_direction, gc->ngpio)
 		pca953x_gpio_direction_input_unlocked(&chip->gpio_chip, level);
 
+out:
 	mutex_unlock(&chip->irq_lock);
 }
 
@@ -984,7 +988,9 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
 	}
 
 	/* Remove output pins from the equation */
-	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
+	ret = pca953x_read_regs(chip, chip->regs->direction, reg_direction);
+	if (ret)
+		return false;
 
 	bitmap_copy(old_stat, chip->irq_stat, gc->ngpio);
 
@@ -1084,7 +1090,9 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
 	 * interrupt.  We have to rely on the previous read for
 	 * this purpose.
 	 */
-	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
+	ret = pca953x_read_regs(chip, chip->regs->direction, reg_direction);
+	if (ret)
+		return ret;
 	bitmap_and(chip->irq_stat, irq_stat, reg_direction, gc->ngpio);
 	mutex_init(&chip->irq_lock);
 

base-commit: ac46dac1613a7c971e28e16d3a7a6ad4b1ae6c5a
-- 
2.43.0
