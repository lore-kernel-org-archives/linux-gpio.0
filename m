Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7422B3B1B3
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 14:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784988084; cv=none; b=p2g3gHdceMgX3KUU9VfnCOg+j9ifhVvrD8TswluRQ3+C4Vh7Um54w/Bqphr3s5jGqXq7vLcfuJ/MlOLUUQkby0taOZfUAMEiqBVzVmpLlEFlqhLPJOb14tcn3sliHHkOZZ3/Umr9OOAUM9q3snBBsBov4mpbKeNp0vl/PvwQyiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784988084; c=relaxed/simple;
	bh=6tn1Q/Wj3aDwYdlGYgq8XLavZnFGLNOhHSrv4GYrFGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lmo+qQHNE9AIMg+Ne1zz6wzO1q0rVcWTOaWPVcyEt4F/3E02+5f/2yHdsML3pMG0Sp1LQdcPLAxn/Qfn2+LHElv8BsJXM1y6Gat00Yv7jnoUUEA6nGWyeKMbOtUHz0Z6V1chOx604h0sUYt2t6d+eXly1OZsEfRgN6Vhk/neG50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bx5gH0fw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bx5gH0fw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D25A1F00A3F
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 14:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784988083;
	bh=6tn1Q/Wj3aDwYdlGYgq8XLavZnFGLNOhHSrv4GYrFGk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Bx5gH0fw88rLPnxGO163Xc2AJanu68v9Q/m3VidHAdv6ciItiNVScFnVDq6qZlhot
	 sV35PrYFIDpY41Ta+a0w4XjQetIP8DL4Qr8+iVQUZQ7VD34Mmf4AxpOaRKLr0eH1vU
	 xEdZI60B5kPwqSKkQ2oVQGi0FoO8nhmuFLC3Z9a0khxW+ThaYh2lRQnr44mYT9vJa4
	 ypGJ+MAIplCJ7qTADVKSMVGnIF50Eralyqo08hHNY8UJBs+8iJF/xa2CfMsQlbC/Gl
	 5DZ5lHKPvUGA8cFpcvbXZPCsQ6C489zIfM6bzaSXY9ZUVx1plHprdyD9r0s6y1854u
	 TFGLHDGCj2hQg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b15dcaca31so1242656e87.0
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 07:01:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpxxeE/4CcD0yLHgj66Leopqxx6WbMc80ircFKN54vN1Pd+45ck9+gGOiEEQgD0j3+hKhaMxd64Qeja@vger.kernel.org
X-Gm-Message-State: AOJu0YwJUN5E/CFdMQds8eJvTiyFh8akGemO54xszjt/RjJhJHbhYzH9
	3f48edij+LYu2IkF9XSnS1EEJrJwIREN3JcVOTqnIO0Xjf5/blfuwdZyp9kMQiJ8VOjJ2fbKdFf
	BqfMMnyR2VTqA9xsy/03sK2BQNKdlmdg=
X-Received: by 2002:a05:6512:3985:b0:5ae:a81f:c1db with SMTP id
 2adb3069b0e04-5b2c1afe026mr398244e87.13.1784988081933; Sat, 25 Jul 2026
 07:01:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-gpio-pinctrl-output-set-val-v2-1-cad55d025636@oss.qualcomm.com>
In-Reply-To: <20260724-gpio-pinctrl-output-set-val-v2-1-cad55d025636@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 16:01:09 +0200
X-Gmail-Original-Message-ID: <CAD++jLnku_B6bQobBZ4FR1WFXW0i60YDTiZYrObzeHaTyee3Sg@mail.gmail.com>
X-Gm-Features: AUfX_mxqgzbL6Y9B6rrkApNSg4Hl7FF00WDCcjenLBMe1pFBdkzILluopip8z14
Message-ID: <CAD++jLnku_B6bQobBZ4FR1WFXW0i60YDTiZYrObzeHaTyee3Sg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: gpio-by-pinctrl: Apply initial value in
 direction output wrapper
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>, 
	AKASHI Takahiro <takahiro.akashi@linaro.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 6:43=E2=80=AFPM Alex Tran <alex.tran@oss.qualcomm.c=
om> wrote:

> After successfully configuring gpio pin as output, set the
> requested initial output value via the existing gpio set
> wrapper, so that the pin is not left at its previous level.
>
> Fixes: 7671f4949a6c ("gpio: gpio-by-pinctrl: add pinctrl based generic GP=
IO driver")
> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>

OMG that's an important semantic fix actually, thanks for
finding this Alex!!

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
