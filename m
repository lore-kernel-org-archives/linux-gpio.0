Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799326;
	b=Bg6oDvPEG/9m/WwKrqekSoVuhNMfST/OPIpnguNqrFFOBAmyzaXTOKlQOK+QuQSSd8ha
	 xcweBR+1yLCpLKmdXTLqB5OTYSFTAB5cb0PliehoTkXMMGSxD0196qHOPGjW5jhIqi5F/
	 e2L1ypFmluCP2m+IcBT6zDO5878YwDmgeJy8vT/DAU+mqIFjp1uKrPQN6DLve2BIlbEf7
	 f1LcsiGmq15QYxzIjg3SzD5E5cjmGfVpbwxztm06KGLb2K2F2IPMmTeA58lsRa9WuY5BU
	 LfmLCZzTcZuIb4fE32KKpQbedmeUb8oDF0sh+cA+Uiw54ZYrQJ3oIs01jLfRvYuEqmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799326;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wQ2DQuZujCN0+Kyae46DtEB2+ByGVe2zWqmti4Oq8FE=;
	b=Xp79v4Ma9mIjO97vVwsQ8d28TfgoHs/24NNAzSnqQqbY7hh9a80c8roMzoQWk0iApKsI
	 zY6PV+ys0Xwr9lTzABxLxvZyUVHhMtUtwOK0N58zzr5mXuKYxmG52QAAMBr0i5XB0vjOR
	 dxx1aKXse0/W5/aGbUXHXoDrGTvd6FLLnPcMJOh6WARyJs+wchZfkfRdmeAz/DunRE1P3
	 jBcDFIMn9cA7x3KX422zYw3MczNTNW5ltrmL7GmO7RxCn1eJ1gpwEW1Pv8iopsqxBgtjt
	 TY5PMDboJ2/6ibnint1ZjbQJkjw2tuQM6qkt5FSCUWW+oC5a7DGtapbp7E3T6ujWWtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bRQT11lp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD400606A335
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bRQT11lp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6805E1F00A15
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793799325;
	bh=wQ2DQuZujCN0+Kyae46DtEB2+ByGVe2zWqmti4Oq8FE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bRQT11lp4jELhMDanVhWxxaqAnDFtBpqKiA3RNTO6IlAYMZ1e0TDHUjPtSiNxfSWM
	 4VbNUC9pQ5SIFXGq/n4ecmQRE0KWMLxjn8CI0bzcAjFvnJKoKNu2FvczmXlDsa+lN8
	 8IK+UKyefYKznvaIYKPuJAsuBWRQX6Ys7B5bH/1nyFyejvXFTIkla/5MxXWdlkfKQ+
	 3jkUMnuQoRpZSp5tqW8LzvHpanWj8769B/BUTQMvwBvSh0OUvddXDDr85sXquvu+NU
	 gkZv+zw2wEI063W6XI4P+F2N50S+UDUS66rqO+wNyL+FPI8cq1iA8oKjXtoMsDAGC2
	 65uQ2i/Mbdtvg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so708582e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 05:35:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxk0CZ91iBCX85EXvqi6EMTzAl9qClcFdXwKPUmgI45BzkgCIgzsIkkkpoHxOLTP9S7Ih9yVn20yNFH@vger.kernel.org
X-Gm-Message-State: APuU4Z/gVdyZshMjJf7wVUSS9A60IJ+1rf/hMOqQMjsdpsq7Dk4e/uPQ
	N9pI4s5X5iCmSGpwtqoe87207NJAhihIjfF6/xSlv59WnXsWxzG8uagSLfN5beXrXwH13hhu+pB
	ZqpfhDGWCAI3+t+7LMudMUwpxpUBko1c=
X-Received: by 2002:a05:6512:31cf:b0:5bf:b96b:bce6 with SMTP id
 2adb3069b0e04-5bfd94ccb81mr5298607e87.0.1793799324268; Wed, 04 Nov 2026
 05:35:24 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024051639.67806-1-olivier@mgcrea.io>
In-Reply-To: <20261024051639.67806-1-olivier@mgcrea.io>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:35:12 +0100
X-Gmail-Original-Message-ID: <CAD++jLkYXYkqk==52CZ1gNPV+eUf+DC8NFjoQuiOcALQ7ip+pQ@mail.gmail.com>
X-Gm-Features: AclHuK9C-S9DBBoaZ5P4feHaKF3nMSq1BJe9p_BTWVci8vcRZ0ncVj6tNlA8_ec
Message-ID: <CAD++jLkYXYkqk==52CZ1gNPV+eUf+DC8NFjoQuiOcALQ7ip+pQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ingenic: Add the X1600's 32 kHz clock output
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 7:17=E2=80=AFAM Olivier Louvignes <olivier@mgcrea.i=
o> wrote:

> PC26's function 0 puts out the RTC's 32 kHz clock. The vendor device
> tree calls that pin setting "rtc32k-enable" (function 5 is its
> "rtc32k-disable"). Add an "rtc32k" group and function for it.
>
> Used on a HiBy R1, whose Bluetooth chip takes it as its sleep clock: on
> a cold boot without it the chip does not answer its reset, with it the
> chip comes up. The clock on the pin was not measured.
>
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>

Patch applied!

Yours,
Linus Walleij
