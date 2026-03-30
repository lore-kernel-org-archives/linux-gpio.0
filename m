Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F08E3ACA6B
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860306; cv=none; b=dsUE1/l4vQZOwzkzZDCaiNIiVFgh6Rj+AlcfGfm8du1BcquoUJsjN5ECy37/0GHKJ/vA7Cd75Ccw6khC+s52j6wVkBDw4IUCQ4x2l5rMSFXb4F8Oxp/QRuATWTL4/XRwSyXX1FlTyb/FJFRHtBHPMz7BDtZWXaTeDlOEiQKpMHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860306; c=relaxed/simple;
	bh=WJZTcp7a+HasXcRN6CknKPVZ1hEniqq0OyZUQfHlnbw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cfi1DBpYxCufHO84NXgTDbXRkFQrkkVZhEv/UXexQwJu+pDvFOKmAPuyrdgFVXYmY5VE+EZkdR4BcD0x3oHkLP7sZkvOWjST7DDoicnOT7AKO0WH0pONLAcKs2ckHq2FCFnmem0GS5SWfauMPih1VShzVnPEn1fkpK6nVaqbKHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBtaAES2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBtaAES2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB63BC4AF0B
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774860306;
	bh=WJZTcp7a+HasXcRN6CknKPVZ1hEniqq0OyZUQfHlnbw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=KBtaAES2FSe3HnNNQrNhknzYyNgRgBxAjlS0+F7skFZW2o9dfyqxFKXZ9PvJ52xT9
	 Lc9pwvYLz1OWA89v+qEJBX1BXHxa7M/nFxkOhsseUK2oT4TjCGr5/uR8CoDVRfhufW
	 c2XMOZwT5jakn8cR4yuqnvA3FWFGEqR/vf+CD5BXzwoHEbprR+Oa9U5TeuydPBRIJq
	 M2CFZDcBmfnWqG9+c1VZr5gioe782bsAGeOwbpThLyBRcspmLB+2d5xDjLp1XrVGFQ
	 yOq5VrQ2sPVffDQASSxWlVDmiwFKwQdvefjsnNmujwhblhUW13WqWg0M+NXOcJQ+iZ
	 xQRUJaAXaJY4Q==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38bcda08c76so32996161fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 01:45:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVApi6tV4pR9JbRQ+63LbPRLJzEteko0xoMyYcnct4YNm3n7aNQDLrkC/kougzno2hf8bhIDA2nw/vM@vger.kernel.org
X-Gm-Message-State: AOJu0YzxTb3qVsqZWJqCXsVaBns8+qq+YT2OMjfObM27zjXW7/vZbRAp
	hxEH9dFesFTb1aLHTI1DCPjuqsv+41nkttiO5QrPBOzsbwWNkjPN1YkCHhGTaJgRowFDkV6ty3u
	JV+WGz5iz7lYLLA3yjWquOlPIbtNm2l0BjR+oTNz5zA==
X-Received: by 2002:a2e:a541:0:b0:37f:8332:6ae0 with SMTP id
 38308e7fff4ca-38c740cba19mr39427471fa.33.1774860304684; Mon, 30 Mar 2026
 01:45:04 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Mar 2026 04:45:02 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Mar 2026 04:45:02 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260327-asoc-uda1380-v1-1-f6f91be9b7f8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-asoc-uda1380-v1-1-f6f91be9b7f8@kernel.org>
Date: Mon, 30 Mar 2026 04:45:02 -0400
X-Gmail-Original-Message-ID: <CAMRc=MeJ4eVx9HEWP6_4Yd-a=jb4SOyoWW=KgY_=od=ft1=7eA@mail.gmail.com>
X-Gm-Features: AQROBzCYXUFizcHcryyFhBvMxVaHBh-593kNDc3tx6lhn1cVUZsNGqKRb9Uhltk
Message-ID: <CAMRc=MeJ4eVx9HEWP6_4Yd-a=jb4SOyoWW=KgY_=od=ft1=7eA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: uda1380: Modernize the driver
To: Linus Walleij <linusw@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Mar 2026 09:05:47 +0100, Linus Walleij <linusw@kernel.org> said:
> This codec driver depended on the legacy GPIO API, and nothing
> in the kernel is defining the platform data.
>
> Since there may be out of tree users, migrate to GPIO descriptors,

I don't think out-of-tree users are a valid argument to keep anything in
mainline, so if nobody defines platform data in tree then it should be dropped.
On the other hand...

> drop the platform data that is unused, and assign the dac_clk the
> value that was used in all platforms found in a historical dig.
>
> Add some menuconfig so the codec can be selected and tested.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Maybe this driver should rather be deleted if there are no
> real users left, but that can be done after this patch if
> so desired. This makes the driver usable on contemporary Linux.

... I'm seeing this:

$ git grep nxp,uda1380
arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts:           compatible =
"nxp,uda1380";
arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts:          compatible =
"nxp,uda1380";

I think these count as in-tree users of the driver, right? The compatible is
not described in bindings but I think this still looks as ABI.

Bart
