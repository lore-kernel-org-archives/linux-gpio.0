Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCB239525E;
	Mon,  3 Aug 2026 16:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776206; cv=none; b=Khx/CkqdmR4iW0KBF55bG05PsUo2gYya4Ti4tpQrT6KtUvmkkHepsmImYT3itePFVOfsYB+4Uby3XOGXiopr7iAO6vKCwe1p4A2izM07hKvtJq7Os2zoHeL5CdGXDFjUOHk4aos1wO4R5s/FFAIOXjiFf7tFz49i2ncvC4QU3ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776206; c=relaxed/simple;
	bh=vZac1ji0I2lbNpDkmzQP3TJvCTOj42vg2oAMlAK30yA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IApMXcUl063LPAxwupI2rq+G88i5i7AI8Aov7J+Rz3GdpJrQrWWDTRClM/ftPuOZXi4jmF8VQxhBRHWFtEXsotIW4+8GrKIKd822UfAe9auFbf/ONXHb5p4M6t5RaCgZNfPyztT440I/xfREiw18x08D1n+RCuWEWYQCnYiMGz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBTuLm5M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBTuLm5M"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03DB6C4AF12;
	Mon,  3 Aug 2026 16:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785776206;
	bh=vZac1ji0I2lbNpDkmzQP3TJvCTOj42vg2oAMlAK30yA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WBTuLm5M4B4n/s132yz/RiVXbbcUExoiL0FgcMkyB4dHw/vb/W2xckkJ3h17I8nqf
	 uAAejYlDRMz3rHjw5R6nYIx5lBf9pEPCn2PvnDfUhu7PIOa5zVRd9ago17GZAHs1Jf
	 n69WbjrFf30vFoC2JAGHDhBPPMa4yAFtUeawbByaaGC9CkKVFKfNuBMFa2IDpEaPbc
	 5zt1lWUS3xr+5mmm8fdD/zbCw+qnDWfLYeStcUIyCPcs0Dfz/MtX0458X/AlGEAKTR
	 qaWXl510SVqHNpEzVWI10581QuDe5/4V9pCEQqt0zu+DscdcGziRcbiSWHH8B1wSD3
	 ylf/yZULHmtUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69E4C55822;
	Mon,  3 Aug 2026 16:56:45 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Tue, 04 Aug 2026 00:55:54 +0800
Subject: [PATCH RFC v5 6/7] mfd: ls2kbmc: Able to be compiled as a module
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-ls2kbmc-mod-v5-6-e6bc5cdd9a93@gmail.com>
References: <20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com>
In-Reply-To: <20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com>
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
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqcMhKiv0vPvGaKDS59l99E0Hr6Vacx6sBqnp3c
 0rDZSl4e7eJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCanDISgAKCRCwMePKe/7Z
 bgaZEACu4h57kqez/+wUZsqc8Zn4n0TLdacI9nhuEuQUFiJJ0QkmvsRb6PDeZ6Hyk0RG070ioFn
 /xpTQt/M8MCPXlhI/idRPF8zWtLC6NHR/unfUAhkLelgd9PLp8wiJ2+TqrJ/2rT7tjhZBuJy/QU
 2OzcirSuQXL2XaCojeysGU6IDoZ95Tf+ixDVp6lIr1A7uHVjZN4H4hMecUJUwV4gmI2hy9j1mzb
 4MGXfFldNN9PIwsOwKwK8TkZPhd6RYLdxtghewv4JROKsnHVev7N6m4a1isnJ1ZRiB6BaEeFz8F
 sDvgO7LSkuDsbO+u4SZxPwTipyx/X7f+U34p/4ScATTesMsKIKwLTx8NK6UWHOXprQL6JSVPTP/
 DeWdWgWfXBEbMm4NsnAJ8aL7yhmpgVp/4FbaB+REqyeDWuIQzlCum5MYgrkrZrjpz5zo43i/eMN
 chYy4lRDbgQK3qZ9YUdVe0joB4vgY2dWk4LR5kahPbEqAle7r8E/mgg8TZNiUj/Rv6WZyDhdEds
 4dVMS7IuC/MKtPdwwD5hkCAWSHO2m/lSPBKxAabuQvNbsHHvo8RT1Uidvy+8bf3NfypQ+8q3KOY
 cUzbT8+NN18c3V2EiCGqV82KG3YWhHb4qcavAeHOvQJ54nz7IbLG4erAeAAkVdJ5/cWnU/t4fXs
 pMmsiIupLnhUt1g==
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


