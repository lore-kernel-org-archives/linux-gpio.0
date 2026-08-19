Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D743BBFDE
	for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2026 14:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150194; cv=none; b=p1AQ/Murpc2WEIFJGgel1iaZkGWJ4Zj6lx5cq6JuDsfTjjzyxqEQTuNmd3IidxJjjLiJczLRWzyD5Cg+wtCOPVxTt0KjtSFcIMrB1PtaGXj58o03Q/+Fe6AoWN+gHsOsqs/eyosGjd5Vy7KiHpd4ozWtQSWvoSf0vMsAZAsVXIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150194; c=relaxed/simple;
	bh=BgAw/rTfxrVoiubtEgGrhMPn7zF8kR5RDzNHbva1GEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FsSlb76GX4Qxz+iq9vX5/bdc5eklpTv3IpCE59Lcp55F5W10F9/yxcYM/n2Nyu/Mtay1p9iO35wcxw3J5pU1CgvdtK1Q3YXb2WtVc5Q/cWz80EAIDaQc4CBIg5nW2gSWcLY4FUoa5YoKX7+rR9lIC5gy+cudUxjalF9tgFLypUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mLcm2kAJ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mLcm2kAJ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so7409295e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2026 07:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1787150189; x=1787754989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tFQzFy9N4s2xQcKw/cm/7CXhwip8F6Dt3efFgFZwCwA=;
        b=mLcm2kAJKlB7mY0ZGyCjxTyq12wb3Uboi/dA4AnEKnGuxxdbkd/4GO4fTl7dqEZmng
         JzdHqqbSutI7CFHeIeSIMxg2f3lZqQQ2zyrWtqc5WsBjEBMerKrhRs7VbnMIsrm7R/xh
         qpfYQfEo7/aN0j5uYHfAhi2VcUylsG5OgTHQp1dD0E3Zi9k1iGGpqTL5xPbT774KNc0s
         /y78qfjkcH9Grj2COpzke7cVHOjpK1OvFgWbDd/n09WC8Rx/+9AF+2FoCKJHtrFm9neo
         bSEQLbpnxEyqa+wKWjeGD3Ueh78Z016n3zweYf+lYxM0HVnNUwMOQwyDxomFDuwQy/1L
         EMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150189; x=1787754989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tFQzFy9N4s2xQcKw/cm/7CXhwip8F6Dt3efFgFZwCwA=;
        b=nWj87dQcqIfoi0F8CInQ5Xb4s/DewVVG98pR/EBcZJiWy1ckC0qH4ZQ8MaJ8I9Bs6Z
         JXFuU6GDf89gTpm4jMehI9a6awet22kH7fq+dha2cA57Ps0bMGy2dEkk2smobyyaESoy
         9uzr8eJz18QL8MNswCpU40tIqvinHZknGNX5iv7+Kc6vSkc/AxJG2d2SqiLEW+8u1dQE
         2qJPo4REUR9ym3szKey0AHDwkStbwSXHALHQUINEeHc/L+Sf5z6zJKxHFYsrLOLTr+Ko
         uwvHpuIpdYKVcbvZj9k9G1gIO3wqjn21smO86E3F2hxz5osOBswrmnVMLp9OhEJbpUBt
         d/8w==
X-Forwarded-Encrypted: i=1; AHgh+RrU2Lv0uHG6hfDpy6HmdjlXSerYzzloTn14aR+OH6+5uT2e9coMsIv6zUJs7AmJKMEixZlbz4+TYUA7@vger.kernel.org
X-Gm-Message-State: AOJu0Yykaea3CrwOvOCy79ss7jvB+Q1lgZjoHX+gU826KV0Ea+c5yl0p
	uWP4kLQaoWZ5uBieQuTCiBYmmflQrH67WMqyuXAhJTVLwNwmky+0KzkX03VqrjMsdKo=
X-Gm-Gg: AR+sD121lVq+4h4YnW8x0MKKUeAGJ8XGePq3sgPaYwiVQ+VkD8HQ2TwEDpxKVK4DxEx
	eQRhRpSkO+iWdNc4F9oK+UHMwMvldjPJfj1Ev67IlY7REaBN/1uHSZegDXHCNln8q9PND4Gu+lU
	Njy/hzol8e11/FBtU4L3Tm9Kq6m8fmGub6iMbR8lRcei9RFiFIOZA9vhHHgE2FpmINCT27VyERh
	f3PlYNy+I/SG/Mj2HV/mVzQsg+WCo6zmZq0ZdqjYZHugjX6BtIvfHlRmjzSJ1qcg9ndJtGdHO7d
	nF0lPS++lcDMlHwTTZfd+8CyTgblt5tEb3BiWBsVEsS5d12fLA5m1Wz6XqJe3+8eXWdta4g25qA
	CL7MfHxRdR6HbT3TN8sPnKBvVGNgnK1qgp9Q/m17fS54540YbWEie1j2fgNV1yf1YeXN6EIiULz
	56ZDJbfhUX852vVzU39T9N1hyY8YDG8cgPLVZ+tDaM8vVR5VT24Q+M2O6+fASQIsHoADvMWLrum
	yR96aAP0DNwYIssMqtTTM0u33TY8Vo6bcjcklrX0y/a9sp1+4I=
X-Received: by 2002:a05:600c:1d06:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-499aa1a8726mr77965835e9.6.1787150189247;
        Wed, 19 Aug 2026 07:36:29 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6400:1700:e978:dd1f:393f:9962])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e37284sm32671235e9.4.2026.08.19.07.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:36:28 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v5 2/5] pinctrl: renesas: rzg2l: Drop defines present in struct rzg2l_hwcfg
Date: Wed, 19 Aug 2026 17:35:50 +0300
Message-ID: <20260819143553.2478984-3-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Drop the QSPI and OTHER_POC register defines, which are SoC specific and
accessible through struct rzg2l_hwcfg::{qspi, other_poc}. While at it
move the assignement of rzg2l_hwcfg->regs->qspi upper to have the
initializations as sorted (by offsets) as possible.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- collected tags

Changes in v4:
- none

Changes in v3:
- updated patch description
- collected tags

Changes in v2:
- none

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 72e0783d5845..9c935dc47555 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -180,8 +180,6 @@
 #define SMT(off)		(0x3400 + (off) * 8)
 #define SD_CH(off, ch)		((off) + (ch) * 4)
 #define ETH_POC(off, ch)	((off) + (ch) * 4)
-#define QSPI			(0x3008) /* known on RZ/{G2L,G2LC,G2UL,Five} only */
-#define OTHER_POC		(0x3028) /* known on RZ/G3L only */
 
 #define PVDD_2500		2	/* I/O domain voltage 2.5V */
 #define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
@@ -3813,9 +3811,9 @@ static const struct rzg2l_hwcfg rzg2l_hwcfg = {
 	.regs = {
 		.pwpr = 0x3014,
 		.sd_ch = 0x3000,
+		.qspi = 0x3008,
 		.eth_poc = 0x300c,
 		.oen = 0x3018,
-		.qspi = QSPI,
 	},
 	.iolh_groupa_ua = {
 		/* 3v3 power source */
@@ -3832,7 +3830,7 @@ static const struct rzg2l_hwcfg rzg3l_hwcfg = {
 		.sd_ch = 0x3004,
 		.eth_poc = 0x3010,
 		.oen = 0x3018,
-		.other_poc = OTHER_POC,
+		.other_poc = 0x3028,
 	},
 	.masks = {
 		.other_poc_pvdd1833_oth_awo_poc = BIT(0),
-- 
2.43.0

