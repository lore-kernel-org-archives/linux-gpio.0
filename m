Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE53E3B7757
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 07:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784275183; cv=none; b=hr80+W4KaL8k1FccbLHI9Ft1ldxWGLoFVaQvv713PIZjWKb27SDzwd0piXggPmXKd64LDPsJmbSTW2K5uc+gEZUvJP79A9VptLZdvIK+uG817bu/+lSGXoeU0e0jTCgM1ghHCIFt11OjouRMr5fOtA2HfW1BpTvNcPrrO0tLqLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784275183; c=relaxed/simple;
	bh=qzutz5Nl+b9YPqrdZckIo9W+6FuELoAo6Sy53Eo06GU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qVrAKYaZ52cDnAf6Cx6zGMVGBhPD0du5QzcwTQ9mtLx8elP9iDUnSZcVydXmtQ0NnEI0XacODP+IZWhfayEBeT6iq0psfHb4ZfPvm+UXcKCZdA8j65xOFds+MCDUUxZhVq72OANlFNHtI91PeIirXBaYASPolAtSty8hXuetXKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ahdrone.com; spf=pass smtp.mailfrom=ahdrone.com; dkim=pass (2048-bit key) header.d=ahdrone.com header.i=@ahdrone.com header.b=jHln2Xkm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ahdrone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ahdrone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ahdrone.com header.i=@ahdrone.com header.b="jHln2Xkm"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49546c690ffso6944735e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 00:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ahdrone.com; s=google; t=1784275177; x=1784879977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMflJCfpssRM4YJJC+Tlv3Nh5omjZh8nOynqqpt+YI4=;
        b=jHln2Xkmtj0Jt38bM7kB6hH54CNRvVH1308h4IhfDn0l2N87aXHbhz2FSzhBConbXx
         GT+B1oWPmixa+S5jS/U6JkiHDZIeY96dWRGPHWEPHlwenYrR9MPYIy9PUC09dXWW8y/g
         cQI0X0/n+TtdP4PJEDhEJClKvgsynfN9PWqZG9DxpNLP5dobGfjmbiCd626oiCGJVkou
         luUCxs5+4vDK8q+nONxscoIBczpkTGE+ROSMPYPB23Sc2v917VJGkOk5/bB/dlXF5WLC
         hgHZTSsSBzx1BqQRy66ur2saTeolh5dQLsZ/V/H8FFZKcO73eLbJ5aRzHhOG0N0/oFC9
         zQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784275177; x=1784879977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMflJCfpssRM4YJJC+Tlv3Nh5omjZh8nOynqqpt+YI4=;
        b=TC/NJr9pU0Tov0eCU1sDESnWmHHRFq2KkbfAWS0amijkSj0PuagwTxNb8E6X+a3YK8
         F5TBVcC1CS98XVlFRdL6XprRNw+ulYTrUaVfuxARadt0SRdOTuPXwgBuZViLzsXTZ76R
         UVNGFBdBSQK7QYXZ+dt2onqxNWkKgFnj9xqrWI1113tJtDeqPLybvOfjpf4eP4FhvPCB
         YNBYDrb/zNsrvSH75TuhVZMD7beiWIZ/7ulczBSLaTNxk1gfEDeibmFZ12STwCp2zNjI
         4q1ng/cFgwnSz0Z/vt2ETV6b431m6S7tPeFnwa7yuNGcaBoCkW0BPpdPFkpe9FP6Ug4j
         YBhQ==
X-Forwarded-Encrypted: i=1; AHgh+RoOm2yGpvaGAknhRKscTF9Da6IkUwWONBO0/QpVyOEmulwuLsD9nUHejlLaDnMPCgHbOXSCCXF7k/YV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/fvH4CSJQsEsthUU0uE6ZAcJ+OWafPz2xzektgxhQQjG4wdTs
	1BwePHelE4cIk5w86zLbcjfsR6Xt2eAJDY0j+xa9dA4FCozqvUlClHR2Qb+Yvbgk8g==
