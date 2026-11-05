Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793898602;
	b=RRmKeS8FXWGkPDA6827UdnloQUlAhqd+TkUY37YvldrC3J9rPQlC/P3lVxNqSnCU8j8P
	 +Ndq/o4rUzNhRK8GYJ1FHjytXTjUv+a1EQR3kuA7XbpRTmr3+eT6r8Hbxzh/fiJ9XFySy
	 AwNlBuxGEpEuBAdbzGOWfGJI9BjV7iXq1Fwq1y8FmchMaDVNZ4juOz89/Q8+2YQ08zC75
	 +SSVqXgkcIbanYqNp4LpO6egqRTGVZQ4YOBESQ23ssogRjam9BFkcumTRj+KqOu3kgt/F
	 DqO37geLtlenR3rxj8P0aeQT7gVNnsLIPMM72SNV2BDYOZFZtKTg/4h1xR8G6Hv/+pg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ifFEYR9TPUFV/LjRD8ZLryB8zv3m5cq4xfOUyH46ME4=;
	b=AdCSfP51v8zSxHHht9O8xRvqSTChSHs5JSnMUqKCyliJR1veb6bnvrtiRixAh1RuyeEk
	 Y7fVbf32VfDEyQ+QPDneh/85SdpSP7onT2jL88usoyYwJ0UWn5ryObizEDDl3M9h4zs/u
	 hl9xfMrtpA8X9bziR1V5fRcDp75CgyO5a9MsKu6SrVTZIvv0o3+yImxFuD8KEXIio2EkA
	 lmD7CFzJQOOrUXvj/T7hi6BfYjFlx2KZazSddmGgBL/iCK3t5CjZd9Cgoc9ESU/StJ89E
	 JO4lEMWrfobUGlBZ8itj5h31/hW9DbsylI2v2a4gDohDnSFP+RarmaV5XPR4JEDwA7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTLn8rvN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317D4606A32C
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 17:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 317D4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTLn8rvN
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67c05273c38so1042879d50.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 09:10:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793898601; cv=none;
        d=google.com; s=arc-20260327;
        b=q0q/B+7SdpXQxh0szLIdJdFO0F8LBx0IshOge8iCIuB4sceBS5ijaku9KSFayBy7E+
         D3jejry0uI9EelTCYApsNDekrMN9wPJEdyRvaiI+U8fwdxXBlLkustbINU6q320s4Ino
         2EEcdVlO+2cE97addpqdjBmpIH2ziU8dhInyvykl+Q/Uur8qGS1qPBOL08wFo4BG1EDT
         faYj2/OO0JxyJOcEgDo067x4yfWWNGMdVcd4ybvEnUS/OiSjbe2nRXJ1l2Drk82U0908
         9K4P7krBR3w6NkN7ra80CdQeEMosOENfMDMck3jYMweyrLX5ph2ICKLeI5nd3Niy7BF2
         9+GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ifFEYR9TPUFV/LjRD8ZLryB8zv3m5cq4xfOUyH46ME4=;
        fh=8s/m3WFbgYWSrFq8O6qnuwJh8MouRhxqinKYkPkfiw0=;
        b=OUatp0EhsbboyT/ybQdBXBZTyCQuIIWDGazq2kepvM6gxpnOZ2jgT4vNHjala2wRvL
         SBdb2184lVlfW9utXpQ6Yy4woKUdPHZfyZBeqL9DIjmJgyLpWvikMLP1TLI//zVVnWQu
         a9SjA8V23z3laiZAZK4mXqXDo7iqOhNmlj/BeQIE1+rIuCwuupm3mI1dcAhMvTiKBCr2
         71vwZs6VdorWlRpKhqM8mqxjHt2n6u45EBMmeRh1aOx+sWbIMr78NYtg07hjP48Dd/QK
         EV8rEK4rWJFjvJRtXNd/a0RhttUuFtFUNGJKABWn064cl1dRkGLv3daUGi93dR1mtX2w
         t5vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793898601; x=1794503401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ifFEYR9TPUFV/LjRD8ZLryB8zv3m5cq4xfOUyH46ME4=;
        b=kTLn8rvNnQtJTxWSirNGj9+iWgYPqS3bJaSFBiV5+s1h6YdXQ44k1cpZe5eUScNPeh
         9O2oPq+fKnLq55wCmFwyrcXzR0+wSuwpCqRoy4oFTTNsb63XELfx0xZwT3y6MMRaWlEW
         l1y9rCX7r3t9VRbn9OfNTdwThe2FSPJ7buDK960TLX7b+4dMfnc8wDlRC1MWt8YzzjBQ
         aQVR3PWjC29lc8apIieGj7T8pxD3mgP6EG0156WDcJExYj5zC4UR3pj0QoCb6lo+sX88
         ewW6U/Lf9jrrWPoI4v8Zt5tHvfcCcwL/mRQPGrm3EcODTMBzp+rDyopvzApQIWyrjneq
         jqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898601; x=1794503401;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifFEYR9TPUFV/LjRD8ZLryB8zv3m5cq4xfOUyH46ME4=;
        b=ehLjWUZRCDrmsTglQcRPKt9FeFdMtcTGWBcOUZFQ6ezdJKUH3xPcLghX7huvHyys3Z
         xQp3t8nLebh7P99rozS1vq0Z2AecILtRplQAxI2ma6DJ5rvNPEMIVq4jLI3JrW5m4CyD
         6/vW5Nyq0+RpZgeqViEOdSTHghce+7cLyuq9ENQCbghvGWZZdqe7kwe/rEMuWgKtBc35
         DXIkoTjGHEeLp+2IQED/LEy1fIOBHGIkac8GQMSjnHDo9I/iVICY8TOlYxox01fnkLDD
         cdSKBEXeQvJKa4NEAg1qhU2iKRjl5FYs0fBiJwqxIdNMgA+8LBxlM6w480M6A/QbvYDk
         qLrA==
