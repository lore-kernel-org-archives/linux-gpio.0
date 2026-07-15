Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07768477E57
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 12:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118589; cv=none; b=hhfSDgKwpNcxEt4RfGc5RIiXjggC14GNaStVNSokWVBdFLhcUrXl4eWltQQodrIbFEu4W9wxCbT9i3FBJCSae7uiG2/2nyT6UoPrcI8Qve2xCFMTAl10vk6HX0qJgKvNJHt0K1LLUIzvlhjf0xfSeDeqPlDhypd7sF09IoSUmek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118589; c=relaxed/simple;
	bh=JiXkwn8rL8DZczeduXfneZiovUxhytzrzDz2zK/MkoI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NdFa+yD1bhQTV7bygOJ7dTUxz+gKbOOR4gilU4U3MC2T+RUulb9Ex8hYIsjW1acbqV+sHClQL/rWLrXcrolAh0nGuWYaHzGrxcsV5cWkATMCtGnS4qYdPCuI4C5eVeOyEqCW/BXq8FgiBLrul4yBujWDCQo+X+kDvX7nRxtuB54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnZvlZPX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnZvlZPX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493e497643fso9939095e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 05:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118586; x=1784723386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UoytU0F027gfAJU2q59F2/SIdHK+cPMMg+f9Ec707W8=;
        b=HnZvlZPXc77/VbkysPO+W48HeFP+V3JmfswUxaF7v8NXRE7hAKY0Lj7gwelaq9J1Q4
         XUw77tx02jLEQOiC8qBYfqpxdtBTPBOqjtZ/3JVPq9GzTey+WAf5HvoS0yRXDUPU6qDj
         Jr506INuOg8rjpVmSytypm1TEKu7bdZEVCenQittANLrO5N8UywDyDpu3LzaIgKoIcS0
         KX/u1hvQCWFxmmr1THcbu7jxdXZuIBm7Ui+sMgG/Rzl214M/XhX64tDXlpBBcj5Mosd4
         3gr+GQzom3qflv4Ix4snJt130ZbMsyDldjTJoxYGmAluNEDv/3cOQ1wNxRzpoz1BtNXc
         QsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118586; x=1784723386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UoytU0F027gfAJU2q59F2/SIdHK+cPMMg+f9Ec707W8=;
        b=eiiXLB7ueWz137T9SWZb3ka9aycms7FwX7mha5TQuDGoNhPxwZFLdp8+L0a6Bromwr
         JBwqh2Aq5qiGcNJFe2Cxss05dc0G2u/pApLgqDWEl9xc2C/iaSNDGp62y+mZ5/E6cTCC
         iVpiiNSy3wdwBApJaVAqrah442gmLBu1J2AFzKEuwR4oRg6DfnqDf/PH7VVcZG2jExMU
         EA2a4qp3+3fztQu7mTjhPgey/+4t1YyXuGy1HYsgqia6l6x7UrTqBrbB1yKnoCPoGtz6
         C5MmOAsmTO1cXmL4vhyZ9yN5g0NzTgcnJOX/easPbmuLoh2XL/bLW7+wTBvkYP885kFq
         tudA==
X-Forwarded-Encrypted: i=1; AHgh+RrgAdXL2c6obvlCmldk87vtPf9gzs9/7Tm2uGfQIU2Vf6hC0K5AWInq5V7PFawyTsHQr+G5tNQ1JmLm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5y5pSCsuIDzKVH2t+VX+11bxTTnlZMXGo3JbnRQ20hx2eYtqr
	Qe7q4QZ0F6LDE8y7b8aS1x7613ygrkoicxxEjWcdhuhdJ3woD5UyaDwH
X-Gm-Gg: AfdE7cldMIowSAYyzNkx6bjoiLesvuNK95bdvGkY2ku8NpvlIH7yJwXATbRKPyM5uwv
	2viqzHbCh3yHuFc9Onoj5FLKRtIBb4HtTwiJfb6e3xc6Bc88BGa6KStzPlJtidcCx3gGhAT9euW
	+IT1zrHLQL16iVgTvNWEs5wjbdAGXzG/6zHEnGPWfG7jvnXKanp2utJBbmZPzE8gAtBUupcp79C
	4yYSlXcfJ9dUYvjwlL8SDkWuF+hxL9l2PSlvDNvVISWv41HiM0/Cv5Xkg+xgPaITjk27OLE0ZFQ
	x3P1FuFz0MNjZBOgXBpz5lAqRgag4+o70Du1kLyBdDcUWHp6tAgD/wc14nDs0vh274Ex288OpyR
	P+XPCCoyXkkf/dbqoWK9imHzPdINnbv+nKiNEdLZZ66/nP3W6cgx9BmzlM6Kd4oRn+9+2skfvP+
	Ia6nwpbnGfRmCd7TcdGzlDxW8=
X-Received: by 2002:a05:600c:4c13:b0:490:e19b:bd99 with SMTP id 5b1f17b1804b1-493f8828635mr123345555e9.30.1784118585835;
        Wed, 15 Jul 2026 05:29:45 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm216770715e9.12.2026.07.15.05.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:29:45 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	linusw@kernel.org,
	brgl@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v1 7/8] pinctrl: npcm8xx: correct JM1 and SMB7 pin flags
Date: Wed, 15 Jul 2026 15:29:22 +0300
Message-Id: <20260715122923.1938327-8-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715122923.1938327-1-tmaimon77@gmail.com>
References: <20260715122923.1938327-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pins 136-140 and 142 are currently advertised as having both drive-
strength and slew-rate controls, while pins 141 and 143 expose no slew
control at all.

According to the hardware description, those pins only support slew-rate
configuration. Update the pin flags accordingly so pinconf exposes the
capabilities that the hardware actually implements.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index e21ccdb5d..f94494b67 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -1465,14 +1465,14 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(133,	smb10, MFSEL4, 13,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(134,	smb11, MFSEL4, 14,	smb23b, MFSEL6, 0,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(135,	smb11, MFSEL4, 14,	smb23b, MFSEL6, 0,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
-	NPCM8XX_PINCFG(136,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
-	NPCM8XX_PINCFG(137,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
-	NPCM8XX_PINCFG(138,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
-	NPCM8XX_PINCFG(139,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
-	NPCM8XX_PINCFG(140,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
-	NPCM8XX_PINCFG(141,	smb7b, I2CSEGSEL, 27,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
-	NPCM8XX_PINCFG(142,	smb7d, I2CSEGSEL, 29,	tp_smb1, MFSEL7, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
-	NPCM8XX_PINCFG(143,	smb7d, I2CSEGSEL, 29,	tp_smb1, MFSEL7, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
+	NPCM8XX_PINCFG(136,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(137,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(138,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(139,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(140,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(141,	smb7b, I2CSEGSEL, 27,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(142,	smb7d, I2CSEGSEL, 29,	tp_smb1, MFSEL7, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(143,	smb7d, I2CSEGSEL, 29,	tp_smb1, MFSEL7, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(144,	pwm4, MFSEL2, 20,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(4, 8)),
 	NPCM8XX_PINCFG(145,	pwm5, MFSEL2, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(4, 8)),
 	NPCM8XX_PINCFG(146,	pwm6, MFSEL2, 22,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(4, 8)),
-- 
2.34.1

