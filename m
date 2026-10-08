Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C86E3D9DA6
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 09:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451323; cv=none; b=RT9QkAKn5CaE1Hjo97qCthObXWrITYZsZbY4O7wI+gE4aDENuBajNCb7ZNUH0PBZi0xy6Pjt+7wWzcN+3OdRswSEki8pXlTeFrmB/zUbeYJu6InnoCGMwF8SvOpcV23yaG16yKGQAaRdgt4B1e01WsHoCTz32XUTwAYOdeoZXRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451323; c=relaxed/simple;
	bh=oFPXGKpY3pOjoAbiz1VXsbR0IHBy67O4YlMMZGIWudw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tMXlxqzPc+i1z3Ut5KJnDw5iq0cSu6qOj+nfcJph7/L/ogQVP+AeG/Ejzyt8aT66/0PzKsYsAJREWnC4/Mt/qcINePreqHDRP8KsQcEOSBjUMlgE7o26FpnRMR6q+h6N542XGfM0VBI3mzTa8RIu1GWYEQjV8UQXzy50jkBXVLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/wmSj2u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/wmSj2u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD271F0089B
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 09:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791451315;
	bh=GWFUUUrBgiIzK+gqT3tOqpmacYA8GLgSjw0YdluaFDU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O/wmSj2uEqcTYn0JsiBAWBr1mTy1i3Hhhg2zHwNy5LCc0R5LVdyYNByVtp+5RbDqC
	 yu8jRuG5tiXQdJN/6h9C/DVJY89tihoWqhAlsGqYjHDPg4npgnBgqrYQeUWUtBDxJK
	 7Pbzsr/NxhfmK06/fYZrX9D3q1bai1sVVseMAomdyOzesc/wUoURGv6rxDKQgCh9z2
	 zyYl8gs4z60qQTOe7AMTe4Tatn7ccmD7+jvPpg0HsdRPRgt4ZHw8zK0rXBUJeecEJ4
	 HRhyMN7xHrY9sEIEeVl73kwad285NnnlG6JYbgIBRLXs8TgyLFcJpFjSwfQom3VAiF
	 g1hvtPUbbL9EA==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-49429181ce9so1454760fac.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2026 02:21:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzH2z7a5TZkoJRzxcy/GBIQUZyEa/2hQgqx0Ps9yVGXD35979upkTASpOJPndAwZmaorugJZ8VzFAJ3@vger.kernel.org
X-Gm-Message-State: AFuF++kh6VoGns8znr6FtFoVFnrfxJ+KkEaM0YHWDw7R7kaedvHvWf/Y
	5C3K1AVyqCBNyONMIJ7Wd1c5d1k269vOlcZbqptcElgf0KXW+5Ooosb+yZQ8AVBQiVKJpq6kv/3
	r6h76MfbTfqLhxPLw0ohmpayTvyCv7Lk=
X-Received: by 2002:a05:6870:1425:b0:49e:691c:1bdb with SMTP id
 586e51a60fabf-4a259412f13mr4800707fac.32.1791451314370; Thu, 08 Oct 2026
 02:21:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005202731.153971-1-pmazzini@gmail.com> <20261005202731.153971-4-pmazzini@gmail.com>
 <20261007211626.GA338242-robh@kernel.org> <6bb97a9e-cc9c-48c0-bf6d-3a1c6e8048f2@arm.com>
In-Reply-To: <6bb97a9e-cc9c-48c0-bf6d-3a1c6e8048f2@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 8 Oct 2026 11:21:40 +0200
X-Gmail-Original-Message-ID: <CAD++jL=5XbF11=B8Ek0sEXbBthDvMXntsS1B3g=hVj3tvJrJ8Q@mail.gmail.com>
X-Gm-Features: AclHuK8MDx9mBKh-LkXc2Y_EmzTnr-w652rPt-NhKQsERmYINlS6dZoVxe0T-gI
Message-ID: <CAD++jL=5XbF11=B8Ek0sEXbBthDvMXntsS1B3g=hVj3tvJrJ8Q@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Pablo Mazzini <pmazzini@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 9:50=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:

> If you mean to just drop the allwinner prefix: this has been discussed,
> but NAKed, because the generic property carries a different semantic.
> And implementing that generic behaviour in the existing sunxi pinctrl
> driver would be quite some effort (read: a rewrite), without any obvious
> win, so we decided back then to not boil the ocean here, and just go
> with a special property.

The point to switch over to the generic "pinmux" property would be
when a completely new SoC series with new hardware arrives, so that
it is significantly different from earlier iterations.

I don't know which semantic with the standard "pinmux" property you
got hung up on though remind me?

The bindings just state this:

  pinmux:
    description:
      The list of numeric pin ids and their mux settings that properties in=
 the
      node apply to (either this, "pins" or "groups" have to be specified)
    $ref: /schemas/types.yaml#/definitions/uint32-array

It's just an opaque u32 array controlling all muxing for a device.
There could be one single element in the array.

Yours,
Linus Walleij
