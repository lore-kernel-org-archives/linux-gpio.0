Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CC3846F;
	Mon,  1 Jun 2026 07:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780300356; cv=none; b=agUZRkuF4pVfS048bODZwAYrwjvGHC0x5LKQFKc06gndtn98VNlJPpYvoxXhgSY3Mhq+9mtiz7jFOcZU8+ucvkXkzIRu4jiJz61a//9xixqg/vOVySHxJOw5LGBBZvFwHki89jMHGM5yOQQiaIHNfPx71wFnqNNa+wTQgOhmw94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780300356; c=relaxed/simple;
	bh=LOMO9GWgNNdWsYyAUHvLgCWvPPNB/cjP0SOAB8OOXPk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dX/8DGLZjJQ9rQnaSbn09ksIl7bz1sTHWXEybLRLLTiDd7kBwk8l1yYUJTbp494T7cyP0Gb6mQIixuuoBA7q6rVupQVRwk71rliwvkWFHGske1yl5O4xQwNxQBspYnQdjiV1mw+FL/WL+J9WxMasFpJHx3EQvauEXea3WNJ7hpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=q7+4vsnF; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="q7+4vsnF"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6517qTvS51893637, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1780300349; bh=3tnGoJVBgyresHh4WhQXajr5WcvxD5sfStjgv+H/9as=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=q7+4vsnFOzYQLRmoqIsPxActb2g4PsUUNUDauVTp/cjzpEg+rfoaiXTFMYKOr3k5/
	 1ZbLumOLxEmNxmnoQuq/DCx2eAa8SnUPK6gIEqwZDZz6Ba4t3Und0JmxXHipaup8dL
	 peBr1l6ugCbHViA/bsjr9kw42f8oiVQUw6MWe3hET1TMtULosijHqH5mrb0ZaYSLSv
	 x++55g901Aaa1/YfDnOXU0hR6I+P1ujsPwQNk3eWS9exBVytqhFxAiaewfGylgH8A5
	 sZa8UplKCIQJuZDqUv9BUP3ARMl4JEvqq3BdlaGwLj350CZDRkPC+trHxkw4XbdCtX
	 g8kHZzHYi972g==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.28/5.94) with ESMTPS id 6517qTvS51893637
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Jun 2026 15:52:29 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 1 Jun 2026 15:52:29 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 1 Jun 2026 15:52:29 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS03.realtek.com.tw
 (10.21.1.53) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 1 Jun 2026 15:52:29 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <tychang@realtek.com>, <eleanor.lin@realtek.com>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <cy.huang@realtek.com>,
	<stanley_chang@realtek.com>, <james.tai@realtek.com>
Subject: [PATCH] dt-bindings: pinctrl: realtek,rtd1625: Fix input voltage property name
Date: Mon, 1 Jun 2026 15:52:29 +0800
Message-ID: <20260601075229.2936513-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The property 'input-voltage-microvolt' is a typo. Rename it to
'input-threshold-voltage-microvolt' to align with the standard pin
configuration defined in pincfg-node.yaml and parsed by pinconf-generic.c.

Fixes: f6ea7004e926 ("dt-bindings: pinctrl: realtek: Add RTD1625 pinctrl binding")
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 .../devicetree/bindings/pinctrl/realtek,rtd1625-pinctrl.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1625-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1625-pinctrl.yaml
index 9562a043707e..adc5955a2047 100644
--- a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1625-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1625-pinctrl.yaml
@@ -110,7 +110,7 @@ patternProperties:
 
       input-schmitt-disable: true
 
-      input-voltage-microvolt:
+      input-threshold-voltage-microvolt:
         description: |
           Select the input receiver voltage domain for the pin.
           Valid arguments are:
-- 
2.43.0

