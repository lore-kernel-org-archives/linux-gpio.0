Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509996;
	b=WtmxJYPE7r5MnFwDjypCzWG8wnK7i0ly2F+cgyBood7M3FX2NdakG3aee0hEoc4xFHfF
	 mhA4W8Y0tJwC/It0Q8WvKgFl9ybIgXU+l+j7oxaKGvGRihYk+tPoRaAICQlNIj+EqmGB3
	 vQotlKG7K4dlg1v91Wnt4ixodeVgTK3lmWLtV+mYQIvtvVv4FohPEsTSNvVm7sNb5EMeW
	 ylkOEcDCOfOYuNdmUUfNU74DBJK3Z/DHonq/eNFVnqYi3TcPNvcXKR/79ytgqfN6Iv0e+
	 ne2xE7f/Zig5P7ojIgc9IPP4s0Y8TxwMQ7xkd4oB6xl5qLtN3X1tA2ndBGtyP0wMFeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509996;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=nmjmmwKrOHaD20xd+RqZwiFlGSSaX1SXerwAAneBLiY=;
	b=3NGkYiECPEvEgRvW8RSTJMmNJA8yiqjIhKm1OQ1DPIJKE/2/LkaKjEGNCR6e7kSgzibR
	 3c4Ru75AOncF1UyzmIdkyGYlUmz2o5f/hOuLZ8NU+46+DIAfCCaDR8E3mOKSIfXiVZMEZ
	 x76l8GxSmc1UFSpOhQHCUMyuwage100hegnD1AQcMSNeUi/5QkRakh7l4MF0ZOxVxzmMT
	 kPik+oQRECMiTMFGvYAX9yCFzc9p4J7rcb0x8Q0dP648tx7CvyRQN0eCZF/O6AIM/jbdg
	 RKyiDTk0Wycr2OTb27Zo68lz2TRVaxIzA0JUUeKCIr5HLSr/ILOxPji9RdNYukIwojQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0606660A2609;
	Thu, 12 Nov 2026 18:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0606660A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:f2fc:83ce:6656:246:c906] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xRa1W-002Xgt-1B;
	Thu, 12 Nov 2026 19:59:50 +0100
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
Subject: [PATCH v2 6/7] pinctrl: airoha: move the GPIO register offsets to the common header
Date: Thu, 12 Nov 2026 19:59:40 +0100
Message-Id: <20261112185941.1316112-7-john@phrozen.org>
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

The GPIO register offsets are private to pinctrl-airoha.c, which builds
the shared 64 pin register table from them. A SoC with more GPIO banks
needs its own table, built from the same offsets and its own for the
extra banks.

Move the offsets to airoha-common.h so the SoC drivers can use them.

No functional change.

Signed-off-by: John Crispin <john@phrozen.org>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pinctrl/airoha/airoha-common.h  | 20 ++++++++++++++++++++
 drivers/pinctrl/airoha/pinctrl-airoha.c | 20 --------------------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
index adfce89493f0..dc9b897ea77c 100644
--- a/drivers/pinctrl/airoha/airoha-common.h
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -34,6 +34,26 @@
 #include "../pinconf.h"
 #include "../pinmux.h"
 
+/* GPIOs */
+#define REG_GPIO_CTRL				0x0000
+#define REG_GPIO_DATA				0x0004
+#define REG_GPIO_INT				0x0008
+#define REG_GPIO_INT_EDGE			0x000c
+#define REG_GPIO_INT_LEVEL			0x0010
+#define REG_GPIO_OE				0x0014
+#define REG_GPIO_CTRL1				0x0020
+#define REG_GPIO_CTRL2				0x0060
+#define REG_GPIO_CTRL3				0x0064
+#define REG_GPIO_DATA1				0x0070
+#define REG_GPIO_OE1				0x0078
+#define REG_GPIO_INT1				0x007c
+#define REG_GPIO_INT_EDGE1			0x0080
+#define REG_GPIO_INT_EDGE2			0x0084
+#define REG_GPIO_INT_EDGE3			0x0088
+#define REG_GPIO_INT_LEVEL1			0x008c
+#define REG_GPIO_INT_LEVEL2			0x0090
+#define REG_GPIO_INT_LEVEL3			0x0094
+
 #define AIROHA_NUM_PINS				64
 #define AIROHA_PIN_BANK_SIZE			(AIROHA_NUM_PINS / 2)
 #define AIROHA_REG_GPIOCTRL_NUM_PIN		(AIROHA_NUM_PINS / 4)
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index e6b0180c9cb0..58e817cb8fbd 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -7,26 +7,6 @@
 
 #include "airoha-common.h"
 
-/* GPIOs */
-#define REG_GPIO_CTRL				0x0000
-#define REG_GPIO_DATA				0x0004
-#define REG_GPIO_INT				0x0008
-#define REG_GPIO_INT_EDGE			0x000c
-#define REG_GPIO_INT_LEVEL			0x0010
-#define REG_GPIO_OE				0x0014
-#define REG_GPIO_CTRL1				0x0020
-#define REG_GPIO_CTRL2				0x0060
-#define REG_GPIO_CTRL3				0x0064
-#define REG_GPIO_DATA1				0x0070
-#define REG_GPIO_OE1				0x0078
-#define REG_GPIO_INT1				0x007c
-#define REG_GPIO_INT_EDGE1			0x0080
-#define REG_GPIO_INT_EDGE2			0x0084
-#define REG_GPIO_INT_EDGE3			0x0088
-#define REG_GPIO_INT_LEVEL1			0x008c
-#define REG_GPIO_INT_LEVEL2			0x0090
-#define REG_GPIO_INT_LEVEL3			0x0094
-
 #define airoha_pinctrl_get_pullup_conf(pinctrl, pin, val)			\
 	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
 				(pin), (val))
-- 
2.34.1

