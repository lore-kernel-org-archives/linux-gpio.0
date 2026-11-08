Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794165948;
	b=UJSi2N2q0bMAhekmaxtiO2fRFZzVDgEOOoUXpWdk6IEGQ/ntVnNrW9IqRgOpQUoVuj1h
	 DpKNG4le2wc5+I9XXNpJyfA1l6eBhcYIbSPJ1S/63immuh91/N4Uy2U4Bv7wQwV6yswa+
	 fVeR/dF+rrxaEFIao+M/gYpDEqaefYbfDDIxUHSiKFQcGCdPinA9OQTKluT9E5oHKbJV8
	 PtNHzlOV82tA4kgrTGeSUXurYVoRPkpJ6LBm6Ie2MeNLFL0+lJ3M1FX1XmaI4ZJWEeL7n
	 JDcMVOgAYu2PDNQGdNaiT6OvQ0/eP9/jCzBiGyRluDj9PyIH/YKFoXg5N1diDFTBtQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:Mime-Version:
	 Content-Transfer-Encoding:X-Mailer:References:In-Reply-To;
	bh=9TFlHze0xZHVHECFNAToGkMpUA7NwrSzUebXukclDxc=;
	b=4b+f0OG24hLItHLDtNzbhJttDx5EVwfVy3WTeax/3HQHb3SwSS7fp4nNIZ6F4+b0UZ1K
	 duBpBGN5fHqzsa8zabguNxYoGfRWtMqP+SgivmcHiUuE17rxFjnL68ZjvRSq3BhR4tDGh
	 dE2V9jXx/6dHklWnvIf64NArw03S/9JkAsHuGibGS4diz540nrz7kkqy2zYBWEmIP8JxF
	 0x7rJRipCnbELu1pz0U/zEvvOnW44DfDeZc8TbpJGrbFzUIQxhHDcRQ9o5MziGaFDMZJY
	 UPzw78ADUBnqwlo/6rZ4owlQqYKlSfq0uDPF0xmkmk749klz8wqYuctGcmTa6NFjOtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSiv4TuA;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B68606A322
	for <linux-gpio@vger.kernel.org>; Sun,  8 Nov 2026 19:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0B68606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSiv4TuA
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c49b431f022so38721766b.1
        for <linux-gpio@vger.kernel.org>; Sun, 08 Nov 2026 11:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794165946; x=1794770746; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TFlHze0xZHVHECFNAToGkMpUA7NwrSzUebXukclDxc=;
        b=WSiv4TuApj5w4HZ50fhfgNst1yV6yzNn/XhgbsQuSgTm0D/HVCH4udeCvKUww6E+U0
         D3N6gs7Usyy2COHjh1RqeQGWpr2skW+hn7epsen7I7xrqYqFTEdbosd+1UWyeCKmRshx
         8JPu6ci7480u9eMj2XPPDmzzJcdd5rsQR33Z5a8L0no+54MDf6arQnvG6cwRzKOyQ/wf
         8VnQG0sN7CnI5yvoG67OJ7bwbiRqH/j7Kqt3StBXm6UkhPd7HulEHPLx40qWowz+IA7y
         Yj9eB5wyBSFmMzhXc2iYzgYS4Qh0XzHhq7n9ToLj7gD0BpKOWW80IVuoX8DQebPToFGZ
         mPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165946; x=1794770746;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9TFlHze0xZHVHECFNAToGkMpUA7NwrSzUebXukclDxc=;
        b=qSVpH77sl5BwTz9f/7bKA7ApXiA3wCkok3CGjR79EvWOzdbJEYtWvN7e73idDvMHk7
         1oaHH9uxg5eSyhywH48klM1e4iMsndJIzDzVN4+bg+j2yUlWRaNIESGUCmEdWp5zrFmg
         S78ccxdxKW5l/HWZe+NOKKceD+i+bvtsRaCepHyl/dTQ0J1vO0LClec5Fgh1h/TXVYPu
         9RvVpT8MKKoDSNaToLQipSoeRlyzobU6wpY0pdny+2dgTE5EE8+gPTnSzqJ7eS6a+B52
         7oSj+e2+gO5Z6speWvMiIXzplpWJLEIqH4CkqrYGAwFITV3CCjwGd5Zfp7DhipqgLgWh
         891w==