X-Gm-Gg: AfdE7cmzz5LmwvgVa9hvJAe6201js39il/Zkpz+Lixk5xBk3bGpjmTHqBKvku5IHWvN
	hajwKEk7Gf2DdnS3qoTFdCm2mF5dmfJkGoL0NbE1uRkS+qXJ2PfKAtG5PN5Lhyd7yrPG8gBr/P7
	2ouTI0IE6Es0HkRDPxZEf2b8fUUBnKnfzzWZDHSxLx0l0vB68/seFI3fLSaO5z4ACZ40acSRTzK
	ybWszUQxDpdFYuWLfVBCM0UUDk9NN8l0Im2c+IP6TBOXmDevK6zgC0trDXL2/Tg+cGTehW8kpTD
	jewvxAwCNAjgHT3/8Qxjej06if2JoQpMb3gI22vSSl99LpRRQfCp4xSV9sL7LrXhTp/5oyH1QVZ
	LYbDQzfEqyVdLodizOF1u0fGh6grc32rrMBkDE1cPJ8VllTPZ7WSRk28jJ20KTieTsXoa8oUYfz
	AVnr6INabRmICssDcPNJgC2aZgCg==
X-Received: by 2002:a05:600c:c04b:20b0:493:d078:796 with SMTP id 5b1f17b1804b1-4954a3f397fmr12203065e9.17.1784275177348;
        Fri, 17 Jul 2026 00:59:37 -0700 (PDT)
Received: from rikus ([2a01:e0a:edb:6330:cc2f:bd70:58a:fcfb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm31709045e9.4.2026.07.17.00.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:59:37 -0700 (PDT)
From: Hugo VALTIER <hugo@ahdrone.com>
To: Linus Walleij <linusw@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Hugo VALTIER <hugo@ahdrone.com>,
	linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dmitry Yashin <dmt.yashin@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 0/3] pinctrl: rockchip: add support for RK3308B SoC
Date: Fri, 17 Jul 2026 09:59:13 +0200
Message-ID: <20260717075918.1869879-1-hugo@ahdrone.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RK3308B is a silicon revision of the RK3308 with a different iomux
register layout: several pins (GPIO2_A2, GPIO2_A3, GPIO2_C0, GPIO3_B2,
GPIO3_B3) gained 3-bit mux fields in new GRF registers that override
the original 2-bit fields. I believe the bootloader enables the new
registers via the sel_src_ctrl bits, after which the kernel's writes
to the old iomux registers are silently ignored. Whatever the exact
mechanism, on RK3308B boards (e.g. current Radxa ROCK Pi S revisions)
SPI1, I2C3 and other peripherals on the affected pins are
non-functional without this series.

This is a continuation of Dmitry Yashin's series from 2024 [1], which
was never resubmitted after review and got dropped. Following the
reviewers' feedback on that series:

- the separate "rockchip,rk3308b-pinctrl" DT compatible is gone;
  the variant is detected at runtime from the GRF chip_id register,
  as suggested by Luca Ceresoli and Heiko Stuebner and prototyped by
  Jonas Karlman [2], so the same DT works on both variants (boards
  ship with either chip)
- the mux_recalced/mux_route tables are constified (patch 1)

Patch 2 is a small refactor so the SoC-specific init can swap the mux
tables before the per-bank masks are computed.

Tested on ROCK Pi S boards with RK3308B silicon, where this fixes
previously dead SPI1. I don't have original-RK3308 hardware, so that
path is compile-tested only; the tables used for RK3308 are unchanged.

[1] https://lore.kernel.org/all/20240515121634.23945-1-dmt.yashin@gmail.com/
[2] https://lore.kernel.org/all/20240604141020.21725-1-dmt.yashin@gmail.com/

Hugo VALTIER (3):
  pinctrl: rockchip: constify mux recalced and route data arrays
  pinctrl: rockchip: extract iomux_recalced_routes_init()
  pinctrl: rockchip: add support for RK3308B SoC

 drivers/pinctrl/pinctrl-rockchip.c | 266 ++++++++++++++++++++++++++---
 drivers/pinctrl/pinctrl-rockchip.h |   5 +-
 2 files changed, 250 insertions(+), 21 deletions(-)


base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
-- 
2.55.0

