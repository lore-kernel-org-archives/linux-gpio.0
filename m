Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C83C3290C7
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 20:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783111956; cv=none; b=DkDUNJoy5w/SrPs9a+bM35hPfDVdESkLKghlou2Ye+zuNDgYH6caotNCZ5eqZotnhludmhTwMQbifSFcGwja34sjj9uh7cidOT1day8dV7zRddKxVJ41tXKuNWTV3lqzv0Rb8pt8jKG2hK2T8rUE5DTqE5riQKePwKT3X0TtJb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783111956; c=relaxed/simple;
	bh=wt/Y/VBm9jQ8oZX05QzsWI0VN0tfpEpyiUq27wvdn3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lmH81tjTsfUsboxhbb+3icKgjk1ha0Hi+Dn8YKfWo6O2pj5IRypxjVasFjypKMvsY1wkt+7gUkonJGMWB3m7mvI2enhJbl0kqwihpXmnISAs8L/AbPmPZWJTHVtfp6x8j4fVz0hXdq2YHY9mA9JiL4RSNGSt2DU/SMLtzCuO0cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQqbJ/YG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQqbJ/YG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A79431F00ADE
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 20:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783111954;
	bh=wt/Y/VBm9jQ8oZX05QzsWI0VN0tfpEpyiUq27wvdn3I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VQqbJ/YGUszFi58UHxDRg4+gv/EeVD3b4/nifpk+ZcWTg8vvTdFywW/SEJbXkHUBa
	 pc39pjtcW5oGImGPPQVPdAIhc4U0J/0Yz/KrCNmqc+irf08F+bNcCfb95jh87IElCt
	 1BhYtgBqvqfni7ppV7QDC6C4fTJv++6HAWYFJuMneDRmB5V/IBk8qc4JNGBqR4g8/o
	 OSccClfsd8ZrfBQ7v4+c2pEdsf0mCV/anK/uqWxwT8/FliVLzg6QHeM8jsbzgm6iKC
	 VguTeR2z3AFhmb4nj7bGniokps0VlBMm0LmOozO6g7wdf+K9BPvBs3qmRaehxhS4FJ
	 uaRFsJzP7fF0w==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb8870485so1141292e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 13:52:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrmlP8+i30iVivxJk1T/niKWv4wuTod3jwbi560QaWlfeXJ9XRjpX5s9nweva6jtLmbwiwqnH+nwDEk@vger.kernel.org
X-Gm-Message-State: AOJu0YxnnFnp1xzBdUeK7/UH8JyThNgFBwOyOwkzDXoeZWJklv2cY0om
	i/9CiQA73+gdKhLPYB+uNTLh62JSHv8OskwobaYWTwzurMotJzEvk8BbcvAmrrCDRmFkgudKln6
	2PmU9dKR/b5fm+qa/wYdoqp3Woo5pCxU=
X-Received: by 2002:a05:6512:39c8:b0:5ae:addb:d657 with SMTP id
 2adb3069b0e04-5aed509e880mr90216e87.27.1783111953486; Fri, 03 Jul 2026
 13:52:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702130903.1790633-1-andriy.shevchenko@linux.intel.com> <20260702130903.1790633-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260702130903.1790633-4-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 22:52:21 +0200
X-Gmail-Original-Message-ID: <CAD++jL=6+WzWD6BOMN8eMX1TpSQEDerWbFZ3NnNH5rJDDH-zSQ@mail.gmail.com>
X-Gm-Features: AVVi8CcaFsE80zYcabnTKlRzOWP_CGfHj72Ym9koD8-F2yo-TYXMGjIKbc9_z5M
Message-ID: <CAD++jL=6+WzWD6BOMN8eMX1TpSQEDerWbFZ3NnNH5rJDDH-zSQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] gpio: regmap: Apply default resource callbacks for
 regmap IRQ chip
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-gpio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Yu-Chun Lin <eleanor.lin@realtek.com>, William Breathitt Gray <wbg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 3:09=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> When GPIO regmap creates an IRQ chip on behalf of the user, it also
> takes an ownership of the respective callbacks and driver data.
> With that being done, apply default resource callbacks that keep
> tracking the IRQ requests and releases.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
