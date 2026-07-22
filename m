Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EFF395AE9
	for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 21:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784756001; cv=none; b=UojmYuq1Use/TjhQ3NlQUC/8SoXIs0XMlgMuwAG9VDKe48NGGTeelCYgIDT378QWx05vAt2zg2sAvzcEbrtJhMTWtkqbrZnDYykA15l6Oaby6xHl2u+ibU3Wj577bhKag9dxTO2H6oBnbsrczT2p9gyOFubo/6hDgK0b6vZMbeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784756001; c=relaxed/simple;
	bh=2e0xDu2AW5V3cBofm7LJsyVwm3nbqAjS6LPFU7pq7Rk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VxA4FNkw87XVrmL/kjbeGWSf6g0QezIhPfXc0zRfhE6/FgYKcXl5h2S45S2ktzf/712sUWEBakR3LMG5r//H56NkPbY4nPTFgIDiy3Eg0shSRWoFsWKvwyCOIo+gM9V4NdW60H/N1wrslJ5IcP5ISoz2TSxF1ZPN8EXEOM4BrVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3thHppy; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3thHppy"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49558ce01afso33243085e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 14:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784755998; x=1785360798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCob+FZUcKF6Rewr+4ZqyG5zkKuKpbnhgU0UJDlmA24=;
        b=i3thHppyVMULgMGrrc6fcUik/ZKU0j1kL7ZhFyVZ5HWINrdMqWxyCv2gOy+Xrfy30t
         rbp1LA2QqXIVzmyIKQvUh8J/Wm4Tbr2aFo7u9DEd73n8lgBdZNOXrb/Xw8bp65CrhNM4
         mxgBYhdmNqLL/gbJMj5KQ6vH3B7a9Fy35AZ7oYCDY8UZA9FQnHIcIUmC8UcCBBnt8RbE
         FwHSwB3vaN8tm5WkkqJBta87OYRGOuuBP78l/g42ceQv/Zzjl2tYJPyzoj5ywkdB+qpC
         8tjyRvcoY29hPobnH93swMKYc+itgFz+c7tbjPThAcHh0jvQFBZ2eR8YDVvWvqCO2M/Z
         KgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784755998; x=1785360798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vCob+FZUcKF6Rewr+4ZqyG5zkKuKpbnhgU0UJDlmA24=;
        b=l4JhpJ2O0qMDDtEnYbHNKsAbHaLuhCSZeo3bggLuHu5SUIngjzavbe94TW4T9ht5/s
         UECuR10uU5ACfUSLvT6mVUL+4EVxshoZFw4olNmw2XU3dtzh9h/QeHZBK7swfwPB602B
         xJYQ8akj5dOVeyR63pt1Oxe2Qx+3u2+MW/ITKNyb18WKrAPKYX9AelAZV+0L76FYXzJw
         LmmGbD7lQ5pIDJnisnyVMOSz/mWxT1i2Ir1DCF0OW6m+cZVNX2vglBJmESZOn1366OX8
         jtVQrhJcwhho/n748gJZ443AxjuLyB3zcc1+p8Cz6MStsLug5S+ZUGLnNEuh1PBPWucy
         me8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr0EJzosYXBDMM3tdUEtfC7Df6vrMOn66l2XHwipfSYfLL/qjNWLXzZAE35Vr08lD1sGHDKxegzp4HX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz1rXJWlSPbueGHgrqcnkC1w5wc9qa9SU0Zs1c15eAotZ9uO1l
	+JSePP7bdH5iT6w8lTz70L8jS5Q5P4d2sWBhGtOHjDMIUjwf9YxPTOzz
X-Gm-Gg: AR+sD12KmXmyahvPp6z4UneZ1ufvP70WH7sci2HyYLgKxIXX849xc7K1N516lhtOt99
	7ji3j193N8pau8avgVobTNuyevnqzHhWyaHmdlrniHN5ks4V/U3KkXJKIomvGdaaxMxhS92ou3o
	A0kLOhx+QdmR+9P394EJohqMzOMU9guUjD6mES7BTeFVkUFRUBD03U5ImyAYoAyKcFf/4M8xQSq
	45hFfBywxRDonv8UyO2sew3GDQlU0TVky1SgmNqdCSGJwqzeSk/61pK3HzpZ6kRtwUobz1HITkH
	xeTA8lgCYBkHMvU9HUKgXkHX7ZFh4I7iS2Rbzl4SYVV/+xRVZvuRsWRgdgCpKogtDJjKDwhLQ4x
	0OwW9u3vIGfXNfaV/851e0qn10WN1Q2d4iyuFt5Qi4D6uHiB4XEGh6vjif80Uf4d7P+og/t2ltQ
	a7U1Rc/CCbbbDuj+S/kBZa74SAJQate8Wc6S/Dmo93u8TByapsSnJeHUEP1F03KDZjdQ==
X-Received: by 2002:a05:600c:4ed1:b0:495:5d6d:9cb3 with SMTP id 5b1f17b1804b1-49573d13756mr3467475e9.37.1784755997906;
        Wed, 22 Jul 2026 14:33:17 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c7880dsm9358636f8f.37.2026.07.22.14.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:33:17 -0700 (PDT)
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
Subject: [PATCH v2] pinctrl: s32cc: fix unmet dependency for PINCTRL_S32CC
Date: Wed, 22 Jul 2026 22:33:14 +0100
Message-ID: <20260722213314.155310-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, PINCTRL_S32G2 selects PINCTRL_S32CC which needs GPIOLIB, without
selecting or depending on GPIOLIB.

However, other similar options in this subsystem actually select GPIOLIB
instead of depending, so I think we can do the same here.

This unmet dependency was found by kconfirm, a static analysis tool for
Kconfig.

Fixes: 94cb9e8f2707 ("pinctrl: s32cc: implement GPIO functionality")
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
v2: fix typo in commit message PINCTRL_S32CC -> PINCTRL_S32G2
Link to v1:
https://lore.kernel.org/all/20260722202638.135277-1-julianbraha@gmail.com/
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

