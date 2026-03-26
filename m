Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12BC388390
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520421; cv=none; b=GeOyv5uy2OspKVeCEbSmQd9UwKdJT+ofmzDoTl809IMNoguXAzS/XyMn/kuzkx3xqTpshNXYxooYKD7hQJZsws1e4aLAqsGlSlKrMcgb3SIRdTAOtqODVTSKLvZxUmbUpupOMju01LrcqSzDUWrxehGlM7m19Hk9tnKHH8cgoQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520421; c=relaxed/simple;
	bh=+AFaFPGoLd85ZT/AVlo+/bM9j6oa/hD8stKt9MjpOMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hz1M4WEfnaymV6LNeCfBwLu+ZmXkO35qxEbMxX4y2UzrUgkSPYVxvT5IQcDhMsmiPl1vOMAOIV5IuZabGSydMkbjQPDL1N1X6toCu+33gK42mttEBS8qCp5NO729Nsd4e7Q4/4/Fkmj8DNM1hkiRDSHsnJSenxs86S71kIybNi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eVSlADtH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eVSlADtH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC1CC2BCB1
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 10:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774520420;
	bh=+AFaFPGoLd85ZT/AVlo+/bM9j6oa/hD8stKt9MjpOMc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eVSlADtHVDEbH4j0ckP95zJgl32LevI3HeZcH6S8DTECB1yWvpc5UrWeLBDzLdDno
	 8FMzYk4XpF1vwDbMbIoPtt1UzHGkCmB5ydKJRA/KF9blykM/PTLaq8hTvOuoLBvYWh
	 AS+C8izyERh8Y7t8pkoNfYSrBbMARpFgWNOBV7OVsoQ47Z9yQKtMGCCyJeInkz7ph7
	 uL4KTE6LMuUwObRROQhcEtXJOh8iBd+66S794z3RJ0L5Palp0HUc8v9SAHpDi00nvv
	 U7UWKqzgaDWPWcFPgcYIAW36XzG9bCpPrhYT7+iOwNgdcBDRLlLMu8vNwAwenBw85t
	 DV/KHh05VGu+A==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79a3ba1653fso7855687b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 03:20:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUcGh2OxltsDC9G3AMHwh1o1O7sDWiE3ZjFCZ5GqhDUB3RrbmRI58fgrBNWznyP3PCnNOqIfkYNwLLn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/adX/obSazE5ARoIOYJRxCuBRzfAkF4Hr1qG8muuyqgFUmxbK
	d+gmZQ8uPZgPq6FKVMkxwKz3dycyVDmG0SnfUaqGl3hOdVrmPVOfp4Sv4WooinXX8psunWfGP7I
	gt62vOKPf8R0Pgyh3ACBURcCOwGq6yh0=
X-Received: by 2002:a05:690c:d88:b0:79a:bbe0:8cae with SMTP id
 00721157ae682-79acf3352a5mr74865867b3.1.1774520420002; Thu, 26 Mar 2026
 03:20:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325-asoc-olpc-v1-1-ebe6de05c7e2@kernel.org> <CAMRc=MdDbm89ST7B4NQ-oAnbvrUAOEmOJNs3iv9V893sWQUrAw@mail.gmail.com>
In-Reply-To: <CAMRc=MdDbm89ST7B4NQ-oAnbvrUAOEmOJNs3iv9V893sWQUrAw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Mar 2026 11:20:09 +0100
X-Gmail-Original-Message-ID: <CAD++jLmOhMPjypOFtZ3JuUXrdJbcNDTav97v8Zs2Pdt20jJMDw@mail.gmail.com>
X-Gm-Features: AQROBzAmN3xUMwygh4ytvAM0z8p-LpOXghNAHWcIs15qVMEd93_2kjfsXFcTNqU
Message-ID: <CAD++jLmOhMPjypOFtZ3JuUXrdJbcNDTav97v8Zs2Pdt20jJMDw@mail.gmail.com>
Subject: Re: [PATCH] RFT: x86_32: Move OLPC XO-1 audio GPIO to software nodes
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jaya Kumar <jayakumar.alsa@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 10:08=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:

> Could we instead define the software node in cs5535-mfd.c and assign it t=
o the
> GPIO cell, then expose it in linux/cs5535.h as a symbol visible to this f=
ile?

Yes we can, but as this should like with the GPIO itself only be done to
the device if and only if it is an OLPC laptop, it means adding another
#include <asm/olpc.h> and restrict that include to only happen when
using x86.

This PCI-standard-device-but-not-quite mess is a big headache.

I kind of hope no-one will step up and test this so I can just delete the
whole mess.

Yours,
Linus Walleij
