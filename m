Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F58343D4F5;
	Thu, 30 Apr 2026 17:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777568502; cv=none; b=OPdYB6w+cMMHMyXjVJfCLcJR0cPKy6rLQ4E8doyeoMVwHnb/fM7Nb4uPVpjkZeVuelaLVzBu9zuOVbo2Gvu/uFFduxfPne/jWT1w+0nYL8umMflxy6DKmFpm9Xnx35absx5xqkRGu2eTU2otU9EHDjuFswUTeLSQranJODzVNyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777568502; c=relaxed/simple;
	bh=fuTPZzLeQpxxgglnlIKcfEjSZIZ8CufrAc3nDKCmECM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mDoWeyBa2ooo/mSTdhcKKhg5zZvgrJ0u0W+Cm3geOHQaIjs51ArfOmBLFMjGoy8aAvMc7m1xaz1sWy+E6hO/cST+F2zrPHhtAS+46n9xsjoxdnL2AqzUTmK17kfZ5/yKMOKjfrcc/1Cn6h/Ejb3E3Suzbg1wAAmjXS1zt4Mbhh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RETGdYmf; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RETGdYmf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=qZ
	ABNGoWFWoPhAAOCiuFPy4aggXq+lshlAidBfGbMEE=; b=RETGdYmfI2CPs/bCzO
	g5RD2OX8Xm+X/1YGCy9M+P8/oibjK1By1+5Kpw/Gc4vwiOHbBhNbYUwy2a79GQ7w
	9i1fYMx1wXMKdgqqoPusZlHArI0HzPQT6A3Y3aFISYWuL08DjVr7EhqOBd5Rn29s
	w/5+M4WSV4Ec9I+O8RxEHs++I=
Received: from zhb.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgAHlazWivNpMZwfCA--.7765S3;
	Fri, 01 May 2026 01:01:12 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: linusw@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	dlan@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 1/2] pinctrl: sophgo: Use FIELD_MODIFY()
Date: Fri,  1 May 2026 01:01:03 +0800
Message-Id: <20260430170104.53854-2-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430170104.53854-1-18255117159@163.com>
References: <20260430170104.53854-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgAHlazWivNpMZwfCA--.7765S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7urW7uF43GrWktry3WrykZrb_yoW8uFyDpr
	4SkrWSyr1Dtr4rury5CF4qkr1Yg3WxK3srGa13tw12g3W8JryUZF98KFyYvr4rXFWI9r4r
	Wa1xZry5ZF45ArUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR73kJUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7Bkw02nzitl86AAA3L

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
index c3a2dcf71f2a..40a85d93b52e 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
@@ -333,13 +333,11 @@ static int cv1800_pinconf_compute_config(struct sophgo_pinctrl *pctrl,
 
 		switch (param) {
 		case PIN_CONFIG_BIAS_PULL_DOWN:
-			v &= ~PIN_IO_PULLDOWN;
-			v |= FIELD_PREP(PIN_IO_PULLDOWN, arg);
+			FIELD_MODIFY(PIN_IO_PULLDOWN, &v, arg);
 			m |= PIN_IO_PULLDOWN;
 			break;
 		case PIN_CONFIG_BIAS_PULL_UP:
-			v &= ~PIN_IO_PULLUP;
-			v |= FIELD_PREP(PIN_IO_PULLUP, arg);
+			FIELD_MODIFY(PIN_IO_PULLUP, &v, arg);
 			m |= PIN_IO_PULLUP;
 			break;
 		case PIN_CONFIG_DRIVE_STRENGTH_UA:
@@ -347,8 +345,7 @@ static int cv1800_pinconf_compute_config(struct sophgo_pinctrl *pctrl,
 						    priv->power_cfg, arg);
 			if (ret < 0)
 				return ret;
-			v &= ~PIN_IO_DRIVE;
-			v |= FIELD_PREP(PIN_IO_DRIVE, ret);
+			FIELD_MODIFY(PIN_IO_DRIVE, &v, ret);
 			m |= PIN_IO_DRIVE;
 			break;
 		case PIN_CONFIG_INPUT_SCHMITT_UV:
@@ -356,21 +353,18 @@ static int cv1800_pinconf_compute_config(struct sophgo_pinctrl *pctrl,
 							 priv->power_cfg, arg);
 			if (ret < 0)
 				return ret;
-			v &= ~PIN_IO_SCHMITT;
-			v |= FIELD_PREP(PIN_IO_SCHMITT, ret);
+			FIELD_MODIFY(PIN_IO_SCHMITT, &v, ret);
 			m |= PIN_IO_SCHMITT;
 			break;
 		case PIN_CONFIG_POWER_SOURCE:
 			/* Ignore power source as it is always fixed */
 			break;
 		case PIN_CONFIG_SLEW_RATE:
-			v &= ~PIN_IO_OUT_FAST_SLEW;
-			v |= FIELD_PREP(PIN_IO_OUT_FAST_SLEW, arg);
+			FIELD_MODIFY(PIN_IO_OUT_FAST_SLEW, &v, arg);
 			m |= PIN_IO_OUT_FAST_SLEW;
 			break;
 		case PIN_CONFIG_BIAS_BUS_HOLD:
-			v &= ~PIN_IO_BUS_HOLD;
-			v |= FIELD_PREP(PIN_IO_BUS_HOLD, arg);
+			FIELD_MODIFY(PIN_IO_BUS_HOLD, &v, arg);
 			m |= PIN_IO_BUS_HOLD;
 			break;
 		default:
-- 
2.34.1

