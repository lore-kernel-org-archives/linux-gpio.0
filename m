Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402DF395266;
	Mon,  3 Aug 2026 16:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776206; cv=none; b=l9Hia3BAmRYQgqYblFHhFgg1a26e6eZ7kEv82RMjqqSG5LpNXnQko0Jo/UnimWO9TgfDbJPUBKaE4ZKmI/GZZEQZssebvh46aOzTiAyhC94XXJglYqbOYRiEf/Pt3r+a7MiwmJrcp9D5IUgNVa5tOb4nx79f08LASoVdZQf1WRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776206; c=relaxed/simple;
	bh=WfZ+z7682VFLD8O5mpMXciAcTTygQXbQjtjD80ndMT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jJXXcyGKvE/f//nHEJdpDaXgHC6IGiiBoDrFj9IC8QPbKXYvvYqhCMXIioRcdXV9cvkSrllvy0N40q1szon2dgAmmrUX4/HYno9aL5+K6JDUJu+5GUOU1jGNAquYoJ0+nl4ASepHWDgLSrdR32pe7M1qa8MLjClUQTl9JQJ1tSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=thmgH+jL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="thmgH+jL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBEE4C2BD00;
	Mon,  3 Aug 2026 16:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785776206;
	bh=WfZ+z7682VFLD8O5mpMXciAcTTygQXbQjtjD80ndMT8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=thmgH+jLj2ynWhCw+v3i9qjXLlyZJ1ePdXPp7L1Gt+Nzfo7dwTEssjvGA0Jct21qt
	 UbQcQiFjqBxYuHJPkg19gY7X0dDKG+uqTL7OMi6zzR+wWKfENx86UeSsY2/GDq0AIO
	 cbFF3uvbOpKFc5K9q8gcsX/cQVYmskY4T7RoBAuGEIPG2vTP+1mW8VmmEUt9a87uiH
	 4LFmepaXe63yt5mLwNXuLXEFoh5RZJ7px7tOFwROjHNd5Shk0WxT9zzInjb+qr8wEf
	 W9F+mnpZTTrg1iMZe1L55AG0NQg3mB0dEk8ZD8pxBeDv7ZkuNFc8aZRc94kPfvNmN8
	 VtRWd4CTD6iAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D471DC55AB9;
	Mon,  3 Aug 2026 16:56:45 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Tue, 04 Aug 2026 00:55:53 +0800
Subject: [PATCH RFC v5 5/7] ipmi: ls2k: Relax the dependency to its mfd
 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-ls2kbmc-mod-v5-5-e6bc5cdd9a93@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1366;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=gWOO98z6lpPREnTgNizoggde9a0/OsZs516s8lw5YNI=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqcMhKLjA7Pw71S5bqO8V/3cOJ+RNzMUIsZ1+R4
 faly8Er4oCJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCanDISgAKCRCwMePKe/7Z
 bjU3D/9zO9GKSVabQGWvriUD7pAikHYnLgNvakZ0ZsA22rBP+B9nuItLx/F0gZuM4/GtWsRbObj
 dEdZgNjAcK8uJeyOIu69C71A/iVcRDGuzPpB7pICy/gSYn5I2ZA/+9McNDnsTE7femZikHHjt1X
 wJmg0EdzCSWz2MwVv+9KhwCxSbToMv+6X6Ae3I1B9WkU8gqwSsi2z5y10LsKCcpnzYtmvx1IPK9
 Vqm7ofvXaGOC3FXZAGQN2B73VAoa2905VJ/FNntOQy6WVx1j/Lp7Rlz5BImSJpqbDYix4lJLwcp
 KVUBkRIYDFPExT72Gf1MeqOrqXv46xwnjwN13Dk/APApNqHLrlRGbwSjsRFcW3DVSzOh21c6LFC
 mVrQE9D6WhZqQjathlGvtwuiXsQO4tqoiYVGwkMehYelsgD444oCJ9hOBI0Z6GOWvQhnJIYgbqI
 FhVsG/RVh7EdDk+StY74HJIi+j/0y/Yl8cIbrjtM8pP0AZfiEND8+9ge/LKvOMJddJsPQ/wjciC
 cK3UWyUtGMFMVdfXXZUN7Hdf8c9mYmxXuD9lJckVSPxZxlFlFF4SM2xWom0kM236KcZAF0uBg/l
 m+ZYoyvIf2L5ZWDDbbo+UnLt5c1sCTrLBcZPKX5qYdhyUu5/4ZcVhKlH3IEIOJj0FX4pvzyvhbD
 GJIutlcIHZ7hh5w==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com

From: Miao Wang <shankerwangmiao@gmail.com>

There is no strong dependency between the IPMI driver and its mfd
driver. Although the IPMI driver will not work without the mfd driver,
it is not a hard dependency. The IPMI driver can actually be compiled
without the mfd driver, and it will just fail to probe. When the mfd
driver is loaded, the IPMI driver will probe successfully. Therefore,
the dependency of the IPMI driver on its mfd driver should be relaxed
to "imply" from "select". This will allow the mfd driver to be compiled
as a module and the IPMI driver to be compiled as a part of the ipmi_si
module. The adjustment to Kconfig for the mfd driver will be introduced
in the later patch in this series.

Fixes: d46651d4e3c0 ("ipmi: Add Loongson-2K BMC support")
Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/char/ipmi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index 669f7600019747bcd2b37563477cf336f19a0407..f456e3e89416932f0d21bb742153a503aeb24267 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -87,7 +87,7 @@ config IPMI_IPMB
 config IPMI_LS2K
 	bool 'Loongson-2K IPMI interface'
 	depends on LOONGARCH
-	select MFD_LS2K_BMC_CORE
+	imply MFD_LS2K_BMC_CORE
 	help
 	  Provides a driver for Loongson-2K IPMI interfaces.
 

-- 
2.49.0


