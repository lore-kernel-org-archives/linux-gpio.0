Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579911;
	b=K6kcVu6LsipViV3SuboECNVwH+zHbmaYudXxPLgeBhiGCS3piqmDefxSS/TZjUuYkhdp
	 DsaY2GXf/n2zllSaqdENyODRMwKRW+9Iiyy4kik+sPXy7WiwaYpT0ATOvIbonbPOLwX/w
	 V34ZRsEDuuSWhcdZXrMXQdabwwMJ5WMhmi6EHbEuda8L5aWQhocphQKP+EnYWeBw9/7a4
	 rtnYIBwv7v4PFAYdmXRjoTPj8Ur/4I9jH5pK1yH070wXNwhM0BaiT4VolJOdSgwNhUhcy
	 TAht4Bv8stcjwRuYRskqOnjsDiVZYUl0hVqpy3r/aNGlPf3fZfGlNnnaoX2C9fID9DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LPY8vdhVi6Xj88wwWO8EGGblZmNfcIUJaJL4gRNaJy8=;
	b=1OF7MAdSQ298PJTyTjGahBjkjOSMo7cjlqHQE3Mcns7OCKA2jG0aE011yObj29Wg/QiY
	 EvTQBiMIG7J/VRf2osyvyZHRELMYygS0JeGL+BSLE6NFAbQkrMbjjoBxcggxBf8tyxaFv
	 czNpgNEZ/9VAEfQi2MzyLTfR31fYIkJ1DF9PsypAaKGkKutrFZu2kDRx+11TS76Snb+Jy
	 wt3B8YGPyMrl9THfEJbIDy/QE8EtEw9yYznUiUxHxCXeXXyy1FkPkqbPOyHfSI1TP6FBm
	 PxI0iy3tLzqwn6fE648eBRceO3IFih2+3eUYLhIT+gYHmvSPSyu2ok7fO0Z06AdHvdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YogfN1+C;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A15C606A319
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 10:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A15C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YogfN1+C
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so4083815e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 03:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792579910; x=1793184710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LPY8vdhVi6Xj88wwWO8EGGblZmNfcIUJaJL4gRNaJy8=;
        b=YogfN1+CAf8JdXWXwZ7r6WzUlJC6+9QrZ2QzvQ7egcgdx4YlcjZmr8Wkq9xMSirwrX
         TQ3akbrh2/vSRJO7DX6s/eGHPkvD7n3zkOkFJMTFj4IvhQAEpMrUQBJEPwa4oP+CzXuY
         vowBguEv9A5WkWSVU6lpkVFR6GWylkbKA1AmGL1KfURAgMOX9BIgeG+lJ0Q3YnvsVK6+
         bvInFcxanHjXF9lDsdu/eX5D4W9tKVUUSpJ90nfpnp2+oBi+QIGjPSVvqP0feb/LGVTU
         Bzte3AyM/xczq1BDIOsPD3Qf15Ssq55++QBt+U6CAhg6W54uPhdf5R+7R81UiF0BbWku
         jB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579910; x=1793184710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LPY8vdhVi6Xj88wwWO8EGGblZmNfcIUJaJL4gRNaJy8=;
        b=XxdkEro7WNm38L6gLhPi4aQ0ovu7KDvk3njDU6w70fExgn2p6Z2eAr71Nxw2G6T+YM
         nRWJVgeAmY9ntiDhDdMpb3J28cd2dTqZQyuWH6CM3eYsph/EhnU3EN3xW2PnNsy28dS9
         FMFXwrdCni1A+5MPgDc9VjN3ZP4BLJo2KzQauSJN8RRrC0WIcOIb9rxPqe+WinVOPI90
         AwDyPuw9PubczKCwMZ75lJk0ymjGQp6TDE7mM4/v1snpGH3bhlZH366POb2shqgZ2WOY
         0eSXqxRVGkV/WUukm/0x7d/WTnpmX5Cs63TDxRTcTN+oa7aSiSBeVJj47KgCHRhyLrRJ
         wXWw==
X-Forwarded-Encrypted: i=1; AKwUvBxqKhXxAy+AJqQZ1OUKQxhzwqFmf8zAjLu2u23kkkSWNw97ps8CDbneCVZrJPyiLF43MP4QmoF8qg+k@vger.kernel.org
X-Gm-Message-State: AFq9FYIJPHy5YPLnGe19pgsmaJBMKGOO5o9U3OVRXADbFWBDsQfRmz4a
	iVQB2iuue2KJATCXaMiXdc1Tvwrg+1YgQQwFFfTUHKIhtpfyJQ3vNKuh
X-Gm-Gg: AYBFou1PQGr8/mBPSOyuxignM+dqNtQH8c7SyJyCUraGnFfoJe3LWfbWawuTfaPSs8V
	YoP66NAyRS9aHh4HWvTHQ8iaNK8vCBmNUTjtwLVzOaa3jK8dTlm1tzWuBNPTDXnpU9J0PVWJY9g
	G8BKPfi6wsbnjOxx1HpGJSTJDxV45qEMezNjtWtuACF6kP0e+ccbL61++HbruyQmkBwhWuyS7ly
	t7nroQ3tzvQ97k92GmhpAqIbRkn8ENj9802HQyfgJgHiHonxuzjN8PRqL/oWszTMuLkgI7dUeiU
	6zPienAaEtgXpkxhh9D+KBrda+HlRhO69LE9VqAo+9O9K8rNPex0jWYRn40RnSNYN9hak4fXKPI
	Lu46aYxbK9GKCS25tnKA60A0YQUAxMQ61gxihl6mmT5zMzvoKk72PkgUcrPYrcjm+dAieTcO9MH
	KK3MUGEJKV+61ANQb0Izk8CJB1P/5WQcVY0EVPfgsA2aza7lmreMT0CnslAJ3nEA0hNRl8o+p17
	xkMFJH5oYV1toD2zH0klnr+OV0RM+b+Zonkf0zqx/xGHBWx9WU=
X-Received: by 2002:a05:600d:4447:10b0:4a1:d1f7:bea with SMTP id 5b1f17b1804b1-4a1fdd1e568mr25614785e9.17.1792579909764;
        Wed, 21 Oct 2026 03:51:49 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:51:49 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v11 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Wed, 21 Oct 2026 12:47:19 +0200
Message-ID: <20261021105109.199886-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
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

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..da534fa324a8 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt6328
           - mediatek,mt6358
           - mediatek,mt6359
+          - mediatek,mt6392
           - mediatek,mt6397
       - items:
           - enum:
@@ -72,6 +73,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
@@ -99,6 +104,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
-- 
2.43.0

