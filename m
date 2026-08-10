Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A1E3D7A18;
	Mon, 10 Aug 2026 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364749; cv=none; b=kLspmBiVOr3L6CIoYfsD8r1tgQrYz0R5eEpiMHw2OZic1T7BOLvtJ9uLunsjHMFjdp4ZHI8oaEddUdUyk7EyJmj4NIrNwOuTyZTogqLi9CvwwMbh23hUPyXjg8Ut0J+m+/ley7anzdMTzgXVNG0sKZyfAat8jDkfFoVdCct0DXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364749; c=relaxed/simple;
	bh=sE76SDyt9tO/Vc836t642bP0UkgFXewo7SBitySNNUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jXFMxNgF+N8LyiVZk1lYkiQnVO9bq6TUXXLq1YvEw7VxPUEzhzvbqDQAbmgzrG9YSIHFJ0epWRWq7iKKdOCzJgLPCagLOt5zn56DYH0vv+XdoAuWTrcqtcO7AXbFyq9slF28dxLrJRXicipGFIQsiHmPgufieCVbKvHF2OBos44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BAaEQKRf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BAaEQKRf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 596CBC2BD00;
	Mon, 10 Aug 2026 12:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786364749;
	bh=sE76SDyt9tO/Vc836t642bP0UkgFXewo7SBitySNNUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BAaEQKRfsOdCD+YJRtmye1xn1vjap4+4NzK57rPZESe0waXXXDic5N74FczErWl51
	 H8h01/ygOJDE4oXGlpZEdcG1Aoa0mLRXCBkz11siPTWvdss0qrIOpbPdo+tLLOpl4D
	 KMwUFOuH0wg9DhkZPRKLVaMQGauY8hXibsj5WIOm68FRugBvZWPCvLpdWekyr/egRe
	 ydCdZYRUku6JFv+pLuQ1fq4Wj81B4OxnHmMQ2FXGZRdiRuheruoE6WIs1GCRLw8Ye0
	 LCqSbI/CRgq8iptTyMZvgsS6WdqbiAEYMdtjx12wKwa9s6fmNmQM8VkTbhIlJoIMHp
	 XuYFzAE20N/iA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA5EC5B569;
	Mon, 10 Aug 2026 12:25:49 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Mon, 10 Aug 2026 20:25:29 +0800
Subject: [PATCH RFC v7 3/8] mfd: ls2kbmc: Redraw using exported functions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-ls2kbmc-mod-v7-3-8aa0fb5a5462@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=R0w0JF+qT6VK1lT/PxMrgYCt2zFDY7MivPLY0o0OME8=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqecNKPciUeVzBs+cJq+dizhD+R61BPU55TG/7H
 K5AXW9ZRwOJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCannDSgAKCRCwMePKe/7Z
 biqqEACuDBEsFpFJ5xOZ0RLdrUHcK6Rri3m6X7XbfKbAUsoEiHXOuH3hB0lDQX8FyTSyzpzMFDx
 n3m/i/BsAbaQwrleSMG8FzPPO9WBAwAFS1UyLPJidYkqh/3RIP+49eB8ylSg3Ie8oWo6iGP4na5
 HkKcYAATWe7If+8yaITrvBLoDryn7WgrYUuiwKo/XTqh5xnFI2jvsJoSNA2VzvGjiRYOzE6jtA/
 jZf7cWZCR7MQhD7AJFs76WmOl7vxzlaH0lR+jcbDfKzLjqf4I0PQSvFcvXkKHfeH2iXDMWPmGwa
 O0/cEr69y3JuCZHxhgE0v4b+rqb5jB5oCoOTMmFU9Lbd5cHVMrSnF5SaurBM3sZOMbc4LXw+tyG
 NVWKblLBO4e6to2y6ewIJBT+uMa0INTMcrVtNYWGg1i2bqPn0rVyxzw70sGvBohz3xJjcvm5RKE
 s1D6M7dubvsikCLgMoOnHuP2QdJlSKxNiTA8JuUud1pujblS6MNRa/VKtWQq8BtDXbszGgGJMUd
 IuhOffC43ZzDTMfJMYojOSXc2tFtEfi9NySrc3LHLMXCiczo2BlOjgILlTEKVmot4EmkHvq8A4J
 eNqvWDri2K6mRhj4FLmjL0UrUyan68nkxR9jlaMStEpHoRabKdC0S1dvTXY5I6QvEEjPCCAWOBA
 T+t5qswSX2mWJ/Q==
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
index 434db99ee501be8e18de7258af0f465fc16c0709..06ec8143d8cdbe2c8e5a141020d96c21b37fa699 100644
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


