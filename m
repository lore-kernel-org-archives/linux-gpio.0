Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513280;
	b=sS/Lu76yx5bCG0fVNRx4WEgMWZOzOcxgjx4QXZSoqKLsLcVIHaZJau/bKvzrxTCAGwGZ
	 hwxQ87ovRfMT7yALDQTQv3crkM/YLPYlNapdgQpGuTjQplMxMHhOGMgpPvewyQWN+v9/W
	 Z3NzLJoMDuikWYKWblCuZuR7TiekY0GscoudZgyaeHWPrRxei+izFVYgYjEHKJcXJ7LXu
	 zaua6Sz4Qzq+aZmMmWP2X8mQMWJNcXlveKuwrgc8xJvhgiBSGNniEIgL6Z/IzbrhX9yYK
	 hsfiB0bT0fJ3W84iqHasU0KftP6j3JdyvcIB0BXuk14Npn3JJQE/WGWLhUXH1It0I0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513280;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=nQiUts7mTWd7FNT4qvqNZ1vMEkZwawFBIwwo6WGDSL4=;
	b=2Knj7jozCUXXJ9WauTWwEu+DbtKzcM3ETnKiAc/SMaDBBDPo5NYnbSkEONeBDJC29oKx
	 LRAAO/ecXr42BnKr4c6Sl53mr64NZTtHL/qq8JeBhA5xZ8LicRWXel9fDn1CpUmjuW4Bs
	 Vpwig522PBqqvHhuuZH6osKCEGU0U32rccPsfSR9ycktUT+6AFniGEMk31hbc20YF2WUR
	 tJCPr0ZvyqkHQjlVlAsQgoPzIJFgMjQOcfdz4GrmH0u2oQaQC/0jDCozGZYANavUX4TB4
	 wbRyNXdyJ8eDrlcTJkJjiY8XHyj8wIYeuhiRtyTQadv6GqHmmqHTnbz64IZ/MRjMMkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3CC606A682;
	Tue, 24 Nov 2026 09:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A3CC606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:dffc:4a09:a431:737f:f29f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xVn1O-007e57-0E;
	Tue, 24 Nov 2026 10:41:06 +0100
From: John Crispin <john@phrozen.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 5/9] dt-bindings: mfd: syscon: add airoha,an7589-iomux
Date: Tue, 24 Nov 2026 10:40:55 +0100
Message-Id: <20261124094059.3882014-6-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124094059.3882014-1-john@phrozen.org>
References: <20261124094059.3882014-1-john@phrozen.org>
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

The Airoha AN7589 IOMUX block holds the 4 bit mode field of each pin.
The pin controller reaches it through the airoha,iomux phandle. Add it
to the syscon compatibles.

Signed-off-by: John Crispin <john@phrozen.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v4:
- Add the Acked-by of Conor.

Changes in v3:
- New patch, split out of the pinctrl binding (Lee, Conor).

 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 4d0cf16fa820..8bd9e8b8a8a8 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -24,6 +24,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - airoha,an7589-iomux
               - airoha,en7581-pbus-csr
               - al,alpine-sysfabric-service
               - allwinner,sun8i-a83t-system-controller
-- 
2.34.1

