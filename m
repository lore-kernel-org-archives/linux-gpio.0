Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915CE3E7621;
	Mon, 10 Aug 2026 13:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367079; cv=none; b=FDn5piLlo0VxqRrCno5QSnHrV5SQ4TNNK2TQWiLosyLarIF1i2UC4iu4hgMYAL657wmo9187xV8pP7ZSw5DoIKNpploTLs9y5D3wLWeSe7aTYk55viDxIPhobfFkJ0w2VOGnj1flm5xkpaC/hd0z+BvhK25QJe8DpFos0C5czvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367079; c=relaxed/simple;
	bh=PJ2SYnR4uBlOnCbcUj/L5uulnkl4LU2hhPMleCflk/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EzTJy9Lam6W5ycQssuCcHse8P0KmBord75RmaO98Bv0OZbVLsKKHxZrjwlLX+m/BQ5Agkl3sZoV11QNrs1+l0Ugk0ierQjCzuBav5AF9MDHjy5eHQ6f8+aNgi2FAsvE9xR3jRdhU1TxFTFcaSw3fnONE/5hN4rbo+1PxGPQvPB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fycDhFZ5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fycDhFZ5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93557C4AF14;
	Mon, 10 Aug 2026 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786367078;
	bh=PJ2SYnR4uBlOnCbcUj/L5uulnkl4LU2hhPMleCflk/Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fycDhFZ5v9noLj6cfAbcwmOapkrGwvBdlGapF4GDb82806PEnCCrD0USb/dKkCSpx
	 8KalbbR0gXGJ/WXYAJKizuEqKBQSMLoipdDZ/ubHXDEqLyUtzfeVUYRGrYBg+2W1P6
	 zcdlE0Sixi6T1iPY85jce4+0M1OoZYJLvnq9CCrttz081VIM1B04nILNifUMU6PAJ9
	 yrRtJss6r9EK2vqrSWwxxhGqGd2mKripGVzy8oashbbaeelPYAVL1unEq310YIbpIJ
	 bGqVhA/aZXxjGzmj7tA9v0TutdYQlnnB/fdqoEmbXp8Ba+dpFYEcMBMpyxD7GVoQdy
	 a1/fxIPrPcx/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8155CC5B56C;
	Mon, 10 Aug 2026 13:04:38 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Mon, 10 Aug 2026 21:04:31 +0800
Subject: [PATCH RFC v8 8/8] mfd: ls2kbmc: Able to be compiled as a module
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-ls2kbmc-mod-v8-8-16e44f7322f4@gmail.com>
References: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
In-Reply-To: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=727;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=UkpVPtBCUcqPjbP+E9BhIFiau/5G+QeU7wsp0vFpbTU=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqecxjuLocFhKFEGmvnRkYvp85MXealIssarLZz
 Sl4dMs4LAWJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCannMYwAKCRCwMePKe/7Z
 bnlWD/4xgfwlalceBe7M+T02Baov/hJBfeEDrnZ71V7LuqCm04rJwAi40oOmMSXwptRb7Vl5rnZ
 /FBmYxCz3Zz4QCTTn6s/cE++8hjhoolhaM81DdSAGEdrXb/5wM8owRrlMuUGzr1sKVineRXUri3
 0NLNVynA1fJ6pL+oWKK6VV9y+8bPpKp4M5VU6MT+t6QIHt4KfVPELpyozkCSYe8txtTdwfnOH0w
 llp8N+DZaaHFgiXQuJaOwV9FjdksyRuiFFb4PaaVBKs8HpWeSMqneYwkDRE8XOUidq91eIY4sa3
 X+c8VcSpei2h8rv4LPQV8tI7QF7UUqlqQSygNLE81r0jswQZEZsjTzNnkOyYCj3UW5yOGHPnpFq
 5B+sgga+t1Yh+Q1+RKQcnHNTJ2nqWx+NMvnmI3heCQ6Ydd1GhbEgi9Q1uHErPTLabpfm5mv36k7
 uvGpEX9DyywKkgEsXpIdqY98kIHVgznUlMSA/rSSHjvx1dyFmlJiQqALcl+YyPsLvm+60sumMov
 FeUo5dfNI/W2kGPwiYAShSGgMVgAM50nKvwRAvmFeqc5xTlONb+P8KMhULsACmnJ2MZyw+C89Me
 Y0m9ElY9DTA1Kl2mMYI2H9+uFShq52IQlW4z++2OLsF8rDz3J59ZAPQA5pJkfTSY/5IC2I6lBWq
 +TbRUt9j12MyAiA==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com

From: Miao Wang <shankerwangmiao@gmail.com>

Make ls2kbmc able to be compiled as a module

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


