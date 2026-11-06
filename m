Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948803;
	b=j90gzmeRx/v1kMSyc3w4ivKcROaMw8UjOZVSNiTDUGXjthr/ULq2NAWsFTS7mJmrOJvZ
	 iF0VdU6R3CwebZzHv97TsLtHQI/m76+w+yV52FaedSUedlGp4RS7tzj7W2FZWQ4BRvBT+
	 G7NTtI8r3KSz4ddvt5ZUF9IRSb59wt+lWkQn0gxgizpn67kNmhWwg/0I313IoXC9yE7eI
	 iQFsQOo3VXt3iyMwoSNW8vcX5SI9eZk6tN5ePGSL8fgIBCQ9C7h1jQj18mrZYK+epfuRN
	 OYJAfF0d6C9VfVT+/5W4HAod73tIb3aQakB8kpWhGdhb+oCWC3F6vendW3q2WJG/CbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948803;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=sK1wlGG6YmCD8beXerpELaLtfG4Jd+kTnPVd1L2se3g=;
	b=wEgpf6bXk6fUe3LSXV1413/lW8l+QT7boAgNs5Vu07VPh8fGFifJFd9RQx7S2SP7Kbmu
	 0pJeC9EYwZxw2/e+Uf1oqD2j330vpRXtnuuSGHOesAOa5xN6Ptomc5yaJO181RiiSYX0A
	 6VFnnGie0s5DYKVqLFiX0lBis1znAGiQVptS2uVhP205M+QegT1/qP7KpaZvsIxsgisOh
	 +Dx2z6IfQTWauMRqhhSsZ0m8uW5ZiK4p52xY0b23yx3YTfYcXRxgzSxN3hLhycnnq4OCi
	 XfI6rtTz8/Rrw+7x8vS7iFDUn0FSIk07yfWCu7WIUbAEMxdbdktkQZeb43b7HyvQ6Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kaihong.com;
	spf=pass smtp.mailfrom=kaihong.com;
	arc=none smtp.remote-ip=115.124.28.112
Received: from out28-112.mail.aliyun.com (out28-112.mail.aliyun.com [115.124.28.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D416606A328;
	Fri,  6 Nov 2026 07:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D416606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kaihong.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaihong.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1986584|-1;BR=01201311R191S09rulernew998_84748_2000303;CH=blue;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00258762-0.000171821-0.997241;FP=7888863433177527972|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033040092104;MF=wangxiaolei01@kaihong.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.jy2.91t_1793948790;
Received: from nj-vm-261.pxvirt.local(mailfrom:wangxiaolei01@kaihong.com fp:SMTPD_---.jy2.91t_1793948790 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 15:06:30 +0800
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
Subject: [PATCH 0/3] pinctrl: bcm: Fix fsel_get() and use generic dt_free_map
Date: Fri,  6 Nov 2026 07:06:25 +0000
Message-Id: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
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

This series contains one fix and two cleanups for the Broadcom pin
controllers.

Patch 1 fixes an off-by-one and out-of-bounds read in the STB pin
controller driver that was added in v6.18. The FSEL register field is
a 1-based function number -- 0 means GPIO, 1..n_funcs select
funcs[0..n_funcs - 1] -- but brcmstb_pinctrl_fsel_get() uses the raw
field value as a 0-based index into funcs[]. Every readback is
therefore shifted by one entry, and the value 8, which
brcmstb_pinctrl_fsel_set() accepts as the eighth alternate function,
reads funcs[8] and trips KASAN when the pin state is printed through
debugfs.

Patches 2 and 3 replace hand-written dt_free_map callbacks with
pinconf_generic_dt_free_map(). Both drivers already call
pinconf_generic_dt_node_to_map_*() for dt_node_to_map and already
select GENERIC_PINCONF, so the generic helper is the matching
counterpart, and the open-coded free loop just duplicates what
pinctrl_utils_free_map() already does. No functional change is
intended for the map types the existing device trees use.

Patch 1 was tested on a Raspberry Pi 5 with KASAN enabled. Before the
change, writing "gpio45 alt8" to pinmux-select and then reading pins
triggers a global-out-of-bounds splat in brcmstb_pctl_pin_dbg_show();
after the change the same sequence reports "function spi_m" without
a warning, and a register field value of 0 reports "gpio".

The series is based on v7.4-rc1 and has no inter-patch dependencies.


Wang Xiaolei (3):
  pinctrl: bcm: Fix off-by-one and out-of-bounds access in fsel_get()
  pinctrl: bcm: Use pinconf_generic_dt_free_map in bcm2835
  pinctrl: bcm: Use pinconf_generic_dt_free_map in brcmstb

 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 16 ++--------------
 drivers/pinctrl/bcm/pinctrl-brcmstb.c | 26 +++++++++++---------------
 2 files changed, 13 insertions(+), 29 deletions(-)

-- 
2.34.1

