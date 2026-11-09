Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794257187;
	b=mSHpH7si0REILnSenUyb4lvCiQyDJ/gwexpeo6/rkZhAJr7YkR6BixeDRw9TKUG4ejs8
	 j41V+dGvpX2A3fij23bPIrm8w2YnLJa8vHqPdhLX/g4FrPGR3EjY2E3kttgpGFCklH1+q
	 2x2MaXAKi/HfYHJ2pUr73erwXAWm2eY0BBM8mD4d2u+t2LCZ/C5wH/QkobYAOBFgxX7ee
	 z+cwp5qFwM+g5m67ERGhqmSWwbzTOkLA3egGoYK4USbfVLT40UYT4YU0oKyv8dkQ8SxXB
	 LTgVrbhTtTMYpyTJc+UDh3PiX7QjqDkHBnVBAwwQMQ+rwQdRoORFiq3N4Z2a1NR0XGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794257187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PO36dFoBW7yl7SqTzC8Yly7dBYk4JKpR4W6jyTZ5PPA=;
	b=j8nbbXEhNur2h7Kh/ZaE5DP0vYzy+mOPoYya8jybgKHQP3WUrjehxSxhGSuVyh0DUEs8
	 R19HPZf2wxHomJtElrvre84d3H/BAthghHA2/S4dyE8Hs6Mmg6WtFePlDExXHRAAx6weI
	 gKykgwyVWutx/UWKtay2yZGnRqecMkrrlerTD5TWWmuPbGNSDjG880e63Wmt1sLWZ0/06
	 A8uohl2cQIRLDMFn51qurpUnPOaCyI4HHsURjzCbRUz1xk6XaNbu9HsuKijQaz/J8IKfV
	 5V3TevihcdpGGySLZyrU258jPX5BldoJCC7NIAJuIuJoK1rcMvLo9ByB6WEzFYwYmbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NCq+Izyi;
	arc=fail smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D667A606A326
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 20:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D667A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NCq+Izyi
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b5669a5100so1796744a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 12:46:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794257185; cv=none;
        d=google.com; s=arc-20260327;
        b=ZquCDnaQahneLogihv0ZGTi9xmhac/PRZUbKN9s/PQEJ9kdYor4/O9AMK8myFBHXku
         3XHGYOTXfbm0yFGnl41Tdafbgb744cYEPrvktEinuCjINgOrHcxks4RE1dS9XiX4ch5L
         vtKkSvl01IvZ1DJn02LOrL5Hot4quAVSdRur4HZpGmTojjElNc+ugSkgf0aEcNyxpDkZ
         gIg45W4ugH20/7AGhElMcaFpzZJOHSVNaLL0lYdVz0oEfhdJw0KiVmQGUhvRGQyOdnX3
         /lL+9EKNeAIqPtc+rIAxSXHTmSkQLtg4dB/6gf1b7Uwoxla31z7DHKuD+SkvmhW2/MSx
         m3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PO36dFoBW7yl7SqTzC8Yly7dBYk4JKpR4W6jyTZ5PPA=;
        fh=e3bmYH/PCw9NC7kD51BsA9pszBqQzdjz6kGZ+Fouyz4=;
        b=j7CFNFJxPoUst86ixMWyIE+adFBfCCmhPygGH6/Rc3cXtUcjbKQ/bqfXW0DzYeq5mf
         ZkwyW8o9Ho+zKscKIc3a3VM3CBzaCbU2zPd1xXYWkcUY6urCgnfVyx2jVPg7jGMxqPWY
         nx937lXt7KlHBnZ0E/umP6WpU7I3g8YlukYUJmePR0xRq7Zl4tIPUdxyOipiLmiW/C37
         OFCbYbZQO3T7DqRkhM2CdkPFUAhyO0Qa6KVGSik8m07kat0indjkJRH9wuTp5Xx0iXaA
         QeVSB4r0dWBgPazdrEZs8xkKqaTE4K5E1roJRzNKLTFDIP4DaVd4fwrGmSsxg3U5exfU
         5PMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794257185; x=1794861985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PO36dFoBW7yl7SqTzC8Yly7dBYk4JKpR4W6jyTZ5PPA=;
        b=NCq+IzyiFJIoXBvrfXgpN4m1NTtx6utKbDHhw0CDtvmkxZpIDkhkEAu17BXroc1qQ3
         Dwo2/g9HufKpEVE7+pcuHvSObjnHu2gvVQfvbqEfpf0QbDwr9WYZsiAJWIol4RENYkP6
         l9wjFAnwSfddP5bn2BpxODAComGPKHSdo/Hq5IVSJ6KLBKJi1WQXUndr3ynxhKQQnmiv
         Qqn5geCSciIz1JNiRPz0EcnEdxwU+bcDbVfxU9fBtbymrUn0sOmyrFqRFELOXUYDOKEG
         TIr4fo4nliYGOT5MEF3xuUI2aExKR5p35lcTfFPPWdN5BfOU60BLKdjrDhxK8wSsSC3A
         ZDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794257185; x=1794861985;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PO36dFoBW7yl7SqTzC8Yly7dBYk4JKpR4W6jyTZ5PPA=;
        b=Xv+Esv5W+umnicJithc0eqjh9SdOFy/ozLp1zvklYAQyrMcAK479jh5hOZ595RnIeX
         fef5PgXlbrM7Y4qgHgAFXc9zaeo4CMqPnOBQYf/qZAP3vuzR6PDUHhOBDGiEsY/1DT2G
         Ih9AF9Fe24yfjX3yrcelSh8WpnoiXfww4QiqGqMmZ86GoVI8S343yqxHLy6QAJXDRQ+0
         +RHNBq7E6ZDE2NI+I+2KJYBvl8GTFzoxkn8035/OhW4COUt1qd5MKmCtJigofrpZf0mS
         ESSZYx9NfG/gU9cI7L6A4a3VsLzlpzzt4iobyf++iRWaJolPLi0s37AQW+5DoHm3W/ta
         pNSQ==
