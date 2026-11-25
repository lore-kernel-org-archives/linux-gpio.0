Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795586869;
	b=E4z1dwBLd0U1YnZ5hI9yHB1cRlhNex9zsbp7QI6QaoF7J/Wi4YW8I0oYM6Ikiv690xVw
	 9r+9T/cHKF5ha8Lj25PyV1PBN4DV8jhgVoHLji8HqgXkhNx8zIsCZMRS/+zDiRZzX13e0
	 0jq8Rzhf1hXIQZBTxcUEkvL5B20WziMRdSoGNDV80FGBskKbq3XpIkuW07kn95EJw2+sF
	 +N1hYOGDkCIlHCgzrAoVrk9o7aGH8OctY+x8bIOSH4mCOpQnLj4IfPFYKrP8oU4okS2yL
	 4ePTa62Qdylme2yuNl9bTVHboh4xxjutwZbeZqA7VGkVMRhb5tyEz+oZT+0wrLqQRhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795586869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uNOvfashgWVnAYYWGzUdcUIW23Wlm/O6cLEys1MSUjM=;
	b=CMADMi9pDYhOCNOkPIBx37mLUu9Ss+K5ibK+H4nMq5d4h958ZKc9VUj7lLm8oJraxNHF
	 LnoyqQmIftR5HqZ85UD6aiVt5ROy3O6py48HUVBIufmXrCsJwvKZUg2h1jdRuSHQk4vHc
	 uEbSYuBhujdn+MW5B+9C21AjCaBz4M+D0IYbXaNPmf8uHjxLn0DRGjG0jSfMes/3tc67r
	 MSczTVVQNqmjhAp6ydtVu3Fwh2ror11nWmwKg6s7DXQEVFYn8GZ9p/nUaFR1LeodZN4ip
	 wDl1EW3gV8AHJe0XHK+SyMc1f0yBA0k4/2vvmYzpTqFGNW7e0k6ltwBABPPB/WLXN3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tLjBQXr+;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F449606A32D
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 06:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F449606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tLjBQXr+
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b421e8d111so3622396a91.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 22:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795586868; x=1796191668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uNOvfashgWVnAYYWGzUdcUIW23Wlm/O6cLEys1MSUjM=;
        b=tLjBQXr+F4seW5EPloA/V/zSKMoMqGP/9R+BmO6CE6r3Un76zjlGIHDRPfK3l/xJuf
         n+hzpq2RwkKQ9vY2v2qOc7dMQvNk39WZsnxTBEGNZzk6h5XLe8oztsPGcnZi6JrdSaEY
         9oibnG98bD9aw+DELxTQMJ6ocEWGKhmZ27GA8hOb7IQGFPh0LDXgeIxHAQXQR9mVo+m6
         QtjnokSRmm08XlPig4XEbKDlk98CqNv2jw1/EhqTIL9fHxBhs2WExCDIDf97h1gIZl0d
         CioPzQclsbcRCnVIJIxcjwuwvLu0AEiT9GIi203j2ciGAquvd/l5DAHhPJLv64ZRAMCT
         bm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795586868; x=1796191668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNOvfashgWVnAYYWGzUdcUIW23Wlm/O6cLEys1MSUjM=;
        b=oD8f2IBcVt54CfCXeZPrQ4C/ucAmFk5DmLABi969geHo8Zl7o4rtXHtj/XLmp8B9x3
         nD6ZfTT3fkLSYrBt93PfJrltEqwRrTKbb/NSGF/lLu0iTblMrjrO6HM4Ax1n3N9OSb1K
         qf/mS3fa6drQsvi1VYEZoT0231KNNxGf3XFHkbxOICs98knURtLbTpVEjuJqL6lgeh5D
         UUy5Rf1ZlqxvMwDKWKIC1Kvv57imlh9sEsxmC3EWy65acAcLrEznz5avJZALbWrTJGbS
         UlFfP18ck5m10wyPP7fUO/6CR+srSNsq4CfdyDFXSapsi/1OFTux7OE9cYZrUjtyd+Wq
         v1cg==
X-Forwarded-Encrypted: i=1; AL+hErGk89swptkNWqkiznH03mG7UKzxaUA0rMt2ueLkg2X8tWNdcIoLC/qQfGMf0PhBA5Cdd0CPrULLwsgI@vger.kernel.org
X-Gm-Message-State: APuU4Z/t3CwEsiPQ9xJ8BmtEQvAnxBBXfr+yPwq2iaIxHXv9Tm82H7+e
	75DLhyH0f/yTnx4e0ATBZTOIgzTKwVrlM+OtIU7P1eP7A4h3H3srG4AR
