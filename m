Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086158;
	b=Xs1bhBbUx8DCF3RkH7UUaRsHzsqrQAFv5fX2Rv/2hPQm/cB2oetBLigtc8OC9bo+w3KQ
	 7b5aBJ93hjG73lPtm0ngrccMxus5O+ftiCg1l2cElb2yxjCfDT8uyE7DM8Z+1GwS56KiS
	 SfYyCWmOOZXqLeJ4IyZK5YIufhRubVs6RC5VO8sY91oTSZx43clzBWtFY6WjatzXLZchz
	 hjLNy6qPoY8kwJi3Ldw276JiClPi1a1mq9BK/F23W6ghsiwyAoGTEs9mvZeW8Y6/YZEma
	 1gKVidRTFkiOf2cQam3dA88N6LgPeAg+u533Ux3Hv4SBrldzL/i0P4wGmb0A8aYInyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=Njqr57p5ISV7HCURBgYX/ECIIVbH/IH4ByQbfc3DSrk=;
	b=pyNioTLpxByRGqYh41TPplTp98sEg28HCGaIqW5E7esS9tGdkCdnDV0UQg68l+L7981s
	 888DgepenmH8oOGbMFrBD2DAD9IyOJ7WhsRvDLjk91/ffA8VbXjs9v3+d/p2iylG9BklH
	 uvUr6NNlnbMClVgINCYhu1Om34sPDuajEuNpi3tB6NxJ2a1Xba5VXBFu83Zm1KWR7n4Rg
	 ZNjj37tZTs4FCgeyfjy8yg/HGmA296mbzjKCRL3++66NEp4cSTF66QukQwZdF5SO0XwW2
	 DA2ez/XCQ1Dck2FRBYa94JDnqjbSMx8kvEKvqdV5prZnTWsmGP8omPGqgL6vRpOeZrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WgJZsn0n;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93B5606A325
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 11:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C93B5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WgJZsn0n
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be47aa555cso2456875e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 03:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795086156; x=1795690956; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Njqr57p5ISV7HCURBgYX/ECIIVbH/IH4ByQbfc3DSrk=;
        b=WgJZsn0ntLtQmWwKEunSPtrq+5IfLHGwCNn/3/5AXft5tMN59CFoznndg/dzTOz36Y
         nyqhDzYuD2uBpx9dGgJPABy9nHsXaoE77zLwLBdHboKcNLZuEHO1T4iOlNJc9sFczOuD
         BUeJe4KMlpZNCe6zwSYItuHZsznqzs2zbWPl4he+ZvCeiGvez5anziEuKZ38MOlhus4Y
         9S9jDzCLW6MeW88xWXkHeQFJ9V8Qc/kKJATHZS5TXShS7MD92B857/1PnuVEYakgwBu9
         Ae44JHcUZzGd55VDF0icEKHgKLkI9dQqHSFrLAUBA3o1mWe3g2yFJU0WrpgdpTvkxh9l
         P0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795086156; x=1795690956;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Njqr57p5ISV7HCURBgYX/ECIIVbH/IH4ByQbfc3DSrk=;
        b=2qz8yl17Cf57db50Yy2y4q/UZSe7iMQ7rIJ9yeBRfY7Hdm2CrxtHvM1nG0PV45l3P2
         p0c5N9kwAOvWlmWuffsUwT3W0NcDSP+RVSs/l81+N3RD4EW4utfp/7uJZaajSf9lnQO2
         7lcaE8ZcEsHecB0w1U6cOFh3t8qMnZchfo4Y02GEVcBFT2XsheCq+HcMmcGGrAw4YrnQ
         EhjYRbIWHUmSFwjdlkWcdzwgFfpdSzZ01+OHGoTU4G32IYUOU4lVcB2JPyvW30SlDHp+
         Rb+bQK9Z2agRXQ0JAJeUCKYxd7L6/Bh/5j8hAz3ZewAsyTT0ogzIe+c9rVhKsUeJSozS
         juyQ==
