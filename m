Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954BF411F9E;
	Tue, 11 Aug 2026 08:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786435663; cv=none; b=UBjskegf9AHvuG18weJ4Ep9YxubHODyoIqwv5ZoNLGdv+w/91vfQVPGpawt8QrVsv59I8m4ZF5EftH4RC05flCDulwIte7DlBHn8ecZZVRbyDDIDMxI6GmVXfkY3YCYUDBHBr6SOaDDcHhmbvEsB9aGmoPUKxan3pT7rWauZU9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786435663; c=relaxed/simple;
	bh=PJ2SYnR4uBlOnCbcUj/L5uulnkl4LU2hhPMleCflk/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XymqPHZqoH1doIT8E3vOeMJEns4eEs8nibcr8AICd8892iBoc20kRVv0Lss54xYnQe8V41FHdluIGJMMU/pbJl3QZrJcyVMapSW8IVHtmau94yYFgb9jwgKjmbYmcO0lLrAnd/Buclytdgnyey9uGf/eQhPhAztTJgdyi3/T8mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VP2SEf4F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VP2SEf4F"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56044C4AF0B;
	Tue, 11 Aug 2026 08:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786435663;
	bh=PJ2SYnR4uBlOnCbcUj/L5uulnkl4LU2hhPMleCflk/Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VP2SEf4FzgCbETPnvg7IUFZXscDP4xLI5mA1ZgiioN+u4xaA90Rymdqq4KppHbNvM
	 UHD9iEBDyj667o3OobGnKQDM4qeBkyRL6Ln6INy+pVNTiz02FA5/haIPbUgzPXitQi
	 JyLctq6v+OZld1ibnZcFGICWhRK+YHnMEMSTfepAct2Boz3uCT/tRh9CN8WuHTkYJ8
	 yiNmyAHCPt0CAeYp3S6o/nsfQu6ogo0VdeXZIr426H+cf4FOCuMSbyUCQtHMGhmruX
	 y6d2gAw9RAi43hKMwq4cGh1k6zEMxC9VA+sd0/k+gGjy6MpUB+1wNmywrD8sZIJ9d6
	 PnADLXguoQflA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C69C5CFD9;
	Tue, 11 Aug 2026 08:07:43 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Tue, 11 Aug 2026 16:07:32 +0800
Subject: [PATCH RFC v9 8/8] mfd: ls2kbmc: Able to be compiled as a module
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-ls2kbmc-mod-v9-8-4fa9a5584406@gmail.com>
References: <20260811-ls2kbmc-mod-v9-0-4fa9a5584406@gmail.com>
In-Reply-To: <20260811-ls2kbmc-mod-v9-0-4fa9a5584406@gmail.com>
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
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqethMWV2qXS58xFfnyVtc9+wioVm8Kh4sBoBiV
 pryLDceLX6JAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCanrYTAAKCRCwMePKe/7Z
 bueaEACGsvnW1rziCnhuVXB+rj60QbepcXFUhcfymHjD9/vP/7IOUOjdxdre9+WYkp243W9fho/
 e5O7tR5FA/4IV087cymr7XZ9CJMUtPE26EmX0eE2qIxWTG4pNkv469yCe2UqEuErPTwHNrZQOoU
 7pVc2h+HKdgFXDoimOciguf8yC//dqYeEv8optTX8Ky2LR7AzQ+X9jI0hdXiDFHEpKA96Xj0673
 Pc2JCdxIEEzoqeyQSlePezWuqIvtO8IpIiw72iR69fg0zjejqhGjXjbaZcM7j9Juo9GGdqNFfA/
 08CoKL5wgejhkOafxdXjHxLBtBvT+iCgJk8BfQp5snip0gj/nK0kWjmelr+OAEhde3UgOOt4gft
 YlsIAW9LdX+Yo5IdvnzbSD791Lfh5etds1b+crw2ewCUGDB4B3W49xDxiMVVZpaGsg9SJQ8ZZJY
 PQJX/+Z72kOONVaId18oLbo16RmJDRO2A1KXFzoF+FAcBdJI+gvY4afZrAklmcMdh6A+zsnh/Wc
 DwxijvrggBDD9nOhGKcuayEOBl3gJTH75NVuKjahk3TO5baUw0/uAR97Ztuj8nDTJpdMOgNRRd4
 CuHewcm7WS6ozePJqCvFvb7TjQYvhKRoUd0z7esjK+ffp4PqUyrWcelPGOY3sG1fm4SVmZ5i3Vf
 uEFiKeESkHFNKOQ==
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


