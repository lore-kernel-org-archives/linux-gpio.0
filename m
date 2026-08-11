Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0123BA249;
	Tue, 11 Aug 2026 08:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786435663; cv=none; b=CXmjugmRsXMKXui8iLA8uprunKgNFazi1Iq1jDKQ5wKD72ZM9AyjqmAG+JDmylWOSpRB+jdpPb26cP38bXWkJjMuH+5bIE41NRG0yg2QaYEqiOGW6f7xP788C06uETadzyDCCwaVtRARlIbTsHXhm3q9lyNvvrnQYJdz2uqQ4yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786435663; c=relaxed/simple;
	bh=sE76SDyt9tO/Vc836t642bP0UkgFXewo7SBitySNNUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TnSo+7qIrvwT3nDZrZJ0kRFjbEKEsIbhsJ76NFnJRPlqBxi+f0rXaQcjpjgG5i1/zxlMbDHIgAMjpE+cWDDMns2ZjgRh+pjcTJFkhB44R/z3e76j+3QHE1EWzmV4VoK0FCjGbeqYGjjgUHLago25oUCsC5cRnv8b6Un1wtVC0bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3biw5WA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3biw5WA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EC59C2BCFF;
	Tue, 11 Aug 2026 08:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786435663;
	bh=sE76SDyt9tO/Vc836t642bP0UkgFXewo7SBitySNNUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=a3biw5WAc2zvJZBDQ/Y0X3TBHpsNqO9hdlSLyo0CL7Temo5t47KKTT9iZAh6ov7cH
	 TDp/xyykOG/iegHB2G0SBRYkLxrY8RYAaT+ee2hddzLegmVgM7cHCT/UknOdotjWkD
	 +h+/gTRw++j+zBwD6hRMCkKhYaHvgBg3fKDHWUKSvi0/E4DitWsxwDLkddPQuiMcpr
	 aa2uJnFF35ojAx4cVEu5Xr7I1tcOIBgIpTabMSA4yNl9KVo2lPDAtt/m92qeB3or2L
	 6C6Q8F1gT8je396tzwLl8jFM1wZvih1HVPh8kdCsDH7h5QKRdlvw9dvt5oZ14KuA4p
	 EihCMeqLOdGkA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04884C5CFD9;
	Tue, 11 Aug 2026 08:07:43 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Tue, 11 Aug 2026 16:07:27 +0800
Subject: [PATCH RFC v9 3/8] mfd: ls2kbmc: Redraw using exported functions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-ls2kbmc-mod-v9-3-4fa9a5584406@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=R0w0JF+qT6VK1lT/PxMrgYCt2zFDY7MivPLY0o0OME8=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqethM12pwfl0638tVKhDruoxf4RKu7faP4vsqt
 CftP+xnF7SJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCanrYTAAKCRCwMePKe/7Z
 bsbJEACv+uHBfrsmOS86sA411iFSex2leZIfSlzqiGLcdzrvuvYfXcpWWXAuwCCaPIkfrWoAd+g
 kQSuXySA84OymZrGSLkBEKcBxViEMrknMU9eHQHvfoVAlGzas0MlWAkg5/7UVNHpCHxj4DgZCEU
 /BcqZBNCLScOd3L5O95HD0yeNrnVPr/YPT0WKtn0KS4PrAKuB4CujZfkGMYzhRrh089B0Ku99Dx
 vHX3c66BAjpq+8r7F3CETCiRdwD6tV9xOrkCucywDknvonvZGtp2Ve8FbN611MG0QCZ97hvFrl/
 ud1468W1n3HdIbiSk2gv7GZO50M8q24xCSXtZuYDEGewRMRstrYw/Muo7bozxHjPm/t525JCRua
 Kr7JTCx5T3tD7zmtjF/QEPX4K++F8DKrN7OjtWLgTpbBBYEh4KblUE/BbaLyrG5oKzGol0XjY7U
 ATbfzSKcrIKIYNz7tGwxAvSJqyzhcWe1AJaJzrGefozLkG+2FGAGmgVc3uEobk4lqOJaD4Fm6lh
 2WGXFwtgYWbgGpDlKxP1VbUsN7QRhRwGCe3uT0xw+9zX0fTUqJlZgwNz48+K9nBlZoHBwtMkDqW
 tOwut53EX4wx1o2qrMRsa9DeaYUBQx6hmoHYexXq1jyg+uPYGzlh2CJKkt9d07wJbTscbdeWwq6
 ieEj73Y76WC0oWw==
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


