Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025940;
	b=UHwIKFZydwHfWBGhLUqKw/EM3BQXfXpHt6kym7sKLKt5JvIbSPddI5ggb+GAvw/c3AJz
	 PfmnxKiTh2TOC38FmuXnERA15bvFgPLFXm5bOVb+uDaTEY/8ir8I5w5b4iATS8KswqIs1
	 RFhQgZMbRp6x3de/SPckYhUoir3BSIID98eeiIqxsRevrrUZRO1l2ZmblIt7gOYO8nm5J
	 olaBtzddcFqRNGuL55D46iHT1S+26OJyxmeNDKZBKHym5L+8sH5g+DsM7e+h+ywXELliy
	 MDOlhH67CLYVhsxRVlVci8BdHy3kHZC67oqf/7KPNWB7w5zdW0T7HZoW+7ZSLYPUnBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025940;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mTjGPBEegQRgp+TkjbZALo5DNvb5ic4MusjOWTiPzo8=;
	b=qXBbV3tcqFNx0rfLCT+O9AKOmmFht6SuOhD9sVbZ1b0scF+UkpD3n3v6vPZEJWdTbyl6
	 I8zgHn7QLJ3j8SWXVhT/QggA6W/4rDAxr6CxXOi0KIjxyyRpDjSQftoA2/sw1Csjq8AZU
	 YtXD4CSOmSMRQQhG3L7Ym2rFYXvKCw1di/+XCOzjYbJd+wg1MdULeWaHUT9z6vZEDWOjs
	 X8vXyHDeC0hzkOM/C8aXLJAGqouWjseU4ecsCfpSADd3QTU9FIIv/l8erArs2h4pT8Ycr
	 IbMZ2EF+/jWah9esXDzZXw1z97PdUHiC4Q+Ct3WDLTDBiZkQBhDvA6JBp0vLRz4MYsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fjJ9tHlI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7EB606A31C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 18:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fjJ9tHlI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D277A1F000C8
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 18:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025939;
	bh=mTjGPBEegQRgp+TkjbZALo5DNvb5ic4MusjOWTiPzo8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fjJ9tHlITqozv2A92bNFUGPP3O63gD73RHRUV66TQHLqaE4cc6+TzRhFOqy9gzhem
	 GTHREosT5FaTm2Pjdg+AjYNxu5//4SEZfEhEHhiozX8SZeWZ/8dEtGFuYPFxYwM4gK
	 etPTTSZracOXrm1gcffhReZFmNPHRh3Hm7sBQgaV8+PuzeQ/1B/K/+OagIpFMxgsFY
	 jkFkF/peQjEbokh2deNwGkjXqHFoWqnVcoWlqBfshEuyRIR2UswgkPTtiN2rgj3CcH
	 snSBneN/QS5am26e2yW9pua73F29jEy+Csb7B9imBfYjzayRVV3WVJ7VRlyQkE0aLl
	 GLz3xpVN2IP9Q==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c08539c827so904472e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 10:18:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEreC3I43tlQo3nq7H0NrqCBlgaO8PsJ4jt6iO9BWPjy99tapNQaey2COP9pbnXzqUPaVhGrE17tXMX@vger.kernel.org
X-Gm-Message-State: APuU4Z8HqOkb5mpP2KoHDlj8BWfeV8f3z7YBGcogV2B71Jpc2weei5QD
	sAbdPPbTHGbwWzrxbegd33kEMsZtAn+JfNxfkMI3jPawqD8on1yxedusUt4taejE2XGpQUDFi27
	xhHJ9lFEwvIwVoz7JghhveqnZ5/nSzvY=
X-Received: by 2002:a05:6512:401a:b0:5bf:d54c:1fb1 with SMTP id
 2adb3069b0e04-5c1a9b709a1mr1153837e87.2.1795025938593; Wed, 18 Nov 2026
 10:18:58 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-debug-info-v2-1-73ad7aa0874b@amlogic.com>
In-Reply-To: <20261110-debug-info-v2-1-73ad7aa0874b@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Nov 2026 19:18:45 +0100
X-Gmail-Original-Message-ID: <CAD++jLk66k1EJg0cO_+12HSBdOLvkCD65V_9eDzpXpHBK4z=Dw@mail.gmail.com>
X-Gm-Features: Aa3M54oSzmSzW6vVL6kt_cC3y7y55k_eM3IqSPDViqpXGwp_Vn4eEmeBhlms50g
Message-ID: <CAD++jLk66k1EJg0cO_+12HSBdOLvkCD65V_9eDzpXpHBK4z=Dw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: amlogic: a4: Allow functions without groups
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 6:09=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Allow function nodes without child groups during device tree
> parsing instead of returning an error.
>
> Only count and parse nodes with the "func-" prefix as pinctrl
> functions, ignoring other non-GPIO child nodes.
>
> This allows the driver to support function nodes without
> groups and avoid treating unrelated device tree nodes as
> pinctrl functions.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Add debugging information for error dts and Error pinctrl config not affe=
ct normal pin work.
> ---
> Changes in v2:

Dropped v1 and applied this instead.

Yours,
Linus Walleij
