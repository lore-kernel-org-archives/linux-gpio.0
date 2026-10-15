Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31285425878
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 04:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792037364; cv=pass; b=LQ1ujSz+tDMst77QAtn2fEpTSf/TH7QDnG+HS192Wg8Wtp2YaK4sCLz7k1pIC+Kv01hS//c2wgbNcOCOvyiRGiZbCSx0Th7ZKQsbmMOScTzvznstARwr79b05w7JYAM4myQuk9he1coQR1rf5lBxPN1mV5CzP5c8s62naKkiYqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792037364; c=relaxed/simple;
	bh=cwcIQjmKeVD7FnLdEzP8n5oUHhca5lVTuP6lLsa8DEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f7DAlgsdgHYsRNO9EXhts4HdDhJVj0E9oPUYBEQfqmRoGeEQ3eqlw5S/K4dx+fBaZm9X00tpUfd1ome6iGTh89hLPR+Joo+q/+7i/Rn8smuXwBttdSiEN5EnUDQ84hc7eJPK9FHqOSscXZmi2YwXKiaVMTOzrAtAstDdWPYaHDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=roI4AOWF; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="roI4AOWF"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-888cbacf70eso54690917b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 21:09:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792037360; cv=none;
        d=google.com; s=arc-20260327;
        b=e/AubO9Ka/nzYx3GFl3vNeWbf4yM5YnP4h/zUfJgpNt7qEMuEIF2DTWihW+knsPpyc
         sHYVwwMM61SUpUra9JKfBgtnFhok+9nvm97PGN6pG9UK3M3EY9mIrK9kmwYeJSzRsEYl
         pPNr6pGNVwh8iOu7a+/tLl9uCrR2QtJH3y0o6DbaxEQCYyB36fnsA4De5odUgc046LXN
         et4f5bDD2LJt7wDNmUiY33dIuDjpcYXtXhGq2jPjFLaQR0GhvVijLWe+8/ks5ZlaOYt6
         RioFKzVPV6N7lsbd6blLOBS2bVwiGu0o3bnPlLvFmaDdCTj/cAjBzQCoW98ED1u8Cfk8
         HSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z0RARrI6Xkn31Iauz6QebFLJV9EzpgSJiNuHo75FS8w=;
        fh=8s/m3WFbgYWSrFq8O6qnuwJh8MouRhxqinKYkPkfiw0=;
        b=WtgWBSkwA95iJlZBFNy7RaJryQKntGteEHIATb4OnQ2QNKsLKrdZQL7Y0pXEF4RuWL
         kpw7nkfKusAnKXXqUKo5+xxMFQxc119lsFfiJmuiOCa8inAJ+TMSYWixo3iyZfjxY/2l
         T9lSZ7+fkoEerxTE7Ypq8EZ/MOPD/Up/LMFGYzp8jdZpJSjqlxH4NW6u+xcZAhyATHEt
         nGXT0jyQKe1KxFaWwY38z22W7cpzR8UxEB1Llr9o21/bL8L1e4wIQ/bqYcnjLJ3D0CeZ
         Yo17Ip8LkchorWDP8gDuMAS4JdMKOKni5OD1b7t4v0Rnv4q+G1aPUHAJVZSV7CNocQha
         61nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792037360; x=1792642160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z0RARrI6Xkn31Iauz6QebFLJV9EzpgSJiNuHo75FS8w=;
        b=roI4AOWFOOJkI3qT77jyaY3S6DeWwqvW6Cv+vquQh161BLVLidbkz27brD3e1iOlHO
         dwmNpX5TxBDQ61YxzVKFrN5p2ce+vY+oDp2dsGxD/TPSHGGqh1wZ1UCpt1SCnBDqX8tl
         gy57unsjSYzj5FldlUymTaWFo4IfeItpE+3xCGas7Vyyal/oXSXAElenTaQcT68crkT1
         PXchKbTTLSidCs52fKloV9/sBmC27T7A+1OJHAO2n0ZhDpEbc1RM0QpvU6BAe0gkJh3e
         gjfDuW2nz0mIDC76023t5Jttd7e5vJDY4SRowR7cqvoTWaNm/YMuu5QPrhkatpJD72Q4
         IyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792037360; x=1792642160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z0RARrI6Xkn31Iauz6QebFLJV9EzpgSJiNuHo75FS8w=;
        b=f9XERA0WLdtoz/hjPznGvjG3VRq+2tUBdoODiPccgPu9ciKhjv+O2zSyRJsw1SgYu/
         Ye6f1sl+aI1EE/UmfYXuj0/FQd0Paz/PSuY+pLKY70lmeauWU171fM1jKIy3BsFwtkQc
         pTjPNaIehgXjG7S1iRzNzNmWyiPxLqk2IbhibWS1E40dQal+QFW06bLTMGwOTpqyv9tJ
         mypia07+8tWsnKphqAs1AC+56plbechKocKTr1z17+XDCbj9Z7ZlEHsiwExDBxCPge5b
         AHTmMf+qtISr4VoYQ/hQn7Ax0w0+J4mHV1zzdVgLfwjB40gKFqt7nZ2HEGnFyp3pEmHL
         2sMw==
