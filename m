Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A312C43802D
	for <linux-gpio@vger.kernel.org>; Sat, 10 Oct 2026 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791622828; cv=none; b=oj3ksSnlo9cDrwA0GJLm5j+5hBRXRFkuY7oN89X/0PTmMJwmFc3nkLNWoN7OCHEcb2KAJOtAEdUc+caZ4s3M/PUhfnSrFy5oCeIVSblj7fVb0nUJTR2a8fgXKzZPuqSZbqPfPUPeb+Jya4Iq5tixVlqP29APm3osYgbYE7O9avU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791622828; c=relaxed/simple;
	bh=Lte/nsLScDcBiY5yJmbxZYP+brdDPMqwgAjhfLPNHNo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D4xNqEpm3uvZqTG1IxbErBVIQdtHLnQwmbOZBZhWoQO8ReJ557HOkffH2vI+8qapD85GH0jrJ9+utwkze/i03xTfbTHaAbUkd21R4+e2Nst1Scf+OWUHwB4ugARs7O9nupZKPvShclbLdp8iBOjbrpvqh5zNT97N2AHUWz2v61Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PGoFqEvc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PGoFqEvc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FCED1F000FF
	for <linux-gpio@vger.kernel.org>; Sat, 10 Oct 2026 09:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791622827;
	bh=Lte/nsLScDcBiY5yJmbxZYP+brdDPMqwgAjhfLPNHNo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=PGoFqEvcXJKy1sWwaOv9spO53TdvTmJWhnhGPcKpPqI1e3GL2YdbL1YixPIguBzlT
	 uywJXLtEOa7IGThaDUCl5Mmf9T17WAocixGM5WNZg+8IdjqjCdvyFUB3aLiCW78D7n
	 e3h+TpUeJsr81MAshcgj1POPnbWeG5HQgvd5fMv2HzqUSHgN0BUk+juRI1sAC6rK7V
	 NtK3D5VQ0da6ToonJuI8fFy40PwDxAhBqaRRm7iT3FtcCXUZaCMfCO2trYA/cf3jUH
	 DX2I9cr2yzNkqE9hN9qY9thBka5okJyXkQv2FRW+43tsUO0KtEXgWD0LPH6LzB98dx
	 YRq0nUFwPDWIw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a9a2cfe1d4so3901721fa.2
        for <linux-gpio@vger.kernel.org>; Sat, 10 Oct 2026 02:00:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwFN3ykRFxKnfKtVyVXQiTkApxJute+6sD8oZcD6H7V8iZpmpE1v/nE89hmNGICOGOxBVv9uCBr9zt3@vger.kernel.org
X-Gm-Message-State: AFq9FYKdoQ1/mwrkDMu4SrOSNfgR5vCku9haJ4T32f3OMSsIUxpT5Uff
	n5HS9COegCdHDyU3ezQUnhuN1cA9U4C2PdIZHNi2gD2kVmr4t/Y5uQL7rM6+Bm8nu+G+u8A2Mlc
	nEOsEowixotSyn+Z0kTSqSM+Ohwzd4r9LxPem63vncQ==
X-Received: by 2002:a05:651c:19a3:b0:3a9:c32c:fc7a with SMTP id
 38308e7fff4ca-3a9c5703e9cmr10521891fa.24.1791622825964; Sat, 10 Oct 2026
 02:00:25 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 10 Oct 2026 02:00:24 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 10 Oct 2026 02:00:24 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261009-iio-adc-ti-ads112c14-gpio-v2-1-3231a795fa63@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-iio-adc-ti-ads112c14-gpio-v2-0-3231a795fa63@baylibre.com>
 <20261009-iio-adc-ti-ads112c14-gpio-v2-1-3231a795fa63@baylibre.com>
Date: Sat, 10 Oct 2026 02:00:24 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me0drBY+Y25FCZ0wvoisd6+tBEJC=2hMQQuVs5e7vSCcg@mail.gmail.com>
X-Gm-Features: AclHuK8a_63JHyz-XaS5ghUYaXLV9_nnqQN8e9G35Uaw9iRdf52mufk5abPLkNQ
Message-ID: <CAMRc=Me0drBY+Y25FCZ0wvoisd6+tBEJC=2hMQQuVs5e7vSCcg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] iio: adc: ti-ads112c14: parameterize GPIO register
 field macros
To: "David Lechner (TI)" <dlechner@baylibre.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Chris Hall <c-hall@ti.com>, 
	Patrick Edwards <pedwards@ti.com>, Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Oct 2026 01:25:51 +0200, "David Lechner (TI)"
<dlechner@baylibre.com> said:
> Replace the per-pin GPIO register field macros with parameterized ones.
> This will be used in a later patch to access the fields by GPIO offset.
>
> Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
