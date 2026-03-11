Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F317634AAEF
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 22:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773266415; cv=none; b=IWIFSO39DPJh5dF7upZnYTFsqPMoPdc30V2l/xDZYAgt4Nq3QzmbIK/TWRGqLrW/dreHX+OJUqCZk9YY0F++WkaXpdxmdNeloyAHLLUuSmosFB8XqJcGbgje3hwR0k270i7ZEBsJJbzLEaMa3WB7dSX0H8HVkv5r0HpuwMhdQdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773266415; c=relaxed/simple;
	bh=nR7Ik7+aTY6XkjSrd0rCp+Yc5AtA5W7Ze3vk28+qh4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h+zq5uriBxDrob/PqBPumctd75QUyIU/DMiHx/Dbmb5GeccjPLd5cbHlOd7d2GKDJCEISZskoT1yOa/izGkyv2MG6k8eo4z3FAckNLyvYr/8Gai3fzlgCUtuBTWotvDgKIA2K/dKhQVW4ep2svQac+FenOsmdOYH2+kItZyW6bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/be5Xet; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/be5Xet"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAAA3C2BCB0
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 22:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773266414;
	bh=nR7Ik7+aTY6XkjSrd0rCp+Yc5AtA5W7Ze3vk28+qh4E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a/be5XetwifulfqZ8l3Zw+rxb6HGsGvALSHLOZgLZ71qdHM+wnnpxH6CCWOssZQPs
	 Bhpw9eQU2tU7fSq/MPQhdDn9C+JrFyy0K1lREbjODeW9XJzgCXB0hKS0ifC8RPlWjq
	 V74BWKoaRk4NuaHlXpUBJAFYmJTKRQJ/VruSS4Cw/OnKica35RvTt7U/k2vPUkoyo/
	 Gk0pLHNSDT+99cHY+qMBr3wL8Bw6ZqUSlydQ4TwVy40Ujz1FjFRk0xwaz5yMl6d+VU
	 hyT+Q9vuj4NW/KPCvQhUgKGrIhYG6E+A1EAr2xsJbEtZF4sBrjnDpTAs6fXvwyVv2p
	 vRRl+QXfsms2Q==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64ca09f2170so462724d50.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 15:00:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzslwT6sz0iITlzVVlIuzx641/bpko0TA5SaoJ2m3MlZFc6auLDofF5dYwL8mxILS8ps9R6JILo2N2@vger.kernel.org
X-Gm-Message-State: AOJu0YziX3OYBeoTqpyuZ0SXiXHztTa2Li+Cmi+hMdNulQN7COnUf1KM
	IAUWG6Yny/ZBCd3ihy5QYBOa0btREn2KdqZSrXTV8fLdXaOKjy+w5gd0FqKVb+YG/aTMXwlFn9e
	Leurr0L58YzDKYBKaQWyouKqRIY9Ul1s=
X-Received: by 2002:a05:690c:6b12:b0:796:360f:e1a9 with SMTP id
 00721157ae682-79917eff483mr41909397b3.29.1773266414252; Wed, 11 Mar 2026
 15:00:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773150895.git.dan.carpenter@linaro.org>
 <93920f541564bc4e6aaf0f2b6df2f5aca721d452.1773150895.git.dan.carpenter@linaro.org>
 <abHR2nnC9jJWK2eW@ashevche-desk.local>
In-Reply-To: <abHR2nnC9jJWK2eW@ashevche-desk.local>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 23:00:02 +0100
X-Gmail-Original-Message-ID: <CAD++jLnTJidg20wUYXf+cH4hTsVhAsPwi+CcCdRL5n12kwaTmA@mail.gmail.com>
X-Gm-Features: AaiRm51dlxhS71_O5oR6o4r3R3utrO5MO3jHaVm32VtjMP_IQDLhZH2N3m-Txy0
Message-ID: <CAD++jLnTJidg20wUYXf+cH4hTsVhAsPwi+CcCdRL5n12kwaTmA@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] gpio: add pinctrl based generic gpio driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, AKASHI Takahiro <akashi.tkhro@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 9:34=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Wed, Mar 11, 2026 at 10:39:24PM +0300, Dan Carpenter wrote:
>
> > The ARM SCMI pinctrl protocol allows GPIO access.  Instead of creating
> > a new SCMI gpio driver, this driver is a generic GPIO driver that uses
> > standard pinctrl interfaces.
>
> Similar wondering here... Can't this code be integrated with one of
> the existing generic things, like gpio-aggregator?

The aggregator is very different, it takes existing GPIOs and
creates a new GPIOchip from them.

What this does is essentially take the gpio-ranges, find the
backing pins on the pin controller, and creates a GPIOchip
from them.

I don't see anything that can be shared by the other generic
business sadly, but I think maybe another back-end using just
pin control can re-use this. In this case it is SCMI but any other
firmware API just exposing pin control and no explicit GPIO
could use this. (Not that I can think of any.)

Yours,
Linus Walleij
