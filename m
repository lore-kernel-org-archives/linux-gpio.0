Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A06330D25
	for <linux-gpio@vger.kernel.org>; Sat,  3 Oct 2026 17:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791049970; cv=pass; b=dDPoGWTupR7xCwWS1NJg4gS8+OnsoiCiVpoCYeANpJHL+DGopsiOnPy1MNN0CIAfBdl2PtDA4ZlMKOYkouGYmdQoeuMRC8UrEgGg+6AB/vGWzhJn2YhVFQEH5dTWmqcJoTHwUl5HGz7E3zBmW+UVGyMoBoDCpZwn36UTWFZyX24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791049970; c=relaxed/simple;
	bh=vxWtWY3HzhdcLD80hVcaFM9T8LFY9yejGPC1lkqa+7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=faCKrCM3lGNcqQP2iV6cRbGSgufwMEwRC6Zx0nqFZ1Tz0yS55/Iz9Q90lh4CDIL/0ny1Lch2yUkJ8YGsKrZcWMDzx7s6bOlwwSWkC7x4SgM2def6d2kpMCJo6tYMA1G8257GLv83oC7XNiw8fLRLLRpvHabW3Rh55BIBfh6wWw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzwTksZ+; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzwTksZ+"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2e59b02972so99833266b.2
        for <linux-gpio@vger.kernel.org>; Sat, 03 Oct 2026 10:52:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791049967; cv=none;
        d=google.com; s=arc-20260327;
        b=UC3s+DMk+iJOIKRXs2pQq+jUcO8ab09AzLOs8pCikIQfp3kt7mQb4QX7hVVbaGNIhC
         P8qJeLe7e5iZLaTMN/iGwKhcCEdXLuFpPtX2mwxjYn+t/bcmpLURKonj9+NW7Gr5Q004
         t8kKbfWQe/L3IvNCVFgHubt1kdo5koIyZuhogK7n05xifbw1IaihsgjvQxQvdTl6cYX/
         zlhjtUHGeqM9IVVbQzPp6fZ8r7cY0s/eJFCW7s2uxEhV0gnO4r3veITOXvIPz3CJw/jF
         wy4BHKBZjYmSM54AKwyLrHGFeH9Az5ZlCyksG86zrNkSOZtgsUVNbDghvwfDtLh9IjoD
         lKWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VN3txJe/MPJQiSdkFN0bcV+NWMy4D27bCjExhikemnU=;
        fh=kQoHgGJVNtUfs74PkQgLFFxWmi4i2li2rrtzqPO3oX4=;
        b=KpsDnsTxiPYyI6pfAqdStfP5zHjxa9REDNXBmWJIbfcqlatMoz4tNofgXfl/9afwbM
         5Q/0gyDXF6OtYGPR0bv8ysjf/sJZT8P+q1q8VpkcfZg4fSP7t3CiYmyjUv51VRRnddy4
         V/sGL2Rb7fDLyex+eE1D7e/dvLDV7rUp59FW4pKtyLb8mPUp3XDLLXJsS+2N7j6Aj558
         ipzwWStGXJZH11BR/UuSehqxH0Wal//8pTFnrblDvsuPbgedZMJQfylUPCDcUmWE5kbB
         o7EgY4rvJKkVIiwkzYsxiKRNp4cZGkp0zG4rlwBBDfmE2XwrzJoPFv/xIeM20/eocbQI
         C6eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791049967; x=1791654767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VN3txJe/MPJQiSdkFN0bcV+NWMy4D27bCjExhikemnU=;
        b=fzwTksZ+Dd6LsSoQwOkYoBKbqxJ98lyG6SZVlr4dLjyO1Uue7HPS9+hcANwv/TvhTk
         4snPwaENRURr5uL7TSrnTk3ZooEUGDP8qkAYLZub8owa/IMNPixDsUIWFZZwTFz5ZBfi
         BLN1mOkcn1dViHjbe1f9AHAlVofWhkq9Aj2/aoQ/ufIub7AMEXBRGmj31O8zT2ZwwEMi
         Du0cpATZ1xsluq6GM48eXJ0RO4ehwTEVMcCnRQq17DFVD3z263utakI8ApdqkqLj8bgP
         dsO+x+r+vY6KCUkRBZkuWgCxmJ/9IBG27YU5KqFUTZZBxD7he1Eg97GTL3xD7UaP5sDS
         V6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791049967; x=1791654767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VN3txJe/MPJQiSdkFN0bcV+NWMy4D27bCjExhikemnU=;
        b=XAOsylygChUAJMnMMprnJZis24b2s+XvNRQ0UqhvAzvJqf2KGdrz/q2CNFxnynboRY
         5enYJ9nj3OOYFUTvPdyH8SCI0oE6RcNggbmkNWLaadoGckfmz045KbEZPH0SjA3vl847
         /nu3tMlphfpJUfLpFOaymZ7Evt0vaxl9yD8kdcuOnKwLDALHdByKnUKJYgn6YVAOs8oS
         FumhjMvg1nLSIICwiewH+dX8E+O6dx2u9O4q7EFSQJL6tVXsLMBuJfM3BJmDW7h3Uv3L
         LKRhyZVIDWLk5+Z7rk8ak0hE1zMiUToOb+Qp2wJXUL48k/xsBfnrF/AHzyNJWQ9CaTvl
         Bg0A==
