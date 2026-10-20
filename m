Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792500740;
	b=0G5Ry8g0m9Ng7AhOYqfYUuveavHFLd24dcZAa19cYH+DDaf7amReuEqh5fRalbIITxVl
	 pj9a7ai6MjoZqA+kcORgsEPZ4THJ+To5AI2FzQQeKi5iifq2505OKz9g3mgTR8HRGr3Hc
	 Zbk2Fpur67q7myCBd29Z9U/64STRHlgYVnoFfxTt4yKAk3SnLnYO6h13nDslSesI98a8Q
	 P6Xejjzaxo8S9nc/s/UrY71BfGIHddUCc42bavczCFz8ThttwhAQeDHMDhURgbxucfYjV
	 A41sc9bhkkncQP1g19Zu1xYBuv3DkCi5LOE3EHWqbG75wNPw9UxMyiqMqJU9e3MM2sA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=lXiyP0wNZ1kIP9wjFOW8bw/0sqZpYt/VLLdVFIN+DMM=;
	b=2ajaZz8SDvB17ilT68mZi3g6jra9gqpWss4A3XrCzSBgJvE8kpj55VIYmkoRt9iXd3PG
	 rRpaH8yR2380+3pxEis401lFrIRz8PLN98rHUoqtZ06yROPn+DioX1nmZtRXGl52t61iX
	 GMuOCXlhC4MnraJi7By00w6fFLQNUQUdgxo23rb/x9WKro0diQ26XoYwiKSIvGvPGWBHY
	 uBjBdLf/1uihPZxg3ZPQblq1vQLLLWkggXCHFiyNajVnwhycoMuo/ve02toyQUsvifkKG
	 IVTlLWX11UYK1uK6Hq51oik7XCm6l+mhKJHOtMIFmfJNFnCRebtYXaRnoeHQsZ2ARkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=amIC2ftY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D6C606A319
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 12:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39D6C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=amIC2ftY
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b056d58f2aso25141757b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 05:52:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792500739; cv=none;
        d=google.com; s=arc-20260327;
        b=S447HHX1rOCx2rKzP7qIhFggeXFNcu1TtMBRzI7N/lWWXhdIlM/Kj8zIw5++heVi3w
         issCSN65LyDcYIEBkU7QLjwgIpNEWk0pmEiJkgDcj6e+STLz9wreaKurXM+MnO8NuyY0
         b8xosBPbYdun+wVKbICsbuqWrphY4Il6Pgs4Qy29HYvsDLefjfwUHuPqkZM47mbOgQSG
         Fcv20X+NmEAxarOibZ3G9VjSWzOl5+jvFDg5ZAGSI0p+cYvjjWbe765CYUguzOjzilf9
         ZnQNb1HKtQn/CA6NEmHLvBrp+siwhznzS4g03Q/Y9MYQrR6/eWWGdyDbp+PHID+yPCNf
         b5YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lXiyP0wNZ1kIP9wjFOW8bw/0sqZpYt/VLLdVFIN+DMM=;
        fh=8s/m3WFbgYWSrFq8O6qnuwJh8MouRhxqinKYkPkfiw0=;
        b=lVN8uDW/a/C5VbF65KXtqqW6zGHbYoxBRn9aNTKjRLrPsWtC8EsvFpeE577k+N8ASb
         N8GL8nWWmd2FP9uRSaO6ppH8tIyMGsbkd52Ld0DER0wLxb1CrxsE6s7zr0rEt2fWIIpe
         ooVybOviUOGDRnJZaiWpJNKIoWu0g/ac6auQIz/wrx/IFQUkTLmnup2p+DxMYFcAWcm+
         TezWWFyqJjPaa6blP7bKVFqtcMYFOwLyk8fAG0WggnEDPwc5ogoRzaakoeYT0A2EnRrJ
         jiWeEx4i6rJcOHGGKmDjY3Lcbyu5gd9wfAM4qxTzDf7Cj5sLTmw8Dfz1zvnu3NkFWC+D
         QnLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792500739; x=1793105539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lXiyP0wNZ1kIP9wjFOW8bw/0sqZpYt/VLLdVFIN+DMM=;
        b=amIC2ftYf+72PIq4kNbT91QjFETzY5bjLe7woloZKRMW8Y1f63OSLjMe0e3tsdXyAN
         ifkVc8h3uErjGSN3qXYgK4N5gIu4ggmpunToYIbb8EzE9/rvCJO1o/FFq5+SGI2CI/Q1
         s3LXU/3m6hHk8f+oC/u+5C887cefSx6MJPvmWNl+ElDMk8aU1Jc9fn91xwbvNMR4bjPn
         TTXnlbLctYBCE7J5kt7fe+bF1G0OvEcNdJpjKVu18Wf5+6avwZM7AQierVu+qp+ES5N2
         j2yNI/PLLajwFCfgh/HGpnaTAL3JMbtFkZsywiDYr0l6lRKQeDyizjxPNOLx8rsFfElJ
         pgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500739; x=1793105539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXiyP0wNZ1kIP9wjFOW8bw/0sqZpYt/VLLdVFIN+DMM=;
        b=oIyeqEepIBoWkTOnUKXr9m24LvQXFY0Jdg+y0NfEVlC0pYXkRY0u8Er4FDpoImUL38
         b0zgkXjzyJAyxcWfJtVRljbBUaOs2YbtaOdIiicj3HUh4IRnCJ777pDZrKR61c0Zcag6
         uCHRuf703+7slCMfXKjyXpfZ9aGygILQQPOKzmeiempR1VWNFY5zLPxSD9s9kphbMCiM
         VtoTwtBs6mXxBXSOBxCMPzCEdxCJhI0LJZznM07EYW+Q2XaDomJtk+YFfz8ZQFBnR06E
         XCTlTIrbwX57dpU4LbZxeJIsU1esOPH0rOIsf58JUUh6FzhW8QB+ouKn3lQ2YYmswxQ7
         LLKg==
