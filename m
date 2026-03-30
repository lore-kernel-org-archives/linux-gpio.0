Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F2F3AB285
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860400; cv=none; b=K8qE5kF7WO5dWwlfBGckmU4f6C81d7Jb7Vwmojele86DQjE+FL3iKxxwgJ2lfVJ+Sol34ROnjP7R2tbMm5jhWt8bk8r6a7ap0H9MZqDewpyhZqlWtOMPuEQpr1MWR74criW7ArIWfbSbJkY5vwXJAgkeG+wTOSY7gsmGjLLa/rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860400; c=relaxed/simple;
	bh=+bucZ3/aTkMDLJSej59VmmTZQuxz6M5KA6VU55Qxlo8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cEn/aJ8pYNSRzdLA+UuAdg0N3l0GFdetuwtEhbLjI5mr3RVl3xpC7PA/J80qPaKEIFfLSxxwm0bFW1kL7mD5Lh15W212T9LUVzAYlicIpEuUNMwE+lp2cL4wh3e2VmvFw6+w1f4UGUGkkVSTL7snsX+uj6lshz6wRQb+NAxzOhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X8LOb6tH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X8LOb6tH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF88C2BC9E
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774860400;
	bh=+bucZ3/aTkMDLJSej59VmmTZQuxz6M5KA6VU55Qxlo8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=X8LOb6tH+hKel35d4IrcGfzYYx/V0hG9vnSA1WgagUN/NVDxuOCruR/W5FP++gBq1
	 J8PKT4K3hZbcQF8I5nC6HI2btBPf5Pvsgb7a6RqAm0wAfc4ekv1/U79zIYY4P4xGai
	 utUe3xQ0bQqXWs6Nl9S4eH2vHQ3t6xboTIgEp39iypihNhAbFzEcNrbpgx8xkQMNAm
	 CRHWOJwNGvXYkrVtwahTxmFc4VsgPLEbZY0jawaCKnVdA+fKriFFP1qySkKJa1D6zT
	 OSZOKvX6gSIb6KA3luc/QwDm/VR9+Gb1pnR6WBHPw9QD6USH2aX8CCS0hPY/RwQVON
	 8JPYYdx/gFI2Q==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3870778358aso28052251fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 01:46:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHFczy2EQd1rCYPeLoL9mvLihSFQZa1g3+NSsY1EoeljQWhvF3eXfuzPhH5TkhY515bipX6i8aITxQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwTESXDQPe0t+PGpJ0AjFea1ChAJJDJL7kJBmYq6onsQoyPlffq
	CeM26mizikfgcfaky+nYB4fm4pnc0qglSymCegdQUFur4D513wNB6jcIR57uT2Mtzusl9eRANr2
	ozi4jnNaNCLBrfoVuqc/VncL/y7bcrsPibfm3nvoyFg==
X-Received: by 2002:a05:651c:2129:b0:38c:6bf6:5b8c with SMTP id
 38308e7fff4ca-38c72c52112mr38402191fa.0.1774860399039; Mon, 30 Mar 2026
 01:46:39 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Mar 2026 01:46:37 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Mar 2026 01:46:37 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260327-mfd-si476x-v1-1-93298ca35d6d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-mfd-si476x-v1-1-93298ca35d6d@kernel.org>
Date: Mon, 30 Mar 2026 01:46:37 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfbzzafKC2+DQKCPnRCTygWkyD+WLwLzQPw=4AOE1Ds5w@mail.gmail.com>
X-Gm-Features: AQROBzCO1m8kStBtkEKNmxG1EjE4dDRhDRFCZlFvdFiHUZi38hfpjZzLnGovyBk
Message-ID: <CAMRc=MfbzzafKC2+DQKCPnRCTygWkyD+WLwLzQPw=4AOE1Ds5w@mail.gmail.com>
Subject: Re: [PATCH] mfd: si476x: Modernize GPIO handling
To: Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Andrey Smirnov <andrew.smirnov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Mar 2026 09:37:26 +0100, Linus Walleij <linusw@kernel.org> said:
> The SI476X driver depends on the legacy GPIO API. As it only
> really use a single GPIO for reset, and this can be easily converted
> to use a GPIO descriptor, modernize the driver.
>
> The "reset" GPIO is obtained from a device property, such as a
> device tree ("reset-gpios", which is standard, but this hardware has
> no DT bindings as of now) or a software node for static platforms.
>
> Out-of-tree users can easily adopt to providing a GPIO descriptor
> this way.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

You could probably simplify it even more by using the reset-gpio driver which
allows you to use reset control APIs with the "reset-gpios" property. It fiddles
with GPIOs behind the scenes while you just assert/deassert the reset.

Bart
