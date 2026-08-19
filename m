Received: from send124.i.mail.ru (send124.i.mail.ru [89.221.237.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5324481FD7;
	Wed, 19 Aug 2026 16:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.221.237.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787155639; cv=none; b=WkdPjlTRmfkaaBnBP/frQpxxHwyGmgI3x4SgWxInzBzDcn7kUUGm1i+o7UpsegcJ2nCZtnSzkjPGm3VT43LieHmKJIHr/VPqxBN4c8pGH4KkZNdu9mp6249himcr6Y0Bru5ER6pbEKosYNtKulmOfqtGKYf0qvTkNdirP+lv1x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787155639; c=relaxed/simple;
	bh=xBqnBfBKLEG8sjYRqFpUKjndbTDjiv3TYBMWu7iKuDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oSRR4B43TYuE7e/pTPadh+c8f2RbCpF6uk/rqpweQtYXzEoIyN2LCfh3rqO/7QT0ByN5Lqx8Knv7mySxhQ35aFGykskTdUJ/krn15o/9+3hTce8zGrs8eDQPw+ZC8dgyl/9qnF61WxvVt16+bfEsIQxJFRTkpMDUvORwHpj4+8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru; spf=pass smtp.mailfrom=mail.ru; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=ta9saF71; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=iwYs8sUU; arc=none smtp.client-ip=89.221.237.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="ta9saF71";
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="iwYs8sUU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=pELxzKSvgVJ99Xuv8x8cXEjAuIYiacCmlIC/ElbO9ig=; t=1787155635; x=1787245635; 
	b=ta9saF71O7IE4QDQVKlexzwrZUfdWpwJvyW/AMV6iL4M5cb90c9E+B6oy8U4fIH/glzrLRdjUTN
	WUnkIeTk4Kq2mo90hE2TgSPsdtqyjuRWDCcArd9HjV7rgSK5aNmravOZVihgRIikgsUmH6YHxzcWD
	xe1tTxtu9TjZX51C3EBWfmq/EpSOD+4OXYshmPYNX6JJz9VO8NoYu1S9YX9vUZy6Ttp1NlN70YojM
	ej7c5fKEB4/ZAWUjRazY4Jff7+g6ctJpxhc+JxGJ3uc1NJ6Na/1txEaBHg4fSTGvQJjmAk2jcnDOO
	10AW86HDFcXw7VQPeJ6VQQr7JyStRnvYU15A==;
Received: from [10.113.217.27] (port=51922 helo=send59.i.mail.ru)
	by exim-fallback-cc5d6c65-9h9q8 with esmtp (envelope-from <misha.zavertkin@mail.ru>)
	id 1wwiaD-000000003Wv-1A8o; Wed, 19 Aug 2026 18:52:05 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=pELxzKSvgVJ99Xuv8x8cXEjAuIYiacCmlIC/ElbO9ig=; t=1787154725; x=1787244725; 
	b=iwYs8sUUBbXFviKYyP/vNyZY//fdps1c0b0K5v9eW3ELw74Vh72XFuqy4Yygsi5sf0daigA0bLN
	pMu+KBmFkEG9zHNVebKKCrd+qtyTFBCX3Re5qZf9A0MkucMwp/MAsiY9RskmduejN9ttC6UeTKj/F
	1gNNXsF8z2k+ilTspSol71RLo02s+gwO9o5dzqEuyqw/OIxMEbnIcgDxsPEaGv6SOQjo0GbCSGsEF
	LXPUBT6zRec0xxkcpz1ZgUBprL3RsS6qs0PARhIq+bClVTsIOyPaSYk3KNOs5Q4tYZgtz/rLzk8qg
	Y+MZ7sEp+Q8ZGcIur3mzFBqu6PwKq815ap/g==;
Received: by exim-smtp-67896c5f6-wbjnj with esmtpa (envelope-from <misha.zavertkin@mail.ru>)
	id 1wwia3-000000000Sv-0B1S; Wed, 19 Aug 2026 18:51:55 +0300
From: misha.zavertkin@mail.ru
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sander Vanheule <sander@svanheule.net>,
	Bert Vermeulen <bert@biot.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zavertkin <misha.zavertkin@mail.ru>
Subject: [PATCH v2 1/2] dt-bindings: gpio: otto-gpio: Add gpio-ranges
Date: Wed, 19 Aug 2026 22:51:35 +0700
Message-ID: <df4e9924282ac9e719c693abb5e39201f172579f.1787130560.git.misha.zavertkin@mail.ru>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1787130560.git.misha.zavertkin@mail.ru>
References: <cover.1787130560.git.misha.zavertkin@mail.ru>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9D7C1672FFCCD5B16BC9B61FE578F1AC39AC280B6025B67EA1313CFAB8367EF908E2BE116634AD74D9DFE2739B2E791763DE06ABAFEAF6705B8A9B84F634CA03CD4879F5AA7E5201D406EA159844E9C80
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE76042E2DB3E33BF2BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566590F97DEBB4E5ABB3415B019AC41F1361DD4C878184D8FCF02048B81B480659F8EEF46B7454FC60B9742502CCDD46D0D2FFDA4F57982C5F4F6B57BC7E64490618DEB871D839B73339E8FC8737B5C2249D6FBC3EC642A93BBCC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C084ED00A64A654CBE8941B15DA834481F9449624AB7ADAF37BA3038C0950A5D3613377AFFFEAFD2690E30A4C9C8E338DA34468711BFF199477B076A6E789B0E97A8DF7F3B2552694AD5FFEEA1DED7F25D49FD398EE364050FC1DE5D12A4F17E62CE99E4F20BAF2718B3661434B16C20ACC84D3B47A649675FE827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8B20E02FD08F9F3A9475ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A507090348B8B56F355002B1117B3ED69614A02DD4FA25E7121E49B01306B5E3AD3610D81D389A125CDE35189EBF2DEA28FEA14CD2CD220BB99C5DF10A05D560A9880EC71AF561E0AAD9143641EC25BB3915519F706774CB6AF36E2E0160E5C55395B8A2A0B6518DF68C46860778A80D548E8926FB43031F38
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659C2F31359E4695B93356DFCF9E21761C1BC80459F5F79A0EAF9E33567C8424EC158831DE65BE43336B8341EE9D5BE9A0AB177832B1AD214AFBC6085D08CE80FD91C83372537D15E7452EE4E5D9E54FDA4A7285BF96B6084FC8511FE41C8941D68F571C199C4BE91E79E69A34BD5DD98C9F0A6D2C91ED28CB6
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVd9Ysz+d4RqW369PkZBGNp0=
X-Mailru-Sender: FD65D7C492470CAEFECA98C338D0D460AE7220736C945C64B951B70A5BD4BD8E8262DF53518AC9D141CCA86846C742644B2A3C715BC1DED96EFAE8183A2EAE0D96DD28E056F58A23E3C55DE776B662A1DD77B849F69637CB3DDE9B364B0DF289AE208404248635DF
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B491D8917C1B322829C507F2E4FE1A8EB3E0AF52A84EC90433049FFFDB7839CE9E9A5E1928F9919841A407613BFE53C335F239E293C8F52995156F091FA94CF7F64AA5BA276CCDEE81
X-7FA49CB5: 0D63561A33F958A54B308CA66684DC155002B1117B3ED6967E04CDEA1D73865CCE258FEA8B6896FE02ED4CEA229C1FA827C277FBC8AE2E8B71269599799E2472
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZ0RYIlnPFovjl2zZuSc24WQ==
X-Mailru-MI: 20000000020000000000000800
X-Mras: Ok

Pinctrl is required for RTL9607C GPIOs to work, otherwise controller
won't be routed to SoC pins. Add corresponding requirement to
Documentation for realtek,rtl9607-gpio.

Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
---
 .../bindings/gpio/realtek,otto-gpio.yaml           | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
index b18f8f0ca0ae..96396f968e78 100644
--- a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
@@ -40,6 +40,8 @@ properties:
 
   gpio-controller: true
 
+  gpio-ranges: false
+
   ngpios:
     minimum: 1
     maximum: 32
@@ -75,6 +77,18 @@ required:
   - "#gpio-cells"
   - gpio-controller
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: realtek,rtl9607-gpio
+    then:
+      properties:
+        gpio-ranges: true
+      required:
+        - gpio-ranges
+
 additionalProperties: false
 
 dependencies:
-- 
2.54.0