X-Gm-Gg: AZFdTZfDc3IrlwSZPmQl5DVQl+r/Pnt85JSgbFdYoYA7cxLUA8pVG7isHOyUBN1bsXe
	chvKTPWX3V9499tGkCfmhNBi9LwE4dkWFFGKesoPjusMcCaOCeutWGECajc8JGY7IELvFXqvAKr
	qz21/tGRbD7+5HQBr1Jdt6ISYiAOGLY7endgxIL9NM3CwxzdZx+9YWhYhL+wWocmyyGFb766HIb
	NmhPuh4CUixKKB8Cdd+G/tL4jd7sfCMLdOcoEmNCWa0hOxom5Ef+CYdu8FFRamZp+I19Z2WUwV7
	4pOO276pRp73FjR+clThySVdyvzLljSjBJxUG6dPqqRnuPw4zGFq5ma+PeaGezrqQGPR8xp6vlU
	hyx1dKKDmr7FBjzWromrqmfnfBR4RCbO4sdsf80lezxUWBuZj1aZySw5EfOdfbud6c4C8IInGrd
	zwzOPlJ6wxBlJhoiwm/IDLqKIwjETstp153AWk2PQnZdP2tYVxNTkWfqawVLnTxyLV75EDPr5Iv
	ObHVKhRy8TVVU7JqWIrco962nvsJeApsdgZLh/FkoTvdL1WxG6pxQXLCMbdqpqJxF+QoYXCzp0u
	+eHREu8HeER8v1AyEukNejy9U4nM83Ts3pJSIn3sHp4eoQmUN3yJmxOcmWN2ZiTtKY/gy6s0gYU
	WSNNaWUYJoFZPbDLNZwY=
X-Received: by 2002:a17:90b:1649:b0:3b1:2810:dfd6 with SMTP id 98e67ed59e1d1-3b41cb50c4fmr16950732a91.64.1795586867765;
        Tue, 24 Nov 2026 22:07:47 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([2a09:bac5:cad3:119::1c:2e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm25931346a91.8.2026.11.24.22.07.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 22:07:47 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhiqi Zhang <zhiqizhangg@gmail.com>
Subject: [PATCH] pinctrl: starfive: jh7100: Reject malformed pin properties
Date: Wed, 25 Nov 2026 14:07:41 +0800
Message-ID: <20261125060741.14033-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The JH7100 binding allows each pin group to specify either "pinmux" or
"pins", but not both. starfive_dt_node_to_map() uses
of_property_count_u32_elems() to decide which property is present, so a
negative parser error is handled the same way as an absent property.

A group that contains a malformed "pinmux" property and a valid "pins"
property is therefore accepted as a "pins" group. Similarly, a malformed
"pins" property can be ignored when a valid "pinmux" property is present.
Both cases silently accept a device tree node that the binding rejects.

Check property presence separately from array length. Reject groups that
specify both or neither property, and require the selected property's u32
array to contain at least one element before sizing and filling the maps.

I found this issue. OpenAI Codex helped draft the fix, and I reviewed the
result.

Fixes: ec648f6b7686 ("pinctrl: starfive: Add pinctrl driver for StarFive SoCs")
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 .../starfive/pinctrl-starfive-jh7100.c        | 41 ++++++++++++++-----
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
index d89f6a4722..97c96c92d3 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
@@ -491,24 +491,34 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
 	nmaps = 0;
 	ngroups = 0;
 	for_each_available_child_of_node_scoped(np, child) {
-		int npinmux = of_property_count_u32_elems(child, "pinmux");
-		int npins   = of_property_count_u32_elems(child, "pins");
+		bool has_pinmux = of_property_present(child, "pinmux");
+		bool has_pins = of_property_present(child, "pins");
+		int npins;
 
-		if (npinmux > 0 && npins > 0) {
+		if (has_pinmux && has_pins) {
 			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn: both pinmux and pins set\n",
 				np, child);
 			return -EINVAL;
 		}
-		if (npinmux == 0 && npins == 0) {
+		if (!has_pinmux && !has_pins) {
 			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn: neither pinmux nor pins set\n",
 				np, child);
 			return -EINVAL;
 		}
 
-		if (npinmux > 0)
+		if (has_pinmux) {
+			npins = of_property_count_u32_elems(child, "pinmux");
+			if (npins < 1)
+				return npins ?: -EINVAL;
+
 			nmaps += 2;
-		else
+		} else {
+			npins = of_property_count_u32_elems(child, "pins");
+			if (npins < 1)
+				return npins ?: -EINVAL;
+
 			nmaps += 1;
+		}
 		ngroups += 1;
 	}
 
@@ -535,7 +545,13 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 		pgnames[ngroups++] = grpname;
 
-		if ((npins = of_property_count_u32_elems(child, "pinmux")) > 0) {
+		if (of_property_present(child, "pinmux")) {
+			npins = of_property_count_u32_elems(child, "pinmux");
+			if (npins < 1) {
+				ret = npins ?: -EINVAL;
+				goto free_map;
+			}
+
 			pins = devm_kzalloc_objs(dev, *pins, npins);
 			if (!pins) {
 				ret = -ENOMEM;
@@ -562,7 +578,13 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
 			map[nmaps].data.mux.function = np->name;
 			map[nmaps].data.mux.group = grpname;
 			nmaps += 1;
-		} else if ((npins = of_property_count_u32_elems(child, "pins")) > 0) {
+		} else {
+			npins = of_property_count_u32_elems(child, "pins");
+			if (npins < 1) {
+				ret = npins ?: -EINVAL;
+				goto free_map;
+			}
+
 			pins = devm_kzalloc_objs(dev, *pins, npins);
 			if (!pins) {
 				ret = -ENOMEM;
@@ -579,9 +601,6 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
 					goto free_map;
 				pins[i] = v;
 			}
-		} else {
-			ret = -EINVAL;
-			goto free_map;
 		}
 
 		ret = pinctrl_generic_add_group(pctldev, grpname, pins, npins, pinmux);
-- 
2.54.0 (Apple Git-157)

