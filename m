Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948806;
	b=ZUynokMUx8Z/eo+vKrwVpWnaT5oZ+wjoXm0rbUxEcA1dNpndN0uL3BaIKb1hLzSKyGHb
	 ZjIwClMzecPEwx8EKa88SPHH4VUQI9ONeOYmtX/WMqz/iliDmFKX3GPb6IuL9LQ8vpoi5
	 tAVoJBqnExTutYnB+pdtaQQ1jqVr2BZU0d/z7cW5YMqB7cbw+MMUvKc+9QYep3nI0hgaq
	 1d1iy6a4cOL39bnHMT62F7bWUfFTp+pPrTUWkOWbNrEcvgKmuxcOsSWm1YbNUrYREIpol
	 uT16cVhSfKA35OWpneArzt4wb6Gxdtb8CFEc5CAMIvZRzrY9bk89r2ryrgDlO81wHLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948806;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xj+HtoU5ASYrF7ntXB+HFaVy05RTHmxTs3AWF9oBtgA=;
	b=dT8uXGe5GuGXutSMzvOvY/tXtLkc9E2e2rDNWAOSBOJq1TYdFpuijY9Yl5/jwHG3HC83
	 SrS6G5zDuEZv4ospcpSknUCBFLW1ETXm6uC6FWpoNIW12O+ys1LgXCGzUWJxGCJ1r3T6V
	 SdVKdDbE5hrBrfD7lBIWsgSGlp6DzfPqU67nN2RFGZm2xh1M78gjIhyZwy5r29xRAPfx+
	 9AvhShqOHre216oJm9u6b51wOdYJ+JNyYH+DWm7bd3awEuU39fLO1fq8st33RXhMmhxJR
	 QAgclYdM94lrgZcmbXAPR8fTzFFm8GymuXdDiVxiNqKc2N9yIRWH6gZUK4nh7GHPddA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kaihong.com;
	spf=pass smtp.mailfrom=kaihong.com;
	arc=none smtp.remote-ip=115.124.28.110
Received: from out28-110.mail.aliyun.com (out28-110.mail.aliyun.com [115.124.28.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC43606A32C;
	Fri,  6 Nov 2026 07:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC43606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kaihong.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaihong.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07948652|-1;BR=01201311R141S20rulernew998_84748_2000303;CH=blue;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00727809-0.000392516-0.992329;FP=16537210185005860485|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033065158064;MF=wangxiaolei01@kaihong.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.jy2.94f_1793948792;
Received: from nj-vm-261.pxvirt.local(mailfrom:wangxiaolei01@kaihong.com fp:SMTPD_---.jy2.94f_1793948792 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 15:06:34 +0800
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] pinctrl: bcm: Use pinconf_generic_dt_free_map in bcm2835
Date: Fri,  6 Nov 2026 07:06:27 +0000
Message-Id: <20261106070628.1428691-3-wangxiaolei01@kaihong.com>
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
handles both CONFIGS_PIN and CONFIGS_GROUP map types.

The error path in bcm2835_pctl_dt_node_to_map() uses the same helper.
The driver already selects GENERIC_PINCONF, so no Kconfig change is
needed.

Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 725e880ae086..69a92cd7bfe0 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -760,18 +760,6 @@ static void bcm2835_pctl_pin_dbg_show(struct pinctrl_dev *pctldev,
 		irq, irq_type_names[pc->irq_type[offset]]);
 }
 
-static void bcm2835_pctl_dt_free_map(struct pinctrl_dev *pctldev,
-		struct pinctrl_map *maps, unsigned num_maps)
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
 static int bcm2835_pctl_dt_node_to_map_func(struct bcm2835_pinctrl *pc,
 		struct device_node *np, u32 pin, u32 fnum,
 		struct pinctrl_map **maps)
@@ -916,7 +904,7 @@ static int bcm2835_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return 0;
 
 out:
-	bcm2835_pctl_dt_free_map(pctldev, maps, num_pins * maps_per_pin);
+	pinconf_generic_dt_free_map(pctldev, maps, num_pins * maps_per_pin);
 	return err;
 }
 
@@ -926,7 +914,7 @@ static const struct pinctrl_ops bcm2835_pctl_ops = {
 	.get_group_pins = bcm2835_pctl_get_group_pins,
 	.pin_dbg_show = bcm2835_pctl_pin_dbg_show,
 	.dt_node_to_map = bcm2835_pctl_dt_node_to_map,
-	.dt_free_map = bcm2835_pctl_dt_free_map,
+	.dt_free_map = pinconf_generic_dt_free_map,
 };
 
 static int bcm2835_pmx_free(struct pinctrl_dev *pctldev,
-- 
2.34.1

