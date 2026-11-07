Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794012622;
	b=avtk1Xj7rfT2SB35jWtQitkkU4i6GZsQ8aec4AYb0bPm2ijYHoIA3xDLbCNZdS5gzOjc
	 PUyB8BQfukIwgJTtIdoEy6rWIiwOt301A22+5r9HFuHUrGXRygjaal98ZPYVXlGKJ1etS
	 gIdFP8C51ECzIxrd5hIpb0RWPSBiNoscnYcSiAIBp1MulvyfEfpKBRXyHn9EknSD2td5z
	 xFKzJGjEL4K/yiuw2eUg97LUlaUrGiEk84GkfZuE6xyAU2XbeIiPSbvMxS55biT3tPC5z
	 a56soDnm/+AbsT7iVf8YbvveM+15x011RpUmdYaBEiZ4pi0OQniTeQ/UyC+X41TSOlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794012622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UDIdAIMbLFTYVUq+kbKb1q8+a8DtU0N+YUkvYxJXF6k=;
	b=i7njtvDHGLFUMOBhbsrI65iwuN006QTS+X/bn7IaJdBX5TyJlW7jRbP/hAsxy71USHh+
	 sKuyuBlXiBI5rP0JlMWES6+QOiPMPujirzztLuRwNQUhVkAEWvIJ9QlaZl76x/CkgCVh2
	 z4F2o88fCwIo5oohneM9jkwq59pmww61Er0Up92ixlAXIHSS4Rh9pQfcZbDDw/GyPyYSp
	 UEYJpEYmkTdTdGdROUYGR6wgd9lhS8FBYdy1qzppwEo70cwp/g/fGeME1yrVz9fAVvDr4
	 GnCZIOc8RpjkuSH3viH7DAKhiSK3+7wjHIgUjpTKL/bTB1qWRyuKv3Ku2dFN7QEFBqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dIOHp1/1";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBBD606A837
	for <linux-gpio@vger.kernel.org>; Sat,  7 Nov 2026 00:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEBBD606A837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dIOHp1/1
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b33de9d2b1so9437527b3.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 16:50:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794012621; cv=none;
        d=google.com; s=arc-20260327;
        b=WWY9a59lo+aH5mfqXawhinSWlaJUUb4BwoCFLxA88jcwWs/X3EjVtQwRAuh6ifTMpb
         UrKAN2X9oWwMNdUdz/MZm4ofp/+bMzpQJf+IEopgSbjryhRWzTInkc611LEUf8kbAK6Q
         D4pngREVAGkX2NqzgQbVaQww8fjQgYUp4vkcPs+AN3kPsh0JAfJ5wZeBtWf6i/0X+TIH
         T8YUy/In3IfesSKbYPHTrFwEUq6NMRn7Z/+RE2EQMMeCZTLnILj6ow2NPIOnfPCskz+L
         Sl5+sXl0sBUAf1X8J3Ak205B/5XMUTV/HY4VRVl6TTjFtL4A2Goy8vFPF1mSfALOQrx3
         fimg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UDIdAIMbLFTYVUq+kbKb1q8+a8DtU0N+YUkvYxJXF6k=;
        fh=hstC0FXD1H5gL4IT1d2CBYULDarwr8zZ1jgiTgEZ7o4=;
        b=WwT84kQd7Q4GqD8LFoJ0hnMMbUQhd1AD+zQQ1O9DJV/jsKZYFJQqIvQqbps81blQR2
         1+3rYa8AjWL953Xx5pT4JD07g8k0RNO10Vr3SPfHAKZ5q5ySsNMtxoTxfOtivTDOAMuk
         oM+RQIq+B94KpSKKcQPKUbLkgFtBBe1Kug2sYcZGfHydalNyWhGAnLngVedm3avlncaQ
         bYRYkB6HKX0p9kW3vzpWvV/bQP0pivjZXCqrq3so7UMpblk7rweUjHKSU26ZDi+i8SLh
         y4FaTJR/MgiqrpSS8PK/QX6MAtooD4v1CnMjL/7KKmRzQHZ+SvHycUYAd4z52yAfAvgU
         SzWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794012621; x=1794617421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UDIdAIMbLFTYVUq+kbKb1q8+a8DtU0N+YUkvYxJXF6k=;
        b=dIOHp1/1ruOzpxb9+xN9dUntqSgCnzKB3dpKnLy+BqKahjEVg6D4N4nGhEYivx5tDk
         zgVfbEtzJuLj36Zs1xqA+F0hEdtRTR1iEfZhz5XiqRfdfbG6aylt4DyVjm4DvPc3LoIR
         y3bC0dUaRMOaoJhUZXxn+9cTKslqmBrs62o+Wp708C+rncrJVDXjHRdwgI1oFB5z8u5v
         NiahxZV6eqaIDQMwwXxXlPPi2mQiuJ0eaf+UeENpXb+ziCj72U+ux66RMKOlcwdoeRkL
         8Rw5pTHSdAn86Mv/3ofUgQaC3lnvMOwppatKEe+LrwofKBGZXBT7wg9cRgRjaoP0mwbW
         z93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794012621; x=1794617421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDIdAIMbLFTYVUq+kbKb1q8+a8DtU0N+YUkvYxJXF6k=;
        b=Gae2IjqXr/WsSvTq78d8H4G+yddanOEM2dvWY4mdcljQJ6i4xcIjtJ00jXpaGkdiDn
         /59UtwOR7vF68HDwqewC7EFc1S7M6vj9x2aUm7PqqkxIL2kqVmgo293oz1Ub/qmXc1fB
         L4dLLzg686SUmcL690hErKwsTSHp8WL3net3+IKswoRF5OkFtFPf/aVz+ymeWeG/yS5V
         gHziNoOpcjF2Bg5NOhlukBd8X3exgVwsIIoXyV10HVO2EdtoXl7yTFwtW8SSO0rqZy4J
         4CKQcaUztm42qX69ey1p5lNlDipUggjHmfKZRGhzfHQvCYry4JZXFPLA6u8HbqfcYrQL
         Golw==
