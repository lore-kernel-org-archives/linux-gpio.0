Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A8E37DE98
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784972535; cv=none; b=QMULQ0s4FQ6ZHjQHsAlaAxgZk0543aNxr0t1JEJTdOEeJ87lIo8EBA01BaPT5sg5m0dVhyYTrE5ATYmBbCDsOLaRTZgkH/JfiLqEAqRnxXZKVACSoMXbRku2ryNXBFHu/hYk7oZ84xMCvr265sa9CvdionVdbC9SmTaIDp/czJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784972535; c=relaxed/simple;
	bh=KgXhXHdNDjIs9WqjAX2BGt6LN2Jw1ld2hDz6UBwkJik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FCBGZbVlWkGyrQ4Mrqmj6IHrrN02O+Mp19SV16nPAE/IfguIkd8ekw84RXwe1CIUQblec/gW+F/tkXQZiLLluheOtR/6gebDJSf43BUsDAnnbuVtm6jd3N6JteTjROpavrVgqpo/btGlaYIF100Bq+szBliiuqOM7zpKrKt54Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GK9xPNyN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GK9xPNyN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28C61F00A3F
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784972533;
	bh=KgXhXHdNDjIs9WqjAX2BGt6LN2Jw1ld2hDz6UBwkJik=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GK9xPNyNDI77zbnFW48PHV6D2CpXg4Giw98qB9IJptK2ER//yjZA5Sg1qvmF+yyAM
	 w6Fx/K3Yt6lvqaDK/qKjPuGGhtsztx4KFZuD1MjVn8o32ev56Q3rMhcnzd1rJHHN6D
	 jdFJxsmeD9PdpDeLHM4yK/z6d3o2/HmOxLq5UQd6z/h8F4o3pdxg5ItSvJNzOJkkG/
	 gEz1MX5QVVgj2Lu11rfqWnEDj7gx7oU/uGsMde1wo5VNpw5DDCPqBfvpA/Zwgm1x9x
	 EUu+OAexMNXpZfZy7B3YI6KNhKvc6TE8f7TX8I0yYCA3v6YRwdfy30nrevs/E+SFKt
	 RufrgbVGCPBDg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeba09900bso862982e87.2
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 02:42:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrovZT3MzDsDbmXYFcxur184QevsS1WH6iXqR5vVZ38ZetnRqckj4938pUWqkBMTPoQzcaNSctinGdm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Cf5n7CduxLiQPnyKqFEz7BOsw2Qa06oM9XP4gy4XucEF/cpd
	ieflADyZwO3T528cDsaQjnKMIc6mDahK0ku0oUe6lOQr+DdF15BdWAjzdnhGL9VvJSaQqJSpdCP
	5sikRRVZSe9r0/7D+vYG0cvou5+7Jaqk=
X-Received: by 2002:ac2:4bc4:0:b0:5b2:a3ad:fe1a with SMTP id
 2adb3069b0e04-5b2c1b0ec96mr316125e87.18.1784972532643; Sat, 25 Jul 2026
 02:42:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260719134548.8830-1-linux@ulli-kroll.de> <20260719134548.8830-2-linux@ulli-kroll.de>
In-Reply-To: <20260719134548.8830-2-linux@ulli-kroll.de>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 11:42:00 +0200
X-Gmail-Original-Message-ID: <CAD++jL=JvB3E==iMJL7QensFB3g_VWyAE6Y9jmGqEudqYbHn_A@mail.gmail.com>
X-Gm-Features: AUfX_myTNsAzbv0OXxc9u9xBOWandAi-UNKy0Lp9hsJ0v0LHN8LESZyFLH3mi_8
Message-ID: <CAD++jL=JvB3E==iMJL7QensFB3g_VWyAE6Y9jmGqEudqYbHn_A@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom: ipq806x: mark gpio as a GPIO pin function
To: Hans Ulli Kroll <linux@ulli-kroll.de>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 3:48=E2=80=AFPM Hans Ulli Kroll <linux@ulli-kroll.d=
e> wrote:

> The qcom pinctrl core supports marking functions that represent GPIO mode
> via PINCTRL_GPIO_PINFUNCTION(), so that strict pinmuxing does not reject
> GPIO requests for pins that are muxed to the GPIO function.
>
> Add a IPQ_GPIO_PIN_FUNCTION() helper and use it for the ipq806x gpio
> function, matching how the msm-based qcom drivers handle this.
>
> This allows ipq806x to keep the GPIO-related configuration in DTS
> without tripping over strict pinmux ownership
> checks.
>
> Fixes: cc85cb96e2e4 ("pinctrl: qcom: make the pinmuxing strict")
> Signed-off-by: Hans Ulli Kroll <linux@ulli-kroll.de>

This patch -> Bartosz
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
