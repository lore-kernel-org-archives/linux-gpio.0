Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08193D649A
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 08:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784190940; cv=none; b=SD0Ddb2o42Re71DwbPoZqHNYQMSkpoasvY+TInHdjgVha0CibnSZBC9lRiLWX0NFR6ULGCcW8MkfY9D2kJsTDV3pUJqvNcJezegJIjlf+D0BTB+mXa10eQLeBRbuIT1cI69saHZFkINKN8VM4x+yu/O3hbYlxDnE3ssGtiNYLNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784190940; c=relaxed/simple;
	bh=ES+S4L0q3Y+siuX7sJHS+NkfNvRFeWV3XRzgl2yzM64=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dgdC5F8GB7Rz2mNcaMI2NMIRA+TR+2HRsDLjrxLs5acFcP27aj8WsYmOOhxq1tz/DQB64Q7lxbYQXyOX56Ho57VOLVf9G9dlz4GV9AEeZgYLAE9UDb8nX/aztDi3VpnAZ63RT4kAAnv4BVr3PpxIVSjuH1osiVWyNzF34PTTkAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DgzRHVTt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DgzRHVTt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A8C1F00ACA
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 08:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784190939;
	bh=ES+S4L0q3Y+siuX7sJHS+NkfNvRFeWV3XRzgl2yzM64=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=DgzRHVTtqbJEZTsIRBKgr75pyIXTEFQXY1hZA3t9Y9Z7KAbzOBhViWkIC4Gm00Pzb
	 Z1LqHJI1eDmCb/Nh9yht+zka2Xqui8Oge0z866pGg2vY2AtBwjoxSPxOad4I1nMWgZ
	 9hz7rSDxVoskq/1xmrpqIkNN/CUiQntfehveiNP99vwJc93LqBtWOuYZh5yLGpwIaq
	 emuDV7sdLWgf6CMVa/vma+yH3RXuy+fxEklMmiHb/BvheNRRGOqnh8BNwWWKXKEJ65
	 wC/9Klplb6S25tCQbcTOEXZDTaQ7d0dbhBa+wE3+DOmWbgaVqwJ9eifYpZ+BzMSbaC
	 JKZwiKz2DhXDg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c94fccf3eso37403731fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 01:35:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrNKqMs5PUBvuN2qy9vCi2h8V4P7ZJHRAxbRbj2s1Th9SZvFRhL2cVshIR8eOzV7PVB83MJmVbd0ont@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ3I63HF+v7wkQQxJsbm3fI09qR7C6zKVl5rzlvuZpmiu6b9O0
	FT9eJ4UYkcTQKSZOqqQEKEsjNL8cpGnaQ1GBBEIMErtFMDgyvhEeBWURpWrgXjT4HkESHTea7Lq
	P+XBN9X711GAYiMRUQcmepNOe4ghXtK5AxgEHmj4LQQ==
X-Received: by 2002:a2e:be8f:0:b0:39d:b5b9:f0ff with SMTP id
 38308e7fff4ca-39db6bb6646mr12898421fa.9.1784190938382; Thu, 16 Jul 2026
 01:35:38 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 01:35:37 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 01:35:37 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260715192415.1326037-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715192415.1326037-1-andriy.shevchenko@linux.intel.com>
Date: Thu, 16 Jul 2026 01:35:37 -0700
X-Gmail-Original-Message-ID: <CAMRc=MefmKSq11Ro39bo0mTmxS8Y0SEy=D-VoCPXw_1EvtBDdg@mail.gmail.com>
X-Gm-Features: AUfX_mzzUnu6luY_O35STJfNOdQkPH3rmBGMboWmpu-6xPhUMPNEgRGfb2D7GNc
Message-ID: <CAMRc=MefmKSq11Ro39bo0mTmxS8Y0SEy=D-VoCPXw_1EvtBDdg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: legacy: Kill gpio_set_value_cansleep()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>, 
	mfd@lists.linux.dev, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2026 21:23:30 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> No more users.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>
> As of today must go via MFD tree where last user of this API was
> converted by the commit 62acd2babc1d ("mfd: si476x: Modernize GPIO handling")
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
