Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276673B14BD
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 08:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784190922; cv=none; b=oUPyMHxIOgUxnAEbuTnkjsx2maemGoSwIbtFYkBsp3go9QYFLn2DJpT3NoQm9CxC766skURx+UWybAWjNnXkodifq2JCrwkz5MOg7qtiXaHjyPh896nV4v8MgBiHutNMVRLAWBKPA0swLPHg93obvQImo/utRFjkZKLO7DlFHkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784190922; c=relaxed/simple;
	bh=2sc6SQK2x/pqdv8t7O+ZSeMRS7TeIEBv6JLo3xn8qWg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=urVz6xyLvSJ6/DtHzjLINPoN9o/+x7iJUJ/rQdkSeEE1NytZoy6HL4XRmXjBVc7m2FW5+fZT7SMbvKL+zCEqjI8dm3JnUSDigucivH/bA6w0qyBGH/sY/cuQXjew7MbVR12uTjtHlJD7bHxmWwzDQwJaKhMrxx14JopAYmK5vtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iwikwd8P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iwikwd8P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C972B1F00A3A
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 08:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784190920;
	bh=cfhCmtOPIfBqoa/lpSkrNdO1L6fdhc0pXDfJ30oOg+E=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Iwikwd8Pj74xmwetZz/HeFCUwVFGhUECaXgFbsArhu/YNNvp06v0RmGXaaB3SRVCD
	 IIF82vi4AazkY/JXKw8C0YlrLrjHcdXNnRzo1ru9L4sSrleADaYdX7bQqqMFKJZe8X
	 il8mcvh/Tsdq7+peyGKUiSe8s0RYsE1f1B3u29znAmMbWHhIzAmgOqKwQrKzzdBcAH
	 SkIzi6QlCpFoQgnx+Dd9jtL6QyCD4MYvwfMNgbLsGdrh80/98amOwWBD2l9RqfD6ON
	 QTmChoPgIXFYMmE5WMWpkl+pfIXFfiehcVbipgL768zKJP7SBmTBGat6MwkXDhu17Z
	 yHkTomdgyalXA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb5e85378so6830514e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 01:35:20 -0700 (PDT)
X-Gm-Message-State: AOJu0YxDYXZiaMjRfevDUKZE8En4srlpdnh+q8wt+1gwPYB7ice0kuOj
	g16OpuJ7BekuR9QJtZo9kZt6uMmIATKcrqIJqijMIcZatI/bQq3ApYdQPg0O+B9oYw2JxJA9P71
	4MRxOTR7WWvd5/X3dVqICz/i8B8ZuA9tcnBbjTaYrTw==
X-Received: by 2002:a05:6512:690:b0:5ae:bd4d:68c8 with SMTP id
 2adb3069b0e04-5b159b874bemr1940056e87.46.1784190919567; Thu, 16 Jul 2026
 01:35:19 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 01:35:18 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 01:35:18 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aliWiN1EaGziNZ7f@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715192415.1326037-1-andriy.shevchenko@linux.intel.com>
 <178418869936.4524.15759697748852640442.b4-ty@oss.qualcomm.com> <aliWiN1EaGziNZ7f@ashevche-desk.local>
Date: Thu, 16 Jul 2026 01:35:18 -0700
X-Gmail-Original-Message-ID: <CAMRc=Meen-m7FohCe-uU89R60SNU=gJFXkwpBjpTZMw+3+1b6A@mail.gmail.com>
X-Gm-Features: AUfX_my_j_Q312P_LooebQPF3RGC6_SYrEi9c7Hi52ACzGULuQkHeMdHEJCUk-0
Message-ID: <CAMRc=Meen-m7FohCe-uU89R60SNU=gJFXkwpBjpTZMw+3+1b6A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: legacy: Kill gpio_set_value_cansleep()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>, 
	mfd@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jul 2026 10:30:00 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Thu, Jul 16, 2026 at 09:58:42AM +0200, Bartosz Golaszewski wrote:
>>
>> On Wed, 15 Jul 2026 21:23:30 +0200, Andy Shevchenko wrote:
>> > No more users.
>>
>> Yes please! Thank you!
>
>> [1/1] gpio: legacy: Kill gpio_set_value_cansleep()
>>       https://git.kernel.org/brgl/c/aa4bc3b7d36d52caf7c3d3214ae4ce96d609e8c5
>
> Not sure, I put in the comment that this should be part of MFD, otherwise
> the one driver will fail (the conversion change in MFD tree only).
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>

Ah dang it, should have read what's below the commit message. Backed out now.

Bart