X-Forwarded-Encrypted: i=1; AL+hErHb/XD5SZUjQKm386CB9TKuJ56WA8Y4aDkxcD0UypdOLfAKHeaAPCRxEvOFSfPYX03CjiLJ8DHVHQVM@vger.kernel.org
X-Gm-Message-State: APuU4Z/wYYgw2E30W/Fq22x0YOIWOttxPTYQCvJUXzog20u8QXxIhLk3
	UDvvrKPzF/s2F4jKkxytvynG1vJGaV7cybYMk3Szsn8EwixcTepc/iDdVeTT5rhpcj27cYlYJBC
	aTImqIqXq9bZwb85EeDs8ht1sFpI/6lE=
X-Gm-Gg: AYBFou0mPPtQLYDVIqzs3dGkVZ9tAClWhA3ZoqyPa7I8Ct2CcV5aP6XZX55Ro9sTnZR
	wzGKOivtSKMolCE5l55aYMZh62y62F3aWdBVzevBtTu0VhM1C8molVk8TZSnaPQ5mDN17wM5j09
	gQINGKkbLNo+qCPw1g1dUB4shfmHrV4d5MBxzvPGZYAqn+OXuLaKNOMvktlQC7GduVNklMPOAVH
	6/blyyqi7PuqFoHWc5RYFQBm5YYNbQtx1Gsnk5j+Gmjk7s+4EIy6uhRWOi96anN8/KNZf63spGP
	ZWVly2uVFTMEzSIda/5SlpshNLHgRpQa8hfH1QrSaWSULzjEX56iVUNqfeOr9zasadYXMNH3b/W
	LajXPWJv7TVh1xO5NuwCxNaKQ05a2GHc2JQ3rzEft92dML9LP+KbgkVMTxp8XXtrfCcYhjzcQ4W
	91+EM/fbPUfPCj+SFqlEB26lgw8e84g/JPQWcDSzr9W9XhhVFrmWLpkqgsW9SbypRDEYH+XK7Q2
	k+bwQJgpDeRc2gxLmmo36fZoRVnT1nOGomi5qnvH90lNADb1g==
X-Received: by 2002:a05:6402:13ca:b0:6b7:164a:7228 with SMTP id
 4fb4d7f45d1cf-6b756b0fab9mr580476a12.41.1794257185052; Mon, 09 Nov 2026
 12:46:25 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104215959.24035-1-rosenp@gmail.com> <20261104215959.24035-6-rosenp@gmail.com>
 <cw32kfja4uifaotvodb7cfxrpzawt4zqcuzf4k3hvjgxwutxqu@gyaayjuyq3j4> <2d9d1da9-0d2e-461b-9c9a-eaf3dc512035@kernel.org>
In-Reply-To: <2d9d1da9-0d2e-461b-9c9a-eaf3dc512035@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 9 Nov 2026 12:46:13 -0800
X-Gm-Features: AclHuK8yAS4r-QfhKzcFNAvzQn_YgnIQjLvWa2Szkx8dOWqMjuJua69E1x63B8k
Message-ID: <CAKxU2N-oA_EQ-nC4y6E+Y1XCaai_QNmicobvJZ03mRRDikZ5RA@mail.gmail.com>
Subject: Re: [PATCH 5/5] gpio: ppc44x: tidy up includes and probe
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 3:30=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek@kern=
el.org> wrote:
>
> Hello Bart,
>
> On 2026-11-09 10:01, Bartosz Golaszewski wrote:
> >>  static const struct of_device_id ppc44x_gpio_match[] =3D {
> >> -    {
> >> -            .compatible =3D "ibm,ppc4xx-gpio",
> >> -    },
> >> +    { .compatible =3D "ibm,ppc4xx-gpio" },
> >>      {},
> >
> > Uwe: is this in line with your recent cleanups?
> The change is fine, I'd appreciate to also do
>
> -       {},
> +       { }
>
> at the same time.
{} was done by clang-format IIRC.
>
> Best regards
> Uwe
