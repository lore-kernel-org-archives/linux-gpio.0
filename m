Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F003C1983
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 07:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839867; cv=none; b=Gfq9tog5JMxImdr83jeSJP5hY3PNBP2HMmc5n02ujEGoCrWCFDflU76avwMcbKnrJ0GSEZhcRMrrsT2IJ94yF0QGg5Lg2BnpbJRPgTElS0/sIJCRYIWdGp27gZtlKJAhIOEPHY/CJR5tX4ivaIvSqnWf7OieNhn/JuPq7FzzFLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839867; c=relaxed/simple;
	bh=7n4ZA/xYyMniwHGliLaK8FHlgywkD9r7KnUFP53t6Go=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SgZrFFN9fr8nm6obNu+C6GxR5Vm+M5559K4ZeXDbPXoZcQqKqv/fORUQbTkETTEI8jQU6iCBqw9WPQdALelFMfTR9JuGlf3aQ0d7A1YwgOQRanz2CXM+/lm9PR8w9gGV5bReLCpskySNF+RiFTcjP69+Xx99XSxmtwup0zNwBJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=olLM1V6Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="olLM1V6Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69CF1F000FF
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 07:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790839865;
	bh=7n4ZA/xYyMniwHGliLaK8FHlgywkD9r7KnUFP53t6Go=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=olLM1V6ZaHOiESnj4TnYewEHncHyQ3RtXTJ3SYZvPtCqYgwszpWhwZWPbaaYxdjEP
	 4VrwH2dQ0tcq7fjAUytnUhl2R8hrd0Uj0j3nnNvUTz/v9h2Lwfatx6jueZEHisEH2t
	 ZeIX98maYWHhWtRkuXuEWrN8k7r9HN4+Q4qqx55m3md55wJkDfQlw3mtE652jTLg5P
	 4fr6RaLKoecE5La1W+sNb+5VQVA+2fMOA0x6JyL45lIHQ5gpxoCyL3G3ejEZCACbNn
	 iRYWsp0FJfDDwMoaBhVofzmhN4QiMcjumfv0MhZCV1OnTDsG3aSVGtZw6VkCqpATz1
	 pvdre1ngRlPrQ==
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a7be75eb9bso2583041fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 00:31:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxIL37TiOij3BUPyq6JsINylyViPayj3Ji4OaAkxxWqmf28xeXvt76/+ojZsy0PpMzFtOVDNPLHa+Ee@vger.kernel.org
X-Gm-Message-State: AFq9FYJqLo6ZqEWlzwyuTcRkrBT+cRb70/GU3bBKwJgpfwD1JQ8UzdeV
	vfO89VBZ3bxjON7wzQ4x4iblN8+RUJsFqO6BZQpuo+uccKLEbSbU+0CS2O4bM81dCXmsOJI7XvP
	eUnjMgUxsiURl5wuoCCuzslPecL7X54o=
X-Received: by 2002:a2e:bc14:0:b0:3a7:82cf:1784 with SMTP id
 38308e7fff4ca-3a782cf187fmr6070701fa.2.1790839864539; Thu, 01 Oct 2026
 00:31:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916030435.4089460-1-chancel.liu@oss.nxp.com>
In-Reply-To: <20260916030435.4089460-1-chancel.liu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 09:30:52 +0200
X-Gmail-Original-Message-ID: <CAD++jLnTvNEtQRGEXRZjzHhgSZWgEFoiDaDxt3Jooa-SUrOsqA@mail.gmail.com>
X-Gm-Features: AclHuK-4qYG4ASHCH0qYBns-SykiY0Tbcbii1qM199ro88Ougv95ZxDCOE5UYyQ
Message-ID: <CAD++jLnTvNEtQRGEXRZjzHhgSZWgEFoiDaDxt3Jooa-SUrOsqA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinctrl-generic-mux: Fix provider resource leak
 on re-parse
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Frank.Li@nxp.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 5:04=E2=80=AFAM Chancel Liu <chancel.liu@oss.nxp.co=
m> wrote:

> From: Chancel Liu <chancel.liu@nxp.com>
>
> The pinctrl core re-parses a consumer's pinctrl on every probe attempt
> (pinctrl_bind_pins() runs before the driver's probe(), and again on each
> deferred-probe retry or re-bind), so .dt_node_to_map() must be side-effec=
t
> free and safe to call repeatedly.
>
> mux_pinmux_dt_node_to_map() instead allocated provider-side resources on
> every call - the mux_pin_function, the group name table and a mux_state
> reference, plus a group name and a pinctrl_generic_add_group()
> registration via pinctrl_generic_to_map(). All of these are allocated
> with devm_*() against the provider device, so they live for the provider'=
s
> lifetime and are only released when the provider itself is unbound. The
> .dt_free_map() path never touches them; it frees the per-consumer
> pinctrl_map only. Every re-parse therefore adds another set of
> provider-side allocations that are never reclaimed, so a consumer that
> repeatedly defers probe or is re-bound leaks memory and mux_state
> references on the provider without bound.
>
> The groups and functions of a board-level mux are static and fully
> described by the device tree, so build them once at probe time in the new
> mux_pinctrl_probe_dt(). mux_pinmux_dt_node_to_map() then only looks up th=
e
> already registered group and builds the per-consumer mux map, which the
> core frees via .dt_free_map. As the mux has no pin electrical
> configuration, no config map is emitted.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260824022020.2812810-1-chancel.l=
iu%40oss.nxp.com
> Fixes: 34acc5a8adfb ("pinctrl: add generic board-level pinctrl driver usi=
ng mux framework")
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> Assisted-by: VeroCoder:claude-opus-4-8

Patch applied, we can think about other solutions, but that
can be handled by new patches, this works.

Yours,
Linus Walleij
