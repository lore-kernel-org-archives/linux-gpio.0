Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839373;
	b=AmaJ+0eYsdg3Jd1zq3aILbJ5UzF9QxSel6pl8Ym/6M/qd1Bfkfg2Nlea1h9VigboaPgj
	 X7sug6zgLrdceUodMs5gba9ovBcNvDgAW2EU1mEEGCPHxCc4AWXOz5SqlORCeEQEOqHte
	 GPXhCZqUWApl8JFzqnQVjoqICwCTQV39l1zzCIhiZ+U2l68FI+aLv5tPPgguRBPeMKcca
	 kwEu06+25DXAQdpCDf4GlEviwb8HvRbo+clSfdYKHiDzXAf2L4OnhE6I5/Z9sXJv+h0rM
	 JHgTbHX6tOnZXSzmlIxpe1APB5vZlmDEIZ2NryeuYphpHWDQ1GJT3lbYu9CmwhzzPEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839373;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=dlcvkUVMW/9VrLP4zZpdDbI5u+zIZh6oyaHuXCV8ZD4=;
	b=rwglNJ4vAc3tGIpB6qk7cQs2WcUaFy5i9c3piquiMFI4Q3avTE6d/XSfg8Wp5m04Rs54
	 55TFPHzn5vkMU84MhQ7EOhjIZi44nyQh7jm55HgEQaKdLzA4Fv/T5u7ASg7YWvg1y5rbL
	 oKLdiZKyahj0DA0xLYZ8l6wWf1abxD/W2d8a0y/gx+8reCgEL6WRb3n4j/vMmrx3ZCKQq
	 Mrw0TwZpHlwVklgSf1FrWwXVobYXQQWh439DBVSWg4yYp/jF/oxT3AKooxu6KSi1ejIcK
	 CVKkkYiTWyZ4CZ44y1tWTlMvtZbzQ5WPdWvGct/cy/OTQYgNxaRCgcm3wJk6jCPbBXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB43606A328
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 00:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFB43606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so565026a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 16:42:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839372; x=1794444172;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dlcvkUVMW/9VrLP4zZpdDbI5u+zIZh6oyaHuXCV8ZD4=;
        b=TAnzLM7STaA68wZjfcRCT32sHCpkvW/M06pyvB6VvGRxTXvLQFo8zlii+cPDl8DMTQ
         iVl2zWQDGrBXWGNAAVN5Ij3bXxa65psDTGoC9LzXkESnlS7MUr0357uOwBCknGAObLzc
         Q6RTZ8wMNOYPaQoEJeCWq/llM0fyxhT0T7Z3Y6af9h2dS9nOke5aS2GGTSS3k3jeNd2f
         1Lnx4nl6owt1wAsmnSBPLtl0aDbFuzvHP0g4+nU9/d3YIRmmIIjIje6XTszWrX53Sg15
         o+gHemIeGxM6oCAZ8E0XURja0PeOkJncjQUSU3BVClraanovgawKAEMp+ywZaXbgRzis
         RM/A==
X-Forwarded-Encrypted: i=1; AKwUvBxVdpSVYKU96PzFhdGe5cWETD7/Vk/nfg1UYpF4FHcsV9UXFznPlgSmfZg255OA9f3QeKadtTaBtDuM@vger.kernel.org
X-Gm-Message-State: APuU4Z/tvZi9sl0YTgHLPBvJ2W6gHs4DYZODqwmoUVQKz8RfX4l+0ppC
	y5N8+d5m856u+9J1aZzFzH/NVgqnW6x/0v0O5HhwENPgkG6B+Ok+N2qS4fE2GmJW
X-Gm-Gg: AYBFou225YNRdTaS9YDo5X/yExxdBKEbGxFykn3aAu8J9TuGb3NV8Po9vU6cu5dDzYq
	likZPrh3avzuIEhLkN9drqjVEf//ff8KEkZdte/lUf8wSYNs+WW5bH0ffdMx9wyKgtITkOcVTIx
	LtF0fDQHI4HpJV9Vl5efoyydWlJ4KY7JMPBmUkjzr8d90aXuuvgLEKNohp+y55aQomVu1/cpdkC
	51o4gzmigONBD8gnqFy43yKKPuLl3Lwx2gsu6SM3IRJgOqD4xDvLwttFo0KaHWvry6u/+CHOWH9
	xti9TFVAcGtMD6OwUasL55QbCVazX5XmqMd4onkeN16ID3Vf8gWT5au15u8QoAa3AbTb8eo6HlW
	ANoCuctp+ANc0sHNGn9MHVsI4N6qUZWAro2UGn5U67qPoNRBPG1HJpIXAsVxGf4yjPfiDEW6R5+
	5JMiUQ6p0tt5rqIByeFmDDRgrxmi80I/yPugzB0vLjK0m+mZjToCuzqZOGXJKRuqaGXVNzOQhfW
	W8t9+uExd+uLbRNqw4rYdVqBrCUJ4z26XNAR9WCnxJ4bcVfBveuh0kawzkpJly5H/r0YOwQD8T5
	9GtVORmOouyNTbngMvsCoz3vbu45MhYW3Ef4B5DvKZWccfQLQlp6CZSg5C4YCfHUERFKmXMpbwe
	8NglhXOW5G8UJzqBVQEoO1i1zKYBQIU4ZlZt5ePddqrYu8qlOMnrc+vdjhaEJCDAW
X-Received: by 2002:a17:90b:2dc5:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3ae897a5be6mr13675845a91.42.1793839372185;
        Wed, 04 Nov 2026 16:42:52 -0800 (PST)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com. [74.125.82.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b096b6116bsm2892926a91.4.2026.11.04.16.42.51
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:42:51 -0800 (PST)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35b2c599f43so782640eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 16:42:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzDMtckqLhJtNFy+jVcfTVM+tsiz3xthluVNWWk/O9D2cIFHiRnGrG3nmS11odpo62Q8sBzK3RHRR2z@vger.kernel.org
X-Received: by 2002:a05:693c:6092:b0:369:1084:8ee3 with SMTP id
 5a478bee46e88-36a423e52c8mr30753485eec.23.1793839370626; Wed, 04 Nov 2026
 16:42:50 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
 <20261104-sf19a2890-gpio-v1-1-45e463c48728@telaak.dev> <20261104-judiciary-fool-05c4157a7cc7@spud>
In-Reply-To: <20261104-judiciary-fool-05c4157a7cc7@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 19:42:39 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ7SZAqNm55Wz6yC0_HP_DCVeDbr8b76+p73c484t7q8ug@mail.gmail.com>
X-Gm-Features: AclHuK9UIWS9fpedIq3oDi0GN4EX_Euc3hJiZbuLEwPXjtpIZ-TUvM_M3RT-lRw
Message-ID: <CAPY4CJ7SZAqNm55Wz6yC0_HP_DCVeDbr8b76+p73c484t7q8ug@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Siflower SF19A2890 GPIO controller
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> FYI, these other devices need their own compatible strings when a dts
> for them is added.

Understood. v2 describes only the SF19A2890, and support for the others
will come with compatibles of their own.

> > +  reg:
> > +    maxItems: 1
>
> Move this below compatible.

Will do.

> > +  ngpios:
> > +    description:
> > +      The number of GPIOs available on the controller implementation.
> > +    minimum: 1
>
> With no maximum?

v2 drops ngpios instead, since the compatible implies it: the driver
will take the 49 lines from its match data, and the binding will take
exactly four interrupts, one per 16 lines.

> Please fix the ordering here too.

Will do, in the same order as the properties.
