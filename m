Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39094BEE39
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 18:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830521; cv=none; b=hrddYuZT11fPVKVaxelgWtTcHBY/ska88pttXGac3tIPGaZmLaeoI+sGFsqHF3O+j+Smr8DKbNhLMPjQ8IaNdvuS7zA0T5CE1qZP4BlsukBoF9sgBivnQcl52lC/0e3akX5WK/TyCYhUZ4uq8KTSemO6dywrMQKHN1nmOndAd/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830521; c=relaxed/simple;
	bh=+7IEebuXjPysbU/EOLi4stnxpBM6T6QymSauphGxL/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZ1laExXNjt1bKDNN9AhnpwVEsd7V9EhnzDuGSXilUtM+2NEudv0EoPqSnPgLY8YmV4RL4hLhOp4rR6iIhqcBtK3PNESXJcrzKOBPypVMT5i/zLmHw/qPtUL2xTnVxUrgl2ggsO/Bz0GinTuXCkQLAlZ7Hxwnue+5vkZK+UZwdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H97a1XtI; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H97a1XtI"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5d7daf06158so738440e0c.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 11:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791830518; x=1792435318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1AyANQsh/NuLrShgUzGL88ky2h7L2MDCXmZx5EOLv9g=;
        b=H97a1XtIYJt4/I/Tso7r9gDwDO9nIF5If321iSItCHG4Kbyl6Thj6YftYeHGNDWuQX
         bREYu0T99CuM31bxJkCnH2J7EijqNAqeJNoYzcFP1MVR+k9bmRK0YFJI23wCBD5vlpkA
         h4hM4XpoYreYSO1QyQ3FXF5EATywEArUF4ugC+a4b646YJALMcqwCWJDXsim4Je1UtBP
         XkOdPb8Oy3CzJsRTHy7Rhk/Ia09NFctgJEdNKXbGP3HP83Q4Hm45+MD08dsDUnp9iwY5
         0L5JWKFG1AySvgdGkVw4dO9/Gcc2a5qVxA7VKx+WfLWhEHtTbUolp/pQvnGXhvI7FRhQ
         G+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791830518; x=1792435318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1AyANQsh/NuLrShgUzGL88ky2h7L2MDCXmZx5EOLv9g=;
        b=gxT1m93gIoVC2YT6RqsC0Ys6CI+J6JoZCB5LxDJ3ibIx0GIi8yBT9OIGbtGgykQbTF
         ghdBmuvQhtSOuBb6Ke9nTagFpSxEe8CrLh5Qg17snUMoLenmzxdnb+JzV9S82gcto0id
         gZFZufN0WVSOYYyJx9rhaioMzUf5ysJtlbKOiUcw+gMInMQZ9cEJBS78pgp357v2OS0k
         bLQGAc0twkqUc3IQBp+ZSI7WmY7735Dv1WbwEPH6MpneThc4L9NO1xyvJtQ+iX1XZKUW
         vUx7I2eeNsEmCGKb6frnlmYzH59O/ynjpe5jrKhnBZgtv7NGEcT4LMRzL5zUlqfjRpYl
         5LCg==
X-Forwarded-Encrypted: i=1; AKwUvByd+TcttXx6dors29qdWSCPsWp5Zi2aT5BSy21oTAJQU5Lvm5VMUK44lzSpTP1dtz8kFgX0DWKS0ilk@vger.kernel.org
X-Gm-Message-State: AFq9FYLse4Huko51nuWpK2RygeY7z9rNE9gDUHycQ/j4k1sqBA5hdAoa
	cOKZjcvwaOa9BNX9naOTsM30wA82UpUQm4NgC3VV+vbpKMkomXnhBpjQrIHbRPTsV+Y=