X-Gm-Message-State: AFq9FYLjtHb2BmcnguHbBvESOOeELJxJQJJteT6TSLeZujOdwutCDSzi
	jo2Nanhon1KUwyktJqd6YwfyUmaC0WBlMeGUAv683fZ09lFVYW8PZpAYsSrekuxRnL32hkf5nAR
	6BlS1arwB1YPaAttEp0/wTctUzswDLR9rPXPW
X-Gm-Gg: AYBFou1TIredLtIAD2CJbr2NfB+oIVW7SGKg9WsE23JN9lVo87LMRge6g6t5+GIKIGn
	Msc5l/huLjLFbcYiZeSKDi0S1XuxXICUGYsznnx2yKHPg/+rb0eBk9/btQGst6aZL3cQ5WclXPZ
	cACb3YBdxTkNEF8pYH2oX8wvoUXcd2F1MSV93TqR/J2mKJ54e/xRUdJqWNGLmNuDSRkEq4cxRQm
	bQnh96MXRi5ENNQnqJxy8jABJ+PzG57mqcRPvBgy665sKhw1dNtmC80nZoG/YRe4T/iBF9+Lk2h
	p8wBL/VAk8c3X4JRgWpmYBT/4nHuODjOXprWxITKhCJ3BGaThhCuA7RVPA==
X-Received: by 2002:a05:690c:ec3:b0:8ab:36db:e2fc with SMTP id
 00721157ae682-8b07ee7527bmr57485067b3.58.1792037359820; Wed, 14 Oct 2026
 21:09:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015035118.9495-1-prasanth.padarthi10@gmail.com> <sashiko-outbox-172228@kernel.org>
In-Reply-To: <sashiko-outbox-172228@kernel.org>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Thu, 15 Oct 2026 09:39:08 +0530
X-Gm-Features: AclHuK85ar3Quea9pPbexRyYHc-KVCFcZrOcG-WitctjclERdx06hBQK6rhJ0KQ
Message-ID: <CAMFFDGgxiTMd01iU5JJebvTLBF9ku1F9Zq16LV+gYyqn+tBVmQ@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: aspeed: Handle GPIOZ6 pass-through strap on
 GPIO requests
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. The shared SCU51C[9] control and SCU510[28]
rejection are known limitations called out in this RFC. I agree that
the post-mux error paths also require attention.

The hardware result establishes that clearing SCU51C[9] permits
ordinary GPIO power control on B650D4U; it does not establish that
this callback implementation is suitable across AST2600 platforms. I
will investigate coordinated handling of the shared strap and per-pair
mux state before proposing a revision.

