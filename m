Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851347;
	b=WaTjakVoiYc5s/h3kYtqh/6XyojjkW3lVvIq7dH4+8ttkHoHkf0hCdvE/ayiPCt2+QuB
	 jiFa3X4dsdv7GoNOHMeaJzFJFQgxbwTrL7YST83cWIyY4GlTcqCYoqoLsKwnA/9Wm6XkJ
	 fC1UhDl7qVTLtfAtqfJNZ3tvdk3s2KCV46ArZar2V5Wrdg0d31gcUJkCFghx8A63HEA/T
	 Ep2vQkeRCx9nnGxUkTq5uFzzH91C79BG0QeFcYuKGz4jyH5XuDVR6UaVgt6vxAXDvDN5+
	 5ss3atGrfe4DINRpbc4lxdQMqfSK5+bIFpfi1VWicwygGKx9RoHNiF1wTQ0PmxA0p0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851347;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=X6MNUcikYiuz1tUhw20RwzrIvpnX6itfbcFVUVrQfSc=;
	b=OKLBtZuPgmBdZeVrmv4uQ5xuYUxS9PDke1Dw1uKy1AXAAdsAJ6/tZ4b2nJ+c5kv42NFa
	 FjITjNLbeiSa8srsSaXvRAPfb875FndKZAnVw+XKa374N+UREpfF6AKRQtl1JnN2lmvf7
	 G5PIo7AaP20kDRVYCVwP2VsulCc86E0XfpnN/w1G9rVH2pz+jwN9RKYYHktzriH7mhgdX
	 XAWaHQtWsy+SANbvjv0h36K11kbIovdsKwmBXsEdPhEjHPex4oJZMA50IzouEi4M8oVIW
	 /fBDn413m3ehDTEYOG+XJWmjotExiFawRq3u23XZUIEo8HzUoKh670AU0OGwLcEHMDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F1F606A89E;
	Mon, 16 Nov 2026 17:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0F1F606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:e6fc:5f71:2c1e:7d62:945f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xT0pE-004GcH-1J;
	Mon, 16 Nov 2026 18:49:04 +0100
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
Subject: [PATCH v3 8/9] pinctrl: airoha: move the GPIO register offsets to the common header
Date: Mon, 16 Nov 2026 18:48:53 +0100
Message-Id: <20261116174854.342912-9-john@phrozen.org>
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

The GPIO register offsets are private to pinctrl-airoha.c, which builds
the shared 64 pin register table from them. A SoC with more GPIO banks
needs its own table, built from the same offsets and its own for the
extra banks.

Move the offsets to airoha-common.h so the SoC drivers can use them.

No functional change.

Signed-off-by: John Crispin <john@phrozen.org>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Add the Acked-by of Lorenzo.

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

