Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1093E95B2
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 21:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784840821; cv=none; b=oQ1yMCH0XZgZP7QDVBJ556+GJ7Tn1s2Lczo9GQBoLN7e57orErVnr896N4mqbHFOykohk4F/DVhHhUxofpwp6r9ZCDeuts4ImX+USy9ycLdJ75Ghcf3PNMr8wB8NMp7loAAgCJL8H0SdJ3nWuOnqie5q5p8rLSfaXvR4eBrQAj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784840821; c=relaxed/simple;
	bh=2F4CTL2BzBGbJ/mb1DEXoRCZ8/lHFVULuOlS7x9hEgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/VTGadxZimyH8AQVQUrqqNcuHS9w5nwOal+01hx9MWtDgcVxjwskS90g2zwIlG4A20kafDGGK4Af1O6tCbILOhq+muTgyeIN5bkGP4DRbXguG5XcnJE0cg8lrG/p/8m4jn5XquhB3vTs6ML9DoiyJ81PB5acmfbWrZmSCyknH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XvRQBxeH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XvRQBxeH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182EE1F0155C
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 21:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784840819;
	bh=2F4CTL2BzBGbJ/mb1DEXoRCZ8/lHFVULuOlS7x9hEgU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XvRQBxeHJ8IGuBiyBscGTyUsWY6KjOOQGb5zlp8Cp0CPui9Ga89Hu7h31IKp3nzf6
	 R/fsOF1UN4aubtUh2gnbLcB3LzKLHFvb6EjZtFawsT+SMHNsDMTlSTWgYXTsWiK1ZP
	 X3hs4u7kdJq+axeBzzHRoA9UAHo52fYgQr5QfSYGYz0nArNc5+4QsEiWfmQWWKSNjY
	 y+gl8DZOySzv2/lSRP7qPPMOfnZAL9PxjZfpSuMau4Wlr7mluZHWDhKs8E9RIKL2L6
	 +ULPTmR8ZXESntAhHB8LUM/KfSILpmPQWsTEIfZ5sfkLi7t/x7Ww0k7EG0yPAQsvZG
	 DH7uRdEw1Pn3Q==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39db07589caso8996801fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 14:06:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpCEFeyqsogzAgIoEaf0k0oXjtU9HdZgtuR9tuypJg2WFbsNxsrfrDbzSdCPqNCep2pZMEHQbcMLkki@vger.kernel.org
X-Gm-Message-State: AOJu0YxbIIsR1ds3zlnhMnyQbpJpLKsqwqsHwTpIlW6Lh09L0m908ZGp
	T0dj70yZvLxNO26nkU8h6s0JwiTgo7IcuddcmFhMqIof6DBe6rPjeG9cLDY99XsT83secqZGE5K
	XFdImHEQKYuCO6WQXX+geZa2F/5NUXTc=
X-Received: by 2002:ac2:4898:0:b0:5ae:b0c0:16bc with SMTP id
 2adb3069b0e04-5b2b2f54f6dmr632866e87.27.1784840817527; Thu, 23 Jul 2026
 14:06:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721065802.689530-1-eleanor.lin@realtek.com> <20260721065802.689530-2-eleanor.lin@realtek.com>
In-Reply-To: <20260721065802.689530-2-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 23 Jul 2026 23:06:45 +0200
X-Gmail-Original-Message-ID: <CAD++jLkmuLq0r_mUJQdD_zxgvYsJiDQgFPGm5mkMey_U4oqzMA@mail.gmail.com>
X-Gm-Features: AUfX_myDly8tDD54v3kipn3n2HPbZEMuZ--u4-RvGSKAjf0H-3AkWAXErQ3NZnE
Message-ID: <CAD++jLkmuLq0r_mUJQdD_zxgvYsJiDQgFPGm5mkMey_U4oqzMA@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] Revert "gpio: realtek: Add driver for Realtek DHC
 RTD1625 SoC"
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: andriy.shevchenko@intel.com, mwalle@kernel.org, brgl@kernel.org, 
	tychang@realtek.com, wbg@kernel.org, mathieu.dubois-briand@bootlin.com, 
	nuno.sa@analog.com, Michael.Hennerich@analog.com, jic23@kernel.org, 
	andy@kernel.org, u.kleine-koenig@baylibre.com, dakr@kernel.org, 
	bhelgaas@google.com, o-takashi@sakamocchi.jp, dlechner@baylibre.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux@analog.com, 
	linux-iio@vger.kernel.org, cy.huang@realtek.com, james.tai@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 8:58=E2=80=AFAM Yu-Chun Lin <eleanor.lin@realtek.co=
m> wrote:

> This reverts commit a57e27c43b0315ee86c6896510d69be5257e093e.
>
> The driver will be rewritten to use the gpio-regmap infrastructure
> once Andy Shevchenko's patches for gpio-regmap are applied.
>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
