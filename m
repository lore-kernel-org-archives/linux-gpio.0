Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010155;
	b=NCFpjpCqakXMXWRdc2xooV+pylsPDJ3pB6XhNMoUS0RC2ZmxTAoQqAw6jKIndHcN3N+t
	 5tuSsr+ckvylKhnj744NjWbdUBZA4aWvxY0A+3J8wVDaTe04kdb8fl1FBtyC700KnN3lJ
	 SVL/UTCjKJn8i+i4cTKPT0I/Kb8IW33lBDY5BfEAMNyhiaJa/oRLxXvIlpDjh9t7nfgKb
	 KrU3SoVN15+5CxjTaupmKvK9NTCzbABmaYMvy5h3NgkpOGPEAIrzkWjc30dwZpmtgabDr
	 GrPgQC89IbHqA4cMlv7MWoKPXDWA9XCA8jzdUdfVcG4rII02KUDcpqNsqOJTsl8efjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010155;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aTVyRE1l9ZTgud3jh/ZR9Ld7EnoZ/uEnJzYar9RtQMQ=;
	b=oeMTES6qewc+gy0KdqBmZUvK44N+VW4++x8MC4/NkHjADaKykq3GZM+F4sHGabFCesmj
	 h/h1c2f4EXu1/VIXFXcDVa8ijJUAx9DNUvR4rwkg0LrEPfdLR5Yuc6ZrpPVXth+3KSNwC
	 uozGt5pGVbpvCpxh+zeRq4+hj6YzaAf54pjkqT0daN3tSIz0zmcOLd6DPc8eGnGna3AEu
	 HEwN43CFWV+KpuQWgwyjDwn9M8Tb5bYV8GYUbdudbPQnEojaRN+bfI3MiObBmrw7GEieq
	 aPYwrfeZScJ3TdANubu5SsS9cH6AbVklS7MY7fjFgSsv8Ib7wCJxj2dXPFfpGqJdcLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RzeOOp+d;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="LZyX/LJI";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FB5606A33D
	for <linux-gpio@vger.kernel.org>; Sat,  7 Nov 2026 00:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06FB5606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RzeOOp+d;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LZyX/LJI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aTVyRE1l9ZTgud3jh/ZR9Ld7EnoZ/uEnJzYar9RtQMQ=;
	b=RzeOOp+d0fF4k1jMKuYT2h/98JEzCzfMJHXnCX8PD9Ct/oBCT7wW21hXKxqJG7Swo5ofr2
	KBP/Mi11lOusPW94uiznFeTxsiW6yQi9FlXZOiGGLCorn/AX1x6wNPNCUahDt0U3RngbBC
	nvm7iXFk+zxPZxW7s4akknPxktmeDc4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-hlJRFtZQP4uV5F9rnaiBPA-1; Fri, 06 Nov 2026 19:09:12 -0500
X-MC-Unique: hlJRFtZQP4uV5F9rnaiBPA-1
X-Mimecast-MFC-AGG-ID: hlJRFtZQP4uV5F9rnaiBPA_1794010152
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e49a1d3b1so210959185a.2
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 16:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010152; x=1794614952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aTVyRE1l9ZTgud3jh/ZR9Ld7EnoZ/uEnJzYar9RtQMQ=;
        b=LZyX/LJIVaAMJ4FErwbeqkmNzu2L2bm+gaJWPMJz4yVnYTlllKLnAcfNiZVuU+CCon
         FBZzP9104xv0Y8Gxn5+gbf7h3qhtgb04zojmTLi7pTy+MJgwVDtyo3C6CpQq5eEK4Fx0
         XH1N8JC/Th+34mlyVoyY9r8w23CpjSsI9Ccc/E2qZT4Uri/tPgaT7VK+J1b2H9S51i0B
         vwU90Rwx1xQ+NkIVBDMbhDRAUYNCeEO6w1GbMZwNzavN9g4tllM6WWXvcs6HMlOliyrj
         tVu/9g1hlMYE0TYJCQAi8jmyZ87SSd2E3dsqJ/YFwzf1/d8a3kSRb7yoATUKcNuHlzkA
         Dagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010152; x=1794614952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aTVyRE1l9ZTgud3jh/ZR9Ld7EnoZ/uEnJzYar9RtQMQ=;
        b=ihEEqUQ5OQd5dEcanD6VCm7+HDqvXBLOYXjA5qH5YX9IajEvi8EVuXjLR6Dc1+H5YE
         XTkZxq16zdeGAw+Ljmr9MQYE1FG+YqpwFKgtL8Zw7Hbl3mCGPxxPK27QvQG/t4kWDo2m
         UkCpXcRvKoel3RZ/VELmebPbf5FxCjHr57402zEDu7xt/EVdnip7pyQJu89z0VQhXe7c
         2T7D4SolCnCfIYn8mPdh9pLs0nPstRdqZrwdxUxy/01d5MMGLFDfPAjZAGV/1TxAu8eY
         MgsEvSccvTcdOgbEKO05nSnAWL/qqUwF2DHMX3VTGI71v5IGhAk45dA3SjWBbiCmVkJV
         56Nw==
