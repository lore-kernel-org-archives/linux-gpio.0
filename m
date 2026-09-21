Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F72344A3E2
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 08:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980672; cv=none; b=ovHTLumaKmkn9SMTAo0+bxF5c4/OWXihu6+t411g6sTvoa16yOAOKOX4UCSzdESPkOw3fSYMcixXffcjbT9MzEa2Garbj+A1Vi/iaRUJc2Jl6g8G/fjEfKSsoUKu+uIbX0j5zeCIdxbuiY426TLvO3+ofvSPsDt/NGU1sZy05PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980672; c=relaxed/simple;
	bh=sdZW/G8qTawlI/Os8mwlWWAIJQkgOz0cUTS2dlNUP1U=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ESz/U83DSDRtNy2TS5nUq+hA4tjNEPLppzDe59UXe7lRSVlpJ3IBJtGNQ8pnFiNCPfrigDB4uWCmi5q+zAv9Ys3AYYmzlGR8l9agBbHYISsEfECCM52lhMV34s2KQI11LJhZhWan6kuFbEGHaRirvmyH8IAxC8MnF0PvRAXVSWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXqYUPvK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXqYUPvK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3AB31F0089B
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 08:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789980670;
	bh=sdZW/G8qTawlI/Os8mwlWWAIJQkgOz0cUTS2dlNUP1U=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=MXqYUPvKAgR085cW94Z8DHy54J+3pL3X/exQadl6PU7Q85Xr02cOgZXBL4dtF3w1e
	 mod5y+70xA3azeolPBOOAlPQwFLe/4yRmh1hSryThYizd0+PK+lnii51zRkZPts/dv
	 wBrFEj1hBdsDVeqF1rodhCTIKVpS12G0cn/cNnQ1lbzA6OgBIiHTChsq/xQmraG3xk
	 0bt7SRQfualzAPJrMjUvzrNUngxWZsVtXqCHThXui1eyShNWFdUh2Yb0zyailFookS
	 FRjcR8f+cRKVNQtzkqVJLD1BS+Z1cVHZLVCJdKXd+8+Abe0x7QgiK6Vnnrxc88l8Av
	 4kJXUz7kyjprg==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d5eso23513911fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 01:51:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx4IJ34S/+aMDa+N3CXSt+TkOsyUDui+jdq5y2VRrseHfPrIPZBMrqFNMuTDLzii0euynKEN8sc2fyk@vger.kernel.org
X-Gm-Message-State: AFuF++n2nHJ81J10S46pqs52LEEim9zRLaZpGjIYDDoERxfovRDoE5+2
	FKblVIANljc+BXqNqnmyvSThpI1OzWtkSxMVUqhJN1A3Y8ICdqfFc+oRTXxlzRAJnqkpnWQtPHU
	JmYsuvGhW3tnV6MEHdI2q0NFf8FxYWLiHpAtUop0dIA==
X-Received: by 2002:a2e:be86:0:b0:3a5:f6e2:47d2 with SMTP id
 38308e7fff4ca-3a5fc10f251mr22211991fa.29.1789980668654; Mon, 21 Sep 2026
 01:51:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 04:51:06 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 04:51:06 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAD++jLmuuLXpWsiZAFEA-QWZsB_6qcaM3PomhtKhHFHbzse5iw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919083655.586922-1-enelsonmoore@gmail.com> <CAD++jLmuuLXpWsiZAFEA-QWZsB_6qcaM3PomhtKhHFHbzse5iw@mail.gmail.com>
Date: Mon, 21 Sep 2026 04:51:06 -0400
X-Gmail-Original-Message-ID: <CAMRc=Me3-cFQr2kqHyPHYx63Aht3kK2Y0-h0--WjeZGpbsGDFA@mail.gmail.com>
X-Gm-Features: AcwNN1WueoBLY3SSKN39I0nyHfXknArX0yblXzJ6NPhctoeMb5IuaBrvm_4Jo9o
Message-ID: <CAMRc=Me3-cFQr2kqHyPHYx63Aht3kK2Y0-h0--WjeZGpbsGDFA@mail.gmail.com>
Subject: Re: [PATCH] Input: gpio_mouse - remove driver that has never been
 used in the kernel
To: Linus Walleij <linusw@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andres Salomon <dilinger@queued.net>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-input@vger.kernel.org, 
	Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Ethan Nelson-Moore <enelsonmoore@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 19 Sep 2026 14:12:05 +0200, Linus Walleij <linusw@kernel.org> said:
> On Sat, Sep 19, 2026 at 10:37=E2=80=AFAM Ethan Nelson-Moore
> <enelsonmoore@gmail.com> wrote:
>
>> The gpio_mouse driver was added in 2007, but it has never been
>> referenced by any platform data or DTS files in the kernel, and it does
>> not support ACPI probing. Therefore, it has clearly never been used by
>> any users of unmodified mainline Linux. Remove it.
>>
>> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
>
> Why though? It is fully modernized and probably has a value
> for people like "makers" who just want to connect an oldschool
> mouse to their random Raspberry Pi.
>
> I think it's better if we focus on removing code that is just
> using platform devices and hacks and is hopeless
> to maintain. For example the OLPC...
>

Agreed. I support removing drivers tied to specific architectures that were
also removed but this is very generic and may see some use.

Bart
