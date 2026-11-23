Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446995;
	b=LAHX23i4hFgLkb/VhbseD3RNxn7OCfLlwzmrnkhJMOTvyPHGRAH1omWvoLzgyuKcOupr
	 oyFCYXYJP9CUNCUIbNWT3XTEdejzF8rxGSY40+uXZSviEM36EohAus7t5tLXYOqEvwQ1p
	 u9fRlNILDJETX4n0TXcChrEUBGIw2SWsXjGjxMx7Fm0pJiHs6Ko6596dcc6j+vuVAjD9t
	 Gbsm3p/H0/Fy0HoifBYQXNmSOYpCbyxrz0Okg8Bxyj6lTShObZ+ch+n0qp6393DpyG1td
	 knxYzyiJ0Z0UNwwd1uE1clDKMmly27inT29dIW1Xjr8V7ENCmoS4ZaxsqU0FE0sLIqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=UfQmc2c/VBqjJpzYZJV/mvR5pLjgufyNtaYeJb3a0XA=;
	b=uAx4VS6yjZ3WfAj/Fo+Yh1h3VA0AAWXUsYEVMRjUZr1/FVhzB2Inosf2OEVP50gmlk9F
	 aRxJ93m6XVjBuablzMxiyFroX0pQLerryLbv/W1Ny0/irmZ27apT34EbzTSLOm0vYaRn6
	 OEkUr9z8To4Jgk7XfuNJ8ZSdYa5+KBE1PC/MWr150SlAFeSFWrzBrF8T4U89qfVxKVF/T
	 X7v3iRm7JoGGq+anVn4Hb6L197+aHmVpi4p2tcKuHKbUnATSGpaHuqPhtavNebdKjcubv
	 qtIcAvHBmWCHyXQSeNOT44lw99tB+oe7UyI3i1Ke31ZolEhMUpu1znQQRHY+LNI6rfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mw4m1gfp;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F50606A333
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9F50606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mw4m1gfp
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso1610608a91.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446994; x=1796051794; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UfQmc2c/VBqjJpzYZJV/mvR5pLjgufyNtaYeJb3a0XA=;
        b=mw4m1gfpUrv2FreNB1ZNFYzNad9WSMfE2DUOWTxfu1Js/8bHT/D3Nb3OHw9uGeIhLD
         yW7CNvkhOKWcTfFvvMZts8R2aR6t6AR0cHwm8pZD705K4Tqbf7Xz2x+0BymycsMY4xPV
         tLu7++89hUi8MRiMUa3u+4QcVY4op8HfQtdfE3iX8fg2y/LVLiCIUPe53HdFEIg9H94M
         IBcdG6op9YsSCfqQyKfdzHrxG5N6VP7mGesC4g1GzO7EpdpbcWrdFaUO+8C41JQtVxDI
         p/Y13atkvC1BHSqzbKx+glAXQt9AEf8vgZy1Zx3RmDhis4kCCd8a8c41g8/I2SCq/c+n
         0zTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446994; x=1796051794;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UfQmc2c/VBqjJpzYZJV/mvR5pLjgufyNtaYeJb3a0XA=;
        b=n0tK8TSwdnl1QqnBPlXcZoV95AH7Q7ULGgnYTjceK/4pBLu4jHzGuvGbKjJSTRTEYa
         Q4qWgywxnpyhNuvWFeAY+ENU7O95KYGeyyaNYhjTNcPQCSwKl3zYU84uNsbMw3jxVtLe
         lVMtx6M3wLoPPtbsx6GFIZ21swEtksRSTlNveCyBjRcIiVDUYy44G/AqdC0z5ajar58I
         m7CQxgREHfFjboqmu0l+W9WN7MOcSF3/y4e5juf7qoE2XiW+VTmEz4ZNqRbsgtFho/Xz
         EOSm/+61P6l/r+vUncAqSZJY4Eiv9uCR4kjmpoRNNhE6YW0c8AGh8yiOZ1zZiXEmfrMT
         Xl0Q==
X-Forwarded-Encrypted: i=1; AL+hErE4g9B6ronKBRI9/NuY+EgMyU5UKJu8up8W3Xpt8UM0ktm/cnwXr8YM0MOWCr8+UZ0h7TyM+5B51htz@vger.kernel.org
X-Gm-Message-State: APuU4Z8LlagIM07r/kYd/19PClORd6QAfGrP9hDP+kLylS4pz4FYF/Mt
	xVeVLOuz3ayEZ88LGpXscw74MVKsL0gdpP0W4II1eNRbh969/iJMvXy1
