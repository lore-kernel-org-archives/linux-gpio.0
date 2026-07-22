Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F7143B3C4
	for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 21:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784754865; cv=none; b=nNSpC7PLLAioojvcHjI3JYRhhb4Pnv3WDkqWrk05T3sixZvfmNQuR+a9nogu60z+nxKZfw4Rq/5zkuVXkdaPFoaUATM/0j9wrQyrYEwXDH7020RdPVBA+2Y5xgDBiMfdegTyGgYBaZqth//PlNNrrWHlocd1Q8615+QKRl7ZMLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784754865; c=relaxed/simple;
	bh=sGs0rfz9r6IQCOxNIuyFl8cjjmJTI88JpUD6LUtWFpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GGuBhyfuPA2W/X9tz3zTBt4QRHxWG48rEANSH3Q7VR5ih9bu0jJ/HU0FKkba3NQPTEF96T7QbnmQd/5GApxzEGtMmXOW3gzn5/KYyhQgpU2lwMFfRWUAJYN8VFwIPXXKB0FN+7y/JzH7WfaCwTmyYkXFcyCUd6yGXFnfOOLpLbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYd1wBrq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYd1wBrq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49546c690ffso44127195e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 14:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784754862; x=1785359662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sGs0rfz9r6IQCOxNIuyFl8cjjmJTI88JpUD6LUtWFpQ=;
        b=fYd1wBrqsC4GM8p5o94n4HNLJzHHbLKhAQ35YG0kdbX3g4YIWKfJz2jcSo96XFgqlD
         FjfqYNwntsiIavPhgLbC/bJwdJqMBqqBsWuEdNwvOo+/T0PiLdoGlrHvizNzXe5GCf7Y
         dqbdY4gSUiw1efeyhVpc8oHVaYjgBwb5b4kf6NQZguS7M7vE5tBD2kZfgBFjvWQwBZmD
         7WytHo2UTGNAJyM/Ct6wEWOSEpeGU9TEDL+g0hQrU0EoDxx2VDPVv8P9wIN11tN+gFss
         ysP2MuVq3jVmNU/Olngn5DeslFZp710cbJOuUy1TLZ7bQEw/i/b3HObRxcay3e55k5Zx
         Vtvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784754862; x=1785359662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sGs0rfz9r6IQCOxNIuyFl8cjjmJTI88JpUD6LUtWFpQ=;
        b=EBImDBNjrnuqhhH8oAlF0yJb26AiH594LGNBU1kHQBqLh8tOhr26HPfCvZD2VkJn7j
         GMGOrz79NMnpyAMI3zLiTDYr8ld0KBS7U2oK23jy/qcpOvuWjabAGqtJhIbNOYuW0NNn
         +T/CaG+V5pLlmfwFeZWBMhWmt/n1zKG37T56UuMkoAaqcx/P86PMSgSGOguaCR5m0dvb
         WpD1JBfrv9IiYnvIfoaAdpOAXVpAfn8E+o1yIqaXVweIk7FMdEStGkgRiA36pC+aJjzu
         gGt/AOjdYNnPwGLmguQvhJyh1Tne9F8/0pJ2hPDP6GScvkMDElHtA1zrWUEbeCEqNzuf
         bmjg==
X-Forwarded-Encrypted: i=1; AHgh+RpQC6azib2U0lunkEWGf7rL5ipim2c9x0SqSUwS442duCo9gSjyUyyPcMVXJpVuCyRnr8fh3oi78h1E@vger.kernel.org
X-Gm-Message-State: AOJu0YzpaxUnvv4uWhI9ah5jiVa6qGqLUbjg5YpqbPdY90zEVrU7Wy65
	3ukOTQ7kaeqY3tVkobzwQRdGz4NwI0aq2nALEj1sO+T5ISeheQqJPGFL
X-Gm-Gg: AR+sD11zGjsw9VGXX9JnsvP0wisBa4qV7PLWM2W7I8lc7/k7t45P62NEdXvfIfTYvai
	J17FSpymsT1IV/kico05YfZBnLB7mDEcSwjssdcpSO1ZqiX03kSyKEuCgVj5VmUSyzc1q22slku
	ht5rqXh0i5u8G6N5Sv8FYI6r418IWFdsQxMq1wC7BfnFfh7IrIbhzwf19c5gRGQwlPGG68t6U8/
	qfWNXw1FHqJcEcFQGbu3cSDTI0QgRggJsyenqXykzNxFz8fXReP1oP5BQE+7jt4BYz2d4P+/SPY
	Ont82iKfIxmuHQL0qthRmm8XsQ0GSBEvysh7p6TWstYzKRLAspzNZsesH6DSw7m1ijxj4Vk3FKM
	BEvl7TOQqeR5mxmt2ah+JABLETy7b7Yq90VrJXOXn1bkO24rOvdsIlE3S5+iQvEbQt2xZ2+hqM+
	xAeDXBuJVqmt2lyMiX7D2KIRd0o/R6o1ANuYANKNATPFh0mR3RpgRlFolfY70dh1efd4MM7g==
X-Received: by 2002:a05:600c:46c7:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49573cb966cmr3744405e9.5.1784754862459;
        Wed, 22 Jul 2026 14:14:22 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b021fa6sm66296175e9.2.2026.07.22.14.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 14:14:21 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <9b2d40b1-a21e-4ccb-a80b-27f1a24afc82@gmail.com>
Date: Wed, 22 Jul 2026 22:14:20 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: s32cc: fix unmet dependency for PINCTRL_S32CC
To: Arnd Bergmann <arnd@arndb.de>, Aisheng Dong <aisheng.dong@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Linus Walleij <linusw@kernel.org>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger
 <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
 Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>,
 linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20260722202638.135277-1-julianbraha@gmail.com>
 <0a99e10e-b4c4-4a64-bcb4-fee8d777d0b7@app.fastmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <0a99e10e-b4c4-4a64-bcb4-fee8d777d0b7@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/22/26 21:39, Arnd Bergmann wrote:
> The patch looks fine, but I'm curious about what type of rule found
> the mistake. Is this a heuristic that found that drivers/pinctrl/*
> overwhelmingly uses select instead of depends, or did kconfirm
> find a circular dependency that was caused by inconsistent
> rules?

Not a heuristic, kconfirm-smt is the first complete SMT solver for
Kconfig (as in, all semantics of the Kconfig language are used to
automatically encode all Kconfig files as SMT constraints).

There have been many previous SAT solvers for Kconfig, and there was one
that attempted to detect unmet dependencies (Kismet) but that one has
both false positives and false negatives because it approximates
everything as boolean logic.

In contrast, kconfirm-smt uses SMT integers and strings to model Kconfig
int/hex and strings (unsurprisingly). I believe I am the first to do
this.

So, to detect unmet dependencies, kconfirm-smt runs a check on every
single selector-selectee pair using this routine:
1. Add the constraints to the model that the option is enabled, and its
selector is enabled, and its dependencies aren't met.
2. If Z3 finds a solution (as in, the constraints are still satisfiable)
then we know that there is an unmet dependency.
3. Reset the constraints back to the original model, and loop ^^^

You can also use kconfirm-smt to do better random config generation than
randconfig ;)

Also, you can give it a partial .config file, and it will randomize the
rest of the options that are not in it.

Give it a try, I would love some feedback:
https://github.com/julianbraha/kconfirm/tree/smt#usage-examples

- Julian Braha
