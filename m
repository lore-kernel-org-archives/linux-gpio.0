Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513279;
	b=cGeAODlFCwxBck98wERx+dtFoY/Hg26vFCaMNeIsyeB5lpqS03NDgg2w5ikKhXNrpx5V
	 E3xLeVwnlYFlO8iSb06jCWO+NrmVBvb5kQFYzXauh0yKmXNZzewNEoNTK1uwHDR+CM7yv
	 rLIfZhV9bR/wgw3+2XgBDuElcfaM6tncyN/HmbnSdNE/dbDKjQRoF8GoWoxRRdAz29eEK
	 YuQZvb6DfJC8eujhMfjNQOES3xkyTHZg0WLIIxcSLegLVYrFFKYMmNZ8Z35/I5e4jdPWC
	 5RWrjVWoP7lVUqtcnGYOBFs1GOfbwNbAlZzrWzaiVHDPREuZvrQ/bvrsDlcck1oz+TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513279;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5Y+EU8L83TEHj4ood5A6BMTvfAl0Hd2iC+y5jCYSZnQ=;
	b=bWjRi2UaOzjAXm00+Sv982keMe/wnjNZG+1aTDkT8W92fuEvUgKxCVYvtJBqmPlR6oKv
	 jIT2B5+m+zpvmouX5bE3bhdQGCdMcg95bc1RCsDSIqvn0qtGO5GAGs5xe4+t9f8u+tGud
	 vhlag2zX3wWML62XkdS2U5ghqgrE+7T36gCYiAbVrVA+1plQgkf6DNb1QipmKixxgPoTt
	 5HypgifmVGml4hM//btQbWSzYtR7iwkJbtLtI/DoZ21+DK0aSBvKWhqMXhxMnHh7WE6um
	 JCq5bZ8zbO8JaNV39O+UCPyhH+tW00Aqw1wMjb7amyNnkaaJitFBW4pXy8cuM49vZew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3509A606A683;
	Tue, 24 Nov 2026 09:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3509A606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:dffc:4a09:a431:737f:f29f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xVn1N-007e57-0i;
	Tue, 24 Nov 2026 10:41:05 +0100
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
Subject: [PATCH v4 3/9] pinctrl: airoha: make the chip SCU optional
Date: Tue, 24 Nov 2026 10:40:53 +0100
Message-Id: <20261124094059.3882014-4-john@phrozen.org>
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

A SoC that muxes every pin through the IOMUX block and describes no
pin configuration has no use for the chip SCU. Skip the lookup when
the match data names no chip SCU compatible, instead of handing a
NULL compatible to syscon_regmap_lookup_by_compatible().

No functional change for the existing SoCs, which all name one.

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: John Crispin <john@phrozen.org>
---
Changes in v3:
- Add the Reviewed-by of Lorenzo.

Changes in v2:
- Look up the airoha,chip-scu phandle before the check for a chip
  SCU compatible (Lorenzo).

 drivers/pinctrl/airoha/pinctrl-airoha.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 615b48a056c4..c879e3009ee8 100644
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

