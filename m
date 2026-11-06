Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948806;
	b=HtPCSG0E0s5jfao8Od8sEhpVDNXdGv5yaHdFnGZCKxaPQW/UUGL0bRgBg7Z0vPTclRBi
	 +kl4HDXGUvQyky6SuU3cbR8ANFs/PELYfmmkd5N7XfdGCWZ1CG6kZugBdZPSrsQu431id
	 JXRzemw+qpyTNYyVXSi9bwJ1a9KAq25WfEkkxQWEAVHuDFq0ihFuZqQQqePeMa68KehnZ
	 YP2suSYNgTFKF2f/DUB4wBXY58OVLb2b5sWJHYEu5QaWbj5pRq8Ayc8Vj7ki01zkdNGNA
	 uI6tWeVtP5DjwgQtGpY1qmXZzA85wpLYecFLI75a9G4tdk7e1VdmDoUGaWEyisin5pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948806;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rc4f5dnnK1s2jbuaCUZzLjIIIVZ/zIrPWuGVVrny49w=;
	b=uRMSuerisM7j7IxJL3k6CAGUbQATEXnLj5EE7kelmLCEyw5WQ/g33g85NvQl3wNtH9Ia
	 fDxF+c0KefoPNze56EPrfsKhKbcYM6CfIXFlwu+3m8OK/CJoemm8cWo0UTRzBfA2iZMjU
	 i2A2qYXGl0DC6AuInATcn4XKHJnMxp5SVYOqXzDgOgf/DZkGRk4YBASdVjlqRTSLFZZB+
	 nvvq9QfIO7J3X0APZQRg/GnZvhoZWDNF5dNfKhAjiqlbvTZytSxvfoaSl02ThQwF7BD8d
	 gUjdbOFJcu9hM3vXu9hCuGR7Q6E18uSbWufeejmFYkk/9yacVm3T1XP42BHLmG9ffuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kaihong.com;
	spf=pass smtp.mailfrom=kaihong.com;
	arc=none smtp.remote-ip=115.124.28.128
Received: from out28-128.mail.aliyun.com (out28-128.mail.aliyun.com [115.124.28.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DBB606A330;
	Fri,  6 Nov 2026 07:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53DBB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kaihong.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaihong.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1603161|-1;BR=01201311R141S47rulernew998_84748_2000303;CH=blue;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.00255697-0.000494935-0.996948;FP=17113666557013083781|1|1|2|0|-1|-1|-1;HT=maildocker-contentspam033023087102;MF=wangxiaolei01@kaihong.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.jy2.96g_1793948794;
Received: from nj-vm-261.pxvirt.local(mailfrom:wangxiaolei01@kaihong.com fp:SMTPD_---.jy2.96g_1793948794 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 15:06:35 +0800
From: Wang Xiaolei <wangxiaolei01@kaihong.com>
To: linusw@kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com,
	wangxiaolei01@kaihong.com,
	iivanov@suse.de,
	andrea.porta@suse.com,
	phil@raspberrypi.com
Cc: linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>
Subject: [PATCH 3/3] pinctrl: bcm: Use pinconf_generic_dt_free_map in brcmstb
Date: Fri,  6 Nov 2026 07:06:28 +0000
Message-Id: <20261106070628.1428691-4-wangxiaolei01@kaihong.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
References: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
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

Replace the hand-written dt_free_map callback with the generic
pinconf_generic_dt_free_map() helper, which wraps
pinctrl_utils_free_map(). This drops the duplicated free loop and
pairs the callback with the pinconf_generic_dt_node_to_map_all()
already used for dt_node_to_map.

The driver already selects GENERIC_PINCONF, so no Kconfig change is
needed.

Cc: Jonathan Bell <jonathan@raspberrypi.com>
Cc: Phil Elwell <phil@raspberrypi.com>
Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>
---
 drivers/pinctrl/bcm/pinctrl-brcmstb.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-brcmstb.c b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
index 2b942ca7196b..e81c5b295a05 100644
--- a/drivers/pinctrl/bcm/pinctrl-brcmstb.c
+++ b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
@@ -180,26 +180,13 @@ static void brcmstb_pctl_pin_dbg_show(struct pinctrl_dev *pctldev,
 	seq_printf(s, "function %s", fname);
 }
 
-static void brcmstb_pctl_dt_free_map(struct pinctrl_dev *pctldev,
-				     struct pinctrl_map *maps,
-				     unsigned int num_maps)
-{
-	int i;
-
-	for (i = 0; i < num_maps; i++)
-		if (maps[i].type == PIN_MAP_TYPE_CONFIGS_PIN)
-			kfree(maps[i].data.configs.configs);
-
-	kfree(maps);
-}
-
 static const struct pinctrl_ops brcmstb_pctl_ops = {
 	.get_groups_count = brcmstb_pctl_get_groups_count,
 	.get_group_name = brcmstb_pctl_get_group_name,
 	.get_group_pins = brcmstb_pctl_get_group_pins,
 	.pin_dbg_show = brcmstb_pctl_pin_dbg_show,
 	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
-	.dt_free_map = brcmstb_pctl_dt_free_map,
+	.dt_free_map = pinconf_generic_dt_free_map,
 };
 
 static int brcmstb_pmx_free(struct pinctrl_dev *pctldev, unsigned int offset)
-- 
2.34.1

