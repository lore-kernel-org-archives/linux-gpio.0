Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5B03DA7E0;
	Thu,  8 Oct 2026 07:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443975; cv=none; b=ZGE9wUJydjnaeujIjkCNXXCOEuiWrzIKxxS2JTOWqqBK6eQvgHGRM4vM0iYjDhPK+f1YuES+Wd7vOteKejCk7ei6sXs4+XtP0WdQBPDtIh68rYzOpJsoRXQyT3Ohb3d0HhKdGdTRVNFc7iYFe0JkoTc/odTwDhs2Upg/UNUWfgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443975; c=relaxed/simple;
	bh=IFySl39AsHRiWxCpOqqyCl8AiRtQlY25GVKskgomnTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lbcr8XGCEbPhVMgHbtg5n2EvAlQcVN6TtUPQRaSIqexNviDvFI7lZZVTlU2NGnZw2D71z77LltHZ8kWYUq3TEiKaqcMfbiLeyOA3N7YmO63hoampSSsAMN+dU4Qhx+G92OEDkjz7jZyZl4PeJq7cyBgsqXvFrSCCsngbjI9AmHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DA17A1F786;
	Thu,  8 Oct 2026 07:19:30 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8B94C13354;
	Thu,  8 Oct 2026 07:19:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VL/bGAJEx2qecQAAD6G6ig
	(envelope-from <jgross@suse.com>); Thu, 08 Oct 2026 07:19:30 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 08/13] drivers/gpio: Stop using 32-bit MSR interfaces
Date: Thu,  8 Oct 2026 09:18:34 +0200
Message-ID: <20261008071839.2247074-9-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008071839.2247074-1-jgross@suse.com>
References: <20261008071839.2247074-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: DA17A1F786
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Action: no action

The 32-bit MSR interfaces rdmsr() and wrmsr() are planned to be
removed. Use the related 64-bit variants instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-cs5535.c | 10 +++++-----
 include/linux/cs5535.h     | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-cs5535.c b/drivers/gpio/gpio-cs5535.c
index 5f5373d86397..a97ec7561889 100644
--- a/drivers/gpio/gpio-cs5535.c
+++ b/drivers/gpio/gpio-cs5535.c
@@ -143,17 +143,17 @@ EXPORT_SYMBOL_GPL(cs5535_gpio_isset);
 
 int cs5535_gpio_set_irq(unsigned group, unsigned irq)
 {
-	uint32_t lo, hi;
+	struct msr val;
 
 	if (group > 7 || irq > 15)
 		return -EINVAL;
 
-	rdmsr(MSR_PIC_ZSEL_HIGH, lo, hi);
+	rdmsrq(MSR_PIC_ZSEL_HIGH, val.q);
 
-	lo &= ~(0xF << (group * 4));
-	lo |= (irq & 0xF) << (group * 4);
+	val.l &= ~(0xF << (group * 4));
+	val.l |= (irq & 0xF) << (group * 4);
 
-	wrmsr(MSR_PIC_ZSEL_HIGH, lo, hi);
+	wrmsrq(MSR_PIC_ZSEL_HIGH, val.q);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(cs5535_gpio_set_irq);
diff --git a/include/linux/cs5535.h b/include/linux/cs5535.h
index 2be1120174eb..5ec2aca537bb 100644
--- a/include/linux/cs5535.h
+++ b/include/linux/cs5535.h
@@ -49,12 +49,12 @@
 static inline int cs5535_pic_unreqz_select_high(unsigned int group,
 						unsigned int irq)
 {
-	uint32_t lo, hi;
+	struct msr val;
 
-	rdmsr(MSR_PIC_ZSEL_HIGH, lo, hi);
-	lo &= ~(0xF << (group * 4));
-	lo |= (irq & 0xF) << (group * 4);
-	wrmsr(MSR_PIC_ZSEL_HIGH, lo, hi);
+	rdmsrq(MSR_PIC_ZSEL_HIGH, val.q);
+	val.l &= ~(0xF << (group * 4));
+	val.l |= (irq & 0xF) << (group * 4);
+	wrmsrq(MSR_PIC_ZSEL_HIGH, val.q);
 	return 0;
 }
 
-- 
2.55.0

