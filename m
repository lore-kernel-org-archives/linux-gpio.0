Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E183F39B97F
	for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2026 14:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150188; cv=none; b=m1tpb7131jRH61A+AbVR+ROciEuyNZrTwb01GWqqVBle8WBF9W2uIdL8+ZBYcYENQA21X03O4S6On+o8i0S3e0Wa7FBDVHrVkjLb7OMDiTT6Db9B+S+p96CY8qaFdXBVJceYjv/4amGLx+pvkVpahfMt0he87N5VMQcDa5eN6Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150188; c=relaxed/simple;
	bh=z3m6fox0VDL5+p4WGInn9Me43qPCmqPICFvZd8M5Azk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SBri9XFifKNUlgfkCAkcSPFYhsfZ4vi0R1UeK3MKMMVBTQGiO1Op42iGDc+Dq6lkhGf3+YapgDmih0pBdtvRpA7i+GvCqNNLJa7ElkJhWvH2Qrh2qAjOU2TLCnFMY6sMuPdpOODAt0OvU3wQEVJYS1cWZid3XyV2M7jwRhDDpYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=gsrE5JKX; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="gsrE5JKX"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so11138585e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2026 07:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1787150185; x=1787754985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G5yTeyQ1vVAKMn0PJztOwFpeHkqkgo3sW/fF3NuHvjQ=;
        b=gsrE5JKXPw2lxpRjyJEiaxyPUd1pU8t/0ubzf9j7L/CUXujQi2zmOalOUYsPisha21
         xFBDX6pAskz6fnYtntzd292CL9DQ3B2cQELsoSgfapRrO1jQxgl5JRpb41ZNu1ZX91cX
         hsCT31B7STR8s9pHP+Yag3IkC63FWzB56NC2syPIJ6KOi91BKZHKbncBq8fk2zJrSN98
         ApzAv+ePK07FFh1dgw+fv0zq374G46QmTTRUKi14ljzdSkNU4AcEoPT4kTm6t8jdBoLL
         44cG5K7TytVkTr5tzekrxNo9DLY1Ii+TjvJfzr67K8Db1DT7ZkUdzIxxR9SU+JwuFpd0
         DF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150185; x=1787754985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5yTeyQ1vVAKMn0PJztOwFpeHkqkgo3sW/fF3NuHvjQ=;
        b=JOIv8XJBvf0qsolvNQCZbnXUffuULaK6Zwz2qlsG0/eolvcc83SsB+ZYKX26paLW8V
         MhtmoejFV225TwoGa3eV+fC+wPj6gt5G3k7ZO2swxOIS4czob4BHTpwolGyxal+OQItx
         zAVcpro5AJfPay0/i/QK0G1p90wSB+eYHDR4+0ZVZYY+XfDQSHKGtTmtj0wYuBb1QdNs
         OKOn2ILe0SGuEm8INtU1EXR8GAasq5KuI77KSztsWcpH8i/Y3EnWccY+w2WNllbIrLNT
         XSeNceMCDNwaDuH7oum3D/JlazLcEQh/JURjqPISpplTVeqlwWMBXDegE2r/jvYC7ctt
         w4IQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYWbcvTvVRsjUvPftV6/7Bnd5k7ehJL0ErroU1M4a5rw07e/3mbjR834QFkEbMix/6sTs8Ewm76bkM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3bK9/lwq2MNoqimLADketqyWTBLnwBacYkRTYX3FdJV7YjehC
	xPR5Ge3aukQq+DpnP6lcgWK92VALyCd8xKmWjCCx2cvIh7StjJH7xi8pI4v7PlwZZOE=
X-Gm-Gg: AR+sD13HgED0NqAfWNhlpaMor9CJRxPE9eWW/NgjISpXaaDRj4o7zLRSm763Vw2dA9o
	G89uW/7l1pIWE2HGnP3/5MXRStEoz1BdIZ7ln0bvN9z5LSMY0jZmTHOQ17wNylb51y80+QZ2Knw
	ml51h5gj4pwxY0P/7xcK15kXUNZS6qQnRbPsCeHVyhpnPFhm/2hbTswDdQ3fc7G7PVpu+asjWhG
	Kx9iWP/AOtzqFlG8uMZG/lKvskh3CSdFDNx4eFZzMWoW5dws00qN0Dur+smkL9+rdqUXTtiTdWk
	RWsxyD8iEG9ont8rlTzGzR9WTPh9A08UBkWuj1Kkw2M65AaTpfrrmkXAgEA8voZGKAdzXq7TT0E
	CW/6Osd1SP6yYb0J6+d5fTSVkvcHsOgOgMuOJvREkJ4k804oba+GyZW0yXx1u971vIN8dmM3a75
	QxNSt/e/H1H/MdJSCfNx92UKitdUvdSNCQP17kMOcgCLikq3Ac8lJOhFjI9FJWAJ3/0DooKcrmq
	7ToJsOQHf5tkgxsyHQj6/1GUXZMJ8O6Mvn/xschvzSSshHV985fVTD1bB5b
X-Received: by 2002:a05:600c:4eca:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-499aa1a7a53mr81886955e9.7.1787150185026;
        Wed, 19 Aug 2026 07:36:25 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6400:1700:e978:dd1f:393f:9962])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e37284sm32671235e9.4.2026.08.19.07.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:36:24 -0700 (PDT)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 0/5]  pinctrl: renesas: rzg2l: Add support for RZ/G3S I3C
Date: Wed, 19 Aug 2026 17:35:48 +0300
Message-ID: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds pinctrl support for the I3C on Renesas RZ/G3S SoC. For a
clean I3C support, cleanup patches for the pinctrl driver were also
included.

Thank you,
Claudiu

Changes in v5:
- collected tags
- addressed the improvements review comments
- added patch "pinctrl: renesas: rzg2l: Unify the power source handling";
  as a result, patch "  pinctrl: renesas: rzg2l: Add RZ/G3S support for
  selecting the I3C power source" was changed
- dropped device tree patch since it was already applied

Changes in v4:
- dropped patch 1 from v3 as it was already applied

Changes in v3:
- collected tags
- added a fixes patch (patch 1/6)
- dropped already applied patches

Changes in v2:
- collected tags
- dropped patches for configuring I3C standby

Claudiu Beznea (5):
  pinctrl: renesas: rzg2l: Generalize the power source code
  pinctrl: renesas: rzg2l: Drop defines present in struct rzg2l_hwcfg
  pinctrl: renesas: rzg2l: Unify the power source handling
  dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the missing I3C
    power source option
  pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C
    power source

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   2 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 313 ++++++++++++------
 2 files changed, 216 insertions(+), 99 deletions(-)

-- 
2.43.0

