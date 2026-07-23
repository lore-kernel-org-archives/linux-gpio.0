Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F5237E5EC
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 21:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784841360; cv=none; b=kGebuzJKVCnr3960nStqnFbK/a1mxFONvaf2Wzp8JPIFaCJmRrcuWDGpAtHUycoIjwNoeTrfiGjckIeboocvCnNF4t16lSYuPzeXBt0C1bpPEp3VkVGOFg4u5shTzWAbtYTZhxRcMu+bdj5TOv2y2vS4SjwfeZqc/bg/MEVo2ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784841360; c=relaxed/simple;
	bh=E2T0dCAIXHo2jG9G4QjSPYFVLdp3Oqu8UDxGhPOwgj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fvfM+EK+ycQmAN4nOJAY0jxCbgBWC0t8c6f4JBVSaVezpgQbGtPg5yVkBCWDh9e5lgxKm1hEROuxmO+RCn68+/RwnpERzmgiIOQEkRX/S36ZItnmOM9+DFEhahRUHrpqCbtPyWJajva5EKpXKo9p0+uU3DmyQWJzxBbxtVfyK8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FD93u8n7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FD93u8n7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E231F00A3E
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 21:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784841357;
	bh=E2T0dCAIXHo2jG9G4QjSPYFVLdp3Oqu8UDxGhPOwgj0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FD93u8n7irmmK6nBcty44IiqghI6T+cIc1/rQF3kBnn4rgpRMv81PhFsjIZ+QCaeS
	 RcM+atYTXA4GQNB0senoPhUKbrh7piPTbVspCiyn4cE8saN/EePvjElUPf53ALbuF4
	 trdrEBkXDN5Qr7Rwf+6marDfSnTZ5/Kvg2s8uPKD3H4HMUypC1FVSHZr2E1qd0nghJ
	 VoOjUBOfYIfMwOhGPxu+DXssc8RJcddZZ3zNv2kObApwT+Z2mU9mx+DwxQ/IvIBMsV
	 Y3HpDvZa6+zoUOZOUJ+gzqweR9P/rubNEl8SgkOIu0ONhf2i48ugcm+UDjmInqEYRd
	 wOWwe0C2+WwnA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b021916bd3so1110184e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 14:15:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq8Hj29kNOyYlmKLjwejUhXFgDoHnyLoXWoIxXmap5IIHeHHMUCyj3uUJ6eV4Hna14NsUCryu61Um/3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx169UFlPFKHfaOdESIYqgObWh5wgCzBlT/8cDhb94GR3NXtUgC
	AzFAkc+JXX98SShiAlgo9IgcGa4G8LS4B9YOHq59NAjmZCwc2b+UXs0zW7ekFQ1eB3BfTVqGgHP
	HOvdiFcnkn+GJ67Alp2TnDYLBcjqTNIU=
X-Received: by 2002:a05:6512:3903:b0:5ae:baa7:5ed2 with SMTP id
 2adb3069b0e04-5b2b2f7bd29mr705054e87.63.1784841356159; Thu, 23 Jul 2026
 14:15:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723034237.2501507-1-eleanor.lin@realtek.com> <20260723034237.2501507-9-eleanor.lin@realtek.com>
In-Reply-To: <20260723034237.2501507-9-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 23 Jul 2026 23:15:42 +0200
X-Gmail-Original-Message-ID: <CAD++jLknYEo2juD18808P6a4Vh=daD+fr0HK9rLAXEvZDbvNPQ@mail.gmail.com>
X-Gm-Features: AUfX_mx_gP7nWC8ssHs4uG-WQYoglupLaQk9OW-tXAcKjj7YksEdlf-lh5_zyEs
Message-ID: <CAD++jLknYEo2juD18808P6a4Vh=daD+fr0HK9rLAXEvZDbvNPQ@mail.gmail.com>
Subject: Re: [PATCH v7 8/9] gpio: regmap: Add IRQ enable/disable helpers
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: andriy.shevchenko@intel.com, mwalle@kernel.org, brgl@kernel.org, 
	tychang@realtek.com, wbg@kernel.org, mathieu.dubois-briand@bootlin.com, 
	nuno.sa@analog.com, Michael.Hennerich@analog.com, jic23@kernel.org, 
	andy@kernel.org, u.kleine-koenig@baylibre.com, dakr@kernel.org, 
	bhelgaas@google.com, o-takashi@sakamocchi.jp, dlechner@baylibre.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux@analog.com, 
	linux-iio@vger.kernel.org, cy.huang@realtek.com, james.tai@realtek.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 5:43=E2=80=AFAM Yu-Chun Lin <eleanor.lin@realtek.co=
m> wrote:

> Add gpio_regmap_enable_irq() and gpio_regmap_disable_irq(). Since struct
> gpio_regmap is opaque, drivers cannot access the embedded gpio_chip direc=
tly.
>
> Reviewed-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
