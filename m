Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEE7435531
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 07:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235913; cv=none; b=n11pgZvOAHfVRrJI7Jik0nT5ASeRGWzBKrNkR7tgcQDdCYFTGMXh6SvlEOZ9YqiLf9feekukvVtM4ehdt+Qjx7MZO68cupm+meAbXVNIPLKG/rWdEYZsJ7UoDzs0FrlVBKbNHHOMT7ZmeUZ9RNIBALuTMyZPZzLRtUroB2iT1Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235913; c=relaxed/simple;
	bh=7hDwtff/130wTbbY6s1UWja18C8B6EWVPFvoMP5VF1A=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VF6yeJ1NTdrAC4ijcW92bnWZFjjUJ8rCeQgQ7fJEixN5DJ/cdb+LN7vesRzzg5qXOTP5nWoYMaOmD8ZeLwFk/mF79LmiH6f5dbR+dPniQeY0nJw76sCOQpZZY7yHYg8QgEG1ziwGZEjB+/Xahlr5ATc+9CYKs+rl30cdqmHcxE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EkVemhqI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EkVemhqI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1669B1F00899
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 07:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790235912;
	bh=xe0moQMWZni9FPgpfk86tHqdgwrQV5zJ2qqOJuWxZE8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=EkVemhqIF+TZCxNtTssUPkqAtr8H/Hwudapg1/DSgII58my0238Fles8GtR3iLk1F
	 OqZwSfUVOXVKC2wRiZp0jBcyHHNhhXBLuYUdQ0ITSciEeH6iXiyYDfrXPXfYuJ9CdR
	 ftg1Pov7ix0DHD7xYckTiJNRE55NRADHUWsBCZgJ/F1Bjz+pgTJ8Ud+dyHSG9Vic+/
	 FoovX7ZR6udWSd4tePR4stQg3MrNM73uBXzDbPCKJ85mfFAyurtrIeBVemU/hvbNwA
	 0tyC/qXLrZo1Z9IobuAMMEGLog9PUBXeCDzbdACiGw3PLZ69SSZQamENC8UvuZKOfW
	 NQ2h24G8S+c2A==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16cd1so1647994e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 00:45:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx3akypKeO8dBoD8NVH/dpQy5Xx4JTQ8a8RYvOYUzgjm7gaRSGh9LCOgRmGNYapP9mq0qBLYPZWvXvk@vger.kernel.org
X-Gm-Message-State: AFuF++lVsJgn87+FqMemQMxOjejAmorAnAYe7t1M7zE+2brOrnw0daAs
	PGLywSkiiyFUr4FYUXfMzMRtZPt46O9pvLsh/Pp2HCBCDdgIiQEn+OmYX1tkZgYCCfOtq6gQV/A
	AXi/yRQRa278WVLCB9ktjqulp49Z/nOeKFn/25+EdlQ==
X-Received: by 2002:a05:6512:3a6:b0:5b8:c9d0:6e8a with SMTP id
 2adb3069b0e04-5b8df09b8a9mr357168e87.2.1790235910753; Thu, 24 Sep 2026
 00:45:10 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 00:45:07 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 00:45:07 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260924065514.3678640-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924065514.3678640-1-mehmet.fide@gmail.com>
Date: Thu, 24 Sep 2026 00:45:07 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc1r0sqKjHGV0xFjDfeXb2PVGw6kC9iKjTLhw0N-8c7LA@mail.gmail.com>
X-Gm-Features: AclHuK9hzbk-zBFMk-HJiBT5RtXJLqeCCqnaDBYDmg90YLR_-vN8G305IumFrdE
Message-ID: <CAMRc=Mc1r0sqKjHGV0xFjDfeXb2PVGw6kC9iKjTLhw0N-8c7LA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: include linux/errno.h in consumer.h for ENOTSUPP
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Haibo Chen <haibo.chen@nxp.com>, 
	kernel test robot <lkp@intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Sep 2026 08:55:14 +0200, Mehmet Fide <mehmet.fide@gmail.com> said:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
> The CONFIG_PINCTRL=n stubs of pinctrl_gpio_get_config() and
> pinctrl_gpio_set_config() return -ENOTSUPP, but the header only pulls in
> linux/err.h, which provides asm/errno.h and not the kernel-internal
> ENOTSUPP from linux/errno.h. A translation unit that includes
> pinctrl/consumer.h before anything else fails to build:
>
>   include/linux/pinctrl/consumer.h:110:10: error: use of undeclared identifier 'ENOTSUPP'
>
> Include linux/errno.h explicitly.
>
> Fixes: b44aec87658e ("pinctrl: make the CONFIG_PINCTRL=n gpio config stubs return -ENOTSUPP")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609240855.U59akHDO-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202609241240.61Hz5rix-lkp@intel.com/
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---
>  include/linux/pinctrl/consumer.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
> index 7be49d447426..81e7866bd2e3 100644
> --- a/include/linux/pinctrl/consumer.h
> +++ b/include/linux/pinctrl/consumer.h
> @@ -12,6 +12,7 @@
>  #define __LINUX_PINCTRL_CONSUMER_H
>
>  #include <linux/err.h>
> +#include <linux/errno.h>
>  #include <linux/types.h>
>
>  #include <linux/pinctrl/pinctrl-state.h>
> --
> 2.55.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
