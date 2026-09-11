Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D41457E76;
	Fri, 11 Sep 2026 07:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112793; cv=none; b=nIqjjP5w0xvdk0SVGopyvuwNhKE3LeCohzxPy2q9FdH8gq8XgkJ8d2V3tTRO20bYzZ08d7mkwMt8yp420IJ5AMZB7Wozxneb0BZsHrvi2xypT1iunSi6srXk1qsqTCrYMOQPtol0WxwzxFekZA5X6wm2y9TT5dmO/goGys6pi0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112793; c=relaxed/simple;
	bh=IFySl39AsHRiWxCpOqqyCl8AiRtQlY25GVKskgomnTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avTd7NVRlYEnTiiqG9/eXDjBOOe8ETIHvUIOGQW06D0l3kRW5BrbwVXQr7rj5+n9FrBLHrWRZYNv/LcibsUYx56zxWPHDBC1ye0/FuqTAXkmOVzLDfzzM7TMNOvDLu2llZUNaZJ1bqkuTyOqS/R91ptkr5BH9XxNiS4lnvj0PB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=q/oAxz8X; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=h7Pcglut; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="q/oAxz8X";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="h7Pcglut"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7011621D36;
	Fri, 11 Sep 2026 07:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789112785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kP0E4uM8fKg0x8bpJLpQKlBFhhp2X3VTVwrAfQjwrYc=;
	b=q/oAxz8XRs7ECUPtzyTAALtOcEpI0RVZyqXIuWXsddX6QWEu5OqL3+e0LM20Wiou4DPZJy
	FLk8CXp0HEy4FHh8TSWaJueI+5ID0g6zQQKvyShHL6Uju0GBhwMywN8ibQR3YlH4PwHSYQ
	FP29cCMXXyPY6UCRa7BElVoGE5/gJMc=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789112781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kP0E4uM8fKg0x8bpJLpQKlBFhhp2X3VTVwrAfQjwrYc=;
	b=h7Pcglutm93CkXvBE4uv4HtmwKQ2KRJttVVye/sFY9W9sUG++oLZWg0ZnJ81fiLU3taWLi
	V9rEjA5sLMPyV+zfs7he3O+atUUPKjo970JFhLVMNX8AgwBl8SoX5VRRopGrsldchwGTdx
	603VpgVipKM3aEC2zy5LA25vOQ1QaiQ=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 211AC13794;
	Fri, 11 Sep 2026 07:46:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pZPMBs2xo2q0WQAAD6G6ig
	(envelope-from <jgross@suse.com>); Fri, 11 Sep 2026 07:46:21 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 08/13] drivers/gpio: Stop using 32-bit MSR interfaces
Date: Fri, 11 Sep 2026 09:45:25 +0200
Message-ID: <20260911074530.3140830-9-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911074530.3140830-1-jgross@suse.com>
References: <20260911074530.3140830-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo,qualcomm.com:email];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

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

