Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A2529B200
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 21:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773265782; cv=none; b=bWdtkeTyPyGjO35rschC6Z4Ho7iUGfvag9RqlkgiAG0RXdAJWsWoEPsEN0Lo4Q7ahIGUbxTuTzHjkNPR/zQ5viAciF5x76QPa/RZ2QCjTf7HGCeEFZIhV6ZDFF6UusApX/ozvZ8CThysHMakHLh0WLCTv/j+HCFJSd9+czxpwVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773265782; c=relaxed/simple;
	bh=OLD9utuIZfl6KHTmJ4+yFvh9pZE/I88gRyn+8KAQ/TY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hfg42cHsE/lIHILWVppQVna9UKY2qFMzbBtVEFB8cVe77HioCzSiReVi38E6PyWCEvQ15F+a/M+LpinbEebQwQTD0Yvb6rT5HJJKmLztRo0WyXUsqW0YhgfAGIkXheTYcGU0mN0ShDIJglXv3XLdkHNo6CP57eK1206S58V/z2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLhK848C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLhK848C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD051C4CEF7
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 21:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773265781;
	bh=OLD9utuIZfl6KHTmJ4+yFvh9pZE/I88gRyn+8KAQ/TY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mLhK848CEH1wsXE8pCiqsu+3uW271C0Jlcnt43am103q0yXt1jPqxter2Qzk4NT1A
	 zr2ceq88NA2b+2a7kE41dNLQqDTDxZDD6tEwtBECtPITkl1kvCNBJFBgCqyBLkyiro
	 t9t7mKh5vuvVStNBOjYE9rMs4O3HnRE3XYo3Fau2LevYzCL2S1mkxe3dTqoMzuZRuG
	 zHz4sEQnEcRZ+Par1qnsJ8XzTEuJNGAxEf02zkrNg0WQrgEbCfknKQfYwFL2R4j0Li
	 Ve4jDnbSISBfx8I6fkjGYLl2BtKHTy03gsnRxcgUhSodZI6pcVGIZSNSeiz7hayN1S
	 +ukple3GdP9nQ==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79800183233so7030497b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:49:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzXBts5695yoJJq71JpwZgB6E29NowCy3WhwsacwPskNtXfEoEWUYLNbJmE+hBqjmS2RGvZwHcGD2s@vger.kernel.org
X-Gm-Message-State: AOJu0YyxQa6dUVey59xKWeu/01tpgmr0C8ATZ/m8RGPu/KcRFRYFNr0L
	F1v9svZofLOcXWUrhx9Ko49r6knrUSbcEazxMpPjkg5oTO4j09Jvuu3M2ii0IJ/FLAqaGSseujR
	peBoC40EJz5BmVf4DgCw7YLv1GOkl9X0=
X-Received: by 2002:a05:690c:ec4:b0:796:335a:895 with SMTP id
 00721157ae682-79940fc005dmr13930717b3.6.1773265781277; Wed, 11 Mar 2026
 14:49:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773150895.git.dan.carpenter@linaro.org> <b24c7b023c84ec14cfa7e49352e834262e3fefb5.1773150895.git.dan.carpenter@linaro.org>
In-Reply-To: <b24c7b023c84ec14cfa7e49352e834262e3fefb5.1773150895.git.dan.carpenter@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 22:49:30 +0100
X-Gmail-Original-Message-ID: <CAD++jLkajNc=t6JmJkMK=YCMeumEQc8RO9OViKHGYPA9wVGt8w@mail.gmail.com>
X-Gm-Features: AaiRm50k-R75GYtAcf7sWc65ZG8Nbggj8JAild9FrvXMa8aJm0e1W2tTM8TiKCE
Message-ID: <CAD++jLkajNc=t6JmJkMK=YCMeumEQc8RO9OViKHGYPA9wVGt8w@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] pinctrl-scmi: ignore PIN_CONFIG_PERSIST_STATE
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, AKASHI Takahiro <akashi.tkhro@gmail.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 8:39=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> The PIN_CONFIG_PERSIST_STATE setting ensures that the pin state persists
> across a sleep or controller reset.  The SCMI spec does not have an
> equivalent command to this so just ignore it.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

The SCMI implementation by definition lives in some always-on
universe I think? It never sleeps or resets. Nevertheless:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