X-Forwarded-Encrypted: i=1; AL+hErHf6ipFqTd8QevHsR9iRxN4HDJ7biomLWkdOG58KqkaPNDCbBj7KMw15uelRvByI6L50Y+Jn8xTp4Fb@vger.kernel.org
X-Gm-Message-State: APuU4Z9Gt3RcehhywUpnF0YEbsqe85BFtu/4bWERbrM0U6W5D71rQ00w
	shLS0L4Y3wXdS6+jQzZymXY5ACKlBIJRcUCPlA48714NiIr/o5gThYo1
X-Gm-Gg: AYBFou1K9AFA887ASLN7mFXT9yIsOvsmQcECnP7ER3rOGnftc6N9NsRAK+4vKl8gVO0
	ZVdACVqXG3Vi7cg8MgR+HIBgbemBsiwvv7VATustRJbnOdAKdol1ltk590jR37Wo5F0xWwxwxQ7
	vVUI4TXbV++AlSVC7nwXizsd+ikUPPUvFGdUsmVfOWHg1WIVXT3OfFpVBPr839NOepxUZt1jxZ9
	ai1Fv1sRHX53XPB4SvysCrLUuHX3WMEtsTdJEK3okXA4K4b7oFGrPqyZ2AI+EQ5yp4Qhk0Fx+RO
	OprekBEMFveE1je0ONUEsYTEpT/wCpQNqiKTMZFZsJdCMCCbYPfVM2XTgbJ0CQou0jaDgXFe/cw
	5AwB7aqMyyssEiix2mJGCrpHPa9flz6McqJlAIRSxGkcYqjxlQTIscHaMl7NVA9vALrUM986RB7
	6xWpy7XyytyO1Dsiz0AYFdyvac5GLNdEeqt+7oV5KRk1qKg0na9U5XtyBl7Yi5rCHzIkAKB7q7o
	DoJovHOPDhkpxXXMkP/SaJyeWhfSZstJEzVURG6iPqTYpRXEYiUsWk0yhhYCusNfFlj+njI23KR
	mCsgaMgk6pLxptWY+DbtUudaAK1WR3VnepmwEgM9rIHjFSzgb3lOHW8=
X-Received: by 2002:a05:6512:2308:b0:5c1:4f83:17dd with SMTP id 2adb3069b0e04-5c1aa2b4af5mr1725666e87.53.1795086155763;
        Thu, 19 Nov 2026 03:02:35 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa772c50sm1425957e87.40.2026.11.19.03.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:02:35 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/2] gpio: Add Cortina Systems CS75xx GPIO driver
In-Reply-To: <ndapsfnk4wdon57ihawkorz5rwrhxsb7ql3mujqvuu6ixi4sbc@ugtxsjqt7gcc>
References: <20261116-cs75xx-gpio-v4-0-ad80a944e966@gmail.com>
 <20261116-cs75xx-gpio-v4-2-ad80a944e966@gmail.com>
 <ndapsfnk4wdon57ihawkorz5rwrhxsb7ql3mujqvuu6ixi4sbc@ugtxsjqt7gcc>
Date: Thu, 19 Nov 2026 14:01:58 +0300
Message-ID: <179508611881.4.16899217970121840224@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Bart,

On Thu, Nov 19, 2026 at 11:32:23AM +0100, Bartosz Golaszewski wrote:
> Can you please address sashiko comments?

Yes. The spurious edge IRQ is fixed in v5: after programming the trigger
and polarity, set_type clears the latched interrupt status before the
line can be unmasked. This was tested on the Almond+ reset button, with
the pin mux configured separately by the test kernel.

ARCH_CORTINA_ACCESS is defined in arch/arm/mach-goldengate/Kconfig by the
CS75xx platform series [1], which is still under review and not in
mainline yet. The GPIO driver has no code dependency on it and can be
built independently with COMPILE_TEST. The architecture symbol allows
enabling the driver normally once the platform support is present.
I have clarified this in the v5 cover letter.

I am sending v5 with the IRQ fix and the updated explanation.

[1] https://lore.kernel.org/all/20261114-b4-cs75xx-v7-0-8f17f38821b4@gmail.com/

Thanks,
Fil