X-Gm-Message-State: AFq9FYIK8ngTzmwRkxmA0ErVS2IrXCse4gOhMLXVyV7F+9D5Pvery/+H
	MWSKQazZ9jePQf8sEfZ6agOjNbWvY3SnORHqT3fftH7iesVHyEP43FXDkAJJQQdoYCN0613F0hC
	P5h/D/mA22zEbaFDaYglFKdHldpZogm3C+dSl
X-Gm-Gg: AYBFou0f3J8wQoC7sQF11BzJ9Xkeq8aeuuyHtwBTQ4C0l1YpyNG2VTylvEqXRyauMx0
	ybsaed3LYlnkh8Vc/ltvHg5NzT5Av+cqj/MmauIQR+/ZCAdeZJZe0JuFY0lKT1UyN93cY1G1rz0
	1XHAKziFoAykbXwd6H0Kc30TgHouJyG3lHtIjzFhtj1bGKPV+rfG+OcjpWrTpu7WqA7UAyE8gx8
	ZkGWb9hBA+6/AtkHMB8A1nzxG59k2WZ2RKy46gkTBu9hLgz/ijoyCB7GhA08wsy3S/Kej3MlAyf
	wJBLSg9XQgXbRpTGyTO3P2j/FascrpJx6CGCtDAuGs4CpACYjhqKgwzs+AzabcAkuy4=
X-Received: by 2002:a05:690c:1c:b0:8b0:57b8:744 with SMTP id
 00721157ae682-8b0f218930cmr29898317b3.45.1792500738255; Tue, 20 Oct 2026
 05:52:18 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
 <sashiko-outbox-172228@kernel.org> <CAMFFDGgxiTMd01iU5JJebvTLBF9ku1F9Zq16LV+gYyqn+tBVmQ@mail.gmail.com>