X-Gm-Message-State: APuU4Z9qcXDBvvcJmCiOuGvRyAlfkj4DkJ5ZZqMhpW3UuCUm2bW6iU+S
	gtrPKKBjGvS7/2BdPCYnXIPAby8xnNToOunslZFV5Av5uW0K6+qm8IVCYHri2/eRNQ445+PbZr5
	yfLCOXx2L4BTA0EX8ynTe07wp2o40+uDFGnxK
X-Gm-Gg: AYBFou2OvtwhD2eeTzuw489Qj6ksKM8GP82uA/yv7nb2D5GNRgn+aZE83FUA9KzkgZ/
	mbvTULYZISyideyj1Veav6OYisrY3nZ6ECQr/lAqPGSvr9cwGabklOAXOj1yvpbznHpgsg/sKVe
	j4idykA7DY36x8HF4C2ZmaUgukoIxd76V4lCwkZSdS3IsxowWt2id+/3OhOUz0YZaX20WVPuisS
	iHX/RI4vs/EgygTjjjiRRfOgm9GcHtGn9Jdj2s2oswu+oO+eAhAVHrNS4KnGKsIBxVzuHkzuwt4
	/DfgVdwVBxgiuVEUBboCPFxMwJfQ1ZxsQKccOX/YS4pRSLd45YExXPqh4GAWZWK4Yh0zfvOEXCF
	QTq0lWfiVxIHbppqX+fGXIB0KB9nE4hY83DMn5l0=
X-Received: by 2002:a05:690c:113:b0:8b3:2eb4:1429 with SMTP id
 00721157ae682-8b32eb41a88mr12568607b3.65.1793898601098; Thu, 05 Nov 2026
 09:10:01 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022024314.48623-1-prasanth.padarthi10@gmail.com>
 <20261105152348.8567-1-prasanth.padarthi10@gmail.com> <sashiko-outbox-199315@kernel.org>
