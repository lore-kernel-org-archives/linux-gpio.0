Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81603C3BE0
	for <linux-gpio@vger.kernel.org>; Tue,  6 Oct 2026 08:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275816; cv=pass; b=MUfme7Izzh0GxbjF/DIq3J4/yi/RnLafo1nO0vXGk2WFpHRAvDWUSLkIFUaHR9HigFMlqVsLI2H/PAvpuP80n+lkNz2wSNZjGm9SpbOeIlsYydq9IQjAyMVFkxQzVs8NThXuKsCXhpbrP9AYEHT/6d7bUuft5H2xmmDA6FRFeKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275816; c=relaxed/simple;
	bh=QLEBVnIW+aFeWqP804aoo9rQfAzOmPivw26f4x4A/wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jqmG5HIdJretPZVXEHA4Vffyly5bf1mEpg+Rna9W7nJMR38lg/Lg/pxtCGNXpAXKDZdCebmCNs+Wopl9jsoCtTWHjX5+9MBQMzXt5vfZIVl+7rDhjYGLVvBOA7OKV0J5K4uFN3GCEe1dLaUtleefwqZASd8GqQlwGCbE006F20A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9TBv+5c; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9TBv+5c"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2e5d08214dso383783266b.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Oct 2026 01:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791275813; cv=none;
        d=google.com; s=arc-20260327;
        b=QbqbifhuLAnAQnbul4B0vnN4guIDlDa13v0c9TtSQwgMke1pUwkBx3IxE1njxbren4
         6AYw/KED5PChC+B/TMwKnQ+6bivoeOKBao93eyR8BzhDVAIvoDrZXPRd5tDMw3dblXCa
         BJrusjnDkt+cmBGPDkZsns32o+MvRVX1IcbGuScpNe5gn+srYHO1kAHSxuKtl20EPt/a
         teqzfb3qeTs0NgZlZO6t3bLVqB9D2IYiw3ZgGbtiBkVRSogXWDfWi8aJNDP23hOxtnz4
         KxtE9duw3ithgxNsUxj9zZ9v0BYuxPQDlCshxkhmMOSDwmM4J8T1HgOc2PNWP2lAhKri
         UEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dPUBVtwXpkjB73xJy9d9sGCYrAAokkcesa5s+T0NIQc=;
        fh=pWdHckMm2Nm9ib/hHlpWebL+7jxA5y5ywEEvjGLTU5o=;
        b=T/aRlf7MR3s85S/gll8FRBhlTInxIhRENvKDelqHfNlxejej9OYG4qfLgHYgO96RaF
         U+P0jMa9zFsVdCDEMnczRWBJu7iFivwHj2153u6itUFriaNNCsLsj72gVfuEH/zz5ecd
         cEii3M4MqKkod0egTPSaft1KkJAmcd8LyZRw6U1eqzkWnaNqtCOTgzf0GQzkzhe/X1++
         sHIegdWeI7ItogMt63UydJ4oLhEXjQFSZ7tbVAtFE7OpZ+g/wWDrtLjstdoBT0v8t/7D
         MDoeTs2QYSsYUIHXZcGLEPsNlInYzk6dC1g0XCCvMTbetB/qWoZwJ51FdOshLJO0obqU
         O+3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791275813; x=1791880613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dPUBVtwXpkjB73xJy9d9sGCYrAAokkcesa5s+T0NIQc=;
        b=e9TBv+5cXsj1ahyM9umZgzC8HYb5dPcrI/ktr1JgcjHoO1Ij93tc2tHW8Gom/gASP+
         XVQDFM3dMpkVjT18Beccx7hDavaR6pxiBDC/2urHuxO0hJqVBIP3G5DVbIP7QBousxuZ
         e6DWPNCDuJPPXtCSKvl8HZJ+u/GzEEmxFKNVe7gdMSZP6WSZ9iQTobLXFsa6FmkrB+ID
         tpN8n4cbLjFeB2o4eJ5PQfJrPVVArkzLB6ukyf7QiJUtQVDorr0XG4rCGbksMj+WEJ0M
         B9cgWrzZE8bryZMY2jxNsyjGXu1AcjUYy6i+CI9MErtIlEFGhjV9ldqC493Xh+zan67/
         vkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791275813; x=1791880613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dPUBVtwXpkjB73xJy9d9sGCYrAAokkcesa5s+T0NIQc=;
        b=GPWEoOFWxFuPNcBTruHarwquqmKAfhlU8Fv/7oBJBpHkw00j1nTen4v+lyikjiqXyS
         ASIMCeKr7Yf1vjp5NQyY8eUpFesuhWkw0+6+JCDFvGYOfEw58I+mObRI5XrUH301jAkG
         J4Z2JVUoMmJNfsNd2jOimYbrsnVKO+2570zrFMFOOmpV/IUAGj2dV2lVNcJm48ymUcLO
         DpOLqZoZOgU0Asd2t7PfxLHWQcclhwUIHMAu2roV1pFfqTT/ymRSuhxCZggvhHNK0awf
         oQIXZVd10PoqjML2tpTgLJ+TNjiPVRbYMUHSvPOH/bo3nphwhzKIe912Jkb6Eq76nSNB
         2Yng==