On Thu, Oct 15, 2026 at 9:31=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] pinctrl: aspeed: clobbering shared SCU51C[9] strap bit breaks pa=
ss-through
> - [High] pinctrl: aspeed: unconditionally rejecting GPIO requests based o=
n SCU510[28]
> - [Medium] pinctrl: aspeed: missing hardware mux rollback on error path
> --
>
> commit fc751bac2dfdee809f65ba4da118ede6fdbe6aaf
> Author: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
>
> pinctrl: aspeed: Handle GPIOZ6 pass-through strap on GPIO requests
>
> This commit introduces an AST2600-specific GPIO request callback to handl=
e
> the GPIOZ6 pass-through strap in SCU51C[9] for GPIOP0-P5. It clears this
> shared strap bit to allow host power control on boards like the B650D4U,
> while also explicitly rejecting requests when SCU510[28] is set.
>
> > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinct=
rl/aspeed/pinctrl-aspeed-g6.c
> > index 85d6640ff4c4e..6e58feb48bf59 100644
> > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>
> [ ... ]
>
> > @@ -2743,12 +2744,56 @@ static struct aspeed_pinctrl_data aspeed_g6_pin=
ctrl_data =3D {
> > +static int aspeed_g6_gpio_request_enable(struct pinctrl_dev *pctldev,
> > +                                      struct pinctrl_gpio_range *range=
,
> > +                                      unsigned int offset)
> > +{
> > +     struct aspeed_pinctrl_data *pdata =3D pinctrl_dev_get_drvdata(pct=
ldev);
> > +     struct regmap *scu =3D pdata->pinmux.maps[ASPEED_IP_SCU];
> > +     unsigned int strap2, strap3;
> > +     int ret;
> > +
> > +     if (offset < AB22 || offset > AB23)
> > +             return aspeed_gpio_request_enable(pctldev, range, offset)=
;
> > +
> > +     ret =3D regmap_read(scu, SCU510, &strap2);
> > +     if (ret)
> > +             return ret;
> > +     if (strap2 & BIT(28))
> > +             return -EOPNOTSUPP;
>
> [Severity: High]
> Does this unconditionally reject standard GPIO requests based on an unhan=
dled
> strap condition?
>
> Systems where the SCU510[28] strap is set will no longer be able to reque=
st
> GPIOP0-P5 as standard GPIOs. Any standard GPIO consumer on such hardware =
will
> fail, breaking backwards compatibility.
>
> > +
> > +     ret =3D aspeed_gpio_request_enable(pctldev, range, offset);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* In dedicated-strap mode, SCU51C[9] does not enable pass-throug=
h. */
> > +     if (strap2 & BIT(30))
> > +             return 0;
> > +
> > +     ret =3D regmap_update_bits(scu, SCU51C, BIT(9), 0);
>
> [Severity: High]
> Does this clear a shared hardware enable bit for all three pairs without
> refcounting?
>
> The SCU51C[9] bit globally controls the pass-through feature for three
> distinct pin pairs (GPIOP0/P1, GPIOP2/P3, and GPIOP4/P5). Modifying it
> unconditionally for a single pin request might destructively clobber
> concurrent pass-through usage for the other unconnected pins.
>
> > +     if (ret)
> > +             return ret;
>
> [Severity: Medium]
> If regmap_update_bits() fails here, does this return an error without
> unwinding the active pinmux modification made earlier by
> aspeed_gpio_request_enable()?
>
> This could leave the pin's hardware multiplexer configured for GPIO, whil=
e
> the pinctrl subsystem considers the request failed and the pin unreserved=
,
> creating a state mismatch between hardware and software.
>
> > +     ret =3D regmap_read(scu, SCU51C, &strap3);
> > +     if (ret)
> > +             return ret;
>
> [Severity: Medium]
> Similarly, if this regmap_read() fails, does this also leak the hardware =
mux
> state?
>
> > +     if (strap3 & BIT(9))
> > +             return -EPERM;
>
> [Severity: Medium]
> Could this error path also miss unwinding the hardware mux state from
> aspeed_gpio_request_enable()?
>
> > +
> > +     return 0;
> > +}
> > +
> >  static const struct pinmux_ops aspeed_g6_pinmux_ops =3D {
> >       .get_functions_count =3D aspeed_pinmux_get_fn_count,
> >       .get_function_name =3D aspeed_pinmux_get_fn_name,
> >       .get_function_groups =3D aspeed_pinmux_get_fn_groups,
> >       .set_mux =3D aspeed_pinmux_set_mux,
> > -     .gpio_request_enable =3D aspeed_gpio_request_enable,
> > +     .gpio_request_enable =3D aspeed_g6_gpio_request_enable,
>
> [Severity: High]
> Since this structure lacks a .gpio_disable_free callback, is there any
> mechanism to ensure the shared strap modification is reversed upon releas=
e?
>
> Without it, the SCU51C[9] bit is never restored when the GPIO is freed,
> which could cause a permanent system-wide functional loss for pass-throug=
h
> features until a reboot.
>
> >       .strict =3D true,
> >  };
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015035118.94=
95-1-prasanth.padarthi10@gmail.com?part=3D1