In-Reply-To: <CAMFFDGgxiTMd01iU5JJebvTLBF9ku1F9Zq16LV+gYyqn+tBVmQ@mail.gmail.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Tue, 20 Oct 2026 18:22:05 +0530
X-Gm-Features: AclHuK8XpbJAsfnLQaGbpyrlz8Y4TfMIQrF5MX7-1IbapaZu4M2nvVTS-zVaLtw
Message-ID: <CAMFFDGgpCM9+pAdL-HW2LFEkZVkdP+bz5xTq8uHAPhkzx3TPeg@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: aspeed: Handle GPIOZ6 pass-through strap on
 GPIO requests
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Further B650D4U testing shows that ordinary GPIO power control fails
with SCU4BC=3D0, SCU510=3D0 and SCU51C=3D0x1e80. With the candidate, SCU51C
is 0x1c80 and power-on succeeds. The captured power-control executable
and configuration hashes match between runs.

A separate candidate test also succeeded after complete AC removal and
CMOS-battery removal/reinsertion.

I understand that unconditionally clearing SCU51C[9] can disrupt the
other GPIOP passthrough pairs, so the current callback is not a
complete generic solution.

I am investigating whether shared-enable routing can first be
represented through the corresponding per-pin SCU4BC controls, then
the shared enable cleared, allowing the normal GPIO request path to
select GPIO on the requested pins while preserving the other pairs.

Does the hardware support this transfer without interrupting existing
passthrough signals, including when PWM has higher priority? If so,
would normalization during pinctrl initialization or coordinated
handling in the request path be the appropriate model?

This is a proposed direction, not a validated transition sequence.
Feedback on its hardware and ownership assumptions would help before
preparing a revision.

Regards,
Prasanth

On Thu, Oct 15, 2026 at 9:39=E2=80=AFAM Prasanth <prasanth.padarthi10@gmail=
.com> wrote:
>
> Thanks for the review. The shared SCU51C[9] control and SCU510[28]
> rejection are known limitations called out in this RFC. I agree that
> the post-mux error paths also require attention.
>
> The hardware result establishes that clearing SCU51C[9] permits
> ordinary GPIO power control on B650D4U; it does not establish that
> this callback implementation is suitable across AST2600 platforms. I
> will investigate coordinated handling of the shared strap and per-pair
> mux state before proposing a revision.
>
> On Thu, Oct 15, 2026 at 9:31=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 3 potential is=
sue(s) to consider:
> > - [High] pinctrl: aspeed: clobbering shared SCU51C[9] strap bit breaks =
pass-through
> > - [High] pinctrl: aspeed: unconditionally rejecting GPIO requests based=
 on SCU510[28]
