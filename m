Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795665277;
	b=q77ARpmEXb7LOb0zMOL45PbFXg9PR4FgIyGucFbAQH3SANiYnSyEdnIAMiVegAnOBLzg
	 b+YDldaIfpYZ0DAYaFTzYFdTHpv+/vmYbev2wIDSIbCjEeuqKFRVvD+vDR9EUZIJzE9yW
	 I6olux+OZx7LLvc6elzKVCvm3jPLhKE2fwP5EqlwRTplkCH2VfW4yS+/7NeClQdiWRfB+
	 AYTNJQ1eMsZCXFZ6OefrNIHnSUqZJrEdstTB0GNAIMH0SoGlRoV+Pi5/nw2x20hQaCBiM
	 Q0aPfcEr/bjaXizGheeOSaUiqt9XXQhEHFbnxae7DtLWM1vHQlWvEtapnQnablReCIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795665277;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UYnHuD95jjTU7bUbz610BGDINyKJ2tUuvBJYRsnN3iQ=;
	b=GK9/VF5uKdNzKW1p8oc6i9jbC63rdu5tAwVG9OJ6nXMtn3Ri5ZKPg6GhXwezIme23EwG
	 ezmOk6Ja2GpDnLzR/E6I5FUOZuWdD5f1rceC2MXZmSu85vrKF/a3Aljg6zCRn6PGDvtSa
	 bYA/QurAc+1o7ASVCUEmGmf9aNa4SE8ahpW4P9mtng4ZbLdFQKiAm85wVvLCcXNjkQu7C
	 knaBoHFyG72X1EERCeIT66c30WOj8oIgBmEKuiR6qdp8xOm8M1PfH2+7quiq7HOrpzbS5
	 XEd/Na6hK+5Hkiyvp3DVupCahxHBZgkl85bMsOPtResLbAXhyfITG6DUEID1h6yXUPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kaihong.com;
	spf=pass smtp.mailfrom=kaihong.com;
	arc=none smtp.remote-ip=115.124.28.197
Received: from out28-197.mail.aliyun.com (out28-197.mail.aliyun.com [115.124.28.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B49606A329;
	Thu, 26 Nov 2026 03:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8B49606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kaihong.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaihong.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1369101|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00221578-0.000296395-0.997488;FP=14794307250485396133|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033025068124;MF=wangxiaolei01@kaihong.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.kASpfSd_1795665269;
Received: from nj-vm-261.pxvirt.local(mailfrom:wangxiaolei01@kaihong.com fp:SMTPD_---.kASpfSd_1795665269 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 26 Nov 2026 11:54:31 +0800
From: Xiaolei Wang <wangxiaolei01@kaihong.com>
To: linusw@kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com,
	wangxiaolei01@kaihong.com,
	iivanov@suse.de,
	andrea.porta@suse.com,
	phil@raspberrypi.com
Cc: linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: rp1: use pinctrl_utils_free_map() for map cleanup
Date: Thu, 26 Nov 2026 03:54:20 +0000
Message-Id: <20261126035420.1836760-3-wangxiaolei01@kaihong.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126035420.1836760-1-wangxiaolei01@kaihong.com>
References: <20261126035420.1836760-1-wangxiaolei01@kaihong.com>
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

The rp1 driver open-codes a dt_free_map callback that frees the config
arrays of pinctrl maps and the map array itself.  This duplicates
pinctrl_utils_free_map(), which the pinctrl core already provides for
exactly this purpose.

The local copy only handles CONFIGS_PIN maps.  Because the driver can
delegate map creation to the generic pinconf DT parser, CONFIGS_GROUP
maps may also be produced, and their config arrays would be leaked by
the open-coded version.  The core helper handles both types, so using
it removes the duplicate code and closes that leak at the same time.

Signed-off-by: Xiaolei Wang <wangxiaolei01@kaihong.com>
---
 drivers/pinctrl/pinctrl-rp1.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
index 99566a25ecb4..bf2c300eef29 100644
--- a/drivers/pinctrl/pinctrl-rp1.c
+++ b/drivers/pinctrl/pinctrl-rp1.c
@@ -1089,18 +1089,6 @@ static void rp1_pctl_pin_dbg_show(struct pinctrl_dev *pctldev,
 		   irq, irq_type_names[pin->irq_type]);
 }
 
-static void rp1_pctl_dt_free_map(struct pinctrl_dev *pctldev,
-				 struct pinctrl_map *maps, unsigned int num_maps)
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
 static int rp1_pctl_legacy_map_func(struct rp1_pinctrl *pc,
 				    struct device_node *np, u32 pin, u32 fnum,
 				    struct pinctrl_map *maps,
@@ -1286,7 +1274,7 @@ static int rp1_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return 0;
 
 out:
-	rp1_pctl_dt_free_map(pctldev, maps, reserved_maps);
+	pinctrl_utils_free_map(pctldev, maps, reserved_maps);
 	return err;
 }
 
@@ -1296,7 +1284,7 @@ static const struct pinctrl_ops rp1_pctl_ops = {
 	.get_group_pins = rp1_pctl_get_group_pins,
 	.pin_dbg_show = rp1_pctl_pin_dbg_show,
 	.dt_node_to_map = rp1_pctl_dt_node_to_map,
-	.dt_free_map = rp1_pctl_dt_free_map,
+	.dt_free_map = pinctrl_utils_free_map,
 };
 
 static int rp1_pmx_free(struct pinctrl_dev *pctldev, unsigned int offset)
-- 
2.34.1

