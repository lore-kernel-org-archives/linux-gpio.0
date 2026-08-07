Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D38F42640D
	for <linux-gpio@vger.kernel.org>; Fri,  7 Aug 2026 20:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786134211; cv=none; b=DqcVAw2OnvMfEbMvCf3TyZhYy22+2fOR85HMi5lUM89LLP8fXuwWA+sXxLlXYFYVV1Anunz+SG/FE2f0iFN3QXLmKr8vjwp3AMzQ+amdTL2pEiH0+DS9ZDfrmAI0iIMYZiQ6OgkiLyDaMlbxESLqUKZv5zpyBBsn41s4lQTsk1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786134211; c=relaxed/simple;
	bh=jxcH8eZGKIgBbAGtXktUmTUcGx6/TN/TNRYvri5Tjq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H448LKIik5KfSHbtWTvUq02QdnS6xh/Pjay77jHq43p6BftN7CJmdBs9tYOT+8dVqaCJkLj5T1jnwHeTKPFJT3yf9WapmtVNMr/MfIO52750MbuvVTUym216V2G7fJQZKjRwvIrqr3dRwXnAgUSf4G2mr3adpephzFLkLcvB7oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NslAsB+M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NslAsB+M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44A41F00ADB
	for <linux-gpio@vger.kernel.org>; Fri,  7 Aug 2026 20:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786134209;
	bh=Jwrr4lVLGS11GjYrZqe6FfMEjh7fA/X3L7gVPhE5eMk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NslAsB+Mrwl2KkiMwrTMgAqT3D9wVbPHREEJpYouBUMU1eMEoLClWLnOo6O3Z3fkD
	 gkPgKkaiS3IY+QK2VjNyyyY2npG9XtmPoNkWMTUxMwLi4aeCMQTi0dWDqR8wU/0i+Q
	 GY6oWBCnD3WwyzH7BBV+wV1H1Jr2eo1DcLy10ckMQ4QPgbu8OpoXb6V1v/yL9DuVdZ
	 1zjrGpurGBCemXpOnUoCg3v/s+wJIKnRd2nhZMpU/bWXBv4FQYQKXBQeOELpty/K4+
	 dpp70baGOsAvUcFkU/2TOR63O5V+KzJxdiqX5Cor/1vpY3tYXQJyzwhhgCWYSOiVl7
	 tICnmIvpgYe5Q==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b0148201fbso3432542e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 07 Aug 2026 13:23:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrZQ4mqOPYnvzfeeeva/oqImfqbi+q1t3+/ipRZGEJKgHyuSejlfEmNGBAkzCtBv0oXzbJ0ogewvBXY@vger.kernel.org
X-Gm-Message-State: AOJu0YwBD3f/8p0qLFGA/Bi4VVqUY6BiDFfl+otjEfosL/7sSYcAz6ee
	yXGYSbszHb2Lrj7OpD4def/yDnW5Ng+AGGjRAkgJsNay4eNql4yOh//N7zk/S8rMWEhwFJ0543n
	W2r7WAdnX9Q258lf08Mdzpc7KNPEcZd8=
X-Received: by 2002:a05:6512:3d8e:b0:5ae:ba8f:f9fd with SMTP id
 2adb3069b0e04-5b30b728f72mr381168e87.9.1786134208666; Fri, 07 Aug 2026
 13:23:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785838584.git.mazziesaccount@gmail.com> <838486b443af9188410d8b802a818dc0af20ea9d.1785838585.git.mazziesaccount@gmail.com>
In-Reply-To: <838486b443af9188410d8b802a818dc0af20ea9d.1785838585.git.mazziesaccount@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 22:23:15 +0200
X-Gmail-Original-Message-ID: <CAD++jLky237PRXNmyURjNEOPPgFV00ox1HBeBev=qADxKM3nWQ@mail.gmail.com>
X-Gm-Features: AUfX_my1uSeJQFZWOjjbDePuT4j3HCVXBhkgikPPCovD-qQ5-mA5ffWK5vqmoGE
Message-ID: <CAD++jLky237PRXNmyURjNEOPPgFV00ox1HBeBev=qADxKM3nWQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: mfd: common ROHM PMIC properties
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matti,

thanks for your patch (and the other comments in reply to the
old review).

On Tue, Aug 4, 2026 at 12:20=E2=80=AFPM Matti Vaittinen
<matti.vaittinen@linux.dev> wrote:

> Sometimes the existing properties aren't 100% what reviewers would
> prefer. When issues are minor or just cosmetic, changing the existing
> properties is not feasible. Reviewers can't be expected to know which
> properties are new, and which are existing - and this can lead to
> unnecessary review discussion wasting time and energy from everyone.
>
> Adding a common file for re-used ROHM PMIC properties should make it
> clearly visible that a property is re-used, when a new PMIC binding
> refers to this file instead of (re-)describing all the existing
> bindings. This will also help keeping the common properties identical
> across the variants.
>
> Add new file listing commonly used ROHM PMIC properties.

I see the upside of this, the DT binding maintainers will decide
on it. It has the upside you describe, but it has the downside that
new components will always (ab-)use the old properties maybe
even when there would be a good opportunity to modernize
the syntax, and then the reviewers will not catch it.

But well, maybe that is not a big deal in the universe.

What about patching those old bindings:
Documentation/devicetree/bindings/mfd/rohm,bd71815-pmic.yaml:
rohm,clkout-open-drain:
Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:
rohm,clkout-open-drain:
Documentation/devicetree/bindings/mfd/rohm,bd72720-pmic.yaml:
rohm,clkout-open-drain:
...to include this file as part of this patch, and delete the old defines f=
rom
those three files?

Then it is clear what is going on.

Maybe this happens in later patches, but anyway it should be part
of this patch I think.

> +properties:
> +  rohm,clkout-open-drain:
> +    description: clk32kout mode. Set to 1 for "open-drain" or 0 for "cmo=
s"
> +      a.k.a "push-pull".
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 1

Yeah I see now that this is already in use in three other bindings...

Today we would for a new component use something like
rohm,clkout-drive-mode =3D "drive-push-pull";
rohm,clkout-drive-mode =3D "drive-open-drain";
reflecting pin control.

I do understand the idea to keep using the same bindings
for all of Rohm MFDs. But when a completely new design
arrives with many new properties etc, maybe we can think
of something new?

Yours,
Linus Walleij
