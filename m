Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F39B41B37B
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 12:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997410; cv=none; b=oKZf8a+UsGO4Y69HUjV+hi+oIEAuBL+pzeqMRImb/u+Zcci01OO8ex/6TZcDNyEJ2sdAfUVkTuheBswsUaFwJISwjBnD3j6wNBbqjDo1EtqFuCY7o9I8ctoobQTqstnejiYzNwPeCW4sBdEU+krPH6OYIr+pEYTNN/xuM9dZMNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997410; c=relaxed/simple;
	bh=aw55Zrzq12nVvFM5yNqWDNOmjaYbuotVuuIfzaI3Wms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XzFwBouWtvcGWdr09RrqKLt3xS8QbDqB4TePJgeXTtSB5QMzB2CROyInMm0N7d9ie/1kpWHlTaeeXh69wGrrZsB7Xy4qYMQ5aJ5C1nccXpry4KZwpnhsRaNNETUqUB5gzsJlTVNWBq6K3wVtkZJmI3jGtnLGzRBu/6oFVKZnHtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sohguRdE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sohguRdE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3047AC19421
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 12:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768997409;
	bh=aw55Zrzq12nVvFM5yNqWDNOmjaYbuotVuuIfzaI3Wms=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sohguRdEa4xu42MW1VYS9Rc8Lw5EGke477u6OlfzUCxN1r86Zw1B+eZA7XXbyqLUF
	 4g3Nygq0jFG3ovfc8E7vMk1Gwc19ropuB1uc5uYemec5neKlBEgcbwu48PhBqqsD0F
	 tCuy6EqzoRhYTQzCOFNAjrWJYCO9ze6YGGr64VZ8txsxKYZ+V6kxIf+64+1DrHAm2N
	 kf6AL7XyXkMvpkINHFJPmOwPqVwHt8fO5Kq07ruP8IZZDq9xYeI6zyAetFqG+32VR8
	 dGgEQ5YW/uaJ9gYSG2gcJVD11txHvFXfn8dtdVQkDNjyRN+FZZvW6DZstnvchCWM85
	 cmjblcVJzgdnQ==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64931bbf70cso2554326d50.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 04:10:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV0OgDoNQLuTrKfDxz65c6OaGLwK3g96ubzsk6b7urrBqjIZE3B5xDZLdrAwX9d7fsFhj2L1rOUwQVY@vger.kernel.org
X-Gm-Message-State: AOJu0YyCdVOwf79SAJSsaVv/NnGgLf57L4n7Y1RY+6qrpIz4MM+cfgVM
	jRFo1qOomvlC4bTIfXJNOArkgwASHUdn3PYC/p9vjQryEF0HZJ7xDDqEaA0TuF5ib6oEUWPmzHA
	jsBgmTFxhxLnu1c5+68FvQ0JqRQeztks=
X-Received: by 2002:a05:690c:387:b0:793:b660:fba6 with SMTP id
 00721157ae682-7940a218394mr87027157b3.40.1768997408481; Wed, 21 Jan 2026
 04:10:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120154913.61991-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260120154913.61991-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 21 Jan 2026 13:09:57 +0100
X-Gmail-Original-Message-ID: <CAD++jLnVR1CbW9LCW3YPeytidWcjWEUbAAUD0z7LBS83x3ik3w@mail.gmail.com>
X-Gm-Features: AZwV_Qh4I8Lh__e-vaXQnaDQ5KRA868vPkdVjwVieEAwSucC483TetRYztu4U-M
Message-ID: <CAD++jLnVR1CbW9LCW3YPeytidWcjWEUbAAUD0z7LBS83x3ik3w@mail.gmail.com>
Subject: Re: [PATCH] gpio: shared: propagate configuration to pinctrl
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mohammad Rafi Shaik <mohs@qti.qualcomm.com>, 
	Ravi Hothi <raviravi@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 4:49=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Just toggling the descriptor's "requested" flag is not enough. We need
> to properly request it in order to potentially propagate any
> configuration to pinctrl via the .request() callback.
>
> We must not take the reference to the device at this point (the device
> is not ready but we're also requesting the device's own descriptor) so
> make the _commit() variants of request and free functions available to
> GPIO core in order to use them instead of their regular counterparts.
>
> This fixes an audio issue reported on one of the Qualcomm platforms.
>
> Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

I don't quite understand all semantics but I guess it works
like this:  gpiod_request_commit() is only called once, during
proxy device creation.

If I understand it correct:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
