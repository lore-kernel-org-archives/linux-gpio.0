Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D68B33B96E
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 09:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590855; cv=none; b=IqRlAVN68rw2ibK9ywWPeFT6h/A3nK+tziO9OfxK67GQUYhx509xH2B/aiR4SRpGKlqM9rzklOkXqPna5pN+nZFnFDYnjGnha3gZGxoXO3IGODwm5NRMBbMj7nTgh9ELwwvk34g08hjja/7Pw7vAyM+jTUajQayq+NXq8tl8w3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590855; c=relaxed/simple;
	bh=YkYiwZJ4ojXAQuS02Y+mHBCwUemZk4jG0C5zsxDwbFI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OqGVFlc1JnvhhfGaZA11e32rngMUQJxjjTDxghOGFuv5hhqbPLt96vD11OzURE9gDAa0XxZ6E5kbf7I25aMm0NLFX86Z1X+F/O/vjxa9KAhG+Z5X7uQ8lwSRHVxWLGDs5PSmiAkBo6a1vokRWO2+V8UC8z3pPNEXUvqobJsq3lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAZsYk1i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAZsYk1i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C53C4AF0C
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 09:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769590854;
	bh=YkYiwZJ4ojXAQuS02Y+mHBCwUemZk4jG0C5zsxDwbFI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=TAZsYk1iDwiIXE1+QTMCZ5wTmf52LhyFDB8E1NesOAaPATcumQmx2lQw3q7HRdUDl
	 Z+sLIdwg+wSsypMtmQPsvBH1b7nmJDZQJVCgsGDlA9Y/vUXjnrHjva6TS7Ne4Ukz8S
	 1v8pe+jCOw/3FIcVSMdbA7v3NTKxnrp0VuJMYcVRewi1dI4VMD/0WoHDjdsJhOSrYg
	 Ul/mslh3AudBrpu1CmUWEozxXpI6xraeh9goF6axkVqHUiKUpzOlSCjZFFVgqvGYzP
	 JEp+4GfdcWlueYIJeoys85m6vnkrAWXc1/iIAjIoz31JNC1nPCrm+Fs+i6dvq/kruz
	 8NeSPZzd/8fkg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59b679cff1fso6506144e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 01:00:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWFEolSf/R1BlCHJkD3SttBpQlGM4GeYZoLaE8LIrUTS6uZ09J3D8HugNPVQaDcggR0iwtxwoJxQGSP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz21rTHEpzM9serY2tF7CQnG02Xygm3De0mtuFpLKkWld9OcuwI
	Sz6hq3SyWhdW3lumBV4KZ9MR8Gk+vB47SZ1IbKRDr1eDg2wmLYORS+e/LWgzaElY0uGtZBa/Fsk
	LY1a836ZiB0KuwIj2XCQPRzjZNNN1lCWDoi5vqPrR8w==
X-Received: by 2002:a05:6512:3b97:b0:59d:f71d:1efa with SMTP id
 2adb3069b0e04-59e04034c72mr1898225e87.47.1769590853533; Wed, 28 Jan 2026
 01:00:53 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 01:00:52 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 01:00:52 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260127103325.3925173-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127103325.3925173-1-andriy.shevchenko@linux.intel.com> <20260127103325.3925173-4-andriy.shevchenko@linux.intel.com>
Date: Wed, 28 Jan 2026 01:00:52 -0800
X-Gmail-Original-Message-ID: <CAMRc=MfraMGeuO7PBgEBaDQDd-mMk2HWTGx5KW_RczLuae0_5Q@mail.gmail.com>
X-Gm-Features: AZwV_QgzYEB-p2gDQDkFLVB2gsO13yEVklP57u2_diTMi53GncC9pVBMOHbPT1I
Message-ID: <CAMRc=MfraMGeuO7PBgEBaDQDd-mMk2HWTGx5KW_RczLuae0_5Q@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] pinctrl: core: Remove duplicate error messages
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Philipp Stanner <phasta@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Jan 2026 11:32:08 +0100, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> pinctrl_claim_hogs() is covered to report any error via message.
> Since that it's not needed in the callers.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/core.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index ebf803bff867..342bda2a1bd6 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -2187,10 +2187,8 @@ int pinctrl_enable(struct pinctrl_dev *pctldev)
>  	int error;
>
>  	error = pinctrl_claim_hogs(pctldev);
> -	if (error) {
> -		dev_err(pctldev->dev, "could not claim hogs: %i\n", error);
> +	if (error)
>  		return error;
> -	}
>
>  	mutex_lock(&pinctrldev_list_mutex);
>  	list_add_tail(&pctldev->node, &pinctrldev_list);
> --
> 2.50.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
