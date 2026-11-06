Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972861;
	b=viXQEIPgBdCpvXdWHsrUyyhVSKt4ayzKMTMff2jotkaZgOdUaMiHPGMwkPbubwX5EqP6
	 GPL7X+71CkoRGg/iJXnLoq2Es24B57nK7C7UNS+o1oviJxpiRqU130/QH2shq8+YxQl51
	 XLVSx5FKqP2TBneAcv4I26D0/BFEjo8JTqD5FvAgmDe4bNHraSYN1Z5Uaxhnab1N2kCay
	 3e34UKp8SqbnNySfNAoQXAQhF8+yxp5fWnPEcFq1XjtGgj7AE/7KEszJlxVl7PiZB0ny8
	 Nx9rUnb4hB3OgCAvy2/6oNoXxkwNf1R0pBfoJz2CnzrnkGnY8NiMBxU+M/bRJUbzHqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972861;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4vVL1EiPkJtSj0Q5/MEZPPVQTmsj+iOOThXSePIk96o=;
	b=wRqUTOJMakl/XSLSV2YKhF+PdBTC1bJBOGYFUNeuXDn/EtbzP6rGpTscdDfGZ9EeY/3c
	 jSg8SAlFczGypYFYjpyvQx6suJk4xp9sc46qZln0vnnUzEzbnKoT539S8jzlz7VF8EoLe
	 FN/rvNVzdtAwuPcKpj/iHhl8YBvj3DRmPCtETcKl0VIvuO9ykYyosmG2T+6fcIW6i+KZ2
	 nH2yHPKHHgmtPNzQH3ubLPDNNKKvWbjLjM/rIBi2FAv2bDk3CToeh3EtO/5z0IS3nSqXS
	 ZLxomiJgMJYnrHJhzrXMHuwa8HyXMsUH7pOCDzWKQqpGPdGndyOjfZFPYCd8HXjaAVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hq0Bqfj2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB4E606A32D
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 13:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hq0Bqfj2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B97CD1F008A2
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 13:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793972860;
	bh=4vVL1EiPkJtSj0Q5/MEZPPVQTmsj+iOOThXSePIk96o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hq0Bqfj2UyhLMuTH5ekszeM/i7rugVYBcjwLWOQjWb5rKs5SSOkLzbvQOxdY/lWjf
	 qmNzTDIjow4/PpnuRv/OABiVlxSnKeMxeTZVMaknC3ZUax/bvINmgAKMlNidIiH88P
	 LGFWmh2WsKNsJl3zUmLa7jn/ECIt41Ur+LHGhk2bHnrozUx+tOpVNYzIcpCPuGVDzD
	 MIPAZVI/7RAaLoWyUhNo4XrDTQl55uGWDWrzWcfy+KQleJK//ZytW9nn55oa6HvI4R
	 tN5Xv/Mno20UNLkbF4V6WTbFWJqRwU16ONj5edIc9D+TkD83sv8Iy3jTTW6x45cCp0
	 O9ZoAgM2DqvwQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bff8fc7cf2so711859e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 05:47:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxopOXpwehn73tEzCUy7bqSG5jqW0xhzaVTGfQ363AmcnaplHw1Jnxu9u3wb8qwbi3jRNCbr2W1aJYC@vger.kernel.org
X-Gm-Message-State: APuU4Z/eVQBcGsmjCstgSR5dNzENeRWXhrtTWHZ8m2MF6kjg5gGP+OFX
	52NDOPvco3KGljD9YcXdoxMvPNN4PwpIJhbw5rWHLm0/p5ET3mh1FiTM3BdJecttlCTtQeZU3wk
	HDtCbdnvXdjV1ajHP059gjWMT3of12kg=
X-Received: by 2002:a05:6512:3b11:b0:5bf:d6f5:f966 with SMTP id
 2adb3069b0e04-5c003adf1ecmr764970e87.47.1793972859536; Fri, 06 Nov 2026
 05:47:39 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103213002.1673560-1-lee@kernel.org> <20261103213002.1673560-8-lee@kernel.org>
 <CAD++jLmF0U6ehFSuauqKDQiZRkuUnqpbZd--v2aqF2YZQF=HwA@mail.gmail.com> <5c414196f5e34bfeb7a94714e5542a72@realtek.com>
In-Reply-To: <5c414196f5e34bfeb7a94714e5542a72@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:47:27 +0100
X-Gmail-Original-Message-ID: <CAD++jLmBht_EauPV1ggkw_pnydVbCTHk7s_dyHPN6OA_zXOKvg@mail.gmail.com>
X-Gm-Features: AclHuK-g1F9N5vtbEMFGavDY124RqKgGGFWqEsXHGpoz6PIuenneZBMpw1y5QLU
Message-ID: <CAD++jLmBht_EauPV1ggkw_pnydVbCTHk7s_dyHPN6OA_zXOKvg@mail.gmail.com>
Subject: Re: [PATCH 07/10] pinctrl: realtek: Initialise omitted offset fields
 to NA in config macros
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: Lee Jones <lee@kernel.org>, =?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.com>, 
	=?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 3:49=E2=80=AFAM Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=
=90=9B]
<eleanor.lin@realtek.com> wrote:

> Thanks for applying this patch. Just a quick heads-up on the merged commi=
t [1]:
>
> 1. The first Fixes tag kept the original 'dcc9334435b0' instead of the co=
rrected
> 'e99ce78030db' I suggested.

I went in and fixed it up.

> 2. Branch: It was applied to 'for-next' instead of 'fixes'. Just checking=
 if
> this was intended.

Yes Lee reached out to me on IRC and asked that the paches be queued
for-next as nonurgent fixes.

Yours,
Linus Walleij
