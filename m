Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE5749A3CF
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 23:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686565; cv=none; b=s6Ku6L/ZUqoECCMqWNunnE92nXfFzG8PVlldR4ZajFQ7R9oEHJk8yO/NQAAQO6oE0tiur2EAuptwQLqbkz7/EZ5mapP+UpPbz1X2OeNZj6lUR6Rj1SLmr1w2gx/m2g26eSb2e6XdsmRwh33ZNxNijU7sQbQLWmHz25az99p+4Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686565; c=relaxed/simple;
	bh=bzi3qTltra6aIkH/Jy2yzrbQPmxGzlr79foFYbz7a8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BhS+Dfh/zTTZf1C4n7bTlPVbHWd09MTRFKtJhgVndhdrfyPvJU1XrGo5l08s6QQDE0aYzyKTXq25v4b/qDLZOSXNGDZYS5iBA0RgTp0hVHPR3bmIGEqE4vrDwx+IHvZKYWDu3Um24oYZi8TnMomoaLdiACdrp28gX96LNqyFwcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCDpPbhK; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCDpPbhK"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2dd77300816so226045ad.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 16:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789686558; x=1790291358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1U17Jog9ZY7djCaBaNRYmrySX0Lr3PE+x+SDEArIf+0=;
        b=KCDpPbhK2r/5qiHBZbPIar2PE7x77ZTdvl3oBru9tlh5ocTudJ4IbXksE29I4QQKW3
         YTkQkb/83bOSkjyRoqZHpxrex4vdzhnXY1c77CIRzIYgEZcKh3WRssocebvMCaVvinur
         lz8LQCmTL/kTkX7SLcW2PdISkNcnBe8fZcUC1NTwaHrBUThzz5s7EMejGgu0fb52o+Ew
         IItA8vd7om26zKylXE7LUt94dffbIDbwFnVqNZK0aSnZQfHakyFBvc+COVqoO7AQLEGB
         gsDhncBRtBkW6IpTGV7bJ8+TXJMzjx5taRtEqw5FmaWJE+ijKTU0pcc73t6mcPjZnd5U
         TNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789686558; x=1790291358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1U17Jog9ZY7djCaBaNRYmrySX0Lr3PE+x+SDEArIf+0=;
        b=O/2LcwlRDSQc/b3rt6g06dI3W/vTfHA5XENS3NncK9MFxQKDjF2LO3vDvRXB86JNkE
         D6F7D4mqgXyX/eqyHjBBb0Ewkj4Vh3J6DlGa9x2K47ZO+DxMNSgmY4EXbpUXf7OnwMZA
         BXG5nGejL+X1csD2RrJ+ZzC1ihIvY4wcHfYrJA9Rj7Lf1ySYt4VMF00I3spuygPtNK03
         Pc1zbAxmJPbqFemjOLZpmql96d8hXkTSA+/wga6UQd6xJvgc5Y8031S+GjWnDgl66Y05
         o7DoEmrjhX381s0r/2KKabxV3Ohr1gJS7mAzPyL+FMesELZXW1HV27aDUJ7UICgXv9Rm
         vREw==
X-Gm-Message-State: AFuF++kuNCSHfTAxHWXRfMciWOyxoJZNfo1Oytqm/M1tIspILCqMe/dX
	X98MQnpZjH2ypgGnBkEnR6F5G82bSdbsXuYUMLAyltbypIFvt6yDvj+dUQsbgA==
X-Gm-Gg: AYBFou0ji81jCmD/O9+d2QZD2fUOUb1yJvIc8ySchM/gRlYPzc65LozhyfCWVK3KNn2
	cDlocc2oBOuQAfr0ud01Un7J89GUeAMd33Ph+ziSwb06DYvyrrLRyZnwfLgyd8zirlH5/QMVCPt
	mV9somfZcNpEXtv2hz1WWJ7q9B7MwuD9idBbO18l0KgrIPshOteq4TDR23b0h0ndUfK6O5FbAFO
	nStqtwBMwhnVegcsIh7qxcl9VFKWnzpc5X5/icilxlDFmT2FgkxKIYWyAAQFzkSV8YvaR5JTHk5
	VJi6xYMjf34YEQJrSiNBEJinms1Ks+y5GYvG3ENjNPf07XJuYvKsIfLUnJqjMz9CVb7FN7TzBiw
	tIoQeYrmv0FHxVQ7BZCIJaU50kHtcQFR4GKxkaz+e2nlDqf+nr6m5jqNUrPBlLmyyvkJou18Ihs
	4gMEFUtzuMzqlaW68Vogn/edjwK6RFbZgh/sGogt2zpmk6O1pt7O7NJsxk3dTmRkjKYLoP3sQBT
	WTJxqLKIUGFjhTa/CwYJO5zL0N6iU3f6ZsHXI8AI3pJVXQpDEMuwI374zNxf1GXap1luxCQ0AFc
	nnuUI+xj7YQ+MFC4shvtQUN5r4oT835Yby33I/pwnF346MV5
X-Received: by 2002:a17:90b:3b8d:b0:395:8124:ac53 with SMTP id 98e67ed59e1d1-39e554cb74emr572733a91.6.1789686558386;
        Thu, 17 Sep 2026 16:09:18 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e36116920sm7294763a91.5.2026.09.17.16.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 16:09:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-rt-devel@lists.linux.dev (open list:Real-time Linux (PREEMPT_RT):Keyword:PREEMPT_RT)
Subject: [PATCHv2] gpio: mvebu: use raw spinlock for MMIO regmaps
Date: Thu, 17 Sep 2026 16:09:16 -0700
Message-ID: <20260917230916.118382-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mask/unmask handlers run with the generic irqchip's raw spinlock
held and call regmap_read()/regmap_write() on the GPIO regmaps. By
default regmap protects itself with a plain spinlock, which becomes a
sleeping rt_mutex on CONFIG_PREEMPT_RT; taking it while holding the raw
irqchip lock trips might_sleep(), and PROVE_RAW_LOCK_NESTING flags the
same nesting on non-RT builds.

Configure both GPIO regmaps with .use_raw_spinlock = true so the MMIO
accesses stay atomic in hardirq and raw-locked context.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 v2: remove inline comment
 drivers/gpio/gpio-mvebu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 267e6d5bacd0..92ce02441cc9 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -603,6 +603,7 @@ static const struct regmap_config mvebu_gpio_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
+	.use_raw_spinlock = true,
 };
 
 static const struct regmap_config mvebu_gpio_percpu_regmap_config = {
@@ -610,6 +611,7 @@ static const struct regmap_config mvebu_gpio_percpu_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
+	.use_raw_spinlock = true,
 };
 
 static const struct regmap_config mvebu_pwm_regmap_config = {
-- 
2.55.0

