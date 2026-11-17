Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944961;
	b=G5rndOLmHpxVcZrOwCwG+WtJJHbxqzzAd5Mr82sxFM09Q9lpOyzWPE1IBamM4YNXM/rc
	 8VLkY1MAj5rWux2aEcS57rmhm1NuhbNN+yY8AJICgbwC3DqjfTWNfUqD7OXGK7V+21gIb
	 7qxdeuylvefhERHt8bXRuF01uTZpEN756y9ieu3TQXgFDVw6a30DRWan48qmARE8JRwbt
	 FCZN3BH/bhTuwEl3QyV7p3LBi6uJZo1rW04X/7RcregSWMuwnDc2Q1JFiR+qL5IZYnFtO
	 1CdToKjkTflAlwSUO09ZZdvWMdjfR9RKEUY/IixkNlyyxQyL/ahDKBBlDjIzhEALRkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944961;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=dx7TBIE8Mp4LTw+L9asay8YhTgGHn7Srtn+pY/iE7EU=;
	b=BnZ5WTZdxMg3Qzg1MLztsfQa1ZMItTWtn5CVDxIw70ebdzZ+xGDlcN1Y2LYPNvhhi6fz
	 mH5TjDgDc6ewRaXya+vBjULaZgmiidpnWnhGeKvJdLhJQxHKxC6tSrpnGaRpLhUzudH2M
	 XUr/mksuZH9WSlRYaa3IouVDimNDh0X5Ua1rcYuvu04gQby5CxkWWc6brWR+aoVjFddR/
	 lkfaJyXODSplLZZhTK3GwvaR26tV3K2cHBCyqxl4KcnXnx8ZkV7eXx6M/O2g+x5WX24Cf
	 kZa9WTuZjjd0p3ox0i+aD557A6PC6P4Wj8S3UaAtPff5zZGSRtUQlMnhNj8xwh+0nBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D549606A337
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 19:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D549606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b3bf3bef9aso82961a91.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 11:49:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944960; x=1795549760;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dx7TBIE8Mp4LTw+L9asay8YhTgGHn7Srtn+pY/iE7EU=;
        b=m2QYoafxjkgctJTdQGLfvo8QovEdwtcdIIoFZPkC9MkAQs6A0YPugu0jfK8os4gmHb
         gQe7NoWfAxNOI0mObzu+ea6vONy0TNxBYn9SE/9zNr79arqxTFkBGVhXnqylQqwNQJBO
         sezxgWR0AOpRYHKs/6otGkvb8BXJOGRlog0XMkd96vQlQw04O8naYcGkgZ9Cl7SejTHv
         BLh3aAYg2FAUkCyKfAlXeI3CM/CU9OJXkUR7R3DEfYhYHR2sTdSLbfx/76BQZXmPnLHN
         vg2fXXkU5TD9B2U42WFCFkN1rY2PoERPSb9iIKqhOlwMeNvIfkSLSKzwNo372z/pw2ZR
         5XgA==
X-Forwarded-Encrypted: i=1; AL+hErEJ+hf4DuDDfU3Xu8OIK63XqI3n1Qk3Tw0ZMHM/alSZJWpl950ylJPdObqGK5GzaqsC/MAX09KAgmA3@vger.kernel.org
X-Gm-Message-State: APuU4Z/aHAM3WrA36z8tXc+fZqTSIo3di52AZj3F+LVxXEutFpnvvnpr
	tz9HEfrvHW1Fdzez4egUgqgTH6myHUqDMpsf0ZpdcXm7exbNPThlyGcBqpYoemRl