X-Forwarded-Encrypted: i=1; AKwUvBxr+3w+mGncqoTLBWCR6KI4hvwp7G+uTtT/RfG8zSXMz/gum+4eYipGt/lOks3hR7P16NM403HwI8fr@vger.kernel.org
X-Gm-Message-State: AFuF++mS7g5XRp29DY3W/zP1hpmbRZ8A5+GADVh3EvytLaMTyyyQG3E4
	6axLAUrA3FuiXnQMyyYEcJ9lkuf2M4l/490bhmJzO/5MksY7YL95XIcF1nuRcY1+19RsL9jkOl/
	E94u0Vfnk9AnXTRC6Ga56KmiotojkNWw=
X-Gm-Gg: AYBFou3LJj1lTj86GrvEOWiBoj1YshGpbAxD+z8y7mWovaktXFbfPDbx1wJ2/wILHEk
	mmJ7d7ba3HDqV8+DtagSyTLeN9C1BOdQ0Vk7Sjb1Xt5xHTdOHhl7IXhluEhp+wSYO2vrtopd3zB
	OH1uuyf+8dQ5K1T3AUUuNBUo4NU4n31XfohBk2hahJqT3D56RpnEqRH/HFyfD7DEb9WWFeCkV4P
	BMz/7R41jBPQScQ25AYdyhAklBL++PuU8AkD9QixehG/L9Zt5sP0BBEt5yKo5W6+SYPP9uhvvEA
	Udxxo33Q21RGW2Ixeey+/08b6gPe/X1DZ+pLv4IC5a7UtyGJlB27wUItZAQoL0drMBIqR4JLjja
	4VD/vmrUBsqiIG9lI5hHOWGrHSDcoU7yvyEbWo+IpIcCwTjzfbvP+yOOXMkWDFeDi84p0BbvFCx
	ssOB2eDeHtB6Ln1v/IRuFOox2Pbgit0QNi+YjtKaUd
X-Received: by 2002:a17:906:ba8f:b0:c2a:f1e7:d1ff with SMTP id
 a640c23a62f3a-c2e4a8fd869mr493909266b.4.1791049967157; Sat, 03 Oct 2026
 10:52:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-5-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-5-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:52:10 +0300
X-Gm-Features: AclHuK-UG3tTAL01WV2ZDjC5tjM6igwBQLvqa3RPpfuP_ptSFYX_iuwDV1YsoBk
Message-ID: <CAHp75VdyMJUBv9Y-4vdAWp2f2JB0toX+y7hV_esXxtni0wXutw@mail.gmail.com>
Subject: Re: [PATCH 5/9] gpio: mxc: use devres-managed PM runtime and dev_err_probe
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 3:09=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> Switch pm_runtime_get_noresume() and pm_runtime_enable() to their
> devm-managed variants so that pm_runtime_put_noidle() and
> pm_runtime_disable() are handled automatically by devres on both
> probe failure and device unbind.
>
> Remove the out_bgio goto label and replacing all error paths with

replace

> direct returns using dev_err_probe(), which provides better
> diagnostic output and handles -EPROBE_DEFER.

...

> -       pm_runtime_get_noresume(&pdev->dev);
> +       devm_pm_runtime_get_noresume(&pdev->dev);
>         pm_runtime_set_active(&pdev->dev);
> -       pm_runtime_enable(&pdev->dev);
> +       devm_pm_runtime_enable(&pdev->dev);

Definitely not.  There is little point to using devm_*() if you don't
check the return value.

...

>         err =3D gpio_generic_chip_init(&port->gen_gc, &config);
>         if (err)
> -               goto out_bgio;
> +               return dev_err_probe(&pdev->dev, err, "Failed to init gpi=
o chip\n");

>         err =3D devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port=
);
>         if (err)
> -               goto out_bgio;
> +               return dev_err_probe(&pdev->dev, err, "Failed to add gpio=
chip data\n");

These (and more) don't belong to the change =E2=80=94 split it to the
logically isolated ones.
One patch for dev_err_probe() and another for PM calls.

--=20
With Best Regards,
Andy Shevchenko
