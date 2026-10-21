Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792564549;
	b=oj4z5AxnSrwvKihDVCfQkFWICsNSQI6k1dG7quVzalzVDDR5gZ9G238IIHLw9cEUM98e
	 9UTWdKH6bYWf1cLc96XNgAdYe4gBm6O7c/+rgYYKM7L1j0N2DAornvmdbDsbB5GIgA0+n
	 +Vi8SRusT2D75/W2VZF+yFDoCxEHQX2A5RbJw6J9y3MkW3SnIlwfp2x5J8ckWbKnEG0Hq
	 ekMz6schEaldYhbGMAbe1M3KqoYu5CQt6QViL0S0Pt29ntlFchKuueP1smBWe7x0YvHEG
	 8Q0RF/eEX78gAI7LAsvHFvdFeiduVgv9MOMO4QdxhM8OVOFkB62eBKasDOQ4v9iF2JA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=;
	b=hirbKtQcC++OlspwPKWwpNncWnMukPry+KDvBtPLsaqg7ZbPAOX56saehAU3+lT4kZqa
	 9ewOliND3Y5Dbghcdw1hKY+RCIlvKimXuoRr9FYQCKSiY8nQzuluLcWLjmWdP5Sirjdn5
	 g+Cf7x051d+hBfH1FfjFvNgyfYbAFErW5n9URwTjGwDeLLCJtcC/HBhFxoLzeNYvtUQFg
	 uaroP0y5hQmu0UntyyRf1yF3snBt6sNbNkqW+OM4OC9MGEehGdkegfSH8irywG2g7ufi9
	 NmNgYqxzPFyV1nEoES5R1NE46aDs12nFdOUcz8MWGRJfciz0VECiE48Ck3UyHuCj8UA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A36C606A31A
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 06:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A36C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so381716a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 23:35:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792564542; cv=none;
        d=google.com; s=arc-20260327;
        b=B44uRlNbCc7r77zq9zb9QnUUz2112pXhg8M/BGLAizOu4P3v+215PRid5wNMhGhFze
         LkuxB/+M9sS3nMATJOLfBwWhBl4fmFfj32872PxMmlpoJqrefw2ugzP9BwUEaEu1icwe
         3k9UwlCwx10WlkZ9NvOqHBWHSD1TE7EcxCXV9LPwVmUns1py1zvj9lRK9kRuvmnYWMjA
         HLLzI1cMWQzljFIXJf4rzoadd3outbwy7wcbwsYNYbMA8rxzlfcldVsjT3dq6hS6m46f
         1arnk2MGSWhCQGzMxw/YvbaGjxrUVIHL4TkBwQwc8oRtFtWu+JBMzEk3VTOanO7MLB9m
         ACYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=;
        fh=eL4dMNON/6oK5FUdDBJXCC77OlXKrbplqiGToOtHA/U=;
        b=Jk4TuvRWs4KZLquvYDNyvivP+HN1efUmIwE7me7b/BsXgWSENwoEbNFxe3qS6w6I9j
         pAyc6Nl1j7ehV8tzwv65+r/aur62yAZ0ZQ34vPZzrHMboWLkcTKqE6R++xSNFLah4xtr
         4Smj1B8QedSP0PL73+2Q4UTEB2fkfWxF5omp1c40JdUObhJgsTrBpFO3bbjE1PJF7yb3
         PwCJrw4txj/EPWA8Lg7IWgOJq4Q6DnNDUWTpxFtvNJ5onclufNzlZ6bMf5SGO0CNRBwm
         XXcnvwF57unJBEjvGfFLsO/D1j5LMA2MA+DUHprEn31rfHJL8SvbsmIcd5FjWJj17WFc
         ZrPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792564542; x=1793169342; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=;
        b=SQsO8Joyz7VS+7gfUvSNluNI65EhcKIFQMPJULqGN5UfjLP9MzbUUAM2GeJ3hqkllf
         uQTdBDyQbPPjRYGai0WfdeDnW3WO4+t42Z2mxWWGm4pmVnVlCQHe6qlpBR9vaZ+vllGx
         h2xGVBgEQCFKH11r+9q5QdY65sS295/+Tq2DS5ZXmmh/j1ULBCd9h7KS+U9B5Cl0c3Fo
         X3iBdo5tlBejOn37rvZjodYCVcBnhpW++UlRUA6F09Pri2F5ZzW1B1p7sy6bKVbEkrHz
         Wb8LUZX233PjNaT0LiBwXYPf0Yyg5Q1S+TRvn1by6+Fz8GSTOQ4X1R586y6DHikxclnf
         NB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564542; x=1793169342;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=;
        b=a/Wi8LP9SPhI4wDkipdfmORUKmJK6FHrW0lTPoa+/A7zwEtgqsFzlhrv5v5J9eF7h0
         +GVLT8mWO8Jv597QOt1iDPNqs3GGoYzxSThnYoQ6Ci1K7rOjpsxsF6PGevFLdCzxcNeD
         373B35SLBjj5sG/5O0TLb4Z6zYa3FAXPyfJTCR6mmHNJug4a6YHWsFNrQHSUhtMXrFeu
         EgAfoZPLARbsgusKBUYDJfyn2OqY/H/6aqh345nSwLMXYwo7jE/GunF+NHQVZe7XKRmM
         KWzwSt6hYytFtDOQ/N8GfFbNWxfAN6xkG4/8ddcvw7zPWaTlY3uGH/7Sogqs80AJKLxP
         /TuA==
