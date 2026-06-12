Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9D638F24C
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 16:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781280704; cv=none; b=ehnHX96R7e5ZkS4jPJPJirfxsXIdr/IA7RDXzgIfu/m5qzHwSFqFAAzTIQ/NecI3t2jztAT4JiCyaTf9uFkkXH5wJb9kyDGBw9sM2vWCXCNIe7ianEVDjNtcxeasVG3ueI6HAZV3rF0Hzzr1GtzX2GmAjYd/6TcOH8tu5Hqphv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781280704; c=relaxed/simple;
	bh=Coc6+axgNyuKZ/w9tZNcDBOAp4QRsPLZuDPcvvKDRkU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=UNyBeBMKe6noHkpzEOuj+aAXt5GBIEWjadD4p4p6ZraTppYYehzSTIletTUtQl9S6HcHmoueQ42nSbVzEd5ESZCug/oSt9KOABixhvaWN/mhD/xUCz/ifJiVtJL5nttrRAmWv5FWGp1/NvKLoHPlS0MaUf+jErZrjFtFMl+ZeLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dj3m9A+U; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dj3m9A+U"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260612161138epoutp0401a112024a5177e59428f6e0d77906ad~4YVt79YXW2799127991epoutp04R
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 16:11:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260612161138epoutp0401a112024a5177e59428f6e0d77906ad~4YVt79YXW2799127991epoutp04R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781280698;
	bh=Cz8/kWNTiABNBQS/iHlFdfUP/vEMQXqsBrLkZrtPWyo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dj3m9A+UxXTr0RLiLrQHFypwCXLvwhSWdtTT8WL+uwCwb+lwdhdKIjZ8PjhkOOhN0
	 H23bZZWbo/4oMuPcStHOv+wFhBRAFFpyvgRDwy3/3+mB9RsXa7nMZUwmnZJnuLn67z
	 +lOFcTtQfTIBSTI2rG49Xzmeqdnw66r4spewY/GE=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260612161137epcas5p14c3cd223be48dec5a976337b19d27810~4YVtIQNyK3233932339epcas5p1G;
	Fri, 12 Jun 2026 16:11:37 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4gcPf02g8tz6B9m4; Fri, 12 Jun
	2026 16:11:36 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260612161135epcas5p284a7b8906c3c2651acaa981db964fa69~4YVr3moSw0551705517epcas5p2L;
	Fri, 12 Jun 2026 16:11:35 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260612161134epsmtip19052f4564b5379b93b1a0c8d58b7c267~4YVqclJaV3251832518epsmtip1y;
	Fri, 12 Jun 2026 16:11:34 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	hajun.sung@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 2/5] dt-binding: pinctrl: samsung: Add exynos8855-pinctrl
 compatible
Date: Fri, 12 Jun 2026 22:00:17 +0530
Message-Id: <20260612163020.411761-3-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612163020.411761-1-alim.akhtar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260612161135epcas5p284a7b8906c3c2651acaa981db964fa69
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260612161135epcas5p284a7b8906c3c2651acaa981db964fa69
References: <20260612163020.411761-1-alim.akhtar@samsung.com>
	<CGME20260612161135epcas5p284a7b8906c3c2651acaa981db964fa69@epcas5p2.samsung.com>

Document pin controller support on Exynos8855 SoC.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 7b006009ca0e..c4773701c92e 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -53,6 +53,7 @@ properties:
       - samsung,exynos7870-pinctrl
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
+      - samsung,exynos8855-pinctrl
       - samsung,exynos8890-pinctrl
       - samsung,exynos8895-pinctrl
       - samsung,exynos9610-pinctrl
-- 
2.34.1

