Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6754E4C24
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 23:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791934669; cv=none; b=ZHMsp53cK+KL+NsS0sLftYoMKgLHJIqGCTFhmCIKdBaWHDGEh6vpNSss0UDhS8msqEAxyza0CqHD8ST8w6UBGA1pwJ41fNRnKmKRHyP/WgSSEkS+RIqbOrs4kgiJ0rCK//WvPHT0AkCDE9gERWYm1aP5SOMVBSbTr9nuaIYjGK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791934669; c=relaxed/simple;
	bh=NRYL7unWirl86XjxWCIqaCAbuQfLBqkk+D9GKLD5pWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k/OlNmhJyXV8k8jozl2DlIg/PyXfq/nvmNL29Ad5cbJ3qfTrJV4cX5nfc/pEimARKH+E8b92Am8kTtxrpSJ09K+5gPdNecfpsD0dcLoPwkpZXiPEMmQvVTecg44UA5Lt/GM4X4D3mRME2v46nx/FIRF1xaoFtdwLYlOblurUhTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QoqZ6dxe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QoqZ6dxe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B5FB1F0089B
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 23:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791934665;
	bh=wiNbuPmyHWvBDHH4TW2Sjy48ZttxSv2iyqaxH8oE7rE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QoqZ6dxeYqGlPOIJat6pK5YMTTV3YTmEo3O5ZvSlYHMd2jbkMyWMXEc9EeCYwxXYP
	 SNs3OR9kY82yBuz2xQG6HyB61dkjVXw3q52Hur7ulfucGANvW57mi5Es9FXSum4vLS
	 R1jE9ExOCHairEE2iK/vBAufAtYJ32IiD7MzbDC8HEY1Q75YaIW9Itet9MFtm2xICF
	 pO5Xw+NEd/IPnTqAEgI+KkWZxoeHZyhriOz6yzoTntwX/gzuW7CsY4V7t7JJiZraCM
	 6A1HdIJIs1USLZvuza6wmhZvm6FEe+/6/5l4vZ+fP+RDm6A60MToCoTzaDRI+L3Icn
	 XHy9Y8rJ1ulDg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso4484555e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 16:37:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwQJarrut0fvvN9oL7wCdc0/dEhPhuKzxgJNFdO2hOqHOqCxz5HXoKtOhHBUnEnmgr2yhPPWm2r30LQ@vger.kernel.org
X-Gm-Message-State: AFq9FYIOn+tmNrCzzC1FTHVbzJJULeMO8vvSuaWDIg5TTY63OEzz0Gi5
	Kzqit0/AvSPJfqB1+Ksj1LTu7D0oxJG4p9iS7NhsD/resAb3PGPg6RCySHMQmndRxopSMOhzY+g
	8+1qGsC1AwZYi5Lbw0zb+5PCsLild7r4=
X-Received: by 2002:a05:6512:3b24:b0:5bb:7829:741c with SMTP id
 2adb3069b0e04-5bcde35ea87mr4836395e87.1.1791934664181; Tue, 13 Oct 2026
 16:37:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011061722.3159941-1-make_ruc2021@163.com>
In-Reply-To: <20261011061722.3159941-1-make_ruc2021@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 01:37:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLnHiKZ0OuD4Yb=+YoB7mM7KVPCNAzy4qRuRq1P3LEQDLQ@mail.gmail.com>
X-Gm-Features: AclHuK9TqHDzu3p9JgxKkHBWbUqRTWvhKXq68f01GBj1YgfR4EN8Zm8P75JUKC4
Message-ID: <CAD++jLnHiKZ0OuD4Yb=+YoB7mM7KVPCNAzy4qRuRq1P3LEQDLQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: Fix fwnode reference leak in stm32_gpiolib_register_bank()
To: Ma Ke <make_ruc2021@163.com>
Cc: antonio.borneo@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, andriy.shevchenko@linux.intel.com, 
	fabien.dessenne@foss.st.com, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 8:17=E2=80=AFAM Ma Ke <make_ruc2021@163.com> wrote:

> stm32_gpiolib_register_bank() walks the "gpio-ranges" property with
> fwnode_property_get_reference_args().  As documented in
> drivers/base/property.c:
>
>  * The caller is responsible for calling fwnode_handle_put() on the
>  * returned @args->fwnode pointer.
>
> The returned reference is never put.  The function calls the helper
> twice, once directly and then repeatedly in a while loop, and each
> call overwrites args, so only the last reference is even reachable
> and all the earlier ones are leaked for good.
>
> Put the reference as soon as args.args[] has been consumed, both for
> the initial call and for every iteration of the loop.
>
> Found by code review.
>
> Cc: stable@vger.kernel.org
> Fixes: bb949ed9b16b ("pinctrl: stm32: Switch to use for_each_gpiochip_nod=
e() helper")
> Signed-off-by: Ma Ke <make_ruc2021@163.com>

Patch applied as nonurgent fix, look into Andy's comment
and see if you can follow up with a thorough fix.

Yours,
Linus Walleij
