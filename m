Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CBB3A75A0
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 10:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556225; cv=none; b=JNYW1P9lYbmFOAVmVhQxKfB5ad7RGNiV8GLHfT4iURslC1cpiTIhpHmGOM20EOQrdpkf81UpsiBmAwzI8U5pyHIhYyQpqMeMylp8J+iBugiP+5nGKbA/HGwVowJIkyyLzhdLCC87EaY6pfnzxPmLNF8ZTEXZxPSIF3/rYLQTfQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556225; c=relaxed/simple;
	bh=pXEtjwHqXcfnWSDq5qpazFXu/HXu3Lzm5hMLjmyDGz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m9/8mmoTvHopNY1JfLVEFlXZH1QXge32CGik1I3gYF+pu3ML/nZcP5uC32KxxW88Y//NuqPikTYwqXifhRcSIYLVyJSls+0XZOWUKLpKrn8Zjr3M7l3glGqk83/YxkShoCwWAB61NplBTtj4yN6NO/7eq6j2UPmPjLjzjwAnfIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VbQPX+ZU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VbQPX+ZU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96526C2BCB1
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 10:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775556224;
	bh=pXEtjwHqXcfnWSDq5qpazFXu/HXu3Lzm5hMLjmyDGz8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VbQPX+ZUl/DYOEG7XwXsXaYChsmRY9PwQzHN2o3QxJ0gmEWRO0l0XogyiOTwjSbt2
	 tcA5JkF0XIWh2UQrt83esp8O9GlHdHNh565+1vs7VY40TYqj7wkCxCuuZ//59NS4Ek
	 qOL2WO1lchCNMiTmum55OiIvuGDYR4Td7vIhA2W0n0dTHBqw2xdNQK0ojDaGjK9gr4
	 9n65t03FF6dlUD0lUhHeq0hTUv8Ru2tjLzBlM7dnUAFOo2yIFis3X3Ns88d3sz4pUe
	 AtaF/oQ+t4p09uLdr2QjZVXVy/aymc58uWmlN1Yf3+p0pV60Xc/P5VscyNLKpCx/pI
	 2Zqcb7FZT9y3g==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7a299d84b7dso34488157b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 03:03:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZyXlPPj8uUG4Zw8rArZG2mVdU+6DhJZjfRL9/10cJONb2vTOJIrpMYrx5ptKuk0L9B8tMf+JpU0Zj@vger.kernel.org
X-Gm-Message-State: AOJu0YxUrmRx1EYBGpQk1v1hPYwtT3uL0am16wIYr7IFl7bnqFe7BZA8
	xbUpJIt3MIhkm5F96xVYBvnGJokD5naCaL76GcWmiEOdW+kS1JYN6kuju7TP7hHVSVRriZ7XyW5
	S8d3vFipQplmfz0r8TbzYVsO0Cvo8d0A=
X-Received: by 2002:a05:690c:c508:b0:79b:d341:56f0 with SMTP id
 00721157ae682-7a4d38cf05cmr162751417b3.14.1775556224007; Tue, 07 Apr 2026
 03:03:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403-doc-gpio-swnodes-v2-1-c705f5897b80@oss.qualcomm.com>
In-Reply-To: <20260403-doc-gpio-swnodes-v2-1-c705f5897b80@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 12:03:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLmRwBJd+9QnvTRBVSdQqZdJgja8FXzqCNu0ye0smsn-9Q@mail.gmail.com>
X-Gm-Features: AQROBzCcrOGC9mYV_BDSmk9EoZKY7WEkflwtqH_mBs79DxOjvPi57U_1gfFCwh4
Message-ID: <CAD++jLmRwBJd+9QnvTRBVSdQqZdJgja8FXzqCNu0ye0smsn-9Q@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: gpio: update the preferred method for
 using software node lookup
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 3:05=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> In its current version, the manual for converting of board files from
> using GPIO lookup tables to software nodes recommends leaving the
> software nodes representing GPIO controllers as "free-floating", not
> attached objects and relying on the matching of their names against the
> GPIO controller's name. This is an abuse of the software node API and
> makes it impossible to create fw_devlinks between GPIO suppliers and
> consumers in this case. We want to remove this behavior from GPIOLIB and
> to this end, work on converting all existing drivers to using "attached"
> software nodes.
>
> Except for a few corner-cases where board files define consumers
> depending on GPIO controllers described in firmware - where we need to
> reference a real firmware node from a software node - which requires a
> more complex approach, most board files can easily be converted to using
> propert firmware node lookup.
>
> Update the documentation to recommend attaching the GPIO chip's software
> nodes to the actual platform devices and show how to do it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

OK this is clearly making the kernel a better place, and I expect
the AI coding agents to pick up on it and help everyone do the right
thing soon enough as well:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
