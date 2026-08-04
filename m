Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFCE4749C7;
	Tue,  4 Aug 2026 19:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785870874; cv=none; b=UX4cctNd9qWge88zDjijmBaWR4EBzOTHz3Pc9o36O5xAqy3prwsJrimyd8FmGDXYQ3RPuPkPKHpelOJm6w6s1F3Lvm6H2PCRHVat6rzHDblmXhRjUdwyZsHjfcn1VcYlW7/kalVI8frTI8+5tiSFIkUxOI0C5Myq7V69N6Rmx78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785870874; c=relaxed/simple;
	bh=fU8usTjUA60Rf4D6wb+h4cXL1Y0SfWD4mw9WYuLXMi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gcn+kA14wUiXBF/zf6B89CgCo9G8MFEDKwPSQWHfljFJGK61vCpsrdunARXsh/Z5muZDfjiHC4RnRrhT5824ZpEECT2UgRXm20SYJoGTCEwmeIzX46IOMnG7MzAfTu1xNupmKR4cDE371M6eZM6uJvimqirvZ4pVATWx/MKKOCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HSi+sWC2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HSi+sWC2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62DFBC2BCFD;
	Tue,  4 Aug 2026 19:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785870874;
	bh=fU8usTjUA60Rf4D6wb+h4cXL1Y0SfWD4mw9WYuLXMi8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HSi+sWC25Pb3Rqm4X2DJNI3KAuWiCLgrxHVTkXuGmgBh/qTdD/8M15dZAtT72b1SG
	 u9/YUpOFEnecLavE8UqH6WK/+9P+oPWPOWXT6+96gTizxIBgMTsDNxcEH6RcT9bMeO
	 95nVS7LZ8Xx0p6sh39JqY0t/YMqkbzGghSo0IFBn9YdDRj1Hy6HmMC4g/ML7Ll4trJ
	 QaBo+0D4l47d5/beTQP6UIv+Q+MmeEQb/rPJ1e6bwZmag9uDG5ZHZnvG+if281Abtr
	 LcSACFGXuakj6KqcDZ6kbx2FsaN6vEbyRHJaBCYPlUGHpZv//HpcXQ3woVZyvY5HfA
	 ZxjN6+zWcbu1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F22CC55ABA;
	Tue,  4 Aug 2026 19:14:34 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Wed, 05 Aug 2026 03:14:23 +0800
Subject: [PATCH RFC v6 5/7] ipmi: ls2k: adjust dependency to its mfd driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-ls2kbmc-mod-v6-5-16ccde412d86@gmail.com>
References: <20260805-ls2kbmc-mod-v6-0-16ccde412d86@gmail.com>
In-Reply-To: <20260805-ls2kbmc-mod-v6-0-16ccde412d86@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1710;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=fpiTDlsJul0/E2sbRt8CcUmthxoiG2abu6bbCUuF/C8=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqcjoX2yPyf6ZbALvv192CCQyy3/z+CEEqZfCKm
 5Zp0IRGOUaJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCanI6FwAKCRCwMePKe/7Z
 biu5EACpbxNgd9sAvkg/GzaEPsa9a9fh167AxBEYBKD6xmWYr0DyPLhTXCAwwEvYCLSIqvmQkm3
 9sYQIukasRGtEo1ysLM640QrtlVgYBGqOJuIS6Z4keFdXAM2Q2yRBLLOJqR7/dDBD3q/0hNvtPQ
 RR8w8XwNairhTiZNjuxityIFXZGjgwsRvEjuMvPkAxCANngacnQ10owkH7C4niBMaYXvEDcn6MX
 o6wNxUUYTFsqMs+SaPXp7xWH7xQfvCrTwepCpYln3pTKjKZBK0EB3KGYufGqnLEKWL42Qq2hKQa
 X9aMxefe6chaa/YVvoVdyw8z/BBCzTK0VJS+POikvTpOzckk35MW2D37nGeT2XYfe1Al9vdtdnO
 40CsCDvIJvo1HY9pif9XM54vqjf+nNDynA2yWJUttp7/hfDtbhU9xwh12C5d4ZK2eY3DUtPAsH6
 YarwYVT0MaOQMWUfzgXgWDqLXyU9rgxTGMngExmAL9R5+ZlhiqpwpdzWJ7Dyh1+9HtBlrZf907c
 5uBpkR+yLUJlY/ZLovJblcejB4/P7EI6dvuGxG/LmY0+PxJvmvLnQs3JZUntSX0OtH1sdMj4MtK
 wOetI2g9P5C+bejiBV48QzO5bAjVcPvt4cJvaySSMCSSbk3QaGBdz9lpWwsdOWEurCujBBQtL9o
 yy3KcOTDMbAhhng==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com

From: Miao Wang <shankerwangmiao@gmail.com>

There is functional dependency between the IPMI driver and its mfd
driver. Previously, the dependency was set to "select" from
IPMI_LS2K to MFD_LS2K_BMC_CORE. However, the ipmi driver is actually
compiled as a part of the ipmi_si module, and IPMI_LS2K is a bool
option. Therefore, the dependency "select" will force the mfd driver
to be compiled built-in when the ipmi driver is built as a module. This
is not desirable. This patch fixes this by declaring a conditional
dependency from IPMI_SI to MFD_LS2K_BMC_CORE if IPMI_LS2K is selected.
This will allow the mfd driver to be compiled as a module if the ipmi
driver is built as a module. The adjustment to Kconfig for the mfd
driver will be introduced in the later patch in this series.

Fixes: d46651d4e3c0 ("ipmi: Add Loongson-2K BMC support")
Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/char/ipmi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index 669f7600019747bcd2b37563477cf336f19a0407..07f3308c71616215871a730b87f1991d2b502e63 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -62,6 +62,7 @@ config IPMI_DEVICE_INTERFACE
 config IPMI_SI
 	tristate 'IPMI System Interface handler'
 	select IPMI_PLAT_DATA
+	select MFD_LS2K_BMC_CORE if IPMI_LS2K
 	help
 	  Provides a driver for System Interfaces (KCS, SMIC, BT).
 	  Currently, only KCS and SMIC are supported.  If
@@ -87,7 +88,6 @@ config IPMI_IPMB
 config IPMI_LS2K
 	bool 'Loongson-2K IPMI interface'
 	depends on LOONGARCH
-	select MFD_LS2K_BMC_CORE
 	help
 	  Provides a driver for Loongson-2K IPMI interfaces.
 

-- 
2.49.0


