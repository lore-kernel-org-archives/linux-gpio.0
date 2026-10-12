Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B3946EF60
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 09:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797284; cv=pass; b=X4vwp6X17wgqUctttVveE6MfAEYzl4eQ8Ak10E5IBy1yilP8KVWNOEl1Cy7VDdrwKvu9yCAKTAac+2GmYjNgEWBJPavpLzyCRQiTVZ1kCr77lgKKckEp3XLLJMU0buyud5lcMbxYgU7Kj7exybC+ILM5Tx/71PxMp9nCMq8AwXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797284; c=relaxed/simple;
	bh=ZQmvARbCgXiJ/YFm0TMPhZiaIp+RRWfinoq77aEij7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G4OuA+ZI0XHtAip0rGwBOV4T7t7Smjxi2jNRrWpGzOzMI3cOk9TX67/q9ZCEV0OmsBjof2Dt3pmGj+MzzieCP3bIXw8pqXdt7w9saxNsosPsvHgILHN+S75poysbTYRnlHnlNS5+k6G3jfBx2jnV6tSCiMWcQm0mUG6x0sJ1skg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4YodQTI; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4YodQTI"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a1585728b5so16269991fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 02:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791797281; cv=none;
        d=google.com; s=arc-20260327;
        b=FtTfHI1NCLsE9YGF8p7+yhv2RvI9T+lbCSpEjZ0NxCytOQMVhF2DbniU8mwbOrSpEQ
         lVF2BNLn+4mgxFurDcxuYDnJT/O1fCZlhmW2x1jke4sWWRh1Uu1KSV+8dKOt7QMYOWiD
         OffLMqT0e3tXgUdOwoDSsajxoohhByMbN7HqbvpDhd9M0SUz7vcvIm9n1shuG8tXqlX1
         ZfFvh6VfOJQpSERc3xlWXP6fxuSk8HTTlhMgzgzSaXPg+knYwebPuBAFkdnlfu1XRPvz
         JPuSeCYOTvf2wrnbxfLmsmckwb0lFBOaEbDwClwHQJpS9/i62mMYY3kYOPXrHOtr+wgW
         vjAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DvmpQMhsElKYIhMGMYI2OVNGAllui7WBWbcRWxS8qE0=;
        fh=8YgG+2NBMhKK4DUWi3egyVhQiOPgqmFshzGHJOcTWs4=;
        b=fTZ8T+ZJzR4b09EVuNOiKSOeiwTFDe5aOf+3QX9X+PcPqVHSCwDskO1L/jgsWxDUUk
         8f5YaODnPeqAeeE+8GBmii40BFsMBs+RncFCWy9XKceQBWi+c/ggBxubfZPIrElKLqhX
         KuDSqx33euvZ8Knix2KBVNGkdoJDZb4omlWvj7HFanPAekCVHIkFs1HooaUg4xbyj1r/
         y1FRyQXx/zElT4ua8+2AGBV113Tf7Sfx/G5pcb4NWJSLQfMk7FIgxJSFaq4EW4Vy89Dc
         vH1QxtSRrWWgTNNTC9FUH/g6SNnQXkCYjn0OtzjH3BvOrAvuPjUmVJPIYo4ci8t/WO0M
         wtMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791797281; x=1792402081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DvmpQMhsElKYIhMGMYI2OVNGAllui7WBWbcRWxS8qE0=;
        b=B4YodQTILQ9zaXAyR16qT0/VXnzTFnxW+BQsml7Pn3+4umy5Lr2GzLElACjcGU154w
         PaJY8bd8Xtr8tEL5pw2TUOLvcIxEPCC06aW8yrpEzISSTfftlWeRDWXrmOGk5d1QgKN/
         mwKDw6CyOwl6jlc4SMb6O9u1660zfL72aqwVyS7LAupugIqW9A3mD7A/DBde/TXNm9fw
         s75CS2tfvscCVlDzUSgTvtu83FgKIqNqoTWPaZPuAtIyYpvfo+yCzdqjP9gSQJ62kPIz
         7r+GACd1frCvRFEFAZYCuyfV6hjl3Aw/hx4acYdzwLYHAJQMfpKcA+Sfxy96r9hLhgg2
         KgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797281; x=1792402081;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvmpQMhsElKYIhMGMYI2OVNGAllui7WBWbcRWxS8qE0=;
        b=XM436rl51NfuAhrWq1FXLE74KA7cSzwI92zQITkXd6Rm6MNOg0Po5a2cP2pCbxXAfv
         2oTMcuPDDMY4lDzY3kjK9P2xe2JjqpN1nQ4QQv9DKg17WL80L/E2vZ7xsePq4gNoLBJV
         djavUyQXLIRsbZ4zwXwua/iv9l+DZGIDHd31oXGt/XYRMPLpD+3tfhq0G1dRVf7DtXU/
         pTYGy6ulGEr8Xp/ki+YtsVP/DhSdACsXZnhRLJAltJXwSGS3GSipUBSH2GIDmBubGEy/
         eNh6FW/xDCCccpVUltoxEfKXCBqbV8wppQXmJbw20KTT9pEUi1Tf2YI86UDR5i8dEyNw
         HF4A==
