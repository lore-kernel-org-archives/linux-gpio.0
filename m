Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AD93921ED;
	Mon,  3 Aug 2026 16:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776206; cv=none; b=HvPTDd1r1hosr9utSpxjocyuGlizlt/N8msgU2e3zhCt8NrI2vp+RpteHDj1eeV/USRckZ6Muoa/c85o2sOkO2NBtcTM9bB2knvTKflFKBvPop4KFxKwM5DBc+F7XWTSZGgu3NI0OM7sDrF+/5kHM17rWyg8b/QQ7FFO1nfBP0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776206; c=relaxed/simple;
	bh=J9mfaTs/eKOadRk45qFHbUkFlnkzEtRD4/K4DSL8eT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qOcOgbZ3HmK3ayLx00ojdsyZcn7i37hP3LT/YsWC1TreQU4/g3THic5PsRQoYg0WbAC8LdYi0cWAotG1Jq51Qz5n/STUJVBDSpFutZJ2U9QljmeihMSD0nm70vN1ingqMoyRIpjxGxI/BJY6iIPxy5SqPJahuyPxgGZxgr7l07w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VsuLLXbe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VsuLLXbe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD120C2BCFF;
	Mon,  3 Aug 2026 16:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785776205;
	bh=J9mfaTs/eKOadRk45qFHbUkFlnkzEtRD4/K4DSL8eT4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VsuLLXbeNtmHykYwEpN9PCAvMGmIWtZaXiHWGq5zhtCE2OX5BpqkwpsmegzyFjIh7
	 dXdt2sDcIDLYIIMfnvirBYowG3sT1iKJZfC+xulqQWuEf5nPiZaStXANCrHuVCAQMy
	 8nxjhN+ISafZY90cBkVjhF+GLixwzKN56lDEvrJRLbr/j2si8xouHaIwxUvHxozuOI
	 dV+7GSgAwk2KkXv+FYx+Tv/9nb3FCiniAED0Hyf517WmBdFahKuUchWGrmSKvEEVPV
	 W+ihjAuANxR3j88NuJojUMYlyxr3251h2Gn6w+jsoqyiXcNL8FEjdBQCRFD1lXH+3I
	 c9vHi85Z+wyjA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8D3C55843;
	Mon,  3 Aug 2026 16:56:45 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Tue, 04 Aug 2026 00:55:51 +0800
Subject: [PATCH RFC v5 3/7] mfd: ls2kbmc: Redraw using exported functions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-ls2kbmc-mod-v5-3-e6bc5cdd9a93@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=VcxGUAsZn+03JiICVZ3kCtaItmQKTSKAeZBuv6zGY/o=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqcMhKrq6jiI7RrNX9FagV9tUCFSss1tfMqJ2th
 qvNYsk/hiOJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCanDISgAKCRCwMePKe/7Z
 btk8D/41YbebAtDb2E9S3BwoDh7Yx4FtCVdTo96K6VUzWGIIz/T9s/XZWHdTba2p9e7lKJO+ho7
 Sjy+JA2UFfzpmd3d/SXBbN5cEXOvFmZ9CIuLlK7pgIL83XnY+jACqNdHk7W8QukXXFTEPkdty4Q
 Hhm9QEjt/X7uQZtjunOypbvEVWp8blBwDsLvC65nFUNIPvUF3m3nIgrXcokm2tUo8gUJkc06f6V
 T9onIK7QCGt8e32eHa4zERSagpy7Wq6lyZ02pEPgl4PbT3SLI844D3O8FZsE+6Jgf8KfQJ/6Qgd
 aGZgJ8/KEdKWiBEFBuPhBz7oQ+ffmMfxkGl7nIWE1ukfKNOF7xbceY9hRVamglLOwmczybYfb72
 8fEr4+EYDM8z9rUuDYJPXYFb0HzCzSGpYPk+qDmjs/o+cdm2bP5jwLzKU3GDtYmyYtXaeu8WNvY
 sFAHd1hgvD6mt/ShRpZHWAynqVA7LkIeDJjriacOTGzH4Dx72Y6a5y3GF8g6pJuG7DgxefjutSy
 GMdqSmRjiThq1pX+fECTt8Kk0HHdr468nKx6fUDkTGdT17fs6OSw3RJSV4pSwXdJMTdzwZsi0uq
 Njq52h+pWj/rN1ghPr9UYrsYHkrYgejKbDxOZ6JQb2KKNs1nb6KWEn5286D9XKetkO/+fUJVp4J
 Ft5TEn+Tx/jsOag==
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