X-Gm-Gg: AZFdTZd6UxH5OYvd3WH0OaTSj4bYCH6EbIjfSESAzoBVmezrD9fHvbJiQqgvZEmU+JV
	MstxAv+elzsBaL2mgjXkZ2N3PhPT0tgDOS/TQbsHl1EtUzIHM5fpDRuPJ9hT2sV9Qn0XHbNjQd8
	V01AsoI67pDKxvRnwvtWek4ZcIhZcE/5/eD8AZNSRoI/sqqkvmtcWh0G7RxEXeaJOnbl4pIno1p
	uIjxN9whGQ+GqIOy9FUEsm7yByDTj64/7lAWOU4ZEmxHeH598pAU0vxRtCTTTHqe7Z+bL7TEtbW
	sKrBD0QBW3VADhooj/gBeWj6DHbQ/fhCD7amnpyoU3r7s9ylA6mab+whreBArZ3aGHwqc3RTt8O
	5tOcc+zFwpSDzfdUhzbKWoXxZwrua2rD9G8xH1UfT233SgfPNj/Tu6IKUNIeVtzcq+YavDca4Zf
	cdVy8obPL2EDLdmg4/l9dpzlcyNJM1Kuvv1p9y2CB5H2d+QNWDe7SmmePpt5RVB+WSTsbVCJ6pG
	Y0fbqQtEzCzWLw4EgkZfwXr8ljNWMXglgZQuvPgTFoHrZmSzyIc9UgmfhSNu8dw9CiddbEVmRpL
	UOW18hOcAwz8oun4PLxuAaG8mEzxzEzsYNnDSCMPUPh4d7DKEEOmzYy2TwkFDLkqyVejzMDmUmI
	C3qigXFY+brQBxo3adw+cVO/GlA3BkVapV/nSD/iu/A+E
X-Received: by 2002:a17:90b:1810:b0:3b1:bdc8:c32b with SMTP id 98e67ed59e1d1-3b3d07e0cbbmr443051a91.53.1794944960593;
        Tue, 17 Nov 2026 11:49:20 -0800 (PST)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com. [74.125.82.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abb786f7sm5387708a91.1.2026.11.17.11.49.19
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:49:19 -0800 (PST)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33fb4680717so504870eec.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 11:49:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGsiFo/DWmX222IAIuJ3QOwHzjKfmwkmPBDKBz3+1nsvgKIObYwnFLuSqrQxDdqkPu5ONtrbFy1r48K@vger.kernel.org
X-Received: by 2002:a05:7300:e009:b0:370:a11f:dcb7 with SMTP id
 5a478bee46e88-3828161f1d8mr420423eec.41.1794944958852; Tue, 17 Nov 2026
 11:49:18 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-sf19a2890-gpio-v2-0-b885fbd84c4c@telaak.dev>
 <20261109-sf19a2890-gpio-v2-2-b885fbd84c4c@telaak.dev> <CAD++jLkGavE9jL_EbPB2iPH=Aa=4Vdwj4nvHgiauJtq-dbwKZQ@mail.gmail.com>
In-Reply-To: <CAD++jLkGavE9jL_EbPB2iPH=Aa=4Vdwj4nvHgiauJtq-dbwKZQ@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Tue, 17 Nov 2026 14:49:07 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ49c1g9t6teEK7zSnvig_iwNfa_yM6GP_WcJJkzQ0Oq9Q@mail.gmail.com>
X-Gm-Features: Aa3M54q2rRrfck_2znOo84tl7sC4Xfyn9RtGeBH_rlEOV0HSVp39Mi9qyquXGxc
Message-ID: <CAPY4CJ49c1g9t6teEK7zSnvig_iwNfa_yM6GP_WcJJkzQ0Oq9Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: Add Siflower GPIO controller driver
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 11:38:53AM +0100, Linus Walleij wrote:
> So this has one register per setting per GPIO line?

Yes. Each line has its own block of registers, 0x40 apart: input,
output, output enable, the interrupt masks, the interrupt status, the
trigger type and the two filter registers. Only the pending bits are
shared, in one register per group of 16 lines.

> This is ideally handled with select GPIO_REGMAP
> for gpio-regmap.c using regmap-mmio, see for example
> see for example gpio-mvebu.c that does this elegantly.

I'll move it to gpio-regmap on regmap-mmio in v3, with a
reg_mask_xlate() for the 0x40 stride and the debounce in its
set_config(). gpio-regmap doesn't set up a gpio_irq_chip, and there is
one parent interrupt per group of 16 lines, so the interrupts move to an
IRQ domain of the driver's own, as in gpio-rtd1625.

Thanks,
Joseph
