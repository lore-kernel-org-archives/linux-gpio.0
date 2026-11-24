Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514883;
	b=fCzsZLyuCPmTpnrk1A4xaY1lZCZ6PpjFDaZoyHYT1UrwLrzO9/O+1alKFWkROAmRiaKU
	 tWEHq4I0nDM5JDCvhITSZVrN171KVox149tWmNk/2N5jz0SXKZKDpnhMw1hFVAmgmfjfq
	 tPk7Acuc+NEkS7KJM+CkvnWY+yRMSuStJHWqNSpGZwka1tO6g+jcfqaj5UwS95IrDCE6i
	 n+JXdta3T3hdXzrIyMM/2SnsA+K2+S9Ojto4vtdCiqniasbW0KPqM8bNOy508CmGKOTFJ
	 s60crJ/sWLiApflrJoJaJXv1JyJXMClUr184Itu8rFWQfNHl+AzufEpecfkQcHNYcmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514883;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=If1utSv5nMW5RhBOH/0E3OMG/t4TgZpT3KdrpJ5BcZw=;
	b=XLgWmpOx/otxWg9BMtgCQn1j4yyW02E52iDzYkf39Q9wSE7DRSm7P2GX8BkayHlVOGwn
	 nzmcsVrgJi2wbS7ODmfX9WIWGnWkGwdHApVBsCNFmgM0O+z+Bp3Ri6WJnV90x3J8Oo7Hb
	 96U2zWiSET7EsiHMmiKMLft/xun04fPrdT0KrQeYffxEPKUh/ShJbvCvw94+c5U4UYvDR
	 k9Vd1lrJmMUgqSXsvGxCna1fE4TsOVPGPQ2yN31GhjsJmRk/Tos0yKLDdRwZTuANNonB9
	 UuJirGelXYI43piix9Fpok6Eq6M0DohONg5LSkBvw3xrgTAhZXLjljkPA3/UYVVuwRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7FF606A31E;
	Tue, 24 Nov 2026 10:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C7FF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:dffc:4a09:a431:737f:f29f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xVnRH-007eZH-2u;
	Tue, 24 Nov 2026 11:07:51 +0100
From: John Crispin <john@phrozen.org>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] dt-bindings: pinctrl: airoha: limit the conf pins to the largest pin group
Date: Tue, 24 Nov 2026 11:07:46 +0100
Message-Id: <20261124100746.3887616-1-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
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

A conf node holds the pins of one peripheral. The bindings allow as
many pins as the SoC has, so a node can name pins that do not belong
to its peripheral.

Use the size of the largest pin group of each SoC as the limit: the 17
pins of pnand on the AN7563, AN7583 and EN7581, and the 8 pins of
pcm_spi on the EN7523.

Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
Follow up to the review of the AN7589 binding [1], as offered in [2].
The numbers are counted from the pin group tables of the drivers.

[1] https://lore.kernel.org/r/20261116-resolved-riot-c6a310bb2d8c@spud
[2] https://lore.kernel.org/r/e20f708f-ebfe-4dc0-a64c-1590fdf608f3@phrozen.org

 .../devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml      | 2 +-
 .../devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml      | 2 +-
 .../devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml      | 2 +-
 .../devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
index 6d186ebe4a41..77294c1e55f4 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
@@ -258,7 +258,7 @@ patternProperties:
                      pcie_reset0, pcie_reset1, i2c_scl, i2c_sda, spi_clk,
                      spi_cs, spi_mosi, spi_miso, uart_txd, uart_rxd]
             minItems: 1
-            maxItems: 38
+            maxItems: 17
 
           bias-disable: true
 
diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index aad2e9880ec6..9e161e1a1cfb 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -307,7 +307,7 @@ patternProperties:
                      i2c1_sda, spi_clk, spi_cs, spi_mosi, spi_miso, uart_txd,
                      uart_rxd, pcie_reset0, pcie_reset1, mdc_0, mdio_0]
             minItems: 1
-            maxItems: 53
+            maxItems: 17
 
           bias-disable: true
 
diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
index 599f80e94432..b5f95b0b7191 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
@@ -286,7 +286,7 @@ patternProperties:
                      gpio20, gpio21, gpio22, gpio23, gpio24, gpio25, gpio26,
                      gpio27, pcie_reset0, pcie_reset1]
             minItems: 1
-            maxItems: 38
+            maxItems: 8
 
           bias-disable: true
 
diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
index 0cf1826c691f..453f41e862ba 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
@@ -308,7 +308,7 @@ patternProperties:
                      gpio41, gpio42, gpio43, gpio44, gpio45, gpio46,
                      pcie_reset0, pcie_reset1, pcie_reset2]
             minItems: 1
-            maxItems: 58
+            maxItems: 17
 
           bias-disable: true
 

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.34.1

