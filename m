Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907908;
	b=TsIYRfR+8Hl/TF5iKoIY0OnEx/Sp9bvVJmyRzf3e7InaQzE9tQyLJwEkdkZR0RcNP/eV
	 FINfPEhKnmBKaNFreNv/17LV2EF78K91DBEgY62ubdY4X1UzwaCpr1y5oS86Gah9Izhs9
	 QU6RwOzAZn1UVFZb+gAH7za2wHnvkXMmXoo3vlcpwvaGdo2gvNqvKJR4XhszEpTtJgIai
	 by4oNJ+WterrwrXQPDjyUVOhSpCc8rjWa9WzeRrMVL2BmrJHoNjgSLIGLlohmDBclsBHA
	 riz+1/e4IGKXd7c85ldR37Bhc6rt8IMrZuVkMDrvIv8BzToXJoj+iPW4TI0/q64EJoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fdpjdk832N9BwoCOr6cdI+ScZVBChe7jU8b/pMSH0Po=;
	b=AmHxqBM+eKnZr+xI/JpADYlUcbQD1T1MoZ9Iou/cKc74bIt44oE6NKx7kobd23shogZR
	 anaGLE4Hx6YotYx/xyehm2aWpslD1S82W+RYIuG3malEheM7gHl3CDF834fpvB/Ipqcmj
	 lDbGMzquf2srO5lfyZUZhhuEfOA2zkg2t1FdxxfC1NjBQfl7axzyZk93C+aWczdIFl2AA
	 5Pw5PPjuvAs6STtQgqyGMnIyoUsKaS9KHu/0rlLXePTS01v+OtjH3B5QwGEJwiNrzx0eN
	 +xKRUpp8Gt03Frd4whMTfG2+xCm0MtTyvEGM1j5/9zU/axN6aRyjaPDJQijVHYoAnVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fXvGOO6H;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B72F606EEA4
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 19:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B72F606EEA4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fXvGOO6H
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so24004185e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 11:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793907906; x=1794512706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdpjdk832N9BwoCOr6cdI+ScZVBChe7jU8b/pMSH0Po=;
        b=fXvGOO6HFchZghMJ/v5+oavqAdwYE0FUczZPmVcjMiUsOmN8ET9E9lp0Bx2YdISBDs
         roUj3howt7B+J0uMVmcDh6WdKyZyp3SC7N31jGFtIHav/6hKW82Df2Kt02OjQ+slaZy2
         GsF6YUn4Nc+2weRAUGWJUtnPQRyrdkU9S7C2rLRJdWPNsTqni48qtxvlr7wYLCedQJk4
         F/MlCN9qRxnIQrLA3yXNoiZi1rzI8EdYyyZK1q5aoId91yTE6UJOx83RTNIJz04jkpuh
         6wq+U+O0kEL0B+qvjVs8yunDGqJ4RV+w38VGakbcBHiGjBXWu2u4+misUTWgqfRtJyn+
         8iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907906; x=1794512706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fdpjdk832N9BwoCOr6cdI+ScZVBChe7jU8b/pMSH0Po=;
        b=lWr+F3n6DAqDxctN/dNEHF+JXcYoJeMWL6BtN7BvBLiIy8kuLah93EPYxJn4Q/B+SG
         PP4tXopERPO3Wx9l3x00pMDqqASugHSjk8mOSPYZUYUz7nPz8m5k7auGRnwUhRJp+o9y
         b79ikNU30yOudIbBFSC25E5HIArcX/4RnLcQwYGJTLGPqFsxXKkdU1ZYr7Nuxneknb/G
         qJlA8vgHh9Lhf8L6QXV0FDSqmWzx5Kzc1zI7D26Bdqydlxc7yFhNswU/WzCiivnSDrp2
         Z4caR/udwykTo1IaEaEejLHaw0wCm/85rPXlaUFLIldVDdtaLjxm2mbUShp5aUKb/aVv
         lQPA==
X-Forwarded-Encrypted: i=1; AKwUvByKm7LNaRkW7ZJ+8ns3ruSH4+5rEOsNVHachxxeGkiN/cw2n/AgPseytBdiy0H9OrZrNp8F20B3HW98@vger.kernel.org
X-Gm-Message-State: APuU4Z9hyXfu1TpL1jexF+CMBg2rr+1k3LhQO7IU8N1nhDIotJvI5S5X
	2fhHhq34RJ7PjywUQLCoTplEdV7zhTDMIMBpCBUCM6wh28FCDT6aGh3r
X-Gm-Gg: AYBFou31CuCFHiOGJ74rhndPkLCO4bOYld8HLjOymzMsYBtRVZ4d2qR6hcVI5xH07AB
	9sZ4rWU8jdga9a+O0TwMtbP1DO2IIyBXa2FDdiEqcO5k+madBDzZKlES/H/KA3fRiPuUEbPLzim
	iePlcWX/L2BR5eqHNoijF06f9xnUmQFzBfnXEhYkx7CSad3NfzRurNKs8OzlrYh0apvAEBj94pB
	IPOx3/cn6cfeli4Iu+UGFGfnx1yoKQrjt9hZ1nBWFq0b0lYfTuD4uQBLWRQJbTjrXYFCw4PANaZ
	zsHZKh4ISTSvRg5YhdwcnAnGtvXt9qER8J1+6VGm7DzweMGUjaPoX6OeS4Yhez+FaGpM34OioEa
	0R6vsJjUO2X2EUc0kuDwaAIuY4C3vgfPhdfV+fgMWi/QnHrbasJTuPcgnFxTTFdMDrMe52To5wh
	hMFmPSIcnSISf1PvJX4GfPwy4Z5VRjq6q5TiDNZo0CeGQUM6bZnedXHOQfncWsqoq7g0P8lnSh2
	9IGTPlqIMwcu9/40vYBg+EhgCHS0vGehq9QrLvJYbxWbmRrg435wT5R2fVcByeaz4k5dc4cYVSo
	5y3vkekymOyFJmiC3HUlDLXl
X-Received: by 2002:a05:600c:34d5:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4b6db1c5e0emr3268735e9.2.1793907906381;
        Thu, 05 Nov 2026 11:45:06 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6df5eaabbsm4204265e9.2.2026.11.05.11.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:45:05 -0800 (PST)
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
Subject: [PATCH v12 1/8] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Thu,  5 Nov 2026 20:41:32 +0100
Message-ID: <20261105194426.1113050-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105194426.1113050-1-l.scorcia@gmail.com>
References: <20261105194426.1113050-1-l.scorcia@gmail.com>
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
index 055625362951..8ecc44a88a14 100644
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
@@ -75,6 +76,10 @@ properties:
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
@@ -111,6 +116,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
-- 
2.43.0

