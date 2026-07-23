Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991FA3F3295
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 21:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784840992; cv=none; b=OSkg8du2BWZee4NIL2LdB3wxQ8v7NZEvzVdpqoYgVB5X0hLJ6N8bbJkogpZ3ODAWQpH59PS6/Lpr0a8Forq7B2gNXhm2qOMxEwWIKibnpvIbBg7XdbJ1GSPrCOYV+dESgHByGYvNvarvKlkGqAyVgu6x5ZhlmvwRkEAWfvoKVts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784840992; c=relaxed/simple;
	bh=4J5N0YZV1iz30YOO1gIgcHIQ6SOp8Ckaq7AMkA0T4PI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oiJSBx+t0oNWk7tEvX27pjyFdTALyHVgI2jrYd69dwNIBLMwUl2cwEqsPzTiDiASTz3krsj7zGVdMOeTygCCurMdW7/xtbXS4De1R1/OBBd2axEU7CHzCFJEFAok3iHAVYBKae42TPh23Oxza4T7UmvuPJu64Vw+0R9HSj9VOzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SzxVQI7U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzxVQI7U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A271F0155D
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 21:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784840983;
	bh=4J5N0YZV1iz30YOO1gIgcHIQ6SOp8Ckaq7AMkA0T4PI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SzxVQI7UCBLBCrISBQBE8xxgFPi4ed+v8qaJuSayLta2hQO776kFTPdIs+uzEJJ7y
	 nFASBpUINOwrNIqw+OZuLuK4gHHG4jShBlJvsz7+TpNesDDItOSuT78QqKOCetCcmS
	 FoGampk5VE3uV6UsOyAbY+er12rOHinm3MYQ5Ws0LskhuO9VDby/MfXIgQw62RvDFP
	 TR2yYD0ovD/OEYBb6XCBJnGzIU5DTWG3M56fsNRSFU5vlvfsDv38ar5WMBmwuU31nQ
	 o19Vb9uIV5GMq8q7Nwk9n4zAzzz2blbBdHX5JWWQzKPKW3jaIZ6zn4HY6V6JlqrPTM
	 zVUW669SvJ+4g==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aec201b582so1111022e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 14:09:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqM1aH9fPj3uiGGs1ACT0Ob2djdFlPbGzKDVN1uj1cLC6zy6dvgHLDWLyfxTUG5VK66smXvGeIp1LM8@vger.kernel.org
X-Gm-Message-State: AOJu0YzNwZCD5dVF8aW/VjUKbCE+AqXvY4ztjH0A+NrXaTIevkaHB3qs
	DRncBHlDrpgL5saZl3Euecm5dd0WGr2+20JF0HQ8FLoBI7pq24nm1b0NrtPd6LC9LK0QJYRrqSs
	o5xdq3dfKHlV43Mr7Jo+X02lgMu3IQCU=
X-Received: by 2002:ac2:5dc9:0:b0:5ae:bb52:b09d with SMTP id
 2adb3069b0e04-5b2b2f79145mr647594e87.52.1784840982582; Thu, 23 Jul 2026
 14:09:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723034237.2501507-1-eleanor.lin@realtek.com> <20260723034237.2501507-2-eleanor.lin@realtek.com>
In-Reply-To: <20260723034237.2501507-2-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 23 Jul 2026 23:09:29 +0200
X-Gmail-Original-Message-ID: <CAD++jLmQT46c322ok_0mQ+RP414kT=Qj-sERiWUmcpLHLD_abg@mail.gmail.com>
X-Gm-Features: AUfX_mz01SGpVJmxsXcMwwqmSBs7gpLdKFAKXFcbcmIUyM-ozHTxM5lFVLt6VDg
Message-ID: <CAD++jLmQT46c322ok_0mQ+RP414kT=Qj-sERiWUmcpLHLD_abg@mail.gmail.com>
Subject: Re: [PATCH v7 1/9] Revert "gpio: realtek: Add driver for Realtek DHC
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

On Thu, Jul 23, 2026 at 5:43=E2=80=AFAM Yu-Chun Lin <eleanor.lin@realtek.co=
m> wrote:

> This reverts commit a57e27c43b0315ee86c6896510d69be5257e093e.
>
> The driver will be rewritten to use the gpio-regmap infrastructure
> once Andy Shevchenko's patches for gpio-regmap are applied.
>
> Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