X-Forwarded-Encrypted: i=1; AL+hErFrqc39nwCBk73Rby5VYPlxb0m/0iwVq3zipGe7+J3Q4XG9Quf92V3er+T2AgYv5MfZHsahVg/VoyeY@vger.kernel.org
X-Gm-Message-State: APuU4Z+qZiEAeBbb2xU6iWbAVXv2IvVPnRxSY+gZrJFPqeVm+4p1WAwA
	HSE0YVPBRufg8HrR6/ME4QA4FENQUDyzTUdCErbU7gzUj2akHWMEwFm3
X-Gm-Gg: AYBFou0wBKentuKoLmuBWXXlzppe9Rz7A0gfcZHcYqWGPnb1V4WnHyU+4soXfJdtVwu
	9eCoZRU2doJOC8hH5qHVjiEwdRXsNtXQcQPwPJt/fGZtQtpV8/Qen9vUqzw/pcq4uSH+SErm+JJ
	jCoQa6DQBsySlddNrpNNQuBCtdfXp1LX3hXpRQQp1oYUCdkm2zoN/783fYh9X2GXtQil89o1wab
	N8RzuxOmd62HsYybcqKFyb87244rVV7EN7ufXpBJHibkT+n8OMdMA++R9IUtcOZlsFxJ/a5au/+
	BV/JSsFqM9ShUS9CxsuA6HT1UhT/1SF7edBzYdv32o59GYYqiZNOuFNzdXhoTq9rwM7eKfnVsGu
	CWBBoTiuu00go01nr9zK+B8xDL/nCGzLb2AdBvMQLWumaN9YfKC/q0TK3agtcbmTX3vr1ujdqnD
	yYk2Qpgw6GBV8PDUGQQ8jThc00h0j2DA1FlLQJ1ZZnoOAnbmszKqRwyYGzlHPqWsagM0Nl9Wkml
	el0hcyj8BNUBEQ+108vxnAIDHvCkYTeO4p3LIJYoUXb4p3lf+C85w3ERsWmtQ5A8BKh4bDMzpTc
	IyQ/GPe0J6HG+uQSXQfLe/Rxse5dlYkdyIbfd/FaUu5xFEoZqxuk0xpt
X-Received: by 2002:a17:906:794f:b0:c34:83c0:b92b with SMTP id a640c23a62f3a-c4d6d522af9mr142299866b.23.1794165946088;
        Sun, 08 Nov 2026 11:25:46 -0800 (PST)
Received: from localhost ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a998a5asm81036666b.72.2026.11.08.11.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 11:25:45 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Nov 2026 22:25:41 +0300
Message-Id: <DMQ2QUT58NN6.10MAQ6P7FML2K@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
Cc: "Linus Walleij" <linusw@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Sean Wang" <sean.wang@kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Add support for MT6895 pinctrl
From: "Alexander Letuchiy" <asalde.le1@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com>
 <20261108-pinctrl-mt6895-v1-2-f704c443b31a@gmail.com>
 <sashiko-outbox-203909@kernel.org>
In-Reply-To: <sashiko-outbox-203909@kernel.org>

On Sun Nov 8, 2026 at 9:39 PM MSK, sashiko-bot wrote:
> [Severity: Medium]
> Can mtk_pinconf_bias_get_combo() and mtk_pinconf_bias_set_combo() read
> past the end of mt6895_pull_type[]?

Right, mtk_pinconf_get() reaches pull_type[] for the virtual EINT pins
227-246 via debugfs pinconf-pins. I will pad mt6895_pull_type[] with
zero entries in v2.
