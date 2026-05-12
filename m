Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB1F4BC027
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778579746; cv=none; b=TaOj4qJhAhczLufDw60hJVZlIYU8uXp90huAX+DsTbOT0jfr5SiUV/BJbKA8CSiFX/wwI3gAzcRWnHi7Y6dhBBOrZnPliJWDVkSik1Eteg4X4izA2bLLFkm69M2Ocf4t3KQ3iJpe9GoHHAwKsjEN+oeTfWarGfxZewCblTccnsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778579746; c=relaxed/simple;
	bh=jQvTJZrp0S1jM3cf+0gYO/Ixv+Llgr5aA0mfnrTOP0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVfBo8vZ4E58tu3iqi90MrKD1z768PItYMx2KuVDCmMVAURDxbT/KeqxaY9Vn2HkUtlOSw+NjhXU/3Io6b9m8m7VYTxGZhmOwyqkQ0b0aHMBB3RLnN2bE78xe0pMPrZr/edS/sujMX3ePGmaRVvn6vPNU47wCUA8UWryIGVrCUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fyF03NXa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fyF03NXa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C732FC2BCF5
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 09:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778579745;
	bh=jQvTJZrp0S1jM3cf+0gYO/Ixv+Llgr5aA0mfnrTOP0I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fyF03NXaV2PtC9zXk9H8zr3h/VWMjbxoN8143L/6zGqIrDCOwYJpNp0a/ocxleqGY
	 +QLR20iTfRN47Ap3N/PseeJho7jV7YzDXFG3IKV7nfVkiD3xK9apMKMrGqW+vni2lJ
	 FBRpW5mcVmproVsYshD5IOVQoS+N2F6bFMUDwahvDedmHcCPUFPJ0g6I8GmbR2tiNl
	 fei3pPND1wv39H/Y2+e4xSqzX/RuM9jbHQM9crAZd+wZJ7bUiCPr6R5/LU8jErwqXy
	 nG2aQNCKMt+qKPY6E7qOeTC7Zbi7t2ahona5V2emVVTZ9ySrHvbtY9Mkxc+qgGkx6s
	 cMxOjb7elQt3A==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3922b35e69cso45142701fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 02:55:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9/SXOCS9VIxRNzYlTlZqQDbYXPzwRBCkXjPTBsoJF05T1x+s9cnw91cTiTpwTLZV8Gzp6m1GJ/4onh@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl/h4AoQj8bJ5SqOnSerjFYx0ArKAz+LosVemYprJXP8JLWDMC
	ug14+Cdu41UQRdHM01dVRIAsoKki6v9pOLFooQ4Qy8m2gu6UF5JmY4l3upt6rV13nl9BHHo9Zgx
	l0Z7eqdSoZNemTwEmZPiyAgRHqNOMjr8Syvyj/L8H1Q==
X-Received: by 2002:a2e:bcc1:0:b0:394:184:f7a7 with SMTP id
 38308e7fff4ca-3943caa8d9dmr7686461fa.6.1778579744488; Tue, 12 May 2026
 02:55:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511-regmap-gpio-sparse-fixed-dir-v3-0-1429ec453be7@kernel.org>
 <20260511-regmap-gpio-sparse-fixed-dir-v3-2-1429ec453be7@kernel.org>
 <7907021b-2506-4c04-b379-0ca2d67e8503@riscstar.com> <CAD++jLm78ofo3_4Jh=AqARfXjXxKKH=JxfYtkR_OUMW+=26z9Q@mail.gmail.com>
In-Reply-To: <CAD++jLm78ofo3_4Jh=AqARfXjXxKKH=JxfYtkR_OUMW+=26z9Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 12 May 2026 11:55:32 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mff7Njq8_bCq5FWGNvXuXOGc0+jmCYEYvVSkt_2eUZ5Dw@mail.gmail.com>
X-Gm-Features: AVHnY4KdQ2Z5QcotvJwYycNjPqs1jw7wTE2ji9o5ru9bPCJ18egGhsUIfMWdcg0
Message-ID: <CAMRc=Mff7Njq8_bCq5FWGNvXuXOGc0+jmCYEYvVSkt_2eUZ5Dw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpio: regmap: Don't set a fixed direction line
To: Linus Walleij <linusw@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Michael Walle <mwalle@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 11:45=E2=80=AFPM Linus Walleij <linusw@kernel.org> =
wrote:
>
> On Mon, May 11, 2026 at 11:07=E2=80=AFPM Alex Elder <elder@riscstar.com> =
wrote:
> > On 5/11/26 2:43 PM, Linus Walleij wrote:
>
> > > If a GPIO line has a fixed direction, report an error
> > > is a consumer anyway tries to set the direction to
> >
> > s/is/if/
>
> Ooops hopefully Bartosz can fix when applying if there
> are no further issues.
>

I did and I also allowed myself to break the lines a little bit less
eagerly, the soft limit is 75 characters. :)

Bart
