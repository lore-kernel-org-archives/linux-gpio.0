Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAFC48A8C2
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 09:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549232; cv=none; b=D7mTk1D707jrfCoTUtJhW0iP4gFRC2O3Unf3Jbl+LpDVb4VgUlQZHk98gGjwqW2z/p4rCazEw/v8EUYH2VqmweK4qhZj/tZmTAWPnNtoz9Opod0L/RY79x4Ailn3gbr7gJk6FU+JvMKOT80Z4PDpqHaRBVpojfjy+wfdZoJ6odY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549232; c=relaxed/simple;
	bh=FLL0WMGSrVyLr2+WkoJd+gM+88+U2G3SwHYDL1KLPJU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I26lTuSZJ1h504bqs9BMMVYFiFbypGN0aGpo0HCZfcFZIv1b0UovNgBZ0kZs6KjJvF+wsM9FYZbJv0o/X1UWtcpg8LvzA7BMQKqlAuvJwfZTlK/4Ek0j7s9rZE/UqzVYpS6wFWf6CoMEdCU+wiSzjr7CC2mW6qxLPNtUKwhJ7hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzOmu1Gk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzOmu1Gk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7FD1F00898
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 09:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789549210;
	bh=cWZ0gnFqni2scjHvhffjqmPDdUD55J3yKzAKX2hiHEw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=BzOmu1GkRVM3/ktE3WRiWfqYI3camyZcxRiRxjCXzKFOspQ/6Vs72t9DhJUQKXXi+
	 Wvt7kcC4TYDbXzbVKC9hQdcvNyTqk6DF+wg9l/LMYxkUTXZM6g0RsiCmVcsGzcGZB4
	 cQevQfWQxGF6bBQmInXq76J30ut4yzAAM1cGsKzjr70b1U2x0RttOYhHPAKjcLlHOL
	 YE3lWkSSycy5Y9ZL2badIVwwuuNWlV/EXjAJSesVWvJXkr3TE8Stx0GQJZrpgchD7W
	 ZmAn9tRHVusexM30KbmDZ/6MUBTbupseTKRYJg1WrNcD8SZH+ePqeN544cxsgEHGi7
	 Cg32aNDiQhKCA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so690943e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 02:00:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByleI8HvaZfvj2LWUEOR/skgnzk90k2UZE4QX5R8SiyxG56rz8c95cjcGUIP1ro+FD6xLCfl8GoZBlC@vger.kernel.org
X-Gm-Message-State: AFuF++lperRF1B3TOdNT7A/wYXjtRwEGZ9/FpQJJBqq0caFrTgTuarWj
	/B3MuAO3SIBXF+iPVP1ccyOcPT0bMf9AWIi5xvNk1unaHxRdr45sDs8ukRdvK62OY5rEvtMn+t9
	8i9wgjF9OhWyvbOWeCIeAXsYyHJYL9YHfliSUGycbyw==
X-Received: by 2002:a05:6512:3b1f:b0:5b1:5ab5:ea09 with SMTP id
 2adb3069b0e04-5b8b65a355amr780239e87.0.1789549203229; Wed, 16 Sep 2026
 02:00:03 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 04:00:01 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 04:00:01 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260915014447.282121-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com> <20260915014447.282121-2-shengchao.guo@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 04:00:01 -0500
X-Gmail-Original-Message-ID: <CAMRc=McgPQe0x3bWYArqoyprh1ZF9owf3Etop1hqMt67nBXgnA@mail.gmail.com>
X-Gm-Features: AcwNN1Uy4fGyVWvXnyMoCspZKn3z-64iNuKozkP52HeKyvhTgvDXj0RcuM5fHwI
Message-ID: <CAMRc=McgPQe0x3bWYArqoyprh1ZF9owf3Etop1hqMt67nBXgnA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: shared-proxy: track direction instead of
 reading it back
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sep 2026 03:44:46 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> On boards where more than one consumer shares a Qualcomm SPMI PMIC GPIO,
> all but the first consumer fail to configure the line as output:
>
>   reg-fixed-voltage regulator-wcn-core-vm-1p35: setup of GPIO (default) failed: -1
>   reg-fixed-voltage regulator-wcn-core-vm-1p35: error -EPERM: can't get GPIO
>
> The first consumer takes the usecnt == 1 branch and really does set the
> underlying line to output.  Later consumers instead read the direction
> back with gpiod_get_direction() and refuse with -EPERM if it reports
> input.  pmic_gpio_get_direction() derives the direction from the pad's
> input buffer (pad->input_enabled), which pmic_gpio_direction_output()
> never clears, so a pad whose input buffer is enabled at power-up reports
> input forever and the proxy rejects every consumer after the first.
>
> The readback is not needed: the proxy is the only entity configuring the
> line, so it already knows which direction it asked for.  Record that in
> struct gpio_shared_desc and compare against the recorded value.  Keep a
> readback in the get_direction() callback for the case where no proxy has
> configured the line yet, and reset the recorded direction once the last
> user goes away so that the next requester establishes it again.
>
> Assisted-by: LLM
> Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

I think sashiko is correct about the GPIOD_ASIS use-case. I think this is why
I used an unconditional read-back in the first place actually.

Bart
