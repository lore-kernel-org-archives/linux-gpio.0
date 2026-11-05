Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910976;
	b=mZtvC9VuNYS5UN3orsmzxofrf/4o9Vm5g8b7T9eyDts32/ujmjUnQJAa8ZcP7Os+SY/w
	 uQEoR/C/12mvixnSTAQ+N9R8mT7ltgix2+tJJzQoPB/3djv3hnCmfi8r4h7w79tMM3Tpl
	 FzUT98ptUwSwYGvMqy1UcRp16aFkR/Hmq8bd2CFENXkoEc+DIeJy+kmPxOzwA6TMzY3WE
	 cyXSEuduI+zCcjn073AfMFjQDu4UVatfk35Z6e/YUrmA8XYYxTOObFDY1x3avXMqv+EHb
	 y6Pl5ExsTZA80JzqGTPoddOnZVfFLSXlEG353aJaKzBqs1ARlAJgd16XgKRZy8a4dhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910976;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=QQl1ERSY4wmOR1OEbq5mx2PtZRC9i6q9Gw0tuk7z0Is=;
	b=XsD70tkv8I2b4D6yK2BYqaXajAdH4mB5BzDzgEEZ2oz8QQ7Nf889RJzMgRwbnWyjnNbS
	 zyP7eWT+qoP/W1zw0PFoivK0FdUZAAytnp4z+Oe2WgBuiYqoqYtVgJimMftdD0iHjWqWh
	 ZfrXEaWAXJWzTIcTHQf8imrVtBrnIBKxI3xNjr7OOSb9cKdD0wIbIsEZUqSZfmU4JNEcE
	 jVeWRLrRygGhoQaTHTO5zkNoohRDXT4O7dZY6HUEB7qe/bDtiJ+CnAYaHNzbbH6jr8aEH
	 ZIxJhh12kHrYVgXEhCO7esE8K5x1agON2shrLB+tuX/puMonJQ+5Sl3M/oZmmSyYoVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B406606A32C
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 20:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B406606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b0afe09854so806138a91.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 12:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910975; x=1794515775;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QQl1ERSY4wmOR1OEbq5mx2PtZRC9i6q9Gw0tuk7z0Is=;
        b=Nss6Qt+pdsSUlB1wsYlv4aKK2lhKbcYUxC9AlGD6DugRkeELHGY28jVUFfQtlA/DDZ
         7uweNPGPZNOFYHZoGO8FRPrpk3aCeGmwZTBQcODRKfzpqraQui5iw7o9Jh8U3XdZkvup
         CoqhfhLwfuw4+9qqt3Uuq1s7qOzdWmCjQIxk+zfvJRTih8xpkNXmqHIV4Y74uISS5g18
         Mod+SQAM7g6E0MAha453owb9VQ/qWjew0Fv3VmTv2F5HR6xhE8kLni6wxeQQa/1wu6BD
         SxtMSYiJMPMrOC4wmJP5ajVv9TXpACzXW9RfA65hFaEoBO6gFiH9OrlrWAKnz8hWC6O3
         9npw==
X-Forwarded-Encrypted: i=1; AKwUvBy29A/b9vB2sSSKUr/A+p7xazhlVQFM2UFoLOE0I5dXS0h2jr8mTkYNLf9dq7by72LeusxvmqvZ7waE@vger.kernel.org
X-Gm-Message-State: APuU4Z+FvWEqzny/qG9qs/uuoOTYKmBOom4ePhQmeAIoiDcoXcdgC7ZZ
	uVXfx8CIfi8GJl8+wIaTgK5OT+9Gf7ujKdKmD0AzfhHrGRDrZARhdaGFMXo33sxX
X-Gm-Gg: AYBFou1D9nzaQFh5BKHTfEKO3U6crFrpbWKs+O2K3c5wioQEU75d3Teg0PACYN7JfKg
	l8b0pI3mpbclRyHJ5xO4hixZqY8SpYhU4wyWQiWFHU1I1fKeiIiWBy0kI03UbhHX/Jn/fK/t4VQ
	cUwTZJiErqb9Z+nGOUEZIkQEKueEc+amVrU7qfCUnmBQbi5ySR3qVWARdGcp7+sAmkLBWqcpMuM
	Y5wzj5us4Xh59UutYaG8PT8V2N9hyyu/mPPxut5gz1BtSvCEFJtt3aoN103flofxn/8rhqe+z7d
	Hg7Z3Uc4c0RUs+iRl8sTevScFkOKQnesFOqH6LqhCFEA8H07knrio9ZcoqOpmm4EG9VWi0LL+IY
	X6LddGVyr5vU+doiehwSk3MCGZTsfEqdX6ev4nm5/64EANAnUQtqQKTdIyLEaCqOH8jfwpdn2ZP
	vFwH/8zj0yAzFdlCMr9akr/7lf+TRJPWIDkNn8FFYvLeKXUzq4LacJCH1ctv3iGzK4PCAJ8+Nds
	PHt+eNdBY58Te15pe4r7ozXKQOrLXuJQyFwvbrAmlcBxZoieZJF7+5V1pvSgmc+et/JBH4reNTp
	Guox0vJHRE5z2q/ON084Rg+QCKgW1gNjzXReVYoCNi+V18TIgaTliOPooVfyQ+5L+ypp5rlFO3h
	Ii963ylmJchw7V0MoJxSFzm/XdrP22bP3PsloSrfrIi2wQw==
X-Received: by 2002:a17:90b:1b07:b0:3ac:9a5e:9ce9 with SMTP id 98e67ed59e1d1-3b0db6edffemr142219a91.29.1793910975375;
        Thu, 05 Nov 2026 12:36:15 -0800 (PST)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com. [74.125.82.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm599909a91.14.2026.11.05.12.36.14
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 12:36:14 -0800 (PST)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3514b90bb89so4479834eec.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 12:36:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy0zJgbtKzmvKaRQt9ddtSj8kkFlybW92FEMjDWdZfGYGBnYhNW3v3DyKOGYjE9dzue/a9q9NI4zVEF@vger.kernel.org
X-Received: by 2002:a05:693c:8008:b0:369:d486:457f with SMTP id
 5a478bee46e88-36f73e72d61mr409769eec.2.1793910973768; Thu, 05 Nov 2026
 12:36:13 -0800 (PST)
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
 <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev> <CAD++jL=Bhbm3eNafdRTSKcnjyivhdmp0Mk1iHZ=HKN9sy_3Ozg@mail.gmail.com>
In-Reply-To: <CAD++jL=Bhbm3eNafdRTSKcnjyivhdmp0Mk1iHZ=HKN9sy_3Ozg@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 15:36:01 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4ExRTFJ+1q7GDw8ow=_ekk8urUqfC7ZtcYckwf1uO+vw@mail.gmail.com>
X-Gm-Features: AclHuK_D3HUaJCQYumF5y8SooLOqbAC7H10kZ7apqTopxHnLZbvIW5XAq_-o6t4
Message-ID: <CAPY4CJ4ExRTFJ+1q7GDw8ow=_ekk8urUqfC7ZtcYckwf1uO+vw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Add Siflower GPIO controller driver
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"

> Completely pointless indirection, drop these functions, just use
> readl/writel directly in the code.

Thanks, v2 will drop them and use readl() and writel() directly.