X-Forwarded-Encrypted: i=1; AKwUvByUnhbHZZLZL4o2E6xBx6jPpV3yj9bfWGgPCFgQxcC/8OViNg31HOLZ9RxedLjobm/5DFc3T6eXqweY@vger.kernel.org
X-Gm-Message-State: AFq9FYLVeElMUaZCILfWX1akwaDkLn8MbzSuHGeqi0ulrCsQy7rk7npx
	j6QkEI0IFBnbLEhkF3bcHcFBTnt3vBCwHO1BDNBxGgNvVO4HLyNsJz8KLT/dRjtcMe8QIFwew6c
	zAWb6ZRUdnUaRYn48J3vcve6mT8To/FI=
X-Gm-Gg: AYBFou0Ru9ooAO2sXrZVCsLjMmTYGkkKVUyMlJd2tyFAi9JWADCFIoDCTut4/IoSB4d
	DTJgp0e7G3eXi9AS+JfurVywnUeD108xHRyalP3QrcYB2pzC+9VvLqWgbLKTFR+Urw/ZVERNBjt
	p0d7F7o7Xi0oFkpH9Sv0PV0ak1wRKvmF+oPV9wLpOW14c9NwwDWkRS/wks/dpDzhE65kHMQ4h+5
	jlUQQShRtRyK28XhgVISkXSoq7HDxDF0BT/gwlecdclW5gAcFAV1b2bSJN+0M3xEtbrcbUEErR+
	tkhWglD6B0Gyi2wMkGsnQz6ZaCsODCPsHPZHSM7L/uRPgf8M2QESMx6tAnpyRuDVkrp/fhiuRyZ
	SDBEVeOw/kH70gbCcKVcK1ydcQAmAS86QTYzaOq4bkZouZ/wGjgZdy4jB
X-Received: by 2002:a05:6402:2105:b0:6ac:5de8:ab5c with SMTP id
 4fb4d7f45d1cf-6b408ea04f0mr627314a12.10.1792564542175; Tue, 20 Oct 2026
 23:35:42 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020173556.632798-1-l.scorcia@gmail.com> <20261020173556.632798-2-l.scorcia@gmail.com>
 <20261021023245.GA3650393-robh@kernel.org>
In-Reply-To: <20261021023245.GA3650393-robh@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 21 Oct 2026 08:35:30 +0200
X-Gm-Features: AclHuK-lIJk49lXRNa98GE7gi3l_Bk4TgNu432VwdO696lfchFDIYtZnsg1U3Dw
Message-ID: <CAORyz2JS1vf7P2cQkzYse_WheB4xYMmywWi6v2pNbeFSkCO9ZA@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Rob Herring <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Or drop the example. Is this one really different enough from the
> existing example(s)?

I am so sorry, there actually was a previous email by Krzystof
Kozlowski where he already asked me to do that and I thought I had
done it!
I'll send out v11 without the example.