> > - [Medium] pinctrl: aspeed: missing hardware mux rollback on error path
> > --
> >
> > commit fc751bac2dfdee809f65ba4da118ede6fdbe6aaf
> > Author: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> >
> > pinctrl: aspeed: Handle GPIOZ6 pass-through strap on GPIO requests
> >
> > This commit introduces an AST2600-specific GPIO request callback to han=
dle
> > the GPIOZ6 pass-through strap in SCU51C[9] for GPIOP0-P5. It clears thi=
s
> > shared strap bit to allow host power control on boards like the B650D4U=
,
> > while also explicitly rejecting requests when SCU510[28] is set.
> >
> > > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pin=
ctrl/aspeed/pinctrl-aspeed-g6.c
> > > index 85d6640ff4c4e..6e58feb48bf59 100644
> > > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> >
> > [ ... ]
> >
> > > @@ -2743,12 +2744,56 @@ static struct aspeed_pinctrl_data aspeed_g6_p=
inctrl_data =3D {
> > > +static int aspeed_g6_gpio_request_enable(struct pinctrl_dev *pctldev=
,
> > > +                                      struct pinctrl_gpio_range *ran=
ge,
> > > +                                      unsigned int offset)
> > > +{
> > > +     struct aspeed_pinctrl_data *pdata =3D pinctrl_dev_get_drvdata(p=
ctldev);
> > > +     struct regmap *scu =3D pdata->pinmux.maps[ASPEED_IP_SCU];
> > > +     unsigned int strap2, strap3;
> > > +     int ret;
> > > +
> > > +     if (offset < AB22 || offset > AB23)
> > > +             return aspeed_gpio_request_enable(pctldev, range, offse=
t);
> > > +
> > > +     ret =3D regmap_read(scu, SCU510, &strap2);
> > > +     if (ret)
> > > +             return ret;
> > > +     if (strap2 & BIT(28))
> > > +             return -EOPNOTSUPP;
> >
> > [Severity: High]
> > Does this unconditionally reject standard GPIO requests based on an unh=
andled
> > strap condition?
> >
> > Systems where the SCU510[28] strap is set will no longer be able to req=
uest
> > GPIOP0-P5 as standard GPIOs. Any standard GPIO consumer on such hardwar=
e will
> > fail, breaking backwards compatibility.
> >
> > > +
> > > +     ret =3D aspeed_gpio_request_enable(pctldev, range, offset);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     /* In dedicated-strap mode, SCU51C[9] does not enable pass-thro=
ugh. */
> > > +     if (strap2 & BIT(30))
> > > +             return 0;
> > > +
> > > +     ret =3D regmap_update_bits(scu, SCU51C, BIT(9), 0);
> >
> > [Severity: High]
> > Does this clear a shared hardware enable bit for all three pairs withou=
t
> > refcounting?
> >
> > The SCU51C[9] bit globally controls the pass-through feature for three
> > distinct pin pairs (GPIOP0/P1, GPIOP2/P3, and GPIOP4/P5). Modifying it
> > unconditionally for a single pin request might destructively clobber
> > concurrent pass-through usage for the other unconnected pins.
> >
> > > +     if (ret)
> > > +             return ret;
> >
> > [Severity: Medium]
> > If regmap_update_bits() fails here, does this return an error without
> > unwinding the active pinmux modification made earlier by
> > aspeed_gpio_request_enable()?
> >
> > This could leave the pin's hardware multiplexer configured for GPIO, wh=
ile
> > the pinctrl subsystem considers the request failed and the pin unreserv=
ed,
> > creating a state mismatch between hardware and software.
> >
> > > +     ret =3D regmap_read(scu, SCU51C, &strap3);
> > > +     if (ret)
> > > +             return ret;
> >
> > [Severity: Medium]
> > Similarly, if this regmap_read() fails, does this also leak the hardwar=
e mux
> > state?
> >
> > > +     if (strap3 & BIT(9))
> > > +             return -EPERM;
> >
> > [Severity: Medium]
> > Could this error path also miss unwinding the hardware mux state from
> > aspeed_gpio_request_enable()?
> >
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >  static const struct pinmux_ops aspeed_g6_pinmux_ops =3D {
> > >       .get_functions_count =3D aspeed_pinmux_get_fn_count,
> > >       .get_function_name =3D aspeed_pinmux_get_fn_name,
> > >       .get_function_groups =3D aspeed_pinmux_get_fn_groups,
> > >       .set_mux =3D aspeed_pinmux_set_mux,
> > > -     .gpio_request_enable =3D aspeed_gpio_request_enable,
> > > +     .gpio_request_enable =3D aspeed_g6_gpio_request_enable,
> >
> > [Severity: High]
> > Since this structure lacks a .gpio_disable_free callback, is there any
> > mechanism to ensure the shared strap modification is reversed upon rele=
ase?
> >
> > Without it, the SCU51C[9] bit is never restored when the GPIO is freed,
> > which could cause a permanent system-wide functional loss for pass-thro=
ugh
> > features until a reboot.
> >
> > >       .strict =3D true,
> > >  };
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015035118.=
9495-1-prasanth.padarthi10@gmail.com?part=3D1
