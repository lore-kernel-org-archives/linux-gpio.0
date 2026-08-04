Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF68414A1E;
	Tue,  4 Aug 2026 19:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785870874; cv=none; b=lOi2l/IueF/vK/3Gi3J5CfVVFAA+4ndqPbnznX+4quLI4tqPqyeu7RmqmojNJyRzIhP2Q9Q3SIqQT7z7FOW/Td3gac3m41duxZ5Fxo1Tioh9D5C6GdNzuWlhxVzhmgku7Z5cqKcoLgcow2iRKKUrLhaP1jr7XByCVT1bLYChwcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785870874; c=relaxed/simple;
	bh=J9mfaTs/eKOadRk45qFHbUkFlnkzEtRD4/K4DSL8eT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bw9Cof9PkqfpsNGVVSf4sW/kBEhPljwrFuwOHLjC+d7jLhsEmU5OQEQ9FNPueec+rhD60q5wCO9wst9s4oWLC1I9pVyMNJosT15HwXfJyoTksec10oBVjeWsd2jlMyBWHddMmfz4M8m853Fo5g2QCTHlDtxi9yu17yBxOmtGedg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DOriWaFI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DOriWaFI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DE9BC2BCFB;
	Tue,  4 Aug 2026 19:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785870874;
	bh=J9mfaTs/eKOadRk45qFHbUkFlnkzEtRD4/K4DSL8eT4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DOriWaFIwR5AaDHZ2DrVg2+J5maBOyoWk1C2gcYXGjTTjYsm5nfNwCJVdFVo6tZHz
	 A1PhLQPl87R4WvegBWIcL4sAMpjB6t2CDS+U278NgVSDfyieNoecX5hdPQ46CM5nWl
	 16v/t0JwqKpr3AIWWwMQfWPuDu200+ePz7iu+nS15XkUjqa9jVlomroXdWqVz3s4j/
	 pw0+pgoV8rHNtuhgw9dCRg3hfOwFi2fLTFWe4tXqUjQoD+RtqqYdvEQFT+wHy9m03d
	 MDBWPTFR3kPKZVhVzFeNkXrkWeUFIu/wghJiVvR1hOMlPBxFjmyD84JLDY314o2wEL
	 MEKLy33r8WE5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B52C56201;
	Tue,  4 Aug 2026 19:14:34 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Wed, 05 Aug 2026 03:14:21 +0800
Subject: [PATCH RFC v6 3/7] mfd: ls2kbmc: Redraw using exported functions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-ls2kbmc-mod-v6-3-16ccde412d86@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=VcxGUAsZn+03JiICVZ3kCtaItmQKTSKAeZBuv6zGY/o=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqcjoXzExm1vUYrkbxBeKwhcYlg894k5mkbInPT
 AcQMw/57FqJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCanI6FwAKCRCwMePKe/7Z
 blDIEACV8bcwnqBGedgEtPXQPDISK8mqzyajaI2Eq/Z10upPGSIxDxGkxmXbbGi91wJs+T7dCzP
 +70Zx/hkpc/PSsBs/U+J71lERHbSTrVOITUFEe7gXWDlrZ6MQtH2h08zRpFOdqa6LXxmwFht4nA
 LtqYYvjjzSPuVoaRJurOiTqoPERoiqWFvRs4IkaZWE0rNDdq+wpI18I3MW9ZO5sM3V1qIb/QaUv
 Dzs0c0/ym4Yv2W6YtkhP3lbY5hDY1pqYvHS6K5Bm4g+aJA/u+Snvu66AzLqS8ScHW5M7kULRUBY
 r/xBx21v6H5iBw+iVjVVDxyOPNISYQhrR9mWOqkHVMDJYsVmOZmSFEgcAIKtIF2f7i46Gi+yrTP
 m2ihXI6fB9mfIg6tiMakMziriAk/zbcqQinbJKduTyahzF+9d2T5o24lSWENmR4E/ZVvBfvYzT5
 RR50MXGmVAGOEZ5tXer7rG0WdPLFMdTKnsgovLkBf5yPnnXazWWV005I+kwSz+IuFA04s1n1pKF
 dF2XJa0gtbbFIHQ5ZcQOiqMxZtWNVCLzo1Gik27XTG7sOrZ/EFuGNrcJAQGNPXWIz4i5EI5gNfc
 UfSErv2cWyX+tc+x1itV6vk6KLoqiCZSXuNmlZFLo68/DcqoRvbINZkAQnlWT8rnsYdN/0G7QS2
 576rMc7EvejGs+g==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com

From: Miao Wang <shankerwangmiao@gmail.com>

Use update_screen, i.e. redraw_screen() to trigger the redraw of the
current vt.

Fixes: d952bba3fbb5 ("mfd: ls2kbmc: Add Loongson-2K BMC reset function support")
Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/mfd/ls2k-bmc-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
index a9a30611dde9e31cd86ff67b1d6e02bf67b34755..e12f2ca2fbef360ceda14ee6fc64f500e4944120 100644
--- a/drivers/mfd/ls2k-bmc-core.c
+++ b/drivers/mfd/ls2k-bmc-core.c
@@ -25,6 +25,7 @@
 #include <linux/platform_device.h>
 #include <linux/stop_machine.h>
 #include <linux/vt_kern.h>
+#include <linux/console.h>
 
 /* LS2K BMC resources */
 #define LS2K_DISPLAY_RES_START		(SZ_16M + SZ_2M)
@@ -310,7 +311,9 @@ static void ls2k_bmc_events_fn(struct work_struct *work)
 
 	if (IS_ENABLED(CONFIG_VT)) {
 		/* Re-push the display due to previous PCI-E loss. */
-		set_console(vt_move_to_console(MAX_NR_CONSOLES - 1, 1));
+		console_lock();
+		update_screen(vc_cons[fg_console].d);
+		console_unlock();
 	}
 }
 

-- 
2.49.0