In-Reply-To: <sashiko-outbox-199315@kernel.org>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Thu, 5 Nov 2026 22:39:46 +0530
X-Gm-Features: AclHuK9EMZYoNclpt7vGM08eNe4WIB8G2Jwgu5F5HXqHJo1re962sdUNfsV_OY0
Message-ID: <CAMFFDGiM2ExudSegF0X6sQN+AraYnorMHw9R8YvTBXRbKGNCuQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: aspeed: Hand over global GPIOP passthrough to
 local mux controls
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. I checked the shared probe helper and confirm
that it uses unmanaged pinctrl_register(), while this patch introduces
devm-allocated private data. The unbind lifetime needs to be corrected.

I will address controller cleanup and private-data lifetime in the
next revision.

On Thu, Nov 5, 2026 at 9:03=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] pinctrl: aspeed: use-after-free on unbind in aspeed_g6_pinctrl_p=
robe()
> --
>
> commit 7926ad91b4f1741a83b80da360b9a845357a5376
> Author: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
>
> pinctrl: aspeed: Hand over global GPIOP passthrough to local mux controls
>
> This commit transfers global GPIOP0-P5 passthrough selections in SCU510 a=
nd
> SCU51C to per-pin mux controls in SCU4BC during probe, and blocks GPIO an=
d
> mux requests on GPIOP0-P5 if the handover fails.
>
> > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinct=
rl/aspeed/pinctrl-aspeed-g6.c
> > index 85d6640ff4c4e..be22a918420df 100644
> > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> [ ... ]
> > @@ -2778,15 +2827,103 @@ static const struct pinctrl_desc aspeed_g6_pin=
ctrl_desc =3D {
> [ ... ]
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
> > +
> > +     ret =3D aspeed_g6_thru_handover(scu);
> > +     if (ret =3D=3D -EPROBE_DEFER)
> > +             return ret;
> > +     if (ret) {
> > +             g6->thru_error =3D ret;
> > +             dev_warn(&pdev->dev,
> > +                      "THRU handover failed (%d); GPIOP0-P5 mux reques=
ts blocked\n",
> > +                      ret);
> > +     }
> >
> >       for (i =3D 0; i < ARRAY_SIZE(aspeed_g6_pins); i++)
> >               aspeed_g6_pins[i].number =3D i;
> >
> >       return aspeed_pinctrl_probe(pdev, &aspeed_g6_pinctrl_desc,
> > -                     &aspeed_g6_pinctrl_data);
> > +                     &g6->pdata);
>
> [Severity: High]
> Can this cause a use-after-free of g6 if the device is unbound?
>
> In aspeed_g6_pinctrl_probe(), g6 is allocated with devm_kzalloc() and
> &g6->pdata is passed to aspeed_pinctrl_probe(). However,
> drivers/pinctrl/aspeed/pinctrl-aspeed.c:aspeed_pinctrl_probe() registers =
the
> controller with the unmanaged pinctrl_register() helper:
>
> drivers/pinctrl/aspeed/pinctrl-aspeed.c:aspeed_pinctrl_probe() {
>         ...
>         pctl =3D pinctrl_register(pdesc, &pdev->dev, pdata);
>         ...
> }
>
> Previously, aspeed_g6_pinctrl_probe() passed the static
> aspeed_g6_pinctrl_data structure, which remained valid for the lifetime o=
f
> the kernel. Because aspeed_g6_pinctrl_driver does not define a .remove
> callback to call pinctrl_unregister() and does not set .suppress_bind_att=
rs,
> unbinding the platform device via sysfs frees g6 via devres while the
> pinctrl_dev remains registered with driver_data pointing to &g6->pdata.
>
> Subsequent calls to aspeed_g6_set_mux(), aspeed_g6_gpio_request_enable(),
> other pinctrl callbacks, or pinctrl debugfs entries will then dereference=
 the
> freed g6 structure.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105152348.85=
67-1-prasanth.padarthi10@gmail.com?part=3D1
