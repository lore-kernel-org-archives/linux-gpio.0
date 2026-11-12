Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509995;
	b=sTN6TAk4R1YZBJ2wkWrX4vYZTt/fKpo6EIs8ESIkJ/rMz5FobrtT1WC48CZQZzD987BO
	 ljT1C60RlN4V9ELJfI10IvTtwW6xtWy7GoF6MFZzhaSv9ZVpbw6dfudmUFMxNrr9hYBtw
	 +IJa0zuZQAOcYuA6GRaIK09CI96GVbEeTMJ4ly9sQInxWoQicZvsYk2dEQYhMbS9N/ByV
	 GWNY+Q1hdahbBWzjyfpleORkpsjao0tlT5edkHBy3oIcySxCKHPXyJiywUL4/JKSZXRkj
	 DS+/gbN5E0K/Rm56JsgKkDJTyq7DfOb6Ew/KQTOhseT7ZPMoIYI5TZM3cd+XqixL/YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509995;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=yMAAykQB6oCefnRWkX8/jVQpDHtwcvOmdsuX+RRnkkg=;
	b=dCghgaQypuIfs+Mq9OWeCVxA3djvihYIA32OXPAZQDdN/hGN1cdB2AsFfZESqxnEV1bH
	 COEvRu2csToths+AabF7NQnE8ddArMttWtiL/GU1BQJ8VfoR9iPAVSCgrpfXTVbDNQh+1
	 2gnjEE5smtCpwCqk6X2ChwjDMjwqWAHkje8ghHCSvUb1RBw+pPJv6kW7rGjg5AXW/puMa
	 p4IedMN8wAsMK6tycNLdgHrloQdwgAX6KD+MW2Wf5RheOAh6/tpbsR3Vh/F337WylKASa
	 DeYeCbqKPvkWhIC/xGvFPitlJ0BrxjvlvJ4lXHx2rq3OFv3KYLsAqvBrqbCghXGr4pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9858606A321;
	Thu, 12 Nov 2026 18:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9858606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:f2fc:83ce:6656:246:c906] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xRa1V-002Xgt-0T;
	Thu, 12 Nov 2026 19:59:49 +0100
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
Subject: [PATCH v2 3/7] pinctrl: airoha: make the chip SCU optional
Date: Thu, 12 Nov 2026 19:59:37 +0100
Message-Id: <20261112185941.1316112-4-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112185941.1316112-1-john@phrozen.org>
References: <20261112185941.1316112-1-john@phrozen.org>
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

A SoC that muxes every pin through the IOMUX block and describes no
pin configuration has no use for the chip SCU. Skip the lookup when
the match data names no chip SCU compatible, instead of handing a
NULL compatible to syscon_regmap_lookup_by_compatible().

No functional change for the existing SoCs, which all name one.

Signed-off-by: John Crispin <john@phrozen.org>
---
Changes in v2:
- Look up the airoha,chip-scu phandle before the check for a chip
  SCU compatible (Lorenzo).

 drivers/pinctrl/airoha/pinctrl-airoha.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index f9ae4020b764..5ae0c49e491a 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -833,6 +833,22 @@ static const struct pinctrl_ops airoha_pctlops = {
 	.dt_free_map = pinconf_generic_dt_free_map,
 };
 
+static struct regmap *
+airoha_pinctrl_chip_scu(struct device *dev,
+			const struct airoha_pinctrl_match_data *data)
+{
+	struct regmap *map;
+
+	map = syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,chip-scu");
+	if (!IS_ERR_OR_NULL(map))
+		return map;
+
+	if (!data->chip_scu_compatible)
+		return NULL;
+
+	return syscon_regmap_lookup_by_compatible(data->chip_scu_compatible);
+}
+
 int airoha_pinctrl_probe(struct platform_device *pdev)
 {
 	const struct airoha_pinctrl_match_data *data;
@@ -853,12 +869,9 @@ int airoha_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(pinctrl->regmap))
 		return PTR_ERR(pinctrl->regmap);
 
-	map = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "airoha,chip-scu");
-	if (IS_ERR_OR_NULL(map)) {
-		map = syscon_regmap_lookup_by_compatible(data->chip_scu_compatible);
-		if (IS_ERR(map))
-			return PTR_ERR(map);
-	}
+	map = airoha_pinctrl_chip_scu(dev, data);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
 
 	pinctrl->chip_scu = map;
 
-- 
2.34.1