X-Gm-Message-State: APuU4Z9ALJkp+5BP9Ce8BDpSEzBSv0l8fvpEm5MasgWUp4MGyz1nvPt7
	QDom3aFyHDefRYEuUZKfrXSdT3SVd/DjZ2w3j6DtP9l21NzkZJz7xtKlx8YbNLXZEo5+eIB8CZk
	dUpPsRUnpIY/q6+Qxyz+ABO0Y8oIPM784psoiVlSnukxyJngm6wgZDyhqMTONKlc=
X-Gm-Gg: AYBFou3xR5bmJXnnD75yqvPf/aln4n1hKb4Mk9WY/01n+FMh8GzpHR4nqAgFk8qZ2Nf
	g4zbY9CJtNHXLKPAa3oaPvo2ufSpalmIyhyXsXECKnyydxJHabuhUa1xjaD8VThkX7ts+pZmo6+
	9w0C3sScWZJE6nKIMC+KjXdu0KKyy0XLpLm3VCjJtJVBhcXYGG1G6jrG0ao/vww12Sg+dh6iP72
	l2dMyvTGKOf0ZwB+wneoevyZvj9ufHerefKYEsTMGPe5rLs934YnFi8kpmeJfynKgBg/9GRLb0c
	ytobfYokT+9EuxntUx98bXJXNUeB+NyKoE6zBYhBt47kD7ZP6Nd5UmOwHBf0PVfezl0QpK2JKAF
	zAGpBgGlDHTiv+H/KXl71W87HVh33SqTwrdt4uVgjvDfmVW7E5vFayPNWJfr7K1cfbk6UqHaF/T
	vkZjahV+X8GYmbx0hn
X-Received: by 2002:a05:620a:2811:b0:93f:3120:6c84 with SMTP id af79cd13be357-945f349a5b6mr594090085a.36.1794010152402;
        Fri, 06 Nov 2026 16:09:12 -0800 (PST)
X-Received: by 2002:a05:620a:2811:b0:93f:3120:6c84 with SMTP id af79cd13be357-945f349a5b6mr594087485a.36.1794010151996;
        Fri, 06 Nov 2026 16:09:11 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c4b8sm31998536d6.15.2026.11.06.16.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:09:10 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:08:45 -0500
Subject: [PATCH 2/2] gpio: tps6586x: convert to subsys_platform_driver()
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-gpio-subsys-v1-2-0785e37520ee@redhat.com>
References: <20261106-gpio-subsys-v1-0-0785e37520ee@redhat.com>
In-Reply-To: <20261106-gpio-subsys-v1-0-0785e37520ee@redhat.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=773; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=YXtBr3z+8RrgCDqQfttBQjV0XZCNC1l+hikSMXOKPrk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5cjJvbou8GC9eMYkhxMuWrH7U8t/yd2e1zs17cwp7
 ZTAH1EHO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZiIZD/Df++q++Krnz+d//2O
 /pyXf58ox92Sa3Re7/J72tTMHc6BrWcYGQ5p3fneeWV9s/hx7XUGL/yuvBE33/p5hn+6WFzVH9m
 rWzkA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use the
macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpio/gpio-tps6586x.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tps6586x.c b/drivers/gpio/gpio-tps6586x.c
index aaacbb54bf5d..e19af562ec3a 100644
--- a/drivers/gpio/gpio-tps6586x.c
+++ b/drivers/gpio/gpio-tps6586x.c
@@ -116,8 +116,4 @@ static struct platform_driver tps6586x_gpio_driver = {
 	.probe		= tps6586x_gpio_probe,
 };
 
-static int __init tps6586x_gpio_init(void)
-{
-	return platform_driver_register(&tps6586x_gpio_driver);
-}
-subsys_initcall(tps6586x_gpio_init);
+subsys_platform_driver(tps6586x_gpio_driver);

-- 
2.56.0

