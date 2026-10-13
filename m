Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9372509EF0
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898550; cv=none; b=TQzvRCVHIVMi+mDxUx2f6sR9k1ANp0wqflL2VAGZeFkaK59NwYfHXREzpJMCZK16IzX/UCJvjpegh4sLCNpIGhuMhpjL/NFFyD1zMbOS9IF/cxmazWi76w4G4qspodk15Qi0NT1kApEt0F6A2vUZdZPoUBkS4FrOWWCzjxr7op8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898550; c=relaxed/simple;
	bh=OQreSMZcizUiDdYivY39+NvIk9xrh+GNkFREYZHeZBA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZ+TMbVheYoZmh8y++MY7PFj0ogXMbKqzTpwzOrReNqtLPazRIdrmsmnvpZGbJPz6HRQDD/GFQUoqBqe23gVWrDpTpCk7WGQuCYVqHWI3VdtGcT41wilMEWXGHx9j7a/E3FPfQNle7D/kYHN2prVHb0VdX+LqphLQdB/ilRgwLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAXWEmq4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAXWEmq4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C721F008A3
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791898549;
	bh=OQreSMZcizUiDdYivY39+NvIk9xrh+GNkFREYZHeZBA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=iAXWEmq4fOp7iufBpwIRZp8Q/oZpUVrRQ9UZAUOeJiGuV6c0h3Ya8Mafdcgz/drBa
	 22bRmdygV4uvvsyHt0c5TsL5UyDeBDSWTA6TffIBd4GmeP4ZhhuAjoHrOB7xbcPYcE
	 eoer6fEuWwR+I3HwV7IYrbg1Zgk1UxpOmTG3QRpwzujN7EFQPWPvTXpPiT1lNXAiBE
	 hoMnegD3N3xcSwmRI8TwiMKXxMx/UIE0rNMY8H3yf3NWdENi0IVdzd4e3HyHCp7gc3
	 gjdMTtPsnpIs3DeS9M5ERUkyUmwN/FsE2Y+3kaoo81X3uKLRLnFvlEKeZTtvzUr8U0
	 9N9CW0WGoUB8g==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a7754c2471so25618171fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 06:35:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxO2wqXITrf8Q794xaqe/ivMzoSpSzGlaezNgjw+CQlcM8D+W2n4M1cWP3auSS99/Z0JxvBC1TJZuKu@vger.kernel.org
X-Gm-Message-State: AFq9FYLnn4WYz+ocyG4nJCX9yQYVHzEf4oeEy0Sr6qZOi9m6D95ZJB9J
	tCwfXZt9Vh3JtoVLwPkkkMrGVnWe6Pnxh4rUNcpYS9bG7Fnz572I0tltUl4mrfOFA8rORw2Vfhu
	ZP60sqyxGdaQ3hA949SeaGJTjO7pw8Ls7SwukP2Ivcg==
X-Received: by 2002:a05:6512:3f21:b0:5ba:4472:75d4 with SMTP id
 2adb3069b0e04-5bcde6afa8cmr4940944e87.10.1791898548042; Tue, 13 Oct 2026
 06:35:48 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Oct 2026 09:35:43 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Oct 2026 09:35:43 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <as4tep73cAI57Yk7@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <CAD++jL=prd1KDZQawqsRmW3qp1-cJ=18-yhp861CQirOOjE5Ag@mail.gmail.com> <as4tep73cAI57Yk7@ashevche-desk.local>
Date: Tue, 13 Oct 2026 09:35:43 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mcc2b2Z0zrkNQ80NpV-H1MsihgeNtPD5dD5g9xcbiLg4w@mail.gmail.com>
X-Gm-Features: AclHuK8ITRAMzeZzyYNFuZDUAjI2-0MeXgfOXBannT48q8bMwCyFujpuburhehY
Message-ID: <CAMRc=Mcc2b2Z0zrkNQ80NpV-H1MsihgeNtPD5dD5g9xcbiLg4w@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] gpiolib: kill gpio_request_one()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Bradford Love <brad@nextdimension.cc>, linux-gpio@vger.kernel.org, 
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

On Tue, 13 Oct 2026 15:09:14 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Fri, Jul 24, 2026 at 11:40:59PM +0200, Linus Walleij wrote:
>> On Wed, Jul 15, 2026 at 8:51=E2=80=AFPM Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> wrote:
>>
>> > This is the finilazation of the work announced in the commit 61e1fd2ab=
ca4
>> > ("gpiolib: legacy: Make sure we kill gpio_request_one() first"). With =
this
>> > small series we kill gpio_request_one() and leave only two legacy call=
s
>> > devm_gpio_request_one() and gpio_request(), where the managed one has =
only
>> > a few users and high chances to be killed soon as well.
>> >
>> > The series is supposed to go via GPIO tree (due to nature of the last =
patch)
>> > with possible immutable branch for others. Please, ack.
>>
>> The kernel is clearly a better place after these patches than before it,=
 so:
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> Thanks!
> Bart, anything needs to be done for this series to go in?
>

We don't have Acks from MIPS maintainers. :(

Bart
