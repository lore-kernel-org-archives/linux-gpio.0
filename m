Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0A039B958
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 13:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669523; cv=none; b=q1mYKzHPVBbRGbcjmLTBkk0Ck4C/kxpdbG7CbfIWl1HguNyk4nt++0eZFFxqsevpXKNXFlFhlHki1yzm+fp5P8X6fI3ZJQ4Qj3c3FKtL9/alDINJ1Djtpf9nq/HF1CLjJIup/FcPdagGGfV99I6+N9WNSCOJPdTgamp6726cB9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669523; c=relaxed/simple;
	bh=hSMXVkUEekzrw8bwZ8sifPlqvROgTnPiDGsKFKxbDpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JvMeAB9iaKvYeavGWhEnoJE2sgePFreySVYOMmU3KQQC11ynepU5GYsHjSyMSlfhsX70ElslECEx1I/a6NNXMUw8vwoo6HhqL7NACJP3EWRIOEvN6mP8zAItECSts+1tfOdaTSVu5VyBahdUMsrdfG8pzftiW7Tkd7ggiIasY4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ofHsNMsC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ofHsNMsC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67CA2C2BCB2
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 13:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773669522;
	bh=hSMXVkUEekzrw8bwZ8sifPlqvROgTnPiDGsKFKxbDpg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ofHsNMsCMkh32Ijm2DMEzp0uKPKCmoWxPNcBwTtegZ0m8W9cSQhYl8SU72LKR07jc
	 QTbs54Bmk8KdiO2BFIby00ejQU0PaC6SVorydY6l7tjGp23WcaAXapcaAV/fatI/tg
	 tWyuNOo5QYEJCov96kSEQpIs5B7J39JO7nCK2xQX1UhAOSziQaCYH9GT123H2pSxDC
	 JOaVKLt0a8MCFZXeVGF5urYOlDQ9D8r8aalbrbtHTKgEJhiabXYyJJ1yoFW9UHELVo
	 acXu8gmh0V8xjRuVKGhg5vcsdkTyuAkcHG+8EcsiDWsv9ev3LJu7uKsPDp2LrLt2LV
	 DNA2yihX4CDuQ==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79a5a37113aso5114677b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 06:58:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5xyw+4aMx1x5LK0FucO4Bo4Wz8DupZxpX4ALOUBnwtzofEfB6l++s85pDvwKdNH+QFkRCxzjx7HY8@vger.kernel.org
X-Gm-Message-State: AOJu0YxubvqYWxNGW3xWeaamOh0o7Pg9F0KhaMyEnCe+v1LFEwwg5yMB
	BD0R436xwhzkw9ek9cjcPykoVhYINPmX5LCRv1tlTa2DDVOmbosz4pocUOUHHFsWTIrLc+juvP1
	ARR8WwQne0zZXk8iWe01dgNPjD38GcR0=
X-Received: by 2002:a05:690c:d91:b0:79a:3a33:933 with SMTP id
 00721157ae682-79a3a33606emr69844567b3.31.1773669521704; Mon, 16 Mar 2026
 06:58:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313-gpio-timberdale-swnode-v1-0-4df2e9b1dab5@oss.qualcomm.com>
 <20260313-gpio-timberdale-swnode-v1-2-4df2e9b1dab5@oss.qualcomm.com>
In-Reply-To: <20260313-gpio-timberdale-swnode-v1-2-4df2e9b1dab5@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 14:58:29 +0100
X-Gmail-Original-Message-ID: <CAD++jL=dvA6ewmao9c_tjytUF4P3Uqmo-YhXHFZDX7NPTVyEGQ@mail.gmail.com>
X-Gm-Features: AaiRm50yWrLM_KLi_T_7LxWZnSdxFEiWnqrBl359MmXbMmSFbkutwI57NawX5O8
Message-ID: <CAD++jL=dvA6ewmao9c_tjytUF4P3Uqmo-YhXHFZDX7NPTVyEGQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: timberdale: use device properties
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Fri, Mar 13, 2026 at 11:05=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> +       err =3D device_property_read_u32(dev, "intel,gpio-base", &gc->bas=
e);

I guess there is some background to why we do this crazy thing,
like legacy.

I guess if I want to change the world away from this I need to
send a separate patch to set gc->base to -1 and see what happens...

Otherwise the patch looks good to me!

Yours,
Linus Walleij