X-Forwarded-Encrypted: i=1; AKwUvBwZhDL/zRrcfRb2KQMm7eJdyxiaNCIM+k65CK4Dhg7OiQ+++tLh6QcD/e5pip2X3yKZ6XlMMJF8GTvo@vger.kernel.org
X-Gm-Message-State: AFq9FYK6wIK9EhGHgrr65k1KOpXxv3oBJYR7NzhtVGOiYjbom0w9TzRc
	sZsJZX69A2hMC1gaSXw74WRfm4hBGq7S9BL1msBm3Y1UQfxABNLJHnZvHZ94A0U8TVjx3wIP0Gk
	Bsda2m2XTnO6/rALhz5BOm7KX4b4SFG0=
X-Gm-Gg: AYBFou16Y6Tr1LbwJ3Qa/2oMzHdfXJVVFIMMdeKtejPPqgXa4EHOv/VcCt6LEK5aA4V
	5vsLIhwG1Fhgh1EkB7fnNmC3lkUFcnTSv0puqyaNaUVScv0m/yyiwOJg1QR3NuCzXrPPWZCCrO6
	v5D48dPPCW2ws9LsxxMqhP9cUU3VzRWDC/EScjU8fXQci4G17R9DD/Fh3ukct5ahYcnUQY2ak76
	TdGxDY4wKoVs9ERBMfW1OSU/t2TRBUoY05leSDdHaOgxUPjmRugafdlc/FIBNxVBwt3bWsO00tm
	t2OjflNN+cisU11WPgypSbh//i5NWxEKmrXvIea2kb3TjUj5FnDMhaIdeMKcdWX9keQvMMKSG5E
	j0sGoSq2FCJhARomgNSjTfNvQ3YqargfMJEnibpZ4db6qzaX3tPEO9Sa9CzIr3SiU0TQUGAWlE2
	Rsc17cTKxH4Cc6PUtx5vJu8XvMnntV1COV279aXw==
X-Received: by 2002:a17:907:72d2:b0:c25:5d2:acf0 with SMTP id
 a640c23a62f3a-c2e6edd8780mr930969566b.8.1791275812937; Tue, 06 Oct 2026
 01:36:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-gpio-mxc-cleanup-v2-0-bdc3afbb35e2@nxp.com> <20261005-gpio-mxc-cleanup-v2-2-bdc3afbb35e2@nxp.com>
In-Reply-To: <20261005-gpio-mxc-cleanup-v2-2-bdc3afbb35e2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 6 Oct 2026 11:36:15 +0300
X-Gm-Features: AclHuK8Hq92bjRrFR2TwWslr-iyvEz8Se8OVWpb4AqiThf6eR9JzszKQNdfvLEQ
Message-ID: <CAHp75Ve+p6TMr7MwQw0orGdjxLgNBN8gfTw2SY+EKBBgCyYXgA@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] gpio: mxc: fix wakeup_pads bit operations
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 5:24=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> gpio_set_wake_irq() can be called concurrently for different pins on
> the same port, so need to use atomic bitops when modifying wakeup_pads.

so we need

> Since wakeup_pads is u32 but assign_bit() operate on unsigned long

operates

> pointers.

This sentence doesn't sound like it's finished.

> On 64-bit platforms this causes an 8-byte read-modify-write
> on a 4-byte field, corrupting the adjacent is_pad_wakeup member.
> Change wakeup_pads to unsigned long and reorder to avoid the overlap.
>
> And the enable/disable path unconditionally sets/clears the wakeup_pads
> bit even when enable_irq_wake()/disable_irq_wake() fails. Only update
> the bit on success.
>
> While at here, simplify the logic by consolidating into a single
> irq_set_irq_wake() call based on the enable parameter.

...

> +       if (port->irq_high && (gpio_idx >=3D 16))
> +               ret =3D irq_set_irq_wake(port->irq_high, enable);
> +       else
> +               ret =3D irq_set_irq_wake(port->irq, enable);
>

This blank line may be removed.

> -       return ret;
> +       if (ret)
> +               return ret;

...

> -       for (i =3D 0; i < 32; i++) {
> -               if ((port->wakeup_pads & (1 << i))) {
> -                       type =3D port->pad_type[i];
> -                       if (enable)
> -                               config =3D pad_type_map[type];
> -                       else
> -                               config =3D IMX_SCU_WAKEUP_OFF;
> -
> -                       if (is_imx8qm && config =3D=3D IMX_SCU_WAKEUP_FAL=
L_EDGE) {
> -                               dev_warn_once(port->dev,
> -                                             "No falling-edge support fo=
r wakeup on i.MX8QM\n");
> -                               config =3D IMX_SCU_WAKEUP_OFF;
> -                       }
> +       for_each_set_bit(i, &port->wakeup_pads, 32) {

This change can be done later, can it?
(I mean in a separate patch)

> +               type =3D port->pad_type[i];
> +               if (enable)
> +                       config =3D pad_type_map[type];
> +               else
> +                       config =3D IMX_SCU_WAKEUP_OFF;
>
> -                       ret |=3D mxc_gpio_generic_config(port, i, config)=
;
> +               if (is_imx8qm && config =3D=3D IMX_SCU_WAKEUP_FALL_EDGE) =
{
> +                       dev_warn_once(port->dev,
> +                                     "No falling-edge support for wakeup=
 on i.MX8QM\n");
> +                       config =3D IMX_SCU_WAKEUP_OFF;
>                 }
> +
> +               ret |=3D mxc_gpio_generic_config(port, i, config);
>         }

--=20
With Best Regards,
Andy Shevchenko
