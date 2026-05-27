Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAA33E7BB9
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 12:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779883935; cv=none; b=qA9313elzkYEnJV7bBM1/0SI8WkQOLEjYPefND7pjOfTW1f0jiTZor/ZgUkbSc3mUijHWK002dVgpBYqEkRXdqpUB5emGhRn/hQRPdEiiUE6GI7S82VetOAuqACOpORT6GL5Mcq+Nwi8izvvtKcoznzYmRD7bmr/16n+9A5dZWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779883935; c=relaxed/simple;
	bh=qtmxwXDXkODeHr/X0uUEDLqf21BTUtgzdMLbiW/1v/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f5G73ajYSyObUgeSOwynuDJFd19Vwz0haNVIRTmySGCK07rEBss8NbeJ1zRInn+vU/iaMo+Kdmq/g1dWpsA0ASEAKifi3ciR5H3p8lI8OAy0y0JaCvMD+JuQocs9+FsCDKev0FWQPiO4OCeF08Gm2VcQCXgbEaL69OXxswCaELQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsB6iHNl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CsB6iHNl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 953851F000E9
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 12:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779883934;
	bh=qtmxwXDXkODeHr/X0uUEDLqf21BTUtgzdMLbiW/1v/U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CsB6iHNldRfrRUxtwnGLrQasGQraaM2I6687boEch/scBZpLDXSi49luUxVMAGiFa
	 69s4KF34oyfZThgt6pfoLjjXbNjcbl317Ws+RY2GQvfNzHLFdyWtddRNZs+TyKIbzt
	 myJuybWSxcjdrm2Zxy1DBMp5JEJ/QDlC3LqZm6OrxIC1rjtaYJ07RDVNVig7inlVsS
	 v7CNDOU0+T6aTEDbsYQlQMK2fg8rrZIZ9e/meLvpeQkobP01/DarAX067ngvrbsRhx
	 Cjd+04hOFnHXz4pxEzyv7X9d5IKken7SOv1gc51o9rxk0KsiGm37clYaS0gQKBpmHF
	 33AjwrrMbpRiA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a746f9c092so15930744e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 05:12:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8x6rmruIox4s5Y4VHo+wNS2lI+z71eKNewsYlBdqULfiI4/eityPY4azX+6C6aTfaN+iBAGqYCtqfq@vger.kernel.org
X-Gm-Message-State: AOJu0YxYAFcEAWXxZPRyxUP/7voStURBqSkoVB/mG6GAShk8TfLP0dbc
	rXskRt9AeoUp5Um79nww03ydM2T7XO7Yem1GQFoPS2QVBE+vQXR5lYAa8qqK4pGf6C4c8Ptf9/N
	QTLSVZXhJ1kH/fw3rVqRHEkFNkpl9pDI=
X-Received: by 2002:a05:6512:1301:b0:5a8:7360:5c59 with SMTP id
 2adb3069b0e04-5aa2ba6cdbbmr9400818e87.10.1779883933356; Wed, 27 May 2026
 05:12:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430170104.53854-1-18255117159@163.com>
In-Reply-To: <20260430170104.53854-1-18255117159@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 14:12:01 +0200
X-Gmail-Original-Message-ID: <CAD++jLnvjvBWB3F6JDVy-Fq77Zk59MjrG0a0hnZCeKujv_v0ew@mail.gmail.com>
X-Gm-Features: AVHnY4JfpigOfS1yOQGUhqGlz9JdQ_erGKJVT0Xa36BZxIMpCc9OyYzWI0_FXoc
Message-ID: <CAD++jLnvjvBWB3F6JDVy-Fq77Zk59MjrG0a0hnZCeKujv_v0ew@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: Use FIELD_MODIFY() to simplify bit manipulation
To: Hans Zhang <18255117159@163.com>
Cc: unicorn_wang@outlook.com, inochiama@gmail.com, dlan@kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 7:01=E2=80=AFPM Hans Zhang <18255117159@163.com> wr=
ote:

> This series replaces open-coded bitfield clear-and-set sequences with the
> FIELD_MODIFY() macro in two pinctrl drivers. No functional change is
> intended. The resulting code is shorter and easier to read, and it avoids
> potential mistakes when adjusting bitmask definitions in the future.
>
> ---
> Hi, If the Maintainers think it's not necessary, please ignore it.

Maintainers said nothing so patches applied!

Sorry for stalling so long.

Yours,
Linus Walleij
