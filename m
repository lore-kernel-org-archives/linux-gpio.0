Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC9E44A412;
	Wed, 19 Aug 2026 10:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787135047; cv=none; b=Zx4JwcUUPI7jE2gBKJdBvldA5aGPGsbut8QY4N4euJbjHS3gXqG7sNzSnFoMvEk78TBJIfPMOj+cp2hvsxCh+Jps82LdMurszoFjlw8cRJ2BXyr7SdYRHlKFiMrX1Pt5wqYrOQ6EmH850SirEUagsg5tW7Gi5q/J9Zk6T3CWpnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787135047; c=relaxed/simple;
	bh=IFySl39AsHRiWxCpOqqyCl8AiRtQlY25GVKskgomnTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZSWvMo3WS5oKa5S63CnK1D9XNJIvnCMfJ7b/w5XT0exnqvK2YuL5zEpU/xSxg727kY63KwWHMsr1ob2cIH8GcWjUEp7CJBc5+J9pfAea/RNG6pDLPNqysvq0s/u8JE5bKH3CYwIC+TfQEj74wPCYfH5WEQ5L0m5BLRUfRJCgcsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C36A884A8F;
	Wed, 19 Aug 2026 10:24:03 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97392362E;
	Wed, 19 Aug 2026 10:24:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TUTbI0OEhWrMEgAAD6G6ig
	(envelope-from <jgross@suse.com>); Wed, 19 Aug 2026 10:24:03 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 08/13] drivers/gpio: Stop using 32-bit MSR interfaces
Date: Wed, 19 Aug 2026 12:23:09 +0200
Message-ID: <20260819102314.1499258-9-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819102314.1499258-1-jgross@suse.com>
References: <20260819102314.1499258-1-jgross@suse.com>
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
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: C36A884A8F
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

