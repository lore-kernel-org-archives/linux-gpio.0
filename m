Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EC732ED5C
	for <linux-gpio@vger.kernel.org>; Sat, 27 Jun 2026 16:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782579271; cv=none; b=tjGNNyT+vYNYFb7OQqEmyUJrz75NRqIM/kBsem3PfwUBVIi4ZgbZLICALp1rl/85EwvwDgtoC8xfgXvBATWPqNAAPDBgNs1bjAYyes+c91IHBExXrP/n2yWmlWJjhabIAkAkY7hHsQgHow3H76BtKqaaE+LOzZnOCPAkolWWp1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782579271; c=relaxed/simple;
	bh=zOvpCGxnOBwIn7/1Q6QthKUpouyCF7ymszHTTQz3WRM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=iCvOTtP865AVjT5B8v8h03sm/4ZVyzHk/be5zVjnTWOeorZsgMBn3XAC0ogmnI5euyUWE512mtlDyukvYB/0smGe7i2ofl70D7a218tdUvHAPK+Z0Hsi1xxQgpbAaqv79Ps0MWdj/wMP7/bnkLKJbgOfoXM5fCHosuWJbBe/a6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=CgzCXiNb; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CgzCXiNb"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260627165421epoutp04f8f6379eba510908d15b2b2692dd1303~8-mTNcNm_1358713587epoutp04c
	for <linux-gpio@vger.kernel.org>; Sat, 27 Jun 2026 16:54:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260627165421epoutp04f8f6379eba510908d15b2b2692dd1303~8-mTNcNm_1358713587epoutp04c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782579261;
	bh=iQEM45cUDwzTclb54MpqDmkDTdasaCWNzzB5ndoZ5hw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CgzCXiNbBY7afAs9Rz6wzTErLB0EPUPnsSphfdPBetip8v8lvNbE9CJaDA7Nsrri1
	 zTnwcDMwoDzdoVXFKQOjpbXJZkgDk7NCrFa8RzhPgmHhDHO2KfKbr/24xQQFu5LvCo
	 0fj5noaISbLE3dIZ5JYzLtnLpeBCken7ZTr+VBBk=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260627165420epcas5p2a98425aae406907f36200cb0b2fbc36d~8-mR9BoM31145411454epcas5p2c;
	Sat, 27 Jun 2026 16:54:20 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.91]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4gndtM187Fz3hhT3; Sat, 27 Jun
	2026 16:54:19 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260627165418epcas5p1186eea5f8dc54d16a88b8298f6cfcf61~8-mQkK3DH2446024460epcas5p1b;
	Sat, 27 Jun 2026 16:54:18 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260627165417epsmtip1bbc6f887bbb317ca61edaeaa30afe067~8-mPGgazx2364623646epsmtip1K;
	Sat, 27 Jun 2026 16:54:16 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	hajun.sung@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v3 4/6] dt-bindings: pinctrl: samsung: Add
 exynos8855-wakeup-eint compatible
Date: Sat, 27 Jun 2026 22:42:26 +0530
Message-Id: <20260627171228.2687857-5-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260627171228.2687857-1-alim.akhtar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260627165418epcas5p1186eea5f8dc54d16a88b8298f6cfcf61
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260627165418epcas5p1186eea5f8dc54d16a88b8298f6cfcf61
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
	<CGME20260627165418epcas5p1186eea5f8dc54d16a88b8298f6cfcf61@epcas5p1.samsung.com>

Add a dedicated compatible for the exynos8855-wakeup-eint node, which
is compatible with Exynos7 implementation.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 2b88f25e80a6..802911e23aff 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -41,6 +41,7 @@ properties:
               - samsung,exynos7870-wakeup-eint
               - samsung,exynos7885-wakeup-eint
               - samsung,exynos850-wakeup-eint
+              - samsung,exynos8855-wakeup-eint
               - samsung,exynos8890-wakeup-eint
               - samsung,exynos8895-wakeup-eint
           - const: samsung,exynos7-wakeup-eint
-- 
2.34.1

