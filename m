Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5121A411A07;
	Thu, 30 Jul 2026 17:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431015; cv=none; b=MxSgGcBCkYeiVNFEdyKX9gEvMRji11XDJQnIiBVTcr59J6Pm3dIJj0FM2ePyCRYhbbWkMVFHcYMLozpNsc8u/RKZttctaARf456l+xeYN2axLHHUy/1jgUG1iZQlztppDOe6O55eMfx0CmErX69wX7pe7XLv4i0PVUUiYo0+OGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431015; c=relaxed/simple;
	bh=vZac1ji0I2lbNpDkmzQP3TJvCTOj42vg2oAMlAK30yA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kOUKskRabB+ENydkx0e4EJ2SBbjjAon5uqigaaryWf9A6xrB9+NFOSfE6LXuUOckMODHCP9qddUSYeSY/5mAKLkkQCFuo2HzTmdqRdOoilwxFnXNWUZA+kMGWgKPBHujqMr0BhnqueGA1R+5qe4wwYTS5EpPxd+3TiDk5K5uJNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNdftLe+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNdftLe+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14C9CC19425;
	Thu, 30 Jul 2026 17:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785431015;
	bh=vZac1ji0I2lbNpDkmzQP3TJvCTOj42vg2oAMlAK30yA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TNdftLe+v185WHcwTFUzR0jrB5PB06ypCDfUGWf3ENf2LCyvxFngAq3PMGrL+XB6J
	 +0ZcDs8vQb7Z+K+lkj8EzSYV2YDPLoLO109RRZyglTWxotZcBvihKfl8t0rXueVlUD
	 mGMwlgBNVHwsDUFm1EGdyxd5cgWhBLwRJrCfQ/xDRjbVoI76YCZVlSKJyWaIeydGdf
	 sWdyMIiTglCsHsuu1H9eX2S52g4NyFgR+F6MmQnvoW5cqm1JhhXV7AcEhCSjF/8S4g
	 7sXI1jzoUKcV2Ia6SnRWQ0lQmWOwUWNcheSuVaOBPwfcUn5qxDerNcSX8C7AIF21I3
	 iJNBkBtWJh0FQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F08C9C55162;
	Thu, 30 Jul 2026 17:03:34 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Fri, 31 Jul 2026 01:03:27 +0800
Subject: [PATCH RFC v4 6/7] mfd: ls2kbmc: Able to be compiled as a module
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-ls2kbmc-mod-v4-6-d201502ba239@gmail.com>
References: <20260731-ls2kbmc-mod-v4-0-d201502ba239@gmail.com>
In-Reply-To: <20260731-ls2kbmc-mod-v4-0-d201502ba239@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>, 
 Chong Qiao <qiaochong@loongson.cn>, Lee Jones <lee@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, Corey Minyard <corey@minyard.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=726;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=4cYoUAWfr6lC2eTeoh29c5JZOLqOi/IiHDJf/iiky6g=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqa4PkPA7Wc+GA/AWysPzTopCQ/u799JcW50iAE
 gYHP7WFcDiJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCamuD5AAKCRCwMePKe/7Z
 bmTJD/9b2FHYtuxq3H2vctryvHH3u9rTvMlDfbcBCjy/IFkpW11r2S3GVggbpfPveYRJVnbOQPm
 XVq0y3d071BzuzurxvLa820eQw6oCum2KBlzCh9HhkYs2SXP6MzeivAD4LITG1cbMhTYlskF10R
 55UoTKMKu+u6umyBiTwjyJcp8K3yvtvg7t3PAbx8MD97Bu1q3FDFFGMvsAaApuC62ZmoqxRlz6e
 YviyPmLfwQNRL0uiu87jtLbFsakW8CQGDWNOj8HqLeJgodleJWfHqJlnxdHqhLwZSQegbXABhbs
 V4C7/eMCP3RI9wdUwMO6fpGDVmoBQPVF+6fiZaeqh8r+s2h0Q+HjaF10zmVRISq7XMiopZgVihg
 oU2itVZEl6HNEZcTOsgD5VpsEavw/15VoUxfo3bPprIGzjqrIi8Qd6egoe+9JaZefD3+lOLQosj
 KBKUv2gPc84DO/DOHk5AGjpX5sQk8eqOWTZbWiyHdBhhdfpAZgN1LC95ioqosR+IQtzdV0xIE5K
 29gFhpbXseggkxzyFbD7lOn7D6x2Kb4Z3vke2QD0sAre8fVLNuIwc6lxXM04vFBCJgMxVnMuvLq
 Pkr2ot9237tz/BKZBBLF4blj56MtgzltbrBkd5TD93/UfoeHo5i2SUD4POPvVbu1/78ar3HCJId
 8S0DGe5wW6dxWfQ==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com

From: Miao Wang <shankerwangmiao@gmail.com>

Make ls2kmc able to be compiled as a module

Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/mfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 763ce6a34782bdd5d2b1a4d840c75b040092d83e..a7a9f97af248c88489dc1203a1ba05f2ce4827df 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2494,7 +2494,7 @@ config MFD_LOONGSON_SE
 	  which will forward them to the corresponding engine.
 
 config MFD_LS2K_BMC_CORE
-	bool "Loongson-2K Board Management Controller Support"
+	tristate "Loongson-2K Board Management Controller Support"
 	depends on PCI && ACPI_GENERIC_GSI
 	select MFD_CORE
 	help

-- 
2.49.0