X-Gm-Gg: AZFdTZchYCnueQpB7goqVpwV2ON3oA9V1sOGZU49jJpGl7WBoKpo6KNGTwvGIxs72HR
	hZxD6Wm/HdDjUY4kftdgg22+dXHtURXEQVXAokQn/vqr9LHIT9jvqHzXQQgXPuQI+by6x5xfPp9
	g0CKGBz9Bb2NqbbXLfb5k/dHQ0YkY5wf1uA3fQzVBQSu+76zrF/dyznx8Bm/WH06anLl5e3eohO
	lYynWIxOdpQvm0poFNYGSqb3dx2QYwk3lc4HPFurjSvHTEVAwc2m0Fnya/NHMDtQHPYmC2L7SRA
	3Q7bu3HjyOnrKQL5899UMdmqlRSXh5EzYXRq1buAX3F+hJbyv6RCGDiQ9iJRaa6E20yDRxjmf1b
	B+3HiUTFzKspAel9b1iQS9vA9Elge71+YNvXMhq/+cRwWGWaeCPZIo8ajhpZF0muWSzCO4Vzntv
	ltASE7dd9ls3HN/cP29WQUYINnrBGs9OI5lMTOFVveb7eA2Bfv6VF/3z3JnqlokCzU0QTnRocNn
	K6IIRz7UVEvD6IaAroP7yYxe6D+Pxfqigtv9v2FUNHEyO0aIX0enQdCLCcFCC7wv3f9q2DREwO5
	uVz+FlX7Iq1DP55YRKvLzLPSMBnulQ==
X-Received: by 2002:a17:90b:3d8d:b0:3b3:b750:d2ed with SMTP id 98e67ed59e1d1-3b41c7b56c9mr10763673a91.8.1795446994016;
        Mon, 23 Nov 2026 07:16:34 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm20067482a91.5.2026.11.23.07.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:16:33 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Subject: [PATCH 0/5] upboard pinctrl support for device id INTC1055 &
 INTC1057 & INTC105E
Date: Mon, 23 Nov 2026 23:16:13 +0800
Message-Id: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL1YBGsC/zWNQQrCMBAAv1L27EK20lT8inhIN1tdkCRsUhFK/
 24QvM1cZnaoYioVrsMOJm+tmlMXOg3Az5Aeghq7w+hGT0Qet7LkYBGLJm72whAjampMbpr/IFi
 3UrI1dMTnmdfgL9MCvVlMVv38frf7cXwBCl4bkX8AAAA=
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 BillyChou <BillyChou@aaeon.com.tw>, Gary Wang <is0124@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

Add missing groups and functions in Tigerlake & Alderlake & Meteorlake
for INTC1055 & INTC1057 & INTC105E.
Add support "UP Xtreme ARL","UP Xtreme i14","UP Squared Pro 7000",
"UP Squared i12","UP 7000".
Fix pinmux-select set CPLD GPIO OUT not function mode for I2C pins
on the AANT0F04.

The pinctrl-upboard is provide additional driving power & pin mux function
through native SOC pins->FPGA/CPLD->hat pins for flexable board level
applications. it's probe from ACPI device id AANT0F01 & AANT0F04.

Signed-off-by: Gary Wang <is0124@gmail.com>
---
Gary Wang (5):
      pinctrl: tigerlake: add ish_uart groups and functions for INTC1055
      pinctrl: alderlake: add some groups and functions for INTC1057
      pinctrl: meteorlake: add some groups and functions for INTC105E
      pinctrl: upboard: fix I2C pinmux-select set CPLD GPIO OUT not function mode
      pinctrl: upboard: add device id INTC1055 & INTC1057 & INTC105E based UP boards support

 drivers/pinctrl/intel/pinctrl-alderlake.c  |  40 ++++++++++
 drivers/pinctrl/intel/pinctrl-meteorlake.c |  32 ++++++++
 drivers/pinctrl/intel/pinctrl-tigerlake.c  |   4 +
 drivers/pinctrl/pinctrl-upboard.c          | 116 +++++++++++++++++++++++++++--
 4 files changed, 185 insertions(+), 7 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261116-upboard-pinctrl-add-intc1057-intc105e-support-01c37cfa685b

Best regards,
-- 
Gary Wang <is0124@gmail.com>

