Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867646;
	b=QytMlBdKrGZgao1SwhyoFZYbqqxLDd2r7naU3opze+nvjxJWoiZ9v8T0VCWCbgCRzMz4
	 RY1w8Ql95vde0RCFSy735qg04vd3wEu7PHcd5HkfH10slQ/633pPX0I46Te1hpOG5oc3p
	 b2xZFKF6NSyUhC5cVEBA5+2qOmv6IyeUOpTPSZbWGaKHa+KTCv6pLOqaXCxhxgOL6l3Oh
	 9rAT+XDMkGAVyhnmeLX3KkQ7v1fcYAGrjN42vfkC9Jxgo7kF72zoLFoVFl94+EvOMM6Dt
	 YlcDXP87KNNhJJPaQ6UuYbZf9o5i3TA/LchcHgiKbdE0VC+nMlegadJj41rg00uoNJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867646;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WxzGpf08LrKpKuRsmQ6LKWumhJfgKnAt6y8cqHphZJc=;
	b=aRcem2ehckdrpDFgdnMc2L+A7zBKFwaj8D2J/q4F9eaW6shiXgnWQ7+YuGUESeLId3e3
	 WsW4eVZsq0ORNXLr6JUKfJiKx6/dOebjxsPvWTfYTR2Oj+VTCUYKbCCOXJZADyffKL29H
	 ppHWdYgcKxWzaJkBlawAI0RhHXh324Y0JCG+9gGo6RQiRNuy0h9U4eUmeSPm5T9Ks7PjY
	 bhxzTQWu5D1iimU81v+FaCw3Y9qbAJbIXVd+rgyA/i+7axIyHes9WEBUDx0jN9oalasBU
	 6b/1Vwh5pX38Y1ENnhwaqbqf+7CKBGIKBrMRXg9JD2b3tjGXurA1B4cmnMt3XacjgKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JG5KPvPk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C51606A32E
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JG5KPvPk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E735B1F00919
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793867645;
	bh=WxzGpf08LrKpKuRsmQ6LKWumhJfgKnAt6y8cqHphZJc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JG5KPvPkng42jHkqMKVIBRVkFVqKE2AMjohnp1beRk6vX4Un6r/HuIQoeguswBTmB
	 iNzTNSS8Uxb/JxWPJEuZGDQaAsSim91IVg3XEkRfogrvLVT1eEFGBx2yVPFKMbr3Fi
	 OC3AQpTc+gkRJpXFkmKxFUjhGEDKBU/lIhHaz4tspPMfad6RJAvcCfyjvvqo48O4ym
	 w8Oeos4oNw/FIPS80b0KEr+oG7ogMRPbeu/D6fABJJjgWP7s/LdG3ARdQlGP7+mYS+
	 rceOhIE4MXHy9sHF08vyqIM+82Ds9SEqt9E2UbDOzxXzCPDg1sVI6LijdHP+4CIV8y
	 GM0z3YFddb/Eg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bfc9154ceaso1248197e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 00:34:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzFaag2aADrPg/QmWxWX2Ev0Hc79Ga5Co0rQthHYwskjsTp0Xm5o4pnitxNqkHgfqemtbsjaTjhjiv6@vger.kernel.org
X-Gm-Message-State: APuU4Z/2vRiYYrBeh7bfUfUfNImuWSVL53FJzOcmtp5bIU6OptZp12Of
	Q6ZBS+nMuZH4hOWzn0RE9RL1ojAaZkrlJwMrpf0iHBVOw/48BCPR/IXMf7FFWWrEPDuQTbE7qok
	5z7KY7hcDyIi3pTq/qC5/Lr6NR5/DCoE=
X-Received: by 2002:a05:6512:12cf:b0:5b8:f81b:dfea with SMTP id
 2adb3069b0e04-5bfd95892f8mr5387682e87.62.1793867644786; Thu, 05 Nov 2026
 00:34:04 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101100030.15744-1-surajsonawane0215@gmail.com>
In-Reply-To: <20261101100030.15744-1-surajsonawane0215@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:33:51 +0100
X-Gmail-Original-Message-ID: <CAD++jLkyETpvCxbvcvSSZ4_ZF6vt20VrLfkVsskibZ3QpceMuQ@mail.gmail.com>
X-Gm-Features: AclHuK9s22LU3ZgfcLC37072WMp1FnHaL0iX5l5vecmBSPJ2_rBODkzGQKAE7xo
Message-ID: <CAD++jLkyETpvCxbvcvSSZ4_ZF6vt20VrLfkVsskibZ3QpceMuQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function
To: Suraj Sonawane <surajsonawane0215@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 11:04=E2=80=AFAM Suraj Sonawane
<surajsonawane0215@gmail.com> wrote:

> LPASS LPI gpio5 can mux EXT_MCLK1_C, but that function slot is left
> unnamed, so a device tree cannot select it. SC8280XP already names the
> same slot ext_mclk1_c.
>
> Name the slot on SC7280 and assign it to gpio5. The third slot stays
> empty; on SC8280XP it is qua_mi2s_data.
>
> This file also provides the SM8350 LPASS LPI driver, which uses the
> same pin table, so the function becomes available on SM8350 as well.
>
> Tested on the Vicharak Axon Mini (QCS6490): selecting this mux slot
> drives the codec master clock, and ES8388 playback and headset capture
> work. Not tested on SM8350.
>
> Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>

I'll wait for a v2 which comes with a DT binding patch.

Yours,
Linus Walleij