X-Forwarded-Encrypted: i=1; AKwUvByCWJQF3Ar2ue5OEv5FgKJ4wKf2k19v46gBu1EUWb9XL5OKjbw5p6qje2Txb/y1u/9ycEY0t7OEpqFe@vger.kernel.org
X-Gm-Message-State: AFq9FYJVesmT1WKZTkjFWWsWWNnHpewI6iXZf6YL3XTtorDOldRJ6Die
	fQphhkeAkG+5DqmN92v26RboiB3NkRqRPh/yN+fV5JgTOOgvfab9Lyww33Zp5cA/fFVZquwBFiK
	LWmkt8UPy9y6pvp/rW01M0p8blx2r9Ss=
X-Gm-Gg: AYBFou2ficffr3DbFeUth5RvGq1V5+EokXVQcWlCzLjzdefE9UAeP+N/GWnUxFHhFJD
	mPDFqc/MJmskWx+uQURdik9Zr7m0C6ozKAn/hm/nFYqAEvajWp+zdNa+GWKsLb6twvyF3rn4sUw
	bSCi2bIdGbkUB5Qo6+ioE6OpBzj+m/4Op9ELeBgpT4YyKsgmP0g3fdEBtbU9iVe+vREQ8BrHnpA
	8be+M6lovFltuqCbhZnYLtDxKCR+/2yGX2v1AujT19iX+mg5Yy3o9L37MTTk4xT+WMh5a2IqUNi
	+bFczAazO4dRhDAGJTidNdz7JhEkM9oYsifNmv1jaerRfBLZPaq1C0WJ60rv7x1t4DACCrJtb9c
	eis2ieoHsOnDTRJLlL9RCsknACphKTfDa3cHANxA/GjstOVvdNBEaF4exkqUBUyIHhykR+VRUxX
	jsET/56t83hX1HKQCGdYcv9W6aILU0mMXZb7SyQji855etvbihGSQ=
X-Received: by 2002:a05:651c:2105:b0:3a9:7244:e861 with SMTP id
 38308e7fff4ca-3a9c512683bmr23826781fa.3.1791797280833; Mon, 12 Oct 2026
 02:28:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-7-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-7-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:27:24 +0300
X-Gm-Features: AclHuK_r2Y_fKFcYo0k3f82kRis_dPW1IUC88HSmLwzwEEkzairYJHYuqRzAsKY
Message-ID: <CAHp75Vdkh50W7j6oh9mg=DqyNu0ZZYX-aA0goqW+Knf0MmJ1ag@mail.gmail.com>
Subject: Re: [PATCH v6 07/13] gpio: mxc: convert pad wakeup compatible checks
 to hwdata flags
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> mxc_gpio_generic_config() and mxc_gpio_set_pad_wakeup() call
> of_device_is_compatible() on every invocation to determine pad wakeup
> capability and i.MX8QM-specific behavior.  These properties are
> invariant for the lifetime of the device.
>
> Extend the hwdata flags scheme introduced in the previous commit with
> MXC_GPIO_HAS_PAD_WAKEUP and MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN, adding
> dedicated hwdata instances for imx8qm and imx8qxp (also used by imx8dxl).
> This replaces the repeated device tree string comparisons in the
> suspend/resume path with simple flag tests on static per-compatible
> data.
>
> While at it, clean up mxc_gpio_generic_config() to use a local ret
> variable for clarity instead of the =3D=3D 0 comparison.

...

> +static struct mxc_gpio_hwdata imx8qm_gpio_hwdata =3D {
> +       MXC_GPIO_HW_DATA_COMMON,
> +       .flags =3D MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN | MXC_GPIO_HAS_PAD_WA=
KEUP,
> +};
> +
> +static struct mxc_gpio_hwdata imx8qxp_gpio_hwdata =3D {
> +       MXC_GPIO_HW_DATA_COMMON,
> +       .flags =3D MXC_GPIO_HAS_PAD_WAKEUP,
> +};

Okay, if you want to deduplicate that, make another data structure
inside hwdata, or wrap hwdata with flags. But really, kill that
definition.

--
With Best Regards,
Andy Shevchenko
