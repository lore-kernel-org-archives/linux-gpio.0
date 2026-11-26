Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795665275;
	b=CaiV+J5ZUunN/+b2t4vI4cP25V/TO7HJ2kKC4UWz+RaAaISnQ5wZJhYkgDZ+JcjvZhAH
	 QFjFfPs9f7TyNbNdz3vmQ/oP7EInJ90rZhORsFMvXcBi/31LGUQsOLT7vOBA1zPOSoWUf
	 4IDtDnbWN3JuRDWth7KN+MPlUCB+qh6luDqqBEBJ8KKqjO0eZxzytMgZ/KPq0tG38zIdt
	 fvVVk0zshUOgELa0SY108q7Op768FvBM052YqBxX/0DAQ80EbBXgclNxIJ80r/u2gRFvl
	 QYaXdbFFfy/TPkt8YsI/mCEqIaRn16yaIW/0XNLF0JeEgCTFlEBhyl73rTSVHQu1reA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795665275;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=KlUZ8iOXpvQJNsc9I3ifS0i47syyb6w4JS8lphnBwTU=;
	b=UB3ro1IQw+u7x7S0pG7amKBp7puvF8T2s0DNNgrD7oyzoI+fcXbylU1g0xrBq+26mY/b
	 CnUSWdQhja2JdBvcFRnhIiP/1uMWzifm9ckCB3Z93ceKvTM6hxRQPoZBeRquVnbSy1maJ
	 LMQwjrejtpCrgywjEa8Ll/J4hbWD1/YeY2vpigzgd7KGpIM74D6iy3rwKAs0ktC496CTh
	 1xY1iUojc58am6Gez0wvDedwkcFtxHrlGmmbV6bJT+snSSBfPAEPbUob0aDvuiSxDLE8V
	 rf/YOu+XN7sviB7fTEEA6+LVgDy+bbpI0sLR4hmJpHu2DwkV9h7KLnqh6pdxsu978sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kaihong.com;
	spf=pass smtp.mailfrom=kaihong.com;
	arc=none smtp.remote-ip=115.124.28.49
Received: from out28-49.mail.aliyun.com (out28-49.mail.aliyun.com [115.124.28.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C04606A31C;
	Thu, 26 Nov 2026 03:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50C04606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kaihong.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaihong.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1034225|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.00381075-0.000424786-0.995764;FP=17238604813167455461|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033065158064;MF=wangxiaolei01@kaihong.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.kASpfN5_1795665263;
Received: from nj-vm-261.pxvirt.local(mailfrom:wangxiaolei01@kaihong.com fp:SMTPD_---.kASpfN5_1795665263 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 26 Nov 2026 11:54:24 +0800
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
Subject: [PATCH 0/2] pinctrl: rp1: fix RT sleep and clean up map freeing
Date: Thu, 26 Nov 2026 03:54:18 +0000
Message-Id: <20261126035420.1836760-1-wangxiaolei01@kaihong.com>
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

This series contains two independent changes to the RP1 pinctrl driver:
a fix for a real PREEMPT_RT bug, and a cleanup that removes duplicated
code and a small leak.  They do not depend on each other.

Patch 1 makes the gpio regmap use a raw spinlock.  The gpio irq_chip
callbacks run in atomic context -- irq_set_type() is called with the irq
descriptor's raw spinlock held, and the driver itself disables
preemption and interrupts while touching the registers.  On PREEMPT_RT
the gpio regmap uses the default spinlock_t, which becomes a sleepable
rt_spin_lock, so writing a register field from that context sleeps and
triggers "sleeping function called from invalid context".  This is
reachable from ordinary userspace: requesting a GPIO line with an edge
trigger through the GPIO cdev ioctl ends up in irq_set_type(), so any
application using edge-detected GPIO lines hits it.  Other pinctrl
drivers have already adopted the same fix, e.g. armada-37xx.

Patch 2 replaces the open-coded dt_free_map callback with the core
pinctrl_utils_free_map() helper.  The local copy only frees config
arrays of CONFIGS_PIN maps, but the driver may also produce CONFIGS_GROUP
maps through the generic pinconf DT parser; their config arrays would be
leaked.  The core helper handles both types and removes the duplicate
code.

The RT bug was reproduced on a Raspberry Pi 5 with a PREEMPT_RT kernel
by requesting an edge-triggered GPIO line from userspace.  A full read
of the pinctrl debugfs "pins" file (all 54 pins) produces no warnings.

This patch was initially drafted with AI assistance and has been
reviewed and modified by me.

Xiaolei Wang (2):
  pinctrl: rp1: use raw spinlock for gpio regmap
  pinctrl: rp1: use pinctrl_utils_free_map() for map cleanup

 drivers/pinctrl/pinctrl-rp1.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

-- 
2.34.1

