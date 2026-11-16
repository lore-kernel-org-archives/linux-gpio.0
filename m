Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851348;
	b=MYFu1okTFJ4n2GMgpz82K156vz0bnoB8+SdCA3h8IbjJPxecw3jsEHuobsYAThbr6g0z
	 f8pb29m69EXoLwgMd+SOZrYBfTLQI+HxjfAOP6Fim9eXsquRrI52DgxyMcDSpq85VUYkW
	 GF4YRwcovW/IK8tM51EezQ9mnUabLE/3J9hJ+nEjZukCpHfyNVYX4i+tX9wY4O581qwSm
	 V8HXqbQY1QMj4BCQkHHPD+B/9Zhy/gR7ROY04hGbAzF4Fa2Bikkzx5aJM9fknZo82QQxV
	 q401tm//xi2BbXUYb0pk7GLPVtEfVr+S6Tm4QB0rnhYyp2VHYTuLTP/fFIQPk4A8fFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851348;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=77l2IVMUCUed+WO4RNie/mh0zaBbVd8wXt8Ok87wH94=;
	b=TE8B/mlzOndqVDw94Hhk1TLSFL2tfAVmI0XzHh0ICDNH72ldNnR/17bhgiOBIeDJCzBN
	 C4tuzqUDMVGm/onpIQfuvGggv6l23WZ3Cck8f9bOL171sWm40wn7wQgLyHekK4omyU0zg
	 fY6S9aa4T9C6CDLuLxsoYR5VLQ3YCDqhf2Awnysm6Xn7gyUP57IcwlNDfqePVkGHVkEsT
	 yMIlvwV5v/nFILsI0vwC73/fBMrxgZ+KktFPAs49DK9n5/kJ30xIwFu1MwSeh+hYN7Evs
	 5alVpeZTVR5dP0+8zjVxcnu3Gtf+kLgBqQ04F5nmHMPo60gc75lkTHGEtRrK1UUZgHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90549606A89B;
	Mon, 16 Nov 2026 17:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90549606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:e6fc:5f71:2c1e:7d62:945f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xT0pD-004GcH-0d;
	Mon, 16 Nov 2026 18:49:03 +0100
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
	zhengping.zhang@airoha.com
Subject: [PATCH v3 5/9] dt-bindings: mfd: syscon: add airoha,an7589-iomux
Date: Mon, 16 Nov 2026 18:48:50 +0100
Message-Id: <20261116174854.342912-6-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116174854.342912-1-john@phrozen.org>
References: <20261116174854.342912-1-john@phrozen.org>
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
---
Changes in v3:
- New patch, split out of the pinctrl binding (Lee, Conor).

 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index dae706ca7642..e87158d42e87 100644
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

