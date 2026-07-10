Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C9638E8D6;
	Fri, 10 Jul 2026 20:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783716187; cv=none; b=rxw+PQ5+A1MQ8HwkeLC5zBMsvHXlIidvkeERcuurzuQo2mslAasYkaP7WKegUJ2kEvj+P3fbXuGAyRGlkNrLaCAnQAgPVLim2h2YHjPJLkjmCrPTDdPyTQjjdtDIhv4zPwcXAeGyb/9I3a+fAneTGOfcXA1283Ir5mISEkyMkX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783716187; c=relaxed/simple;
	bh=qaaa6HKfF6X5ROepkpOyk0Z0uYS5gT5LQ2U1jjOllG0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Afk7la8Yi5mawtdouXquJoSUPHmDzvetBmpgbXs19Ooky+EsvkJIO+2cbnVxDhyrOGjyJXUqMKu6gI30490B/ACtNslKoVKFQ5vqQqu2A1NTytNtWBj8h6IiiYkK8HGSQyxbHeMcN6mkA20pjmX+gmsgi8FX/imfW9UxZ7orcjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=foQdLQ/K; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="foQdLQ/K"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 87E754108A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783716183; bh=/529Gn6oydbpR06enlK7SvyAmlq2q/m9QtYxT7E+Ol4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=foQdLQ/Kuc/Nl8pdf6xIa7p/PUr5s+Kn5xZOiAyCwy6HwBr6ppTNEVBHjDXLobyow
	 lePj91CbBDs+jGsjuw/cOg/aum0yr5vpED5ACgDeeShivDRua+sonAtOu/nL5MWiLV
	 +zzE46D0Zo9ld288eNeg/AqrsAATVp80Gb9YX8blW6kEdJsNNcXC3n7PyB2a60kXFf
	 x+qSuPCxHHDDmyoPIH3W6yk/2FYQYgaRm78z0398+fQI1po7cXU8Q3ucr7gF2gB6iV
	 u7g2FoD9Ep7sVtZ5Pn5Q6tFhB8wyOMvNeS70uvcn0PcYsQBvcpELtp4utA6IZrLDTe
	 7mEWvA/TT5xDw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 87E754108A;
	Fri, 10 Jul 2026 20:43:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Linus Walleij <linusw@kernel.org>
Cc: Yuhong Cheng <ceohunk@gmail.com>, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: driver-api: pin-control: fix spelling of below
In-Reply-To: <CAD++jLm9oDeMrJU3NAW3333qvVso5P4WxQBgp6-OngOL5_fFiw@mail.gmail.com>
References: <20260705070422.764-1-ceohunk@gmail.com>
 <87cxwulkl9.fsf@trenco.lwn.net>
 <CAD++jLm9oDeMrJU3NAW3333qvVso5P4WxQBgp6-OngOL5_fFiw@mail.gmail.com>
Date: Fri, 10 Jul 2026 14:43:02 -0600
Message-ID: <875x2mk23t.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Linus Walleij <linusw@kernel.org> writes:

> On Fri, Jul 10, 2026 at 9:18=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> =
wrote:
>
>> Yuhong Cheng <ceohunk@gmail.com> writes:
>>
>> > Fix the spelling of 'bellow' to 'below' in the PM API section.
>> >
>> > Signed-off-by: Yuhong Cheng <ceohunk@gmail.com>
>> > ---
>> >  Documentation/driver-api/pin-control.rst | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/Documentation/driver-api/pin-control.rst b/Documentation/=
driver-api/pin-control.rst
>> > index 1f585ecca..80106e44a 100644
>> > --- a/Documentation/driver-api/pin-control.rst
>> > +++ b/Documentation/driver-api/pin-control.rst
>> > @@ -1175,7 +1175,7 @@ Possible standard state names are: "default", "i=
nit", "sleep" and "idle".
>> >    selected after the driver probe.
>> >
>> >  - the ``sleep`` and ``idle`` states are for power management and can =
only
>> > -  be selected with the PM API bellow.
>> > +  be selected with the PM API below.
>> >
>>
>> Applied, thanks.
>
> Do you especially want it? I queued some stuff on top after merging it,
> so would be great to keep it in the pinctrl tree...

Ah, I hadn't realized you'd grabbed it.  I can drop it, no worries.

jon
