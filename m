Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867195;
	b=inqU1yDz3j+LmgvtX3W8gIW4ZPFdgQ+pbP2K/0NXYVZyLraUYyoL1ccDRpyoIdo4rc8S
	 SfNyGL5DeC5AcUvmhU9bb/SIzYAnBNyn3Z76/sdD9A20GmLKRgLRjQ8U7QxVHNRRWD0T8
	 WG0NaN8OrcbUwxY8aJIbh7GM1eAq//a1MG828cZLrTXUtgiMbPl0upvhkQN2lN3vvhQTX
	 IkjECDu6SNJCKi0CKmwmQw5gp/SKaXebSgO2nz4gkemRf3BVVraMw03B1opzwiiT529rY
	 4q9UQYFHFfSURQKx9zzYiad+pXBsLBvMpIue4OOWtGA5f6bTGItdTZdGOP0koxPh9fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867195;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OlC0a2ul9HWhcXICka+GJASx10l3FgSlBIOMYENgx4Q=;
	b=Sas3vkRgKS0MF5ZMt4jofZFcIJmOAlroMeh+swGH2QGrcpZCHdaUTVFsyCFSeFnMF6qC
	 FhaS+0jgPWUv4Um87jqGI1jr5EpCrsS42YLyAcsc0mfQKwLc5/blnGkKRxC7KKcYsY4Bf
	 WmBnK1OJ8mM0RxnX2gqx4iMGNVELX20nA9Or9jPQghW/JfBk7a92xwbN4ljVTaPm+jolN
	 BTvYxzx0ui46Jns971kS4S61Kub6pk3THgaETC1RLWCqmYe24238H3ZRqCfOSK665bCrw
	 z+TIL90neSeYzVdI+wdFgxmbTIXSUImtF/QoSBFDFfafkN5pIixKGlAVJGmXh+GLzug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F8+l8TWO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB3D606A326
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F8+l8TWO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ACF51F00A1A
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793867195;
	bh=OlC0a2ul9HWhcXICka+GJASx10l3FgSlBIOMYENgx4Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F8+l8TWO0fESaT3f5tljg+jTos3ZA5GZhNEHGi+NbA5lcArNWDI4w8eUxzwvherSW
	 6lLHyggvnBYoDCHxtag2FWGJEOmAh89hZnAk0vqfeG9p/wc6UPz/Ee9etbjb0R5bvY
	 riyRA4zCuKgYR/7gTcdmZ70uEItCNuFqEnrJQg1zXSn7c80V8mzbIIHkw82MkI9PH7
	 YyyGH2g+i6K82Vp8UKLjtgvVCK3bh8jLMgSi7W+wj9KNe5cAOhaliFLOD6DT5WDNhP
	 Lw4Vf9cReOs4AJmFLg+CBMwoPQdc1OVo3ICQUjjJl6Zj5PuKKByVRq9VXGfjdL0i7/
	 HGe+3jEbW8aSQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a772ec8389so12426101fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 00:26:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx7a5b750U2zFXHX68V12v172yPl5Flui9zdDJe6LBo+x3/WkdXz+ePRZ3aU80n0uoqe6BHDX0ZMdcJ@vger.kernel.org
X-Gm-Message-State: APuU4Z8NkvPYTlfjhagdUGjAj3iNZPvVvy9OvfjLzSdPXFsuf5B4CWeQ
	JcbhyoXfY6ECWTXbWXWLloxBocvuqTnUZ2eFYgvBwZ2VnrQeBS/R+1Xs3Hygtf6m0bBE7UF/su1
	V16ViOUqtMwU8hXCmLKI6ZvDwp0+8bII=
X-Received: by 2002:a05:6512:3d93:b0:5bf:f39f:cfc1 with SMTP id
 2adb3069b0e04-5bff39fd13amr2013894e87.31.1793867193962; Thu, 05 Nov 2026
 00:26:33 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com> <4cfcd6189bf6f281487a2eeed4fa1b1fe5521550.1793097104.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <4cfcd6189bf6f281487a2eeed4fa1b1fe5521550.1793097104.git.u.kleine-koenig@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:26:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLmSLHtCHoUc8z85_YKVdpUBYZ9p+NkzGz0EDooPKCKMLQ@mail.gmail.com>
X-Gm-Features: AclHuK_fEMFEgEPUDEtLQLuYwPxMgxrsUccIzkDFy39W3E-690CJclgTO-eP9T0
Message-ID: <CAD++jLmSLHtCHoUc8z85_YKVdpUBYZ9p+NkzGz0EDooPKCKMLQ@mail.gmail.com>
Subject: Re: [PATCH v4 22/23] gpio: Unify style of pci_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Michael Buesch <m@bues.ch>, Andy Shevchenko <andy@kernel.org>, 
	William Breathitt Gray <wbg@kernel.org>, Robert Richter <rric@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 11:50=E2=80=AFAM Uwe Kleine-K=C3=B6nig (The Capable=
 Hub)
<u.kleine-koenig@baylibre.com> wrote:

> Update the various of_device_id arrays to conform to the most used and
> generally recommended coding style. That is:
>
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
>  - at most one entry per line;
>
> Adapt the few offenders accordingly.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
