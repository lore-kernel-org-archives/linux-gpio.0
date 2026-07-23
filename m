Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3478C47CA7F
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 15:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821326; cv=none; b=pr1tuPfueB9rUapV61nlZg4ucTgZly6HxtqXGYaSbkR709z8FxnA2GAxfFTGtJ+BSoiZWBTDqp7bzdwx+p3KtwARLgMY+wLnM7x2zL82l5IyIU6LKjyJtxph3pwqy4nFE/BsxLoUs3OZ/SBQ9QsFc0WLdc1Rs/KX65akE7tD2t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821326; c=relaxed/simple;
	bh=Uxpyi86QWWWez51vf9h7G/S/w9n6MkT4D426+4rpJH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XMkiUNU+ATiGV6WM5Qzi98PRwh7h5u+aI5u2neSQIBGq4xAnG+OOGWELNhhLWDPQGwsfN5ULNz30TZDitGyG0MBjiCJkZNswhV+OXMvqiG+s3rxRmbN5rrI2p/+yaFvcYAKfA5fEiR1XA07VX+oqd4QuW5Kj+conh90tKCkOzJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rzIOaUsv; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rzIOaUsv"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso5698235e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 08:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784821317; x=1785426117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hcx+fOflZhetg37fsdgPkibtdUAllraHzQaa5Oytmww=;
        b=rzIOaUsvEWaERn/tDq7djqpVnpwI/l3GT24GyroBX64CCwkSkZ9vkZMF96LXyCHBrw
         nWysjIoYmWnQMhDwZHfOj/Vw9aPAcre32bj59AKZDHgojllXZdd76LXNH95YwSFoqgLt
         fYpCL0cYA5foX9JalgY/oHHb/yQo/MmYmCqLFXcMXJCFRNaCZd04TZShVjfCDIS6uMl+
         Lc/EpS/M2s4WaAjDbhk5QEN80fugbU00B7Wg8rbPzH14ob5JdOWLliXqU+ObbjkNMHwn
         vifr3/+C5sIPuZYP9ZRrKOuIxhd5Sq8MhVzKITUYN5pfpTe7P89ThUsJ0NNr8eoEYcTr
         aaqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821317; x=1785426117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hcx+fOflZhetg37fsdgPkibtdUAllraHzQaa5Oytmww=;
        b=D+CoTsyhQbG/JWl0dbQzCqsqptkUmmEDtlzMharT8c7fHPjCozXDjB5fm0x5EfrUHn
         ou8qWEHgt5kv+P3ructcD8V85HZRNcVPuH4diV1q2hNOfKvJRFd3+Zv/LL50reAjLOso
         PlwBWu//PGyCx7KnvY1mSijVZpjiUhMv+Fvdg3hldiLCIeow++kzF7Hm8ZePOPgA74dj
         IR3Q4L85QxHF5bwo1WGDMDIjkjuq2SdYMI2N400tV6fpSy/9QFiLPQrv1qgn18GWxW1f
         kOzpY/fJRtnnSfyz4t7KPhNpK4V7G80gJ4wkZ/iDLjuqA9e2IZDlwP3zx5LAsl5FpIfd
         eofg==
X-Forwarded-Encrypted: i=1; AHgh+RruMua+OeNvv63/vdPZj+0X9PDbBAV7L5gVZhg76xbGQhLBlCO/JwbMVSkVRgAQXNmuhhgjdw4PsPxA@vger.kernel.org
X-Gm-Message-State: AOJu0YyExWzoX9EUQdHNlSkz/yF8b5YliBFZRB6mVCN0AA1Euhvsoqqb
	fDfFBh4syTJhihyzbqnnErfV9Jx04GqgFaESa3RiKwcVnHEOEmEGzmhu
X-Gm-Gg: AR+sD13j4px8gIf3EzqygzlVSwDIDbaijop3Q4dDZgMZD7JalhX9mnRfN4/p7f/P0kt
	4GvowSPO+ggttiYnriabOiG4hB21cEOEHJYM/nV5PQ4PqvSi5hM3AOtow77Q2a3I/+pubVUbczr
	FFkbHDBucFjuW/nLgvWpGwUctIfxuEPUM0qjMikz/a0pp03MoeGWDsBou7ZD2mKoe7SbQHoTbz2
	HxTITiYynt4dKKzhn9Af9ZMfsODYmIf3JLLBdXsiqgmmmkZb7dZETrH2Inzj2gsCsXJ4eIYhPSY
	pZq7ZYAcfr4PHJu7Vf2o+YYIPPpVcECRg8LC2Cvrl8vLSWayCIpo/9A/I5WeZ7qzOeWM748XbsC
	89ONVdULODpBWfY+Of3bUaF1ESMne6Q9wFMk5NHZM6de7OVFaGfp66rUaTV/6YsncLHTeQts4aS
	SgnNHdTSruok/0xgL5mqWx03D2VAvynW4WxDdJ1A==
X-Received: by 2002:a05:600c:474a:b0:495:5a91:8027 with SMTP id 5b1f17b1804b1-49573c8d444mr42787565e9.5.1784821317042;
        Thu, 23 Jul 2026 08:41:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:f073:32ed:a057:cd3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af5d3c2sm3411345e9.1.2026.07.23.08.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:41:56 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v19 0/4] Add SDHI support for RZ/G3L SoC
Date: Thu, 23 Jul 2026 16:41:46 +0100
Message-ID: <20260723154154.319674-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

This series adds pin control and device tree support for the three
SDHI (SD/MMC host interface) controllers on the Renesas RZ/G3L SoC
(r9a08g046), and enables them on the RZ/G3L SMARC EVK platform.

This patch series depend on [1]
[1] https://lore.kernel.org/all/20260723151024.318918-1-biju.das.jz@bp.renesas.com/

v18->v19:
 * Renamed aclk->aclks as it is AXI bus slave clock.
 * Rearranged AXI bus master and slave clocks as per binding.
 * Split SD0_CLK and SD0_CMD separate as input enable not available for
   SD0_CLK.
 * Added bias_pull_down, input enable, default drive strength for SD0_DS.
 * Added input enable for SD0_CMD and SD0_DAT*
 * Added default drive-strength for all SD0 pins except cd.
v18:
 * Split from patch series [2]
 * Moved sd_ch2 variable near to sd_ch[].
 
[2] https://lore.kernel.org/all/20260603065731.93243-1-biju.das.jz@bp.renesas.com/

Biju Das (4):
  pinctrl: renesas: rzg2l: Add SD channel POC support for RZ/G3L
  arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and
    SDHI1 pincontrol on SMARC EVK
  arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0
  arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    |  73 +++++-
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  89 +++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 233 ++++++++++++++++++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       |  74 ++++--
 4 files changed, 444 insertions(+), 25 deletions(-)

-- 
2.43.0

