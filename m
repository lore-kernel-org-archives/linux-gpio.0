Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922373ED3A5
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 09:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106532; cv=none; b=NUrSlr1IGfY50FCHI2eaQCLNn+h2p7YJOU6fWZQvqJJg0/Fd1D3RtJ0X1b2MqFr3XKdibJtnSGTtaW2CoRXcaqgMWuNyUwKAkLIzSzvvA4WkUhBBlUSOL3mBC+0psUfWyR6F6vdGLUmIn6mopfO80NU8dPLLyQmAr7PkcKY9Nk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106532; c=relaxed/simple;
	bh=UiaxwdsErN1/01E9RU1yk8353v6GsUb6rdk2/6geu9k=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XcjqjV7oWuyDghVDG7I3Psb640mohcgWvFFXg6doMvuwRu6oOJye7QqaHcm0ZebnaVfcUkqt99+9qARUyEUJMCTc6QqaHqh3vNtXYAuC6u4zqusxW2gr1UnsuXGJ1+mXVLwAgFoFMrH/wmBZB6OFbYuz8mU6gOz7FW35qu5YZc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VvwrNlJ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VvwrNlJ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E0D1F000E9
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 09:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784106531;
	bh=UiaxwdsErN1/01E9RU1yk8353v6GsUb6rdk2/6geu9k=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=VvwrNlJ2E4ImcE+WIU4fcDSflBItrwzaZva7OQKwqvf1/8iCr7tNjNqEDUB8Qddd6
	 vAaJ1l85GRH6mp8gtGDoVb7J/TOHkO9u9gqOTwDPAXBbazh0fR+aVqn4U2mIgL+iga
	 I/LQcj8n4vbduvEO+g7d+tZ+0T/fgtoCfXyKFnXJecHSKL1HKnS8M4o95GArBuX8B+
	 NzyzTHtpnL+uGGqSJDpP5cVFHN3DvH6y4QtTswaNmrdZk+ly0P30GNnZsdt/eRJcAf
	 9pf/PXncDC7HfzbPz1wF48ECQleFNcAzuu5ynwsAd2pfahI8eTeLpHExotOq5ckNIk
	 Ix+B90lcLr0GQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c9107baa7so51847041fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 02:08:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr8MB+ZRLGbBphYAEk56ZyRcSCC74Jaqp3X5NcExWpwmXNxk+Kdt/JTSykSPjzRGdmmFxCA4PyxOb++@vger.kernel.org
X-Gm-Message-State: AOJu0YxtOTzcOYsjOY2HgVDyjTDJY8AT/Qpdgw/CuRKdal3vV8VgV/AS
	xtnvYWCRZCpPEKv2Ds1sNmMXizkN0LU5YASpwsqoFS4qH6Bm5/nqwoATcxsHF9gEfArpc4vETGg
	DNquIUqrpVHOMxep9N32HrkQ1XeMpV6WLOF5q5GrWvg==
X-Received: by 2002:a2e:bc27:0:b0:39c:a09d:c48b with SMTP id
 38308e7fff4ca-39db6db0f2bmr5333171fa.36.1784106530137; Wed, 15 Jul 2026
 02:08:50 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 02:08:48 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 02:08:48 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aldGhpswOfyjd8vO@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <alV0wIgZAY_InGYV@google.com> <alX2Q3OcJHVmamWM@ashevche-desk.local>
 <CAMRc=MckJVi5bPtBh9p9D3SHaJcyvf19B2J-u7fbDiTA=CLdJA@mail.gmail.com> <aldGhpswOfyjd8vO@ashevche-desk.local>
Date: Wed, 15 Jul 2026 02:08:48 -0700
X-Gmail-Original-Message-ID: <CAMRc=McMxkpz3O+ho_4qGhFA3W+ok0YVtWz--q4dnhGsAPJi8g@mail.gmail.com>
X-Gm-Features: AUfX_myqr1qMTTlxikqcOdvfAxMiRE6w0BKmQT53Pufpd7tEUr6YcOyZNk5jJoc
Message-ID: <CAMRc=McMxkpz3O+ho_4qGhFA3W+ok0YVtWz--q4dnhGsAPJi8g@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: remove trailing comma from sentinel in GPIO_LOOKUP_SINGLE
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2026 10:36:22 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Wed, Jul 15, 2026 at 08:11:06AM +0000, Bartosz Golaszewski wrote:
>> On Tue, 14 Jul 2026 10:41:39 +0200, Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> said:
>> > On Mon, Jul 13, 2026 at 04:29:16PM -0700, Dmitry Torokhov wrote:
>> >> The GPIO_LOOKUP_SINGLE macro defines a lookup table with a single entry
>> >
>> > GPIO_LOOKUP_SINGLE()
>>
>> I fixed it when applying.
>
> Thanks!
>
>> >> followed by an empty sentinel entry. The sentinel entry has a trailing
>> >> comma which is unnecessary. Remove it.
>> >
>> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
>> I queued it but I do consider it a bit of a needless churn TBH.
>
> You should really be against Uwe's patches then! :-)
>

He's fixing more stuff and removing trailing commas is just part of it. And as
you can see - I did apply it and will apply Uwe's series too.

Bart
