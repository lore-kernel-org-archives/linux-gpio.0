Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530308;
	b=0l6D5GFJuUoNyoGhroNMCkjntDCp+NSYRPqJRVmdyQS1X7U17mothq8yviFQRwGNnsSs
	 RasYttQAV+vxXZ1Y7tPNJ4LnDn9mpkCrC4sK2ik3kiv9JGXxvkrbxbyaXidlJ5sjPWlr6
	 XkgrC0OuQsox5iE0wQUG0CKNEzwDVdrpZZmUZ0oUnzZkAO38+DHTxmh5VTAcSPsHkzQct
	 MwkODXuuZPAooO5USe7BO3UndvhkmK7cUK01r/JNhmThycKHHIsmN5y06/w8B0BvXW+2p
	 qpbKxgSUGTqCYUDLxa6Uepu0mfsJZS27d3Mt4aKyIg6Rjk4JZBvXeSXlYe0uIBK6K5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8NuJWbidnT5EA+aFxRD5SM39/Oj0VNhJI4etsJtJ9CI=;
	b=Z8PYFTJ2vh8KzH1mhxGnajSNuyL9LUFRK+BHTe7WbBzXxsIJARP04AzQzp9tZODc/M+v
	 3XC3G8v9skC7ZF81B6YZ168usORVj4eZqtzW+mON39zK/ez1uhkLAAY87DNdqsmM6CGaV
	 lpmYZsEIGJyKG+eRC2H6qzBU6KxfQ1zJwogCxB3dbYI6PF9Uz7OghWjBq6zUd4GZiWrpj
	 3yKsUyWEZsh2QUZiE7OMjMIXCapIH+KnSuuH8UZ1CmxMCL6eu7hwWWbDt8LULgXm6KSz0
	 6WhQShroRTSr6hIE8KLBr6x6I+2FCwNrlWnWciltp4AeUHkDpWZ5KNKVxdjrsgB+dxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wriMB4Ds;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D20606B7E8
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 00:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34D20606B7E8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wriMB4Ds
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a215e64962so5893515e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 16:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530306; x=1795135106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8NuJWbidnT5EA+aFxRD5SM39/Oj0VNhJI4etsJtJ9CI=;
        b=wriMB4Dsld87YFqNWQv6a5U3pmzdG4WOObP58uk/kuhN53e/HmBjWr50KMY8coCN7m
         /BGyIroDjib2TGMolHIFz1FXRWUIV9p7SE7Stz4WyVVGwVJpMRn/8R80W3tGP3o4DPvW
         ziXadZTdw3dchUAPFrzFlLdVI/cb8dSn7xc8cOwLNbs1Ob5f8LM5UXzIpoAXxjPeUh4T
         TTEq+lr8OsE0QYIj0c6BUOHbMcWaQ3a8a0F1bcaXcoiW4boqd+hw5n0MMCT6jVOIJLsF
         sL7VtehjRE5wd3Ck8a4MmtQ8LUAUJL4tAAXTEuZ3K3BO1vncoAavm6YwEj5gaizDyK/o
         El0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530306; x=1795135106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8NuJWbidnT5EA+aFxRD5SM39/Oj0VNhJI4etsJtJ9CI=;
        b=mLsb/y516ttFV24IHqIyVIVNDMmINpcKQCe9qkvWZc8VaBF2CtleMru7EUwtc7rU7Z
         ypaInBcL1aahYxkKDRpE+rDfP9yom+vWAf1lHpiRgVjwrnDcvTsuc2JLc8m0rryZdiiv
         KM723cBSmWMHDdv3vvaWOQoFFcIJdcWX5f8JTdtC/bt6KGcTFwkAn4p4h5k9yQi0OX+g
         VDwZ3PO37d8g8rieALFeRVHBXZt8xYImp1Ql2Cm5xdavaB9xRXPtePO/2TobQBrZoX0y
         UvxgfK1AhtFTmeMpLyKgHCJJ415Gm3mzCDlob34E5RXJuDMJBJIOVFQR8sFyNLuN7Ht4
         78IQ==
