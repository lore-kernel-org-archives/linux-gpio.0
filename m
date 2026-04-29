Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020383932CE
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 09:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777453440; cv=none; b=vFlArkpb3zY4D5ZyEZlBz2TvGK+ZGpm2+WikwwF3lWYH+G0fr4gx6nScPtgW75jvTGvbkWqyW4qh6aLXhPuwecVN3M2MidgzUsowum65mOH4+pjcdf02xJWUu+OrxJG56mW46JEIuGAnCXQjUy6m4FEttguCbkfd7YBVGeEWEnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777453440; c=relaxed/simple;
	bh=mTUPK7ZxRi3yyrLMtOOrIKFFrpiIPXHYRD2toiOtVGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kYT9t61iCbSaFtD4ikSeSkBlF3NAREL0TYrXoRFSRng/rcrZcgqXkQvqRJyg4FM73iH4jRg6HbfCxTg6dBn3hqiTLPJgyfOJyQApXiW0DofqJXh1GLwQamam+5Gd4OGubcCUg/Cpx6IiFXEvyOtyUcf6nNgIor/moDDeS1lWsTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1RxaVqF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1RxaVqF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E232C2BCB3
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 09:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777453439;
	bh=mTUPK7ZxRi3yyrLMtOOrIKFFrpiIPXHYRD2toiOtVGw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c1RxaVqF2bvWvHNMk/ITIWI/kGn3Z1jc4aOdZ76Uf+Uu9WwHCey/WfLzmaPfidJsw
	 LpaTvd4HUQvyaxA7mR3Ai9DvEwJZjdViO1z3uWXEGRpdVxNqH9OuCFU8NdH3HUkIxy
	 ZgzKAbhewOPbVJ1ilx3HYzuMnX5/kQZ8SLNTq5unbQ1DY8rixhJvFTk/42CWjNDjgW
	 UP3wxjMVgeqD5hosjkaY4h0T13QdPDfP88TDtw7FJ4d7Jhy0GanPhCf6nDAKY8gx0f
	 n63xEJkxd6MKFllfsd9J0A4KQNA7rjJYUVI7l64Bfcllbmj9PzKtCUq2ucLBNMYsjQ
	 zLTMDU10Z5VuQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a2c500750dso14130483e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 02:03:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ia76oN2XhBFOqvOt0RnOx08itf3dzPHlvt2kfIua9ssGiw+lEbTT4XTyOp2aGlEU2QNteX2YfaABH@vger.kernel.org
X-Gm-Message-State: AOJu0YzdnfRcFFpgo69nWpfwfzIZ5OhVBoEh7FbYfmgzPYL3+cULFh2G
	tCZOrOQ0sDZIBewc5q2oHzIz5/LRlhpxLBTVNztkkel3iXAbRPvObIwuvZMX1e2CGTkkldyCrGG
	Tj2Ie7OvmWW3cgmH+FwWECbcEHXYnp+KITIcIcj9zyw==
X-Received: by 2002:a05:6512:2302:b0:5a2:c1b5:f70d with SMTP id
 2adb3069b0e04-5a746409fa1mr2584393e87.6.1777453438308; Wed, 29 Apr 2026
 02:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776872453.git.happycpu@gmail.com> <33d515f13769c685e6811463a14e111252a7c58d.1776872453.git.happycpu@gmail.com>
 <CAD++jLkOZGunkfs2EO_DQDPLnLVp+OPG6o4EKaY5GkAcqYQy5w@mail.gmail.com>
In-Reply-To: <CAD++jLkOZGunkfs2EO_DQDPLnLVp+OPG6o4EKaY5GkAcqYQy5w@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 29 Apr 2026 11:03:46 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfQY2Z+q=YGO0jEBip0dGjyq+uCH8EZwi9RaUOJxf74UA@mail.gmail.com>
X-Gm-Features: AVHnY4Lmb_N-ZmHzzL6TwheIpW-rlf_epcR7VFXtc6pSrDLlasvLLH7-au8zNRQ
Message-ID: <CAMRc=MfQY2Z+q=YGO0jEBip0dGjyq+uCH8EZwi9RaUOJxf74UA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: gpio: fairchild,74hc595: add
 registers-default property
To: Linus Walleij <linusw@kernel.org>
Cc: Chanhong Jung <happycpu@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 11:07=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> On Wed, Apr 22, 2026 at 6:05=E2=80=AFPM Chanhong Jung <happycpu@gmail.com=
> wrote:
>
> > The 74HC595 and 74LVC594 shift registers latch their outputs until the
> > first serial write, so boards that depend on a specific power-on patter=
n
> > (for example active-low indicators, reset lines, or other signals that
> > must come up non-zero) have no way to express that today: the Linux
> > driver always writes zeros from its zero-initialised buffer during
> > probe.
> >
> > Describe a new optional 'registers-default' property that carries a u8
> > array - one byte per cascaded register, in the same order used by the
> > driver's internal buffer (first byte targets the last register in the
> > chain). The Linux driver change that consumes this property follows.
> >
> > This property is already recognised by the corresponding U-Boot driver
> > (drivers/gpio/74x164_gpio.c), so documenting it here brings the two
> > bindings back in sync and allows boards to initialise the chain once
> > from the bootloader DT and keep the same value after the kernel takes
> > over.
> >
> > Signed-off-by: Chanhong Jung <happycpu@gmail.com>
>
> See
> Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
>
>   lines-initial-states:
>     $ref: /schemas/types.yaml#/definitions/uint32
>     description:
>       Bitmask that specifies the initial state of each line.
>       When a bit is set to zero, the corresponding line will be initializ=
ed to
>       the input (pulled-up) state.
>       When the  bit is set to one, the line will be initialized to the
>       low-level output state.
>       If the property is not specified all lines will be initialized to t=
he
>       input state.
>
> If you want to set up initial states, use this property.
>
> This also makes it possible for us to centralize the handling later on.
>

Ah, the old initial/default GPIO values problem strikes again. :(

IMO this is software configuration, not HW description. I think the
driver should do it based on the compatible and/or machine. It should
not be a property but if Krzysztof is fine with it, I'll queue it.

Bart
