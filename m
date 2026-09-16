Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA24489FAE
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 13:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564628; cv=none; b=q1n986Snzw349h3sPb5dTSYTgoWUGo23K1ZydGPeWuE5MhnAGM+5ziB3HCsJehd+UBN6omh2IL/tt4pbofcSBJr1fTXmsLVq97+tVx077BcYZ4aQlFtc0k1rSTS1p9d5s/jPdp0DohVhyKCbLE/ctW2tkLRhxrgrWjMXSNI/njQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564628; c=relaxed/simple;
	bh=+kyCv6bJNSWwBrYebpLS4iOUPj8BX1dz4Wo/hlQuDvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UYKHn/XsfaRL+bXmMLjY4A4B7xtQ2ZZ6o2S/T6znieeuWCMP3FiXFw6aBnsfM1r4anzUyDIfGvRhYpLrfUCJWIEs0A4kBplcBrmGYmo6mSsTv5ar7npzF6m94Hc6MJUhwHfKenJQAVlc1JBPuZBkCn/y4ZUmOBMk2OMPh22qg/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O31hSwe9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O31hSwe9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 966B51F000FF
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 13:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789564626;
	bh=+kyCv6bJNSWwBrYebpLS4iOUPj8BX1dz4Wo/hlQuDvw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O31hSwe9PZ6czSgEapHj5kQm+vZZ8IELen3TpFZoE1Qe3is37POqQC/nNo6lb++lp
	 f/QIbJ21UrezQmOs0jP4bdVuQbz2zjBIflKtTiQ+bJ9pP5/O8b6wwrRNIPI1eNSCiZ
	 CWBuprmfAFM8Rn+J0ap0daSLFW+Aac67uOObKCusCaIkPHAHp+pwCcapkHllhTX2vQ
	 sUMZ9UphJHj51JdsoHIPxqkO8128wWapY8yypwm8IQtDMsZS0W6JM63xA/3eAwT9zT
	 i5cArYucvZYmY00nmtAzSnvdYFANI7zsDsHxW7+NYOK9Mn5pYuoW5b8FrpbsYY/97E
	 cj//8NotDImoQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f15b79so871161e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 06:17:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx6I4XdSiPtCg4vRHAjl5EhVKR6ntgnI0iaUbfqQI2WdZjy+oJmaefU/yzf4PA7jZeiVci4b3AJa9Fr@vger.kernel.org
X-Gm-Message-State: AFuF++ns3RWn+oIc13n529MkMF9Q1YlOqyU4Uuv6wXiv0mIMu00m4b7B
	H3dXl0z8vUjDi4SE0wrqVfdJLaEUuzBms5IVl3kgf2xuiq32DpFi9l70HYsE9R2zSGQJwFTrDLH
	k1oy3ZLiFRaS4F3mi4zs96B5BEah3730=
X-Received: by 2002:ac2:51ca:0:b0:5b6:19c9:d7b7 with SMTP id
 2adb3069b0e04-5b8b6654a6emr1504278e87.26.1789564625362; Wed, 16 Sep 2026
 06:17:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-ad7768-gpio-v6-0-4254ef6c9b38@analog.com> <20260903-ad7768-gpio-v6-2-4254ef6c9b38@analog.com>
In-Reply-To: <20260903-ad7768-gpio-v6-2-4254ef6c9b38@analog.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 15:16:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLkBnfBn9N7rczP5sRktoi9Mf1dqT7ji+dw8hACHHffPHg@mail.gmail.com>
X-Gm-Features: AcwNN1Vj-JRJZ0Qz3UU00kAP8Xx7SzY2VVnqCz5HLqBcAKmTyA5dpswVrtBEXyM
Message-ID: <CAD++jLkBnfBn9N7rczP5sRktoi9Mf1dqT7ji+dw8hACHHffPHg@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] gpio: regmap: Add optional runtime PM support
To: Janani Sunil <janani.sunil@analog.com>
Cc: Michael Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Janani Sunil <jananisunil.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 2:01=E2=80=AFPM Janani Sunil <janani.sunil@analog.co=
m> wrote:

> Some gpio-regmap consumers share their regmap with a parent device that
> may be runtime suspended. GPIO register accesses must resume that device
> first.
>
> Add an optional pm_dev field and acquire it before register translation
> or access. Release it using runtime autosuspend after each operation.
> Keep the device active across the complete direction-output sequence and
> propagate failure when setting the initial output value.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