X-Forwarded-Encrypted: i=1; AL+hErHFHO4sdxgXdlB7fYyrfKt++sxGSpKQXjPNNszZceyY4QBNuCKbyG2tEvFdKxi0x0jQ2BpRgHMCH9Ze@vger.kernel.org
X-Gm-Message-State: APuU4Z81RJJ8qPEPDZVAFDoIsup/w63YejV+5qbiexJdyZxsQ7gWhYST
	TQ5RPJlTCdt0tGb9b6g2hiiPxEVViBO3LYthdinLkcDaPyAtA32nXM7H
X-Gm-Gg: AYBFou0dvrKxB8hwMzwKXdtyxr/J8SDRBKJhtRb+Xmch+B4jxd6H16zDOnnkfOenQBL
	8rLQJra3qYFmlX011GhcjoVqiFngR8p7JuqSzevr264VJV4z1AUBw8mjTKeB0JfgEQcDpQJoXZo
	KPKFWbBwDPfdASRECdkP4Hki9+R8RqoAIPSaK4mbItO6yJzbyvSteLaHbs1DeVH/RHBI5u7hrKi
	icXLNtOqKnTdmEkEzlu/IMLyI4XQYZ/L7LsSLKNo7cA0URR/eJmv3xmr3V+JkjCqLT5lbQemW8Q
	a6WghBVcctu+qD61IJOOABjesBq9PNpwIFHJsHQwX3N21DGHkhXDFjtyzy3XwWJsi4759jRcBjj
	7nLoyK++3zcnuV3w/3VzMiRAIYrvfx4ZjvGfv52A7PRFn7rjP6xsLsQGlYRU51w/f3SvM9LbyrZ
	szzI0gJNtBoqJo72aiCq3dXDJNMM3M9TeS2h60HPaTW2iN+NO8sFiVwwxc4o6SPTmr9FRCStU5q
	VVhmunXhBGJCN8KSOcuZbeo3JHwxZUlRldBaYaBxyQMKEW17fpw/OuEf3mRUxE/c/XFWKthI6R/
	SCKl/osLiXuU1gyXe3dsUNGsknyoN0sf+KpOOqZZ6P7zyY1edjVT1m7khlOqIOAHjOE3HASI/Ac
	6FetXHKI3z8MlRvEmRhgen93OOENDYL+1sZdWdAakztf+2+9OhSiwZ9Ec5YE7kHrohJnRZ+cfzu
	gZRHgbBZn00UAuh6lihHQs/14JfVuKeM9vxe+NvfE=
X-Received: by 2002:a05:600c:4e56:b0:4b3:9540:47a6 with SMTP id 5b1f17b1804b1-4bb55aad2demr18252015e9.28.1794530306547;
        Thu, 12 Nov 2026 16:38:26 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ace535sm19669805e9.6.2026.11.12.16.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:38:26 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 08/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Fri, 13 Nov 2026 00:38:24 +0000
Message-ID: <20261113003824.3670843-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAMRc=MfhnbwvM+c=e1=ga4wALCmj8Bi8LWkB_W4_0YHkK3Hikw@mail.gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-9-ghahramani.navid@gmail.com> <CAMRc=MfhnbwvM+c=e1=ga4wALCmj8Bi8LWkB_W4_0YHkK3Hikw@mail.gmail.com>
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

Hi Bartosz,

Bartosz Golaszewski wrote:
> > +	struct gpio_generic_chip_config config = { };
>
> Don't initialize it here, instead...

[...]

> ... do:
>
> 	config = (struct gpio_generic_chip){
> 		.dev = dev,
> 		...
> 	};

Done in my tree, the config is now set with a compound literal like
that. The GPIO driver will come back as its own series after the base
support for this SoC.

> Looks pretty good, I love small drivers like this.

Thanks, that is nice to hear.

Best regards,
Navid
