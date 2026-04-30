Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5454139B4A0
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 09:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541675; cv=none; b=Fxqel8DxuC8aQkVdB9FzLTe+U+2gN+SZyV3KCgTKRybWtUW3Fc7KQGMfreda7oVPh8yKgE67pBVTbAMZWRDfJZGWOy+g097VGKKwNH1vha7MTgOKKcwaY+lA6y36fAnyPHf5x8cVRqPKDPKVngnxHzvudX4SJ5lLU6gZRUk+GVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541675; c=relaxed/simple;
	bh=pT4vlRF+WTam/ZKzQMnbpk8803cXtcadIPthrcyiQug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=naFPL1uJq9vgncOmK4hCQZ9HiL4GoM/9FjyEfC9ETvoXIm/GiDFNkQJ04dzjxmxgKPoVaiwu01Aexi5/tfi9Or3VRG9eHUMS7PxlzX7dDag4w94tSheUALDmUOxcsgCppGn1smTImSN6/A2TDIo/4meClYpm3UzynfTErIFXyaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUZlAghV; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUZlAghV"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4486b5fcf3cso635660f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 02:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777541672; x=1778146472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/8sLHc9W5tl1EvtfSg0BszVcVjlDsk9IiIlQDWOyFU=;
        b=mUZlAghVi7jtwP77dbSHVcC4Hte47yLkAJbssNX0zSwrU5I7wVgEpZai5CTC0n1FjS
         yjfGbzESDwnewdhns1GNU1O3GAs7nYoNinlR0KwA2cyNMzBjqCexXib4XqZWiYB7hG4/
         Qj3A5eBAhRPT1qwksd/guAFV111h9zEi0fT0BxKi1sgsbM4cz2NxaZXA2VBGxyP7QMrG
         8ozTpbcMjJTjwE/BzaHvBzmQ7GlNMd7Az4B8cFrrucdchblP+9WwoaynbBBslKjYaJB0
         6hFT3e76Kj+wEHuHwEosESkk/1nLPgtpTh14Q5v0D7C9n0gMIHxRUFXn1SplEOLdaGQz
         rcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777541672; x=1778146472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p/8sLHc9W5tl1EvtfSg0BszVcVjlDsk9IiIlQDWOyFU=;
        b=Phz57dWswE21GiLVNQiZRUs6MN7pgStkU45Wrh3DzmX280pa+Qn4VNDjCUgJMaUaab
         7vD5FNpNG/w31gi+CSs4vWIIcyMZDLAFi9UdPAioTbrCs7vsR1ZsmVfTWkztUJ3m6qz9
         27KXP9NRFM/xEoNGQk+WPdJB3f2wxYR7ZzcOCv9PJ5Z4zDM86QVc3G2LnX35RC0reuH6
         9BB/PXlmzhESOke7x7dqfrjwi50/VLdOeCPLCbKw764n//NA69JjAiAXBTay9sdDTa+X
         hTQEquLrtZA1ZSqQ7/v3fg3YnoWrESG3iScogXOP6ke0cwDaZwFExKf/gscXInYnavTw
         rsvw==
X-Forwarded-Encrypted: i=1; AFNElJ/+FHbX/n/tJkXgERKN7Pwoay0DGzUloPMPBMtdYBJI8rVt17ML+oIEU22mdRX4n0IKTaOUQ7lw3R9G@vger.kernel.org
X-Gm-Message-State: AOJu0YyY2uRFR2t8TyMCw9X5AD3AtdWVukUr0ZHbn/aRANBimKeJXAL2
	F6MO1yVBGofmLaA6VRsgy+onZldgI60CmFGwtwSwSV8crycerye2Fd8f
X-Gm-Gg: AeBDiesWgpGZtNMtmIXoMnDjbevOWVwCfsgwccjqG01XTvolvzNo+SJJtAfhafC1qBo
	eIDn6RSISfZSAzM604GC3wBnItD5oHFg8xKxLDzIi22hpv6xENddfM1EaAZ8rYSnTCQ+LtqwTx3
	5iHaX5RnVa7X9z7tFEaNagkSVwD79t918b6KTonIwgTB1DQ5z7B3CTAobuyFMmDxD4n8Bc9Hf5I
	oXwCniEFlt/RosEEQ+JVo14URsQrsAhGmODptbt7zVCMqFx74ns9e/z2YsxQh2sAtfF6P2IGtQT
	lgZaWIbDwQp85sZlK+kC1vcW56pDdu/igmry2GC5trvhJM6nwd2UwYOXlNDaY1O8nohqM9oRocR
	+MpLSRv6jHFlEQpfyWI31gpU3bDptTqYF0gTfNquQAWPAjz7w09EA1I663buW+EqlUt0aW7ROXT
	7bAnVGHCrc3gGEGMXr4wAYz768wqeW599ZzM7hlP6w10k2nT8EaMpRb/P0
X-Received: by 2002:a5d:5f47:0:b0:43c:f1a5:56f6 with SMTP id ffacd0b85a97d-449401ba950mr3616456f8f.43.1777541671742;
        Thu, 30 Apr 2026 02:34:31 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5c22sm11953913f8f.28.2026.04.30.02.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:34:31 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 6/7] pinctrl: renesas: rzg2l: Simplify rzg2l_pinctrl_set_mux()
Date: Thu, 30 Apr 2026 10:34:11 +0100
Message-ID: <20260430093422.74812-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430093422.74812-1-biju.das.jz@bp.renesas.com>
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The port and function selectors are evaluated multiple times
in rzg2l_pinctrl_set_mux(). Simplify the function by dropping
dupicate evaluation storing them in local variables.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
 * Updated the data type of func varaible from u8 to unsigned int.
 * Collected the tag.
v3:
 * New patch.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 004096d5d1d1..eff5fc081ec8 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -687,16 +687,18 @@ static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 	for (i = 0; i < group->grp.npins; i++) {
 		u64 *pin_data = pctrl->desc.pins[pins[i]].drv_data;
 		u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
+		u32 port = RZG2L_PIN_ID_TO_PORT(pins[i]);
 		u32 pin = RZG2L_PIN_ID_TO_PIN(pins[i]);
+		unsigned int func;
 
-		ret = rzg2l_validate_pin(pctrl, *pin_data, RZG2L_PIN_ID_TO_PORT(pins[i]), pin);
+		ret = rzg2l_validate_pin(pctrl, *pin_data, port, pin);
 		if (ret)
 			return ret;
 
-		dev_dbg(pctrl->dev, "port:%u pin: %u off:%x PSEL:%u\n",
-			RZG2L_PIN_ID_TO_PORT(pins[i]), pin, off, psel_val[i] - hwcfg->func_base);
+		func = psel_val[i] - hwcfg->func_base;
+		dev_dbg(pctrl->dev, "port:%u pin: %u off:%x PSEL:%u\n", port, pin, off, func);
 
-		rzg2l_pinctrl_set_pfc_mode(pctrl, pin, off, psel_val[i] - hwcfg->func_base);
+		rzg2l_pinctrl_set_pfc_mode(pctrl, pin, off, func);
 	}
 
 	return 0;
-- 
2.43.0

