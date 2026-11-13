Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547955;
	b=aBmpmG/Iu6YVnJ9kcXbb845wDxnGKeHvGV+SSgfxxcurOltt4iia69q7Ljx9JszpZz5f
	 8lMeibf7PJAAIrrCqMyh+JkWBgBLrOyDO5oFxXjbOQ45XizGXHLNWIjtm8yhgVTgLX5xl
	 p6lJ8cSxbGFjPjWYe45k0njO1DFbODuenjElLCEUZbWV/Z1e/BajbICckWkW2MNeWgXqp
	 Bp4SNIAV1L/VPflsWLl06Rkg+5oDIaFgs+clxyg96Iqmr4FAIF/PjrT30gyWDh4Ji1cz9
	 yXSJ8UA8qebOaY6fCZxpNUHRjZKBAVtXWaVL5jmogXuTXSdu+2GSUePHDRjRh0AqUsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547955;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=59/hF3sIz5vy5pjCFH7TIjq0oVRc37w8+FMpktdK4TI=;
	b=pUrx2epQC0MgHFmjlRUBTEfBKcPcBaE0HkfRzeONMtrg4ke7TTi64qpXmGESpk+ILcvM
	 RrnCkWLsa3Ymdp8je+bOwgpJI+bZlOBXnZF/fiMAhyoHZ6cig4F9sZLerH3SB//WC67mg
	 KnKae7gZVMJdz5uzOxobtzGzEXygneiqzUo1OMGxm5rDGA/UrUwu5iFD7nbJajSWfR1pd
	 zZErvSYQzYUhwp/qmPYqUVAK9ZlcFcVGOqbKe8oZWqwuBYyvEzeWvQeJrDACV/CFdTxm1
	 H8P6ZavTijmJX0F5Dx+5M4CP0f/mOTPi33C9AXtX8sLhyPdxWjR8ZnjWIEMBojmcLkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kaihong.com;
	spf=pass smtp.mailfrom=kaihong.com;
	arc=none smtp.remote-ip=115.124.28.53
Received: from out28-53.mail.aliyun.com (out28-53.mail.aliyun.com [115.124.28.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FA8606A884;
	Fri, 13 Nov 2026 05:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02FA8606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kaihong.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaihong.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.4780966|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0231934-0.00123713-0.975569;FP=7888793062833208487|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam011083032240;MF=wangxiaolei01@kaihong.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.k13i.MA_1794547943;
Received: from nj-vm-261.pxvirt.local(mailfrom:wangxiaolei01@kaihong.com fp:SMTPD_---.k13i.MA_1794547943 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 13 Nov 2026 13:32:23 +0800
From: Xiaolei Wang <wangxiaolei01@kaihong.com>
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
Subject: [PATCH v2 0/4] pinctrl: bcm: Two bounds fixes and a dt_free_map cleanup
Date: Fri, 13 Nov 2026 05:32:17 +0000
Message-Id: <20261113053221.3131068-1-wangxiaolei01@kaihong.com>
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

This series fixes two out-of-bounds accesses in the BCM pin controllers
and drops two hand-written dt_free_map callbacks that duplicate
pinctrl_utils_free_map().

1/4 indexes funcs[] with the raw FSEL field, which is 1-based: 0 means
GPIO, 1..n_funcs map to funcs[0..n_funcs - 1]. Every debugfs readback is
therefore shifted by one slot, and n_funcs indexes past the array. Index
with fsel - 1 and map 0 and out-of-range values back to GPIO.

2/4 and 3/4 replace the per-driver dt_free_map with
pinconf_generic_dt_free_map(). Both drivers already select
GENERIC_PINCONF, and brcmstb already uses the generic dt_node_to_map, so
this is a mechanical cleanup with no behaviour change.

4/4 adds the missing AON SGPIO entries. The controller describes six
SGPIO pins at pin 32..37, but the function tables stop at pin 16 (C0)
and pin 14 (D0), so dumping the pin list indexes past the end. The
function data comes from the downstream rpi-6.12.y driver; C0 and D0
differ on the HDMI1 and PMIC I2C signals.

Testing: 1/4 was run on a Raspberry Pi 5 with KASAN; the "alt8" readback
no longer splats and field 0 reports GPIO. 4/4's out-of-bounds read was
reproduced on the same board. Its D0 entries are not runtime tested,
because the board loads the C0 table.

Changes in v2:
- 1/4: the commit message describes the bug in prose instead of pasting
  the fix, as Andrea suggested.
- 4/4 is new, for the SGPIO out-of-bounds read he reported.

Link to v1:
- https://patchwork.kernel.org/project/linux-arm-kernel/cover/20261106070628.1428691-1-wangxiaolei01@kaihong.com/


Xiaolei Wang (4):
  pinctrl: bcm: Fix off-by-one and out-of-bounds access in fsel_get()
  pinctrl: bcm: Use pinconf_generic_dt_free_map in bcm2835
  pinctrl: bcm: Use pinconf_generic_dt_free_map in brcmstb
  pinctrl: bcm: Add missing SGPIO entries to the BCM2712 AON tables

 drivers/pinctrl/bcm/pinctrl-bcm2835.c         | 16 ++----------
 drivers/pinctrl/bcm/pinctrl-brcmstb-bcm2712.c | 12 +++++++++
 drivers/pinctrl/bcm/pinctrl-brcmstb.c         | 26 ++++++++-----------
 3 files changed, 25 insertions(+), 29 deletions(-)

-- 
2.34.1

