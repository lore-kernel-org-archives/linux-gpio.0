Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACD954707A
	for <linux-gpio@vger.kernel.org>; Tue,  6 Oct 2026 21:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791320611; cv=none; b=Zba1thU7z/iFK37YA1pTlptFCySCl7yLVrA6RpadiYr02/dj+1DBxxmRYGLgnOc4DTK9CRulFoUKNN+xPn9NYRL52zQ50caDeoTs8SA6qTOUTxnlINQE7qSldOCmT+scSTp3oHMyHs5T0OXRok4o6ldKBz83AyzAdLnfOSS+O4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791320611; c=relaxed/simple;
	bh=ISf7Lb0t6b8ylOEcWRDSL9BmaWLi8p6rYhKIlR06ZHE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eopD4WvLdalX/5CfcWlLJK5LsqiDx400aLh4Evbut8cAjJOOgBDtcWVTDfBmFUCbrOlgbhfKOO9hedU+qjuwgc4AZ9F/zkNWr3AjRWkZafgmfuyor4QFkeA3RBCXrw3uMWziJ45IArw7mIm+rIHiwMYkeb5Nha/dNrozBqK0CW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKqmtzUQ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKqmtzUQ"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2e36c3478aso502974366b.0
        for <linux-gpio@vger.kernel.org>; Tue, 06 Oct 2026 14:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791320608; x=1791925408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ylT2JTUORypj+MjhE+jQDW+T/v8WU4XCGcgTDo3Q5yQ=;
        b=IKqmtzUQB7WmQxcEW/YAAzrXsgpHIm0PThTUoXrUS8PGBGb9mXomqqCXqAo9bgAMRj
         U2UUJMWDikgRQ8v3Dl2b1/A+qze7pPFRPgZHFyxatnY9iscLK987ristcBlzDLYBAeHD
         l2ZVQRmmLCYufP06ERngwu0R5hcqhkPCYJk8Xl9TFRQEX9db4+4Iv9S16Tk2iU/V3z/A
         CXl2oDDOocTogggMbdlQDluXxWDna7v3bxt4yN9OpAi86yI6ainUCl2dD0+gZrqxeD06
         pBup341hPMmhMFRyZY8dBSDSv2ilOf58qoZPREVvS++jq44XIDTWbWTlbf2eESkKkx8/
         LYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791320608; x=1791925408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ylT2JTUORypj+MjhE+jQDW+T/v8WU4XCGcgTDo3Q5yQ=;
        b=gj/sNrod4LqlXQ8BD0VgNBGXDF/eGs5mew/fLEnBAuDO3wL+LVSt57e1HU6s3h7Rcq
         o2iup1zZBm6vIxmWTjaKWY/deUx1EsrNvBUYRHCOUFFHecEMt4GrAuzK1eKGNmElQyxU
         borpQZi9q5JqrFw/LL6DDf3LpFLURsStMA16Zktgfh9VAP1+uSxx4WqR9+BrSZr74YpF
         vCFmXqoG/9Ljy6Qw5/R1WklKpWnAxxMmxAcAF8psNlgOKtb1yjKjSq+CR+mTHswDjv75
         9Eop+EmilIdw2tarIRfg0QoScIPLcpGyjPkThdoNs2pMZ8Y//03exGzUqpU4Gbqgqy0F
         FcLw==
X-Forwarded-Encrypted: i=1; AKwUvBxrrGyWgo3yqZtBMlBI4d0YvUpxpTmpELFPnTCJcWCFWasgkz4EWp4Q6DG494hcGqSFjOyprQQaVj1L@vger.kernel.org
X-Gm-Message-State: AFuF++ldcLnLv570nuK6+O6OTNoCowDCxyVxliWlk58skzVDekzTUXTp
	K8AzYDktew2/uuIp+y/3qXLYgiN3bzsPFeWxhzl/Vj1CuIONcdkyrNF+
X-Gm-Gg: AYBFou0YqLonO5ByBMPx0obJZCed6tFPfdF+riX+Zui76LAJDKcsokTaSwHAxg5HLy0
	f4X4m5RMMiBUs1JG5DamE+wSQorTma+72vGhGew7xkEaVpjfPuK6Ub23KUN9OTXiwbVWBkuAdIa
	8QVX8e44fi7FAvCw/06OxGFQUuI51g6NI5NZJpAwdLEAL/lsBltLg6R0QhxuF/W6m3smNtQnz2o
	f06nIuMQ/1+dydDIOBQ0VsNqMufOPyNACI2TBXLFgBIW5FhelA9Dxt4qUMPcJp4IluD66fDlE/T
	Kzb6joSRllILqUp2J0xg2wRFomOOM6916dmrGXq8HpqvY6aqN7kI/zV36dRMGU4+IceqAFJaNxr
	GVrXXepzLiTo3kzY0elLkkseGZWq2nO6vCm8UqsfzSq6n07gdsSs9FvHtnZoV0W4eezaiuJp+HK
	5ng2kNXv9jamIeNHxgSoi6fN7uRiNuQnRKSBzBsLupxXoBsRRHZ3l0DR0W0Eg4bVFHFAPUDsInq
	kJ0lDoaxvWoO0l73s2xA6igg+u0FS7c
X-Received: by 2002:a17:907:8992:b0:c29:5021:f6f8 with SMTP id a640c23a62f3a-c317c0bc3a7mr23014166b.36.1791320607819;
        Tue, 06 Oct 2026 14:03:27 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c317c2f9938sm8483166b.50.2026.10.06.14.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 14:03:26 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pablo Mazzini <pmazzini@gmail.com>
Subject: [PATCH] pinctrl: sunxi: dt: do not accumulate npins across probe attempts
Date: Tue,  6 Oct 2026 22:03:13 +0100
Message-ID: <20261006210313.43163-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

init_pins_table() adds to npins in the driver's static descriptor, so
after a probe deferral the count doubles and the next probe fails with
"pin 0 already registered". Count into a local instead.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 50a16f3bd131..1c1888394cf1 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -75,7 +75,7 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
 					      struct sunxi_pinctrl_desc *desc)
 {
 	struct sunxi_desc_pin *pins, *cur_pin;
-	int name_size = 0;
+	int name_size = 0, npins = 0;
 	int port_base = desc->pin_base / PINS_PER_BANK;
 	char *pin_names, *cur_name;
 	int i, j;
@@ -85,7 +85,7 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
 	 * Also work out how much memory we need to store all the pin names.
 	 */
 	for (i = 0; i < SUNXI_PINCTRL_MAX_BANKS; i++) {
-		desc->npins += pins_per_bank[i];
+		npins += pins_per_bank[i];
 		if (pins_per_bank[i] < 10) {
 			/* 4 bytes for "PXy\0" */
 			name_size += pins_per_bank[i] * 4;
@@ -98,12 +98,14 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
 		}
 	}
 
-	if (desc->npins == 0) {
+	if (npins == 0) {
 		dev_err(dev, "no ports defined\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	pins = devm_kcalloc(dev, desc->npins, sizeof(*pins), GFP_KERNEL);
+	desc->npins = npins;
+
+	pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
 	if (!pins)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.52.0

