Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B343ECBD5
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 09:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773134392; cv=none; b=Lk+uLERflD2q8wZF13wwukVB8NCw1UVoGS073SceMhg3w8Q0bm4mdzo8QYJSei8A4kEX6nDvoOnjXu9A8+6UXYz1cn/HmXV2w+xeQWRPMNKNl2h3ZDaG39mqyWyUqjt8IqJ53KqNulpFrSwC2HdPcN7wQMgh1vhuChQnawC06Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773134392; c=relaxed/simple;
	bh=GF6I/Gt6ggVsFZ1MTQb+5ZG9UqpwuJ1TvoXd1fcQqD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJQmyM8Trv2RE586FtNub6VmTcy9xHtLSWcTnW+U4gIw475IgQn1a9DlEfTKLnkkQKMI7uGw7RFNEq3rDWMKzRT+2kdARJvvYZcNgP+TN2pkuT4ZynDraSWoFekpeD2gJwJWId5KopUkVNrxJ9jXEvkvml1doicCoaZ4k7VN0Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCe2RRMe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCe2RRMe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD89C19423
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 09:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773134392;
	bh=GF6I/Gt6ggVsFZ1MTQb+5ZG9UqpwuJ1TvoXd1fcQqD0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OCe2RRMeqR54xQK73QU7DZfDefzL1aFwipLtNXTWG8OC+lkTQX/3/RvxEmVzJr2Qc
	 Ih+c1sN4oTdLYx898IHvAyX/wZlh5kg2hxGltVcA9uUXa7QvTkrHW6GhpA+qPv5DzI
	 2Jj7WUJWoaysyBxahpcBxfdJE6BiNZaP4E+dIgAnUVdibB5K86BJwAnESZ1is9N3pJ
	 YBMzpV+dZdjG+zqtxu/hT807Im0/WwAkHcxIldoiwkB3PkIlrfD7vS6xflO9mEXeRP
	 9/AmG0R0dION9i9Xhls/jkONX4j4wnCbMrx0ViFHl/PyMdKr55url1BBSJyy8Ns33D
	 lgyFYXsyaLU5A==
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64ae222d87dso11522384d50.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 02:19:52 -0700 (PDT)
X-Gm-Message-State: AOJu0YzVijoOQa3YmHPeuQEmrNPURpgg7YiDm7KhO8KMPRG9kedMzKj1
	h8VfENaZDqUDGRjfrSodcukT03D4uUW6mmUpxA5khzFMjWdSwjO8kpRICslxkSIJcvFimTSbmNy
	TXHmzY4MATwy4StnJFO/F0m0Gh1cSu/s=
X-Received: by 2002:a05:690e:1913:b0:64c:f2f5:a1ff with SMTP id
 956f58d0204a3-64d14163efemr12462920d50.33.1773134391399; Tue, 10 Mar 2026
 02:19:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305095014.3221492-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260305095014.3221492-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 10:19:40 +0100
X-Gmail-Original-Message-ID: <CAD++jL=N1vxiNEDMO5quFvYOi=u4FZdgUf7fLrhDDEB0mNnqbg@mail.gmail.com>
X-Gm-Features: AaiRm516rwWz7_5viD54Z0FFaWffDRgGgkvTDvAi6b8Y1tVB9vFjvLsGATVbt74
Message-ID: <CAD++jL=N1vxiNEDMO5quFvYOi=u4FZdgUf7fLrhDDEB0mNnqbg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: pinconf-generic: Use only fwnode API in parse_dt_cfg()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 10:50=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The parse_dt_cfg() uses OF and fwnode APIs. Fix this inconsistency by
> fully switching it to use fwnode API and rename the function accordingly.
>
> While at it, add missing linux/property.h inclusion.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied, because obviously the kernel looks better after
this patch than before it.

I had to rebase the last hunk of changes manually.

I think there is something more to do, but you probably
already have a plan:

> -       ret =3D parse_dt_cfg(np, dt_params, ARRAY_SIZE(dt_params), cfg, &=
ncfg);
> +       ret =3D parse_fw_cfg(fwnode, dt_params, ARRAY_SIZE(dt_params), cf=
g, &ncfg);

and that uses:

#ifdef CONFIG_OF
static const struct pinconf_generic_params dt_params[] =3D {
    { "bias-bus-hold", PIN_CONFIG_BIAS_BUS_HOLD, 0 },
    { "bias-disable", PIN_CONFIG_BIAS_DISABLE, 0 },

Are you already working on a patch? ;)

Yours,
Linus Walleij
