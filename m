Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919DE1FC7FB;
	Tue, 16 Jun 2026 06:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781592802; cv=none; b=tgfXH3x7e8b4gv9O7uU9istRkuL7I0/nqj8a+Jv+bwX8BtGM+DKE4v8GfO9pFxkGkOQ6M2gU2aATGk10wD0QpSzsgYRFq7kxl8odAAsUINkhkMi3/M9mNAomvJeihzNhki0+xFOioO7ElIAkZ+7UN3KuuvBoXyFCP5OwZCRBKaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781592802; c=relaxed/simple;
	bh=1RCHFrL0xFs3LvN+GZi8uDUe9fuZD2VFuKuLZX4E/KQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nm7DQEJAY/zQ0EeAYatydh/6tKKRRIPA4X25C8PkzlTlPbKoi3EYTO60tX2D18P+4RPoReeGGFOimXWZRDPZqg9jJ5xeWneCfSyfCKJKSCURzZKj4547HD+HXVd2MDjILhqE5ZqimStnz0baQl82A0oPXxqKTT1yDY1tan0HF/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=a8e3PpbJ; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="a8e3PpbJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Wn
	lNdu4Q/Vx9A/ATFwOA2xY6C+LCXc0557Vy6ZMSjDc=; b=a8e3PpbJRxlJ49GEmj
	yQdYhsEqMRdW3pmJoh7v6SmcA0cokQCfUB8R9TcKW+AQzx5VE1WaLTGpQFoxbj4n
	uKF04snrMivYT+EkfsM44HTUNYLFpw/eVMoC+rlHF09V3tN0JKy1qfPC/aECMTO7
	XK33phTHmSA1LDvpGGwHT0qJw=
Received: from haiyue-pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnL1+98jBqq30ZDg--.29032S2;
	Tue, 16 Jun 2026 14:52:46 +0800 (CST)
From: Haiyue Wang <haiyuewa@163.com>
To: linux-gpio@vger.kernel.org
Cc: Haiyue Wang <haiyuewa@163.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1] pinctrl: Kconfig: fix unmet direct dependencies detected for MFD_STMFX
Date: Tue, 16 Jun 2026 14:52:37 +0800
Message-ID: <20260616065241.7478-1-haiyuewa@163.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnL1+98jBqq30ZDg--.29032S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrWUCF4UWFy3tF48Gr1ftFb_yoWkKrcE9a
	ykGFZ3Jr1Uu34UKF1xXF4fXryjya13Wr1Sva92v343ury3Ww1xt34kWa15Cwn7Wa97Gry0
	9ryFv3WfCrWjyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRNwZ2JUUUUU==
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbCzR6S-Wow8r4LhQAA3k

The commit e785c990adcc ("pinctrl: Kconfig: drop unneeded dependencies
on OF_GPIO") will cause:

WARNING: unmet direct dependencies detected for MFD_STMFX
  Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
  Selected by [m]:
  - PINCTRL_STMFX [=m] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]

PINCTRL_STMFX selects MFD_STMFX, which depends on OF. Previously this
was gated transitively by OF_GPIO, which is dropped. So PINCTRL_STMFX
can be enabled on non-OF systems and select MFD_STMFX in violation of
its OF requirement. Add the missing "depends on OF".

Fixes: e785c990adcc ("pinctrl: Kconfig: drop unneeded dependencies on OF_GPIO")
Signed-off-by: Haiyue Wang <haiyuewa@163.com>
---
 drivers/pinctrl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 03f2e3ee065f..08218ef140e0 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -549,6 +549,7 @@ config PINCTRL_ST
 config PINCTRL_STMFX
 	tristate "STMicroelectronics STMFX GPIO expander pinctrl driver"
 	depends on I2C
+	depends on OF
 	depends on HAS_IOMEM
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
-- 
2.54.0

