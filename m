Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A708389108
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 21:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784929277; cv=none; b=aYVy9Q/dPkOrjttXmCVA6RsSNlhoV4vkLNScD9veZN07ZCrS1Mt/B6N5wcFeZu7syaOslGG+rXhJL/bmwG03G05OAJbue1NHpgYBrngOcMAya+MT6lWkMLyJd5CNS7VBSulnelx84+wgK9c9r88JGjRL9YTRxef2WRMxCsyaSm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784929277; c=relaxed/simple;
	bh=eLmtuzNiJN/NtKa2kUTnWgeyP7l+US/ugXSovTsy5mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJNhEA7ow3vuyFRNK74SxzSNGm1bqc7/Rv25N0E2g54FotHTnRjzOc8v9PHVxeewb6InUd5F5LwHGqnmIbUFwaAfTOF1FPKpNr8LE3NBL+3rp+yiHj/f60ppilMMiwXrsYBGIQgRY7qThbM5DDfhMWiPaqkj8ArQf8oF1QW+1kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=knpEx5vt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="knpEx5vt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A531F00A3D
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 21:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784929274;
	bh=eLmtuzNiJN/NtKa2kUTnWgeyP7l+US/ugXSovTsy5mc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=knpEx5vtRJ3MDi4n/T0WX5+WX2WN+Zwj6kXGPxVh5wOH3ZeVCovQskbtzoSjQdsK8
	 7hhjtf6Ba4GV9lCE63dlFDsHLvZkU++GIpTULvKQsFlnPDhJAxsVrCnTkOjE/F+jRv
	 Pn/qUFD1g8I/Qen/F1yNcnzkk7XuE0G8FWlCEfZB4D7BzdGK4kkknBhDwU1VSmKoHb
	 AGaFRHvSgLBHwOThscZ2bgFO7pgcmfse3HNfyjZw0reTkVRT9nGwRRzDBaUdUhOYjx
	 g1CV0/EI43bUSDBPWxHlTkSTcU1ZObZ8YYClertTrg9oLWAOwkkJhgrpvCwuc26NcG
	 HAPrQsKqE539A==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso942415e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 14:41:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RquRh8cdr2+TeKrgxVrxnCjgsugz9R2IEagjkNNojJyt8UWbuZgN1wBtpFdIaQi3N2GO1e4zgcU4iK/@vger.kernel.org
X-Gm-Message-State: AOJu0YzYY0rEP5Dso8m0Q2rNPXIPOLtodeTw+F5BDhHe3LQudKJI36et
	mNNvw212BsNbpOu7e7RxpB23q1TeLqbfzkK57JQBSzB3CMtBXkX9M6iT5xxgP1uvEMoLur5vDdj
	XeYUTQ+UVBr6fnvu7uDOxeRQrn4Hk1HM=
X-Received: by 2002:a05:6512:2310:b0:5ae:bf46:2acc with SMTP id
 2adb3069b0e04-5b2b2f86804mr1934146e87.63.1784929272904; Fri, 24 Jul 2026
 14:41:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 23:40:59 +0200
X-Gmail-Original-Message-ID: <CAD++jL=prd1KDZQawqsRmW3qp1-cJ=18-yhp861CQirOOjE5Ag@mail.gmail.com>
X-Gm-Features: AUfX_mz6ZxVMzIVDlYKzRcjHd5uCb1mkXfd8xMBGPfxdB1J27bvJ-Aw2H_fn9Og
Message-ID: <CAD++jL=prd1KDZQawqsRmW3qp1-cJ=18-yhp861CQirOOjE5Ag@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] gpiolib: kill gpio_request_one()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bradford Love <brad@nextdimension.cc>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-media@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 8:51=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This is the finilazation of the work announced in the commit 61e1fd2abca4
> ("gpiolib: legacy: Make sure we kill gpio_request_one() first"). With thi=
s
> small series we kill gpio_request_one() and leave only two legacy calls
> devm_gpio_request_one() and gpio_request(), where the managed one has onl=
y
> a few users and high chances to be killed soon as well.
>
> The series is supposed to go via GPIO tree (due to nature of the last pat=
ch)
> with possible immutable branch for others. Please, ack.

The kernel is clearly a better place after these patches than before it, so=
:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
