Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BA2439908
	for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 20:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784752009; cv=none; b=MxZxVOBylBvLA+/b6Ab6pmDysrQnbMn0WRM8+NtHqZN5IM9tMjkHtQcZTcPJfW1fJLWj+0YUQnqM0FcTHFqACqi156nFQzbRBr4EHpzQME6A9Noe5KjnT5j5qT5O1Ml0qKshZjSFXAaIJJJNVAj2Qac7G3mBDY4N7dziRFpD8+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784752009; c=relaxed/simple;
	bh=HJyqMn58xeGtBFeowGIJeKvlVPUhHhLHPtCf//wwweM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OnE64h6qld3FXj2hce1b/u6g1nTGlWNO8ksgFVjT1bcKCFYRb/jYvV/+DdHTY9fOkgG2oN9kXOLF2qMhe5LrKv6ZPveFQ1xQxcJ+tb5TRC2E/DrTwzYNmuYkC/hvpYMrTnMX6Zj7sWdPr4C7R5IFG20zArfg3RpWc+wRQ4t6fo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWho8Xcs; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWho8Xcs"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495437bb891so54884715e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 13:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784752007; x=1785356807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oPdGdJt7xb9LixsBJFZMtoQVAiedhCyeSG6TkYspQU0=;
        b=kWho8XcszC1LaDMZrxue7wR6tWT7qKH9yuvLGrwRozFTkgkIUslssJm/PR0i1sEGpf
         BV6fPufEmAk/84EACyFuwbgzz1pIKDzGyepYzSFoOYeUBvM5oahZLlx1ArikgNxaEtTS
         qgSEy3lbmwi5ghhCEQU5lCGN4wTRaKLhiQQM38k/nHFz8nbLxiBZ0ezMxcf3w7wk68EO
         Sn822snEQQs07Dnza+wfc/os9rqbCtY2Flwl91Sjwq0RoY3pxTYxKhzoBq/V/o+ASYhT
         ZrgJIAUqDoV1uoAiJCX9qcAcIlYtL0oPkpziMgly9mIpnKx6Q4V1jmS7dXrxKXskzlse
         vzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752007; x=1785356807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPdGdJt7xb9LixsBJFZMtoQVAiedhCyeSG6TkYspQU0=;
        b=OJmQaOdrg0kjYnfBlmdUTE3t3dF3p3JdNg5iGqvmBbCA2D2ZyMt28vYbKINscykQD5
         /+K9zJC1VsGgpDfUyMYnDZhwmvXHRgxHERRAhbzYCyUYw7BhayGvRflc5yen0RGsQhWR
         DObMucb+FayjR6nG7FcFoaZ2/20tStO26LOwyRJJyohp+eQdys6uPv0jNKhTnusW3hXQ
         dUeEtaIgf//pt2VnXuoLJ/Q52H3X/0iajSkK7ms5nRZukJCmtGOodAoXyLCSycbnIHnw
         BHnZxkA7nqca4MViDjIWh+OnXm+EXW4IHQJlzw8YcgYOSaLKCZlCHYIwJi9aYuKFdRwL
         XR6w==
X-Forwarded-Encrypted: i=1; AHgh+RpEY1V3oD1bET5/OH90Mr88UZrZC7ny6l2Q2EILWBwu/xyaTqeobXa+VmlKLNgJ0Kvu1RMk3VzO5XC3@vger.kernel.org
X-Gm-Message-State: AOJu0YxFMLfwPUT1vUhQh3HscY6c75EccfBBxQlCnIcBkqUMEEEf9Iyb
	gxRaB5ZADXqxGG88CfRP1lmHw1tIUd2FGL1v6JXoZLEn9SdN4pfHhvXk
X-Gm-Gg: AR+sD11vZXv6OG4I2rBl9W0kqg7C+1J5lP1La/U3c/cf6VwRrP/M10KtvabzP2b0hTx
	lsY7KVwH0iAQFZ7P4q+gYuA91s7kss2KVAuQtL6uuLxf/4plDj+xdIJbXtHz2uDfguKe0MpLqw+
	H8Gt4VkcpHyB7y6OfCQsIetaejv3kN3RpEH5/uTsa+lW1+gHr3PYt/X1IUgaSr3YO2cgV7b9Qs8
	W28Z0UEZmlOMTMdJgEksbrrG2NPgEd901JL9Wj7QZERks57y7VSCA6BeMylJdz4yv/PFw1pcJ26
	0BANkFdwARLM8gBf49Bz/JIXeaAu9F3ifBBpSIBHy2MldmDMCu7sCS9kBc+x4bUULXiBt1Kt8lh
	cFY9t2iBvx7hsOYPWc3he02PwS7hpnLTs65AXD3kCafPvni92CGPm0TnLoIHz46IdD8/Goeq7XX
	B0vJYV3Neo4Gpl8g12LKme7zmVqny/q7qKRAdU6gR4X/KBfdvguqFmaE7FtV0ko+LIDTvjf+/Vz
	j5S
X-Received: by 2002:a05:600d:117:b0:495:549f:8a86 with SMTP id 5b1f17b1804b1-4956a631813mr47293275e9.17.1784752006510;
        Wed, 22 Jul 2026 13:26:46 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c631fdsm8705649f8f.28.2026.07.22.13.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:26:45 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: aisheng.dong@nxp.com,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	ping.bai@nxp.com,
	linusw@kernel.org
Cc: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	kernel@pengutronix.de,
	bartosz.golaszewski@oss.qualcomm.com,
	andrei.stefanescu@oss.nxp.com,
	khristineandreea.barbulescu@oss.nxp.com,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] pinctrl: s32cc: fix unmet dependency for PINCTRL_S32CC
Date: Wed, 22 Jul 2026 21:26:38 +0100
Message-ID: <20260722202638.135277-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, PINCTRL_S32CC selects PINCTRL_S32CC which needs GPIOLIB, without
selecting or depending on GPIOLIB.

However, other similar options in this subsystem actually select GPIOLIB
instead of depending, so I think we can do the same here.

This unmet dependency was found by kconfirm, a static analysis tool for
Kconfig.

Fixes: 94cb9e8f2707 ("pinctrl: s32cc: implement GPIO functionality")
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/pinctrl/nxp/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nxp/Kconfig b/drivers/pinctrl/nxp/Kconfig
index 711c0fe11565..fab725f250ab 100644
--- a/drivers/pinctrl/nxp/Kconfig
+++ b/drivers/pinctrl/nxp/Kconfig
@@ -1,10 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config PINCTRL_S32CC
 	bool
-	depends on ARCH_S32 && OF && GPIOLIB
+	depends on ARCH_S32 && OF
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
+	select GPIOLIB
 	select GPIO_REGMAP
 	select REGMAP_MMIO
 
-- 
2.54.0

