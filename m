Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57A83E315E
	for <linux-gpio@vger.kernel.org>; Wed,  5 Aug 2026 08:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785919315; cv=none; b=WxEWiFzxak+6+a75LQclnK8rbmEktrXDeX1Uyxnh2mQBi4IkYjwVIkOGK5H1U03dTZfJN70231RjYSrPHGe3onekbnzJdkf+wm4dHSvTCdEbqikumyEEol3hd8NQzAOkTRYLNwwjL616liEDXzY+g+fDKNMIhxIhz2ZgCHPfdjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785919315; c=relaxed/simple;
	bh=l/oWp5W71NAkATODGkRO0A+w9ni3mNScsDVkSE5s4Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sC62EKp2Kx0JRCsZDYW4PlgkG57/GAe5lujjeaHtCzwsBeFOD7lSOpWq8wA90kJjBhscEo+FZYjhCy11LAMNmUzUscO8MoRNvAzd/bHiEF1+VhzZuZQYSbV47mzHYtxQpCbk/q5xBc2KvVofi+I46qCje9Nr/ywx1aS+RD6UH5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmUKjlbT; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmUKjlbT"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f6609c657so321951f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 05 Aug 2026 01:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785919312; x=1786524112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d3K5hA7CaLdIJbg5AimV7fCZLWk9OkFDdwcvRXHBYow=;
        b=BmUKjlbTaK+c2Uo/hA6ZB6BM+d3oc2KPCaTqE0FEZF5E1wOZvLCmkaQ02h9y26h1Ff
         vhmwR7k+vocoIO1i9EiVFLY/4lX50cgR4AwZeVBVN16X3y1wiAiB0aTStH7299WAFME2
         RTEYrGrLglMxtk/SvW7ocV0hRAJ2xVRIUXygVoqZz6Q8PTNK3BolrO41aFsmlxoVIVkf
         WJMGB8cwNCNFugqJ3ASpEWHk8YQE0sTz8MNy/iYcoSOJI51Fp9TbpUbPQrfBYjj1JCq4
         23gHlT7ExEtSleSPMKq7ZibSQiOkPU3yPbFii4msjE/tq07Z/Hs72AtOGfgKtpdcyl2V
         piUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785919312; x=1786524112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d3K5hA7CaLdIJbg5AimV7fCZLWk9OkFDdwcvRXHBYow=;
        b=C2c8r5liMVDTup/1/qyPG1aOVpdCaBhyHcn+Ar8ipPaYX05Drw78gK/3OgGoCQlopH
         fg/gnaVk/kqemkEq5kBX9DN7lMUZFyDPI/AredWbNxvWBcTyaGykWUdYIA23QLgYABqj
         sACROKjwZ5kG+TOjFTavDnvgk25ByLj25KXdFTL3xrT93pKAOIcE+ns9lEuz0vWcinWG
         X8a4t+Nr4FW5e+T2k6KFvl+5qdcln3CeXd3ijGnRxcEGdKpn3adhUlByMpxfhGbR3aFU
         p2w+HuWo+p1FkImWXvAGffd24y2a419hKdmCfQCkmQNCnRkXZw4WHfUU7egsm1kDwGjI
         F0IA==
X-Forwarded-Encrypted: i=1; AHgh+RrsAT1ab2Ga6A9B+OTo8NlqkvfZNoI5jPmEOBCuzRVF4/ZJhc4t7Jqo3IzHdPBzF7bjW9AIDzhzk0lV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5DNm6ny0Q60t+GDkTFYca137JmkrbkE9p9+fUkLHBaM5zAzc0
	JjmoVE+s51eLkYoXj9pEANQH5ErvwlZyai2u7phRyOV1TdMMMbrdeN/m
X-Gm-Gg: AR+sD13PmzD3wua45TWWXfK1n5mWlwn0JOeEwgUHaqF0IP+6KWfQiUa+t5z4HJi9F53
	dfIfgfdXsn4uAoCRvQxknqjUyps16RuB+9W7MBUcuJEtJj8/7Busgf5FqF4ZKbcinRSPpgEfM/9
	lmj2+ZJeq8C/LS8IYtQ6yF+gYXbpzIvbv93nBS9JuRB0/UlvS8crlfY8rV7aqBkaKTv20FOqLSq
	rmbFln2sTYJj8mClbFkUDGlLBIm98HKcKSkreflMjm1k3aZuFMxPgsabWdehlpT1ApAJSgL6pSz
	IaaC1OkhEWs7Lxb+F53JZxlWT1hughRZ5KYxSIvoA5Bte8yXYF61a2cb428hgXzAgbo7oc1N9fo
	KrKVhsNohY5H4RzMMOSSvtqXszvQ6Drq2z+oCLHtR4Jk3CrcRAvZtKS5mvwybj9BjCD43UyHhDb
	K8o2/C5AR2X8bKhueMrCJttTIx7ZApE0k/IcGlTFnZUYvLEERO/M5jLoCeJPGcjoiNU1HbAW2/d
	2gO4W2qecG2/9RDl2tlWXr4PRW/aj/GJK7AXn+ADFFpM4GRWrLA7w==
X-Received: by 2002:adf:ea89:0:b0:47f:9751:cb3d with SMTP id ffacd0b85a97d-47fec4f229bmr6673348f8f.8.1785919311697;
        Wed, 05 Aug 2026 01:41:51 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-42-255-151.retail.telecomitalia.it. [79.42.255.151])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47febfe5b1bsm6278770f8f.12.2026.08.05.01.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 01:41:51 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] pinctrl: airoha: fix wrong value for PCIe reset pin
Date: Wed,  5 Aug 2026 10:41:41 +0200
Message-ID: <20260805084143.3901-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe reset pin actually require the bit to be set as 0 to work as PCIe
reset pin. When the bit is set as 1, then the PCIe reset pin act as a GPIO
for GPIO44, GPIO45 and GPIO46.

Cc: stable@vger.kernel.org
Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 04b4424c688b..6409572c0a4b 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -1412,7 +1412,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET0_MASK,
-			GPIO_PCIE_RESET0_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1421,7 +1421,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET1_MASK,
-			GPIO_PCIE_RESET1_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1430,7 +1430,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET2_MASK,
-			GPIO_PCIE_RESET2_MASK
+			0
 		},
 		.regmap_size = 1,
 	},
-- 
2.53.0

