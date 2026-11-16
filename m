Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841383;
	b=WQP/ZaZFV3N1Z1c5bicjhNn3Lgz/+z9p7VezDAtxM1gwmXz2pvdSecs68ChpkZQFk9cr
	 dLBjvu3mcUKbtRR3clVcv5pYpov45GMpEOaSGPIjDVpYQA8ceJQIa2Qt3HdR2GEqDmk80
	 ZF2W9GODvivYne7P+yIC1fgyaRMQQbEzOAvCfZQCvaFaKlZCmz9Y4Uq42Z9vkB2fs5iKW
	 gBW35AGFm0Rx7XcZOAoLzhOhaMJXZNrvOqT8Q6M81NakPNeU8RjiMPTF2GHxYCiZqdk+X
	 LPkl9bmfeeKDHue8AniEHJSW+bh5005UtuK+o+stgoj4NfQDpe3KSG1xX6JvgVLpd7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841383;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=DGyC87LkqA3UzSVeuL6RDfAMTVa0J5w5dymDVcx9tC8=;
	b=m1/aOdnXnFnkCvphR2rP+8i73plduwOIoRHanljg+RSzYnBvhIso2kKs2ZscRW21BoGb
	 iEDCpemfzkkLmBiqMYFlKiDusYHIri1IsphaTQtcX8fbz1bVwAZszyNpvuEncjziVochV
	 F7hUwt1DMTccXnWM5saqQDgmwT49KSX5poUAgpuYeOZgJVqy5n/yPH1VcAqGKcKLPovdo
	 lX7PhWkPhKkV934aEmlXQlwYQUdA9isiPtO3pOrk2IzAg+vr68ni51jzNOeHGRO9Ee5nm
	 lbaZ8aJB0QARA0GGjsr/0zwSvCdMQARNt+no9AZn5elp2hVvfu8+Xk1bWGKbYXFcv4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b="kEM/R4qS";
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=iUgO3w7C;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843A2606A885;
	Mon, 16 Nov 2026 15:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 843A2606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=kEM/R4qS;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=iUgO3w7C
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8B28F221FE;
	Mon, 16 Nov 2026 15:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794841380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DGyC87LkqA3UzSVeuL6RDfAMTVa0J5w5dymDVcx9tC8=;
	b=kEM/R4qS1yjlG8bU6mBS+xe3MQ+JWtdrIwmrO5H3AMnoTuo+44OcRepYYJI9PXmJr05bSt
	I8XXemOSvfueNJpk7qjZKOzlRAeepFBkfgWpoD9FALYBIb8U8rBv0WbfdCdHLn4HaaVipb
	4XuhP7dAxqZcWznYCogPD85kIv7RRIc=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=iUgO3w7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794841379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DGyC87LkqA3UzSVeuL6RDfAMTVa0J5w5dymDVcx9tC8=;
	b=iUgO3w7CyubXcmGXMklT70QUfAaU8XjGYc5SvbC731MPCkxU09Bzhu5XUJbfpRuxK+VeoV
	IOCnTAh4were+FNL/ALCPoCjibu3Srd0MNE8Isz2ufeWZax8zaBJRRWff4hZZUEfpD5f0G
	I3nNRP8UmjPIVsdYT8dEUIhWsogDscw=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B05113408;
	Mon, 16 Nov 2026 15:02:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jNcgBSMb+2qMEAAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 16 Nov 2026 15:02:59 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6 08/12] drivers/gpio: Stop using 32-bit MSR interfaces
Date: Mon, 16 Nov 2026 16:02:04 +0100
Message-ID: <20261116150208.1572254-9-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116150208.1572254-1-jgross@suse.com>
References: <20261116150208.1572254-1-jgross@suse.com>
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
X-Spamd-Result: default: False [-12.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[qualcomm.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,qualcomm.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 8B28F221FE

The 32-bit MSR interfaces rdmsr() and wrmsr() are planned to be
removed. Use the related 64-bit variants instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-cs5535.c | 10 +++++-----
 include/linux/cs5535.h     | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-cs5535.c b/drivers/gpio/gpio-cs5535.c
index 405471df5a38..9a3f7fb2cb1e 100644
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
2.56.0