X-Forwarded-Encrypted: i=1; AL+hErHebBTqNtWTwSNY1cD6Js8Vk1haYQFjls/7kJqqRF0XZatxCbRvZLQL8U+DCug4IEXKinAnkbezUZku@vger.kernel.org
X-Gm-Message-State: APuU4Z9JcOSXgvBIh2AeRWUgQv9L+9+W9/kcgC5Dyb2OHOD4M6zd/EVT
	DDfoBRx85T0og5bz2/nu61hGKgCqf4Og1QzsVAbaoSxXW5TiHM+yfaweuJNT9TN7jz6tn0BRSdQ
	8mAeWL4IviUYnuA8wZHLkU7/6CG9xjq4=
X-Gm-Gg: AYBFou2OUgvfz7rgW0WHUuai3SaAi04uele1Ly8VHP0gYOWKAYUVs0B6usrBgmiLhaD
	7qwATB+JGbbVkKnFp7t+td7Udt3TMcRlh+B3Qg4SPKTB0Kf+sZEhmuxqjk+e7NbVsQUHefrEY47
	49grz93tfpzZ/QKFpnt82sA4aJfXkr46aDrJqISp5r+KpnRgccDjJSyixAkGyS1lMYIEWxRKEBq
	dC7e/QW5pDq7OggcPwOc3opjS9MTq2QZcJz9szLAP9Ss9MSINLwdXzklnUrzBGmr2HQYYIahmFA
	FXozWYp2CXF13lSLwV1dweIOotnQ3y2fnNk3lIVswlwME/p6YmSVpZVh4lRD+Vkr+SfUIPyWTAQ
	4rMRAjxUA77GdVb7sV3jflBvMYvx54QkVlrs/MfxaAQ6WX9Sao22rao5XipY=
X-Received: by 2002:a05:690c:d8c:b0:8b3:f05:dd6d with SMTP id
 00721157ae682-8b34192ea67mr20495907b3.45.1794012615901; Fri, 06 Nov 2026
 16:50:15 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
 <20261106022907.10735-1-prasanth.padarthi10@gmail.com> <20261106022907.10735-3-prasanth.padarthi10@gmail.com>
 <71eb94df4d373d0f3afbe2a8ff880869f96e054b.camel@codeconstruct.com.au>
In-Reply-To: <71eb94df4d373d0f3afbe2a8ff880869f96e054b.camel@codeconstruct.com.au>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Sat, 7 Nov 2026 06:20:02 +0530
X-Gm-Features: AclHuK_zfgDPcux-rGy0j0Dx_Q046t2jqfjZUDa9PKNbMEPl2IK8UVzJpqMRhCY
Message-ID: <CAMFFDGgebSfVGfogTG--kpOnGNP5UxWVUGW2g_Sej_18FybNVQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pinctrl: aspeed: Hand over global GPIOP
 passthrough to local mux controls
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linusw@kernel.org, Tan Siewert <tan.siewert@9elements.com>, joel@jms.id.au, 
	ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com, brgl@kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thanks for the detailed review.

