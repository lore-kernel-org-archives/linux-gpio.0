Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795120156;
	b=GYq2C4SZ6+urS7zONphLPToE0yfY06LtyC6nSO4rcXaQThNxA3GeG8E77WCCHstksGUr
	 ppPrzV1JjBasL4cLxt8qz9W+FckScctqU4yogcqS8SoOtyqGNbwPupGJYikMlMsHCHLAN
	 C2zAGhkbZNtm49DmAJT5Q4sE3aXfstD4qDONMrAq5/wqkvY6rMNVpDXDw/z/6swdZe0Tb
	 UF2J2A2rlPQHUHFI6G4qfrm8RCBOdufWo5x50grxp1wumoO9u2dddGUX9sLbuvwbngnk9
	 OISO4AB5g3z8y+xWxsmrIb1P1mDIgnjZgaYT/fDuUwxApGb5sTYN+YNAytvvUrxNT8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120156;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Rspamd-Queue-Id:
	 X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spamd-Result:X-Spam-Score;
	bh=cI9+YUeBugSPFUjGT81xx+ZkV8SXqylOI2vYVbqcBAw=;
	b=sDYnJlj7T35vcBfIYGbrzzGSI3mHMCe1bCrgQ0eFb4T55YWCUfBEbdkQfmebdp2Vlkxm
	 FeMPBVpFeYvLHcTaqFB+4ovmb70IZI0yAb0ZKdbxX3tAdGaMk4vHeAoDn2appQcTgrzP9
	 utz2XRbyyeKxfw5DMuu6XUhDTzsqhqu8IsCLWx2u6Har0o7HNnB4auEMDG+i3iCbtvyY4
	 QTy8rd9lhMzLf6JmjUZzW8TQfwtoCVWidaGrvpsa1dmb+mA7gQyymMIxyf43V6qC6aA7X
	 ZtuwT0lgUgO1M7cqNuEyh3GeHsHxvwM2fS1vY5XrVCiPjfabIZep3GvRTLFGVndk1yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Q7euJFgU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="0c+/SJfF";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Q7euJFgU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="0c+/SJfF";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B8A606A330
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 20:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0B8A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Q7euJFgU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0c+/SJfF;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Q7euJFgU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0c+/SJfF
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 030F82246C;
	Thu, 19 Nov 2026 20:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795120154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=cI9+YUeBugSPFUjGT81xx+ZkV8SXqylOI2vYVbqcBAw=;
	b=Q7euJFgU9g4yxOFh6yn1cLjahRINJn2NLiU+7exR85sKqEJ5NThA4zyHQpYF/GcmrUoY00
	OkPTlLimigZ/HT5+eEy4b8lS/rbMddzPlvaZA+IEqM01809HQhQVUXRsxSQvttAr+WJH67
	pigl2jdZ8cH2kbT4FXJzrAG6mA7mgN4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795120154;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=cI9+YUeBugSPFUjGT81xx+ZkV8SXqylOI2vYVbqcBAw=;
	b=0c+/SJfFMpc5RnZPUPD2LscqirKRur10l3WxiXBr2hzBKy1FV4jt67B/dzeHy2FlwYEaI8
	E0l6K2zywyxBHACA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Q7euJFgU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="0c+/SJfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795120154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=cI9+YUeBugSPFUjGT81xx+ZkV8SXqylOI2vYVbqcBAw=;
	b=Q7euJFgU9g4yxOFh6yn1cLjahRINJn2NLiU+7exR85sKqEJ5NThA4zyHQpYF/GcmrUoY00
	OkPTlLimigZ/HT5+eEy4b8lS/rbMddzPlvaZA+IEqM01809HQhQVUXRsxSQvttAr+WJH67
	pigl2jdZ8cH2kbT4FXJzrAG6mA7mgN4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795120154;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=cI9+YUeBugSPFUjGT81xx+ZkV8SXqylOI2vYVbqcBAw=;
	b=0c+/SJfFMpc5RnZPUPD2LscqirKRur10l3WxiXBr2hzBKy1FV4jt67B/dzeHy2FlwYEaI8
	E0l6K2zywyxBHACA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC3231342D;
	Thu, 19 Nov 2026 20:29:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LWmqIBlc/2rxcgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 19 Nov 2026 20:29:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Linkai Gong <gonglinkai@kylinos.cn>,
	linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: amd: Correct irq-enable readback poll timeout
Date: Thu, 19 Nov 2026 21:29:05 +0100
Message-ID: <20261119202909.7363-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 030F82246C
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.01

On Thinkpad T14s Gen6, I can't wake up from suspend via the power
button any longer, and the git bisect pointed to the commit
44c232e80adc ("pinctrl: amd: add timeout to irq-enable readback").
At a short glance this commit looked harmless, but the problem was its
timeout value 1000: supposedly it's meant for 1 second, but
read_poll_timeout_atomic() takes the argument as usecs, so it's 1 msec
-- which is way too short.

Correct the poll timeout to 1 second to fix the regression.

Fixes: 44c232e80adc ("pinctrl: amd: add timeout to irq-enable readback")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/pinctrl/pinctrl-amd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 30da75bb93b9..e95851a327b6 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -581,7 +581,7 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	pin_reg_irq_en &= ~BIT(INTERRUPT_MASK_OFF);
 	writel(pin_reg_irq_en, amd_gpio_pin_reg(gpio_dev, hwirq));
 	if (readl_poll_timeout_atomic(amd_gpio_pin_reg(gpio_dev, hwirq), reg,
-				      (reg & mask) == mask, 1, 1000))
+				      (reg & mask) == mask, 1, 1000000))
 		ret = -ETIMEDOUT;
 	writel(pin_reg, amd_gpio_pin_reg(gpio_dev, hwirq));
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
-- 
2.53.0