X-Gm-Gg: AYBFou28YscvPw5yta96ti/fiMM0x7SB5EJy7AsuAWOcppp6JAnjvBM21McYBl6r8u8
	nWMxmUGMguzVV3uM6AaxNkA5nXRG+k3V7sgG5qH93W+SNNLpaVLhg1uvILn9i5N4vfahAlr9qik
	pLejivLQO/2jOYfOL/4ave2oIXog8dYsYgg/tNwGYUIR73xP6sVUQCiKkOjq1w35wDcg7tu7rPp
	u8rvuV2sI+kLR7Tg0MBASYqE3gr7jbqvHbZcdktZ0XWy+XKvme43L2Rq5g2xlgggK2Xj2Wtx16A
	sUmgF5p+7x2Ji8iPfMhpQi+xbcIS2SFCxDunW31cwMhGWLQxRZDbAg5uh3jMa9ut6XxwANOHS2Q
	OMk0jgy1aFZQ1KBYpmjt5T2nnQdNnRHcTZbClnjlviHLVcjA8jAT3iWwW6qwZqgB+ckBwUurDqV
	nQFSS750I0J87ft8x8kCn9M8ADYlv+NEeyWJYDQ+KMiTJJrc6BmStuGNDBhBprEjtwej3ZV1mVy
	fwQO/FX8Br8Wgg4zmc/mB7RIhIwxdFT6IGj+LFYw2mFjvHu1TC6lOykXXgwk3ftoxhb/2K1IIy7
	n4XM/LQiZBcup858uw==
X-Received: by 2002:a05:6102:26c2:b0:7a7:195a:1b2a with SMTP id ada2fe7eead31-7cb377f59d3mr2545886137.36.1791830518290;
        Mon, 12 Oct 2026 11:41:58 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003f230b8sm6830180241.8.2026.10.12.11.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:41:57 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linusw@kernel.org
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: sunxi: a733-r: use the A733 I/O voltage fields
Date: Mon, 12 Oct 2026 15:41:29 -0300
Message-ID: <20261012184130.548261-3-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A733 R-PIO shares the A523-R descriptor, and with it the A523
inverted one-bit encoding and the access to PIO_POW_MOD_CTL. Its
SGPIO_POW_MOD_SEL has two-bit fields instead, and the manual documents
no control register at offset 0x344. With PL in fixed 3.3 V mode, as
read on a Radxa Cubie A7Z (0x000aaaaa), running the old helper on the
host with a 3.3 V request for PL gives 0x000aaaab, which is fixed
1.8 V. This was not run on the board.

Give the A733-R its own descriptor with the PL and PM fields, and
leave the A523-R as it is.

Fixes: 31d68e10381c ("pinctrl: sunxi: a523-r: add a733-r compatible string")
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index cffc1e53eef1..1aa7f32035e1 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -30,11 +30,33 @@ static struct sunxi_pinctrl_desc a523_r_pinctrl_data = {
 	.pin_base = PL_BASE,
 };
 
+/*
+ * The A733 R-PIO has the A523 one's layout, but its SGPIO_POW_MOD_SEL uses
+ * two-bit fields, and the manual documents no control register at offset 0x344.
+ */
+static const u32 a733_r_io_bias_masks[SUNXI_PINCTRL_MAX_BANKS] = {
+	[0] = GENMASK(1, 0),	/* PL */
+	[1] = GENMASK(3, 2),	/* PM */
+};
+
+static struct sunxi_pinctrl_desc a733_r_pinctrl_data = {
+	.irq_banks = ARRAY_SIZE(a523_r_irq_bank_map),
+	.irq_bank_map = a523_r_irq_bank_map,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT,
+	.io_bias_masks = a733_r_io_bias_masks,
+	.pin_base = PL_BASE,
+};
+
 static int a523_r_pinctrl_probe(struct platform_device *pdev)
 {
+	struct sunxi_pinctrl_desc *desc = &a523_r_pinctrl_data;
+
+	if (of_device_is_compatible(pdev->dev.of_node,
+				    "allwinner,sun60i-a733-r-pinctrl"))
+		desc = &a733_r_pinctrl_data;
+
 	return sunxi_pinctrl_dt_table_init(pdev, a523_r_nr_bank_pins,
-					   a523_r_irq_bank_muxes,
-					   &a523_r_pinctrl_data,
+					   a523_r_irq_bank_muxes, desc,
 					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
 }
 
-- 
2.43.0

