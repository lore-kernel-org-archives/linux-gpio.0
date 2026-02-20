Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE1832FA1B
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 11:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771586481; cv=none; b=PrV7OWTzVoAeb2whMq6IZoJomYWUOU8yobP+1pTLabk8oZlo8xP8LdhabPtWQx5Xsg0u0NmMQUFu5vSPX3w/3XbpWWQXfgynIFCsg7c+JeX2dhH0LGQ3OmZyyHLt9PuiPz/yA2yleWAlrdjeMftm/Bi3YXsg4UySOAfCtMCiG0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771586481; c=relaxed/simple;
	bh=mlADFL2/DWhCwhbGO29DDwfB21//2slPoxx16AIxgBk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PWDjB5d2EOETZF6kOWhyl6p4Ig9RnU0oJtL30UxJk8GExQheOBenWqWgGeB6pRsmWUwY7/0sa+3Msvji2o9hhUVGjNdhzrn0+AbWAwuB0oXrO1JcZGk5HbRdLxQG5TKTv6EZ4YzDcryB5bb/YwbE/V+4Dh5HQcnCgZaTx8fiYVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ny/Y35Eq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ny/Y35Eq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F228C2BC87
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 11:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771586480;
	bh=mlADFL2/DWhCwhbGO29DDwfB21//2slPoxx16AIxgBk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=ny/Y35EqvhqZvCM+7tbcH+quG0erQhEVEisby62UGuOteXJWhTT/qtjqS+qzpdpBb
	 UBvbS+IPI24mzJ8rY0atoJrumQya6O1AoEc/cbitaOmCwLyfi2/4nIzVbBI9JW6BNi
	 wtK0RB2nFi0lnBeXA2bav0bDAjecmWb1nCzhv5EX2MqeaExip9zluL7JKX4mDOmr91
	 q4hWT9RKTDcsVrWliVUrCc7Z+SgxkFY3B9SFWfdEvzZsSKwiTGx0oZMjrcek2UQ++H
	 o+M1BsBVxN4Dh5ZJv0iqmXb0sFX5zkfjltPIP8T4EBOobk9nBs9+E88ta4sz51Oz9K
	 1dMY/V8o7Xp4w==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59e6b736b84so1882827e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 03:21:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX2wa/kpPlJ/nDn62FNc0Aw4gN/eDEPIk5bm0uUk2t3Rzb7/nmbahUIqyLs+QUmlOQ8r389dE/7myL7@vger.kernel.org
X-Gm-Message-State: AOJu0YzU4HCebNatXsVuVD9at69tN125qopVfMjP68eSvEjCc1QmKzLH
	14ntDLs3p85K25yfJhtjDLMWjPavIalUQDrYwinYVlM4rxL3uW8k6hiTvWNOSVVGuL9eXG6RLZA
	1i/N2gU9jfTRt/dhRKXjNZSwGfheID7KQ3Vfzg+dz+g==
X-Received: by 2002:a05:6512:1595:b0:59e:1954:1d3f with SMTP id
 2adb3069b0e04-59f6d386ae5mr7459308e87.44.1771586479101; Fri, 20 Feb 2026
 03:21:19 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Feb 2026 03:21:17 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Feb 2026 03:21:17 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aZgQSJULgJTxOVn8@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
 <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
 <2026021900-trekker-twenty-9daa@gregkh> <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com>
 <DGJ3H078RVW8.28AJL6FR3OKOO@kernel.org> <aZdkN2zje5CEaar_@smile.fi.intel.com>
 <CAMRc=MfcrD8NNh+8WaO_3BYG8Eqoi5wz__s7AeCR=rt1NkWrkA@mail.gmail.com> <aZgQSJULgJTxOVn8@smile.fi.intel.com>
Date: Fri, 20 Feb 2026 03:21:17 -0800
X-Gmail-Original-Message-ID: <CAMRc=Mc6bVxTwMU=O1B3jisxtMoKdEGSFPgtQysNURn4+xeL=Q@mail.gmail.com>
X-Gm-Features: AaiRm51rVXZBfAP7gJs7TsQVEq8NhT9rXCWD9Sls-tb7T2RcyquI25FOFohnpGM
Message-ID: <CAMRc=Mc6bVxTwMU=O1B3jisxtMoKdEGSFPgtQysNURn4+xeL=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Feb 2026 08:42:00 +0100, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Thu, Feb 19, 2026 at 03:18:24PM -0600, Bartosz Golaszewski wrote:
>> On Thu, 19 Feb 2026 20:27:51 +0100, Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> said:
>> > On Thu, Feb 19, 2026 at 05:55:20PM +0100, Danilo Krummrich wrote:
>> >> On Thu Feb 19, 2026 at 5:39 PM CET, Bartosz Golaszewski wrote:
>
> ...
>
>> >> Also, is there a reason why we need both device_match_fwnode() *and*
>> >> device_match_fwnode_ext()?
>> >
>> > Yes. We don't want (at least for now) to dive into bug hunting in a 2+ years
>> > horizon if something goes wrong with [currently] working drivers that use
>> > device_match_fwnode() against the cases when there are primary and secondary
>> > fwnodes present.
>> >
>> > I won't put my bet that extending device_match_fwnode() won't break anything.
>> > And I don't want to invest (waste?) my time to learn each of the existing cases.
>> >
>> > The proposed way is robust and safest. And for the record, I will be the first
>> > person to push back device_match_fwnode() upgrade without a comprehensive testing
>> > on real (affected) HW.
>>
>> Who's got the final word here? I responded to Danilo's email saying I can fold
>> the new code into the existing function but you are against it.
>
> Of course I am not a maintainer, but as I said, I will be not okay without
> proven tests on the real HW. It's non-trivial change as it may lead to
> a problematic behaviour that one may not observe immediately (it might affect
> 1 out of 100s platforms). So, it will be hidden till unknown point in time
> in the future.
>
> I prefer safest way. And then we can convert case-by-case without hurry, which
> is the usual cause of the subtle bugs.
>

I agree, given how many problem some GPIO patches cause on x86 platforms months
after getting upstream.

Bartosz
