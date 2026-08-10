Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87A93D891B;
	Mon, 10 Aug 2026 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364749; cv=none; b=pAIFm3jt4k0LQisLVbVY+wCnJ94zNbqQ7RJwRotVSvvTqIAL//L+1nG8wuDtPkbDDx0oQWotyso79+v4fHSV/0bMlmnwfLqmgYDOpJ8Mfv+ETXcy2CJfrT0DmjaxpBhiRFfHsoQDb5tJlZns+bOXZixXp6nd0kOs9RG6R8k5hCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364749; c=relaxed/simple;
	bh=vZac1ji0I2lbNpDkmzQP3TJvCTOj42vg2oAMlAK30yA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WR4Pkeb8v7DLDl7uhCp9iVBfCWD3TFyDTLhiLHS0sPHNaNGKeFHsUnEDU+2yuGKFSboMD6KwEC4VVIcTYiQrfeMzqeFKmuItug51twWpvWVwVLJSSOo4NutXcLuzYRIz7GMG7J1jgmg+SfltNH75uSjmVvPJr1S+eJ2mxstpyH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkCYCYeh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkCYCYeh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81DCDC2BD04;
	Mon, 10 Aug 2026 12:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786364749;
	bh=vZac1ji0I2lbNpDkmzQP3TJvCTOj42vg2oAMlAK30yA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gkCYCYehNEPWk97d+N5GgIlgttDcBotLAPNGOlSKXwwWC40FU7Xogx9VC5KKkCEUI
	 9g4Fhesq6vTp16e0ro8Dpzcfxj2MYuAyP1algEgsCxtOS6QUVpp0aGoPbC6rcthc6V
	 w6lmkawQTjFj1WgMEpD6t3qv6dfLg2rXHmqciSLRfUWVSWcD0Ga8xIjDo6esGUWd1f
	 Ub9ijizwIYgO116Xg0xxB+W50z8/iNxptJ2DBe/ljWEX7elp/+zVLe6CbY7N2puiw2
	 lgJ9YGoiasBgDufCJB09AZmG0y80G0bvUG44UyMv7SoJbbtch8yQeNcoVpvL9TRhAL
	 8/apbTmT2QinQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70197C5B56A;
	Mon, 10 Aug 2026 12:25:49 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Mon, 10 Aug 2026 20:25:32 +0800
Subject: [PATCH RFC v7 6/8] mfd: ls2kbmc: Able to be compiled as a module
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-ls2kbmc-mod-v7-6-8aa0fb5a5462@gmail.com>
References: <20260810-ls2kbmc-mod-v7-0-8aa0fb5a5462@gmail.com>
In-Reply-To: <20260810-ls2kbmc-mod-v7-0-8aa0fb5a5462@gmail.com>
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
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqecNK0qg/Jrjw9Ll/FOMMe2v4VrXstJSrbKo1T
 0g6uyqzZI6JAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCannDSgAKCRCwMePKe/7Z
 bmdXEACUGds/nD1M/ElkbmFm5dpHvSWni1XBM8ta7+UpMn7UJDVmG6j6NP/OnyknmR1f3GuJabc
 IUiA5y5lM3RtzP3kH0ei8AET0QU++Jqz5spcpfTkPqwl62xexWiK/+FTp8LayV6oFGlWAn6zlVQ
 3hazb/MzsEAB+bNSHDtJ1My96tVoczHn560d9jqijiskIadHTn5Kpy123QVwzb61T0ClnAp+tM2
 s7AMmKN8PM4fpTCxhgY8wA+4VoKTvBiDYiwX2ebQzx6Owf7oE3qjSZfTV5gEA2JHL7tbNS6DqIX
 6Dq50ie5/hb0u9serMr++x+rSh+FUjrGHyowikPS+d8l/LnEbiFKtIErPrN8/+hdtPELSnz50M9
 aUdNoY39nNBNwlKuAZuXebaG1VNjxErAw1SeqKerw5KE+51C/s1ilkDLcNSMvmOiOi1y/Q+dzuz
 SdiBN8/tMRTaDhMylT8+xyt8K48EJr8sBC6QBE+zAzY8ZhrrRQfnxdZr4cUYHc9t1XTKqNt/o6g
 3Nduc21OHEAHp8GycA4Oz/ufws6H940Z99eFKkrNUmjIkBLrBIletqLUOc17SLCjbGpz/soSa+S
 iw95vRAEpWmY/CkRky/9e3YxxMNSKhGQbd88gseh/N1ireVQXiuHRRAjEm8MyNQcjZKi6PAOEm1
 NdbW8oyhomPvSqw==
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


