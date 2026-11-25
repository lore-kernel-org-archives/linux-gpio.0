Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631669;
	b=JG3EIo0uYt55t1gwLdxfPso5w5FAOzutsikYW+n8+yRbDwBnUhF6vgueu2VZ2tnd+6em
	 /Z3iJ7xLetfb+5+ilcU3DMby/TcF3S/KxkYs6SGz3OCpwsoN0qj+NYt2ts8tTVak53luP
	 9o2SLqW6UPn+wiya2Q6wwWV5ATsUyXXNo2GdAbKPPYVn1o8XJKYfnVqGsP16c16sGW2jO
	 YJNQcixkeu/eZpLP7e3JfNoppCDawdIzuPDmymLR4o6Nzdxp3eYHKKRxkqsggN8Mxy85Q
	 c3C8SqzGYycPO3Z4Q2hnRHKpoeZoQhj1Zg1y9zMp76J6kzedsDYfLdU6o/8mRYgJuRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631669;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=huzeBJvajrnFnGcmiNNvCrPUFe7LS9oLcis6HMj9a6w=;
	b=4Osd4aenDVvi7CxsYXzbzFNu8T/92XBnE4MFaWkQjr7FlOlrj/O2CRimpzlrqlXQ8VnX
	 /8McEqnuyCQtTCCekIchtOu6msNsWnPueWNZOevN2EFlm/cSNT8FyRTmX2/zZ6fSbvCo+
	 1kHXdD75YKiCw/b8iNdKWntKwDJF0UDQRMC1qySYM9mhOew3QCNRtU4zLY2dLlqSK92G/
	 Ta5dd90EZ/s8hml07TCNTntrTRkzicuy7gU4mwoT7e7PJyH+tZlnWVRoKKDerBkoRFHR8
	 mFzwcKriyrAB+wZRw95zO5S82Ls66/Ur+MkTrTMNxslv7Wj7kUl6VO+Iz2tCJKeL1mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WvV6eomv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7E1606A31E
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 18:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WvV6eomv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586961F00ACF
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 18:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795631669;
	bh=huzeBJvajrnFnGcmiNNvCrPUFe7LS9oLcis6HMj9a6w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WvV6eomvshfBYaxVP2E8vJChWGUgUidWuiSAraGC7pphvYd8gXCkxMI4XRKG8I6nC
	 SoGSAF+WYK5TfdUjHraRd4177HXaJDE13ty/oPYNDruB4ogn7OXoxMoLf1Wy1f7x/j
	 x+x3S/QOlDNzQpWzsl1Z/KE2dLjdblYlEPTUjv4WdJLrGoXsJ1ftnX59q5xP7rs2/5
	 r1KP+qYwD4Dp6Vors0XSU9/uH2SRpU+Mr+mMd2kTRlf/3oQUmZ2hETFGmzC1XteJeX
	 X6eRM6gFQL+WHKJlXficHxuZ47FMdanDt2/0RM6V4wauUzlCOPEtg/NgQ/p0YWgbbl
	 rkGAgMzgjYNQw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be47aa555cso7703293e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:34:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG1IWCtS09updz10cXD0MbjMiLSHfNC0U7THvN5YFUqb0+qmvt0Dzj8mjXXMjCqqz+AMAtiLRAUw1MX@vger.kernel.org
X-Gm-Message-State: APuU4Z9LBguzMXYlAsfSdPF73xRu9yu5L5NTrzQnmYaq6hgFfAfX6Uzg
	xxHVoJs4Gl2qeOl2uqwiOztfuWai4Z6eOVu7/x3auaZydyPx1+jBSDv7saaur7cm7VOfnTNGyex
	P/1XaJSSvWXoUGoiu42BKyytZNQp5Yhc=
X-Received: by 2002:a05:6512:3a89:b0:5bf:a467:32a6 with SMTP id
 2adb3069b0e04-5c1bc7fbf45mr5538912e87.39.1795631668071; Wed, 25 Nov 2026
 10:34:28 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119204748.2558209-1-lee@kernel.org> <20261119204748.2558209-3-lee@kernel.org>
In-Reply-To: <20261119204748.2558209-3-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:34:16 +0100
X-Gmail-Original-Message-ID: <CAD++jLmaHrHeApcosC5SXZtTvFCw9+R0of4z9Z1XF2c0R1=f7w@mail.gmail.com>
X-Gm-Features: Aa3M54rQei-ItW5tY_E33jyA6MyDsSvvBdzkAVwW1NF7MU63WgvrrqmNxIHY0gY
Message-ID: <CAD++jLmaHrHeApcosC5SXZtTvFCw9+R0of4z9Z1XF2c0R1=f7w@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] pinctrl: ingenic: Fix element type of
 x1600_sfc_funcs array
To: Lee Jones <lee@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>, Olivier Louvignes <olivier@mgcrea.io>, 
	Paul Boddie <paul@boddie.org.uk>, zhouyanjie@wanyeetech.com, 
	"H. Nikolaus Schaller" <hns@goldelico.com>, Andreas Kemnade <andreas@kemnade.info>, linux-mips@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:48=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> ingenic_pinmux_set_mux() treats grp->data as a u8 array of per-pin mux
> modes (u8 *pin_modes =3D grp->data), and every other *_funcs array in the
> Ingenic pinctrl driver is declared as u8[].  Because x1600_sfc_funcs[]
> was declared as int[], indexing pin_modes[0..6] reads the first seven
> bytes of the int array (0, 0, 0, 0, 0, 0, 0) instead of reading mode 2
> for the seventh pin.
>
> Change the element type of x1600_sfc_funcs[] from int to u8.
>
> Fixes: 4da56f9c6f14 ("pinctrl: ingenic: add x1600 support")
> Closes: https://sashiko.dev/#/bug/linux-5dccd0ae-9450-440a-87d0-44cc86d1a=
f45
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Patch applied!

Yours,
Linus Walleij