I'll address the naming, error handling, and implementation concerns
you've raised.

Regarding the necessity of the patch, on B650D4U, GPIO-only power
control failed with SCU51C[9] set. In my hardware testing, clearing
that bit allowed remote and physical-button power control to work.

However, I haven't yet established whether this requires a pinctrl
driver change or can be handled through existing initialization.

I'll investigate the existing pinctrl path further before sending
another revision.

Thanks,
Prasanth

On Fri, Nov 6, 2026 at 4:24=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Prasanth,
>
> On Fri, 2026-11-06 at 07:59 +0530, Prasanth Kumar Padarthi wrote:
> > On B650D4U, GPIO-only host power control fails when SCU51C[9]
> > enables GPIOP passthrough, even after the normal GPIO request path
> > clears the individual SCU4BC selections.
> >
> > Transfer globally selected GPIOP0-P5 THRU roles to SCU4BC[29:24]
> > before registering the controller, then clear the active shared
> > sources. Leave PWM selection and the strap-source selector unchanged.
> > Clear SCU510[28] through SCU514 and verify the shared enables cleared.
> >
> > If handover fails, retain an instance-local error and reject affected
> > GPIO and mux requests before changing their mux state. Check every
> > pin in a mux group before calling the shared helper. Retain prepared
> > local selections after partial failure rather than blindly restoring
> > a shared enable.
> >
> > Probe-time normalization policy, concurrent SCU writers and
> > post-handover registration failure remain open design questions.
> > Electrical continuity, mixed-pair forwarding, protected-write paths,
> > PWM coexistence and SCU510[28] hardware handling remain unvalidated.
> >
> > The implementation passed remote power-on, remote graceful power-off
> > and physical-button power-on tests on B650D4U with an OpenBMC Linux
> > 6.18.24-based kernel. The rebased version was ARM compile-tested on
> > v7.4-rc1 using aspeed_g5_defconfig with AST2600 pinctrl enabled.
> > With the managed-registration prerequisite, the v7.4-rc1 version
> > also completed one unbind/rebind cycle under generic KASAN on
> > B650D4U hardware and in AST2600 QEMU. Host power operations have
> > not been retested with the v7.4-rc1 kernel.
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> > ---
> >  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 145 ++++++++++++++++++++-
> >  1 file changed, 141 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinct=
rl/aspeed/pinctrl-aspeed-g6.c
> > index 85d6640ff..be22a9184 100644
> > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > @@ -4,7 +4,10 @@
> >  #include <linux/init.h>
> >  #include <linux/io.h>
> >  #include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +#include <linux/string.h>
> >  #include <linux/pinctrl/pinctrl.h>
> >  #include <linux/pinctrl/pinmux.h>
> >  #include <linux/types.h>
> > @@ -36,6 +39,8 @@
> >  #define SCU4D8               0x4D8 /* Multi-function Pin Control #23 *=
/
> >  #define SCU500               0x500 /* Hardware Strap 1 */
> >  #define SCU510               0x510 /* Hardware Strap 2 */
> > +#define SCU514               0x514 /* Hardware Strap 2 Clear */
> > +#define SCU51C               0x51c /* Hardware Strap 3 */
> >  #define SCU610               0x610 /* Disable GPIO Internal Pull-Down =
#0 */
> >  #define SCU614               0x614 /* Disable GPIO Internal Pull-Down =
#1 */
> >  #define SCU618               0x618 /* Disable GPIO Internal Pull-Down =
#2 */
> > @@ -2743,12 +2748,56 @@ static struct aspeed_pinctrl_data aspeed_g6_pin=
ctrl_data =3D {
> >       .nconfmaps =3D ARRAY_SIZE(aspeed_g6_pin_config_map),
> >  };
> >
> > +struct aspeed_g6_probe_data {
> > +     struct aspeed_pinctrl_data pdata;
> > +     int thru_error;
> > +};
> > +
> > +static bool aspeed_g6_is_thru_pin(unsigned int pin)
> > +{
> > +     return pin >=3D AB22 && pin <=3D AB23;
> > +}
> > +
> > +static int aspeed_g6_gpio_request_enable(struct pinctrl_dev *pctldev,
> > +                                      struct pinctrl_gpio_range *range=
,
> > +                                      unsigned int offset)
> > +{
> > +     struct aspeed_pinctrl_data *pdata =3D pinctrl_dev_get_drvdata(pct=
ldev);
> > +     struct aspeed_g6_probe_data *g6 =3D
> > +             container_of(pdata, struct aspeed_g6_probe_data, pdata);
> > +
> > +     if (g6->thru_error && aspeed_g6_is_thru_pin(offset))
> > +             return g6->thru_error;
> > +
> > +     return aspeed_gpio_request_enable(pctldev, range, offset);
> > +}
> > +
> > +static int aspeed_g6_set_mux(struct pinctrl_dev *pctldev,
> > +                          unsigned int function, unsigned int group)
> > +{
> > +     struct aspeed_pinctrl_data *pdata =3D pinctrl_dev_get_drvdata(pct=
ldev);
> > +     struct aspeed_g6_probe_data *g6 =3D
> > +             container_of(pdata, struct aspeed_g6_probe_data, pdata);
> > +     const struct aspeed_pin_group *pgroup =3D &pdata->pinmux.groups[g=
roup];
> > +     unsigned int i;
> > +
> > +     /* Check the entire group before the shared helper changes any pi=
n. */
> > +     if (g6->thru_error) {
> > +             for (i =3D 0; i < pgroup->npins; i++) {
> > +                     if (aspeed_g6_is_thru_pin(pgroup->pins[i]))
> > +                             return g6->thru_error;
> > +             }
> > +     }
> > +
> > +     return aspeed_pinmux_set_mux(pctldev, function, group);
> > +}
> > +
> >  static const struct pinmux_ops aspeed_g6_pinmux_ops =3D {
> >       .get_functions_count =3D aspeed_pinmux_get_fn_count,
> >       .get_function_name =3D aspeed_pinmux_get_fn_name,
> >       .get_function_groups =3D aspeed_pinmux_get_fn_groups,
> > -     .set_mux =3D aspeed_pinmux_set_mux,
> > -     .gpio_request_enable =3D aspeed_gpio_request_enable,
> > +     .set_mux =3D aspeed_g6_set_mux,
> > +     .gpio_request_enable =3D aspeed_g6_gpio_request_enable,
> >       .strict =3D true,
> >  };
> >
> > @@ -2778,15 +2827,103 @@ static const struct pinctrl_desc aspeed_g6_pin=
ctrl_desc =3D {
> >       .confops =3D &aspeed_g6_conf_ops,
> >  };
> >
> > +/*
> > + * Experimental: transfer the global GPIOP0-P5 THRU selection to the
> > + * individual mux controls before registering any pinctrl consumers.
> > + * PWM selection is higher priority and is deliberately left unchanged=
.
> > + *
> > + * Do not undo the local selections on error: a shared enable may alre=
ady
> > + * have cleared. Keeping the equivalent local selections preserves rou=
ting
> > + * while rejecting affected requests, rather than granting an unsafe G=
PIO.
> > + * Signal continuity during this transfer still needs hardware validat=
ion.
> > + */
> > +static int aspeed_g6_thru_handover(struct regmap *scu)
> > +{
> > +     const u32 local_mask =3D GENMASK(29, 24);
>
> Defining a variable with the value (even though that variable is
> qualified const) means it's not an integer constant expression, which
> may impede some optimisations.
>
> Further, local_mask is not a descriptive name for what's occurring
> here. Please name the mask in terms of its behaviour. Perhaps:
>
> #define GPIOP_UNGROUPED_PASSTHROUGH_MASK GENMASK(29, 24)
>
> > +     unsigned int strap2, strap3, local;
>
> Please lets improve on the name 'local'. Perhaps: ungrouped_passthrough
>
> > +     int ret;
> > +
> > +     ret =3D regmap_read(scu, SCU510, &strap2);
> > +     if (ret)
> > +             return ret;
>
> Consider this error-handling strategy:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/pinctrl/pinctrl-gemini.c?h=3Dv7.4-rc1#n2556
>
> If the first read doesn't work, then we can't expect any of the further
> accesses by the core aspeed pinctrl implementation to work either, so
> we can just bail out entirely in the caller.
>
> > +     ret =3D regmap_read(scu, SCU51C, &strap3);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (!(strap2 & BIT(28)) &&
> > +         ((strap2 & BIT(30)) || !(strap3 & BIT(9))))
>
> Please give these bits named macros. This is not easy to comprehend as
> it is.
>
> Also, consider FIELD_GET() from include/linux/bitfield.h. Something
> like:
>
>    if (!FIELD_GET(OTPSTRAP_ENABLE_GPIO_PASSTHROUGH, strap2) &&
>        (FIELD_GET(OTPSTRAP_ENABLE_DEDICATED_STRAP_PINS, strap2) ||
>            !(FIELD_GET(STRAP_ENABLE_GPIO_PASSTHROUGH, strap3)))
>
>
> > +             return 0;
> > +
> > +     /* Preserve every globally selected role, including under PWM. */
>
> This comment feels like a classic LLM statement that somehow manages to
> be simultaneously both too abstract and too detailed, while also devoid
> of context, all in 8 words.
>
> Can we rather say that the PWM functions on these pins are higher
> priority in the mux than the pass-through GPIO function, so if PWM is
> already selected, then the following write does not affect the PWM
> configuration?
>
> > +     ret =3D regmap_update_bits(scu, SCU4BC, local_mask, local_mask);
> > +     if (ret)
> > +             return ret;
> > +     ret =3D regmap_read(scu, SCU4BC, &local);
> > +     if (ret)
> > +             return ret;
> > +     if ((local & local_mask) !=3D local_mask)
> > +             return -EPERM;
>
> Please add a comment here about the write-protection in SCUF30.
>
> > +
> > +     /* Leave the inactive GPIOZ6 source alone in dedicated-strap mode=
. */
>
> 'dedicated strap mode' is a confusing statement because ASPEED's
> documentation is confusing. I think we can drop this comment with
> regard to making other improvements.
>
> > +     if (!(strap2 & BIT(30)) && (strap3 & BIT(9))) {
>
> We've already inspected these bit values previously. Please consider
> extracting them to bool variables for re-use and to improve everyone's
> ability to comprehend the expression.
>
> > +             ret =3D regmap_update_bits(scu, SCU51C, BIT(9), 0);
>
> Essentially, having configured the ungrouped passthrough functions
> above, we can now de-configure the grouped passthrough function in
> strap3 (SCU51C).
>
> It's probably worth noting in a comment that SCU51C cannot be write-
> protected.
>
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     if (strap2 & BIT(28)) {
> > +             /* SCU510 is write-one-set; do not use an ordinary RW cle=
ar. */
> > +             ret =3D regmap_write(scu, SCU514, BIT(28));
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     ret =3D regmap_read(scu, SCU510, &strap2);
> > +     if (ret)
> > +             return ret;
> > +     ret =3D regmap_read(scu, SCU51C, &strap3);
> > +     if (ret)
> > +             return ret;
> > +     if ((strap2 & BIT(28)) ||
> > +         (!(strap2 & BIT(30)) && (strap3 & BIT(9))))
> > +             return -EPERM;
>
> This appears to be the negated expression of the earlier one, and given
> we're only returning a fixed value in either case, you could rather use
> the same expression again. Given it's repeated, you could extract it to
> a macro or static inline function.
>
> > +
> > +     return 0;
> > +}
> > +
> >  static int aspeed_g6_pinctrl_probe(struct platform_device *pdev)
> >  {
> > -     int i;
> > +     struct aspeed_g6_probe_data *g6;
> > +     struct regmap *scu;
> > +     int i, ret;
> > +
> > +     if (!pdev->dev.parent)
> > +             return -ENODEV;
> > +     scu =3D syscon_node_to_regmap(pdev->dev.parent->of_node);
> > +     if (IS_ERR(scu))
> > +             return dev_err_probe(&pdev->dev, PTR_ERR(scu),
> > +                                  "No SCU regmap for THRU handover\n")=
;
> > +
> > +     g6 =3D devm_kzalloc(&pdev->dev, sizeof(*g6), GFP_KERNEL);
> > +     if (!g6)
> > +             return -ENOMEM;
> > +     memcpy(&g6->pdata, &aspeed_g6_pinctrl_data, sizeof(g6->pdata));
>
> This seems unfortunate.
>
> Have you considered other approaches?
>
> > +
> > +     ret =3D aspeed_g6_thru_handover(scu);
>
> Must this logic be separate to the usual set_mux path? If not, I expect
> we don't need to retain thru_error.
>
> > +     if (ret =3D=3D -EPROBE_DEFER)
>
> Do you have an example of how ret could be -EPROBE_DEFER?
>
> > +             return ret;
> > +     if (ret) {
>
> If this handover logic is to be integrated here, can you please test
> for specific return values to separate the regmap access failure from
> the write-protection failure?
>
> Related, I've heard opinions from Tan that this patch is not necessary
> to get the platform booting. Given the current complexity, I'm
> interested to hear whether you can do without it.
>
> Andrew
