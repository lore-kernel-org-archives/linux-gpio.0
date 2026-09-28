Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335864BB80D
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 13:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601603; cv=none; b=umzAhpgw2yvMl1BcfJDIVYxVceUJ7ZwNGjf6u06GPdqnR2GvHKBdvmRoSnNaKdnkE23C+VETF3qRobFCBFCSHCL4oAzmjo1JIUP60g6oqjMYdvtm970lGutgHX3oGmaTMB9RPiWEulyIpH+jyWMHonMs4jOTM3lGMrW4vpvg428=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601603; c=relaxed/simple;
	bh=hjcSuw2cqnvjI5NI1/o5uMksKX3PcnQ52Y/4elq2HKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SOBkfyGouYwiuX64J/98dDc3X1X5ZR+4kjqobpld9jl02H3DB3Is5EHkT85L3+TUyW7T/wJlvqzJPyCu+rEDqJzc4cf8MtfYO9gWHRQnGHNRlWx5+oSceRJRVQDrOaPVuhWqncOwGXjAJNH5KBnsBAh3wI+HaJKCQg9o8z6jOHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9851d513a70so2343468241.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 06:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601601; x=1791206401;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+2hurtBCerXJa7Ue1vT5vjNfpc9Jv9KHDeVjKG0g9dQ=;
        b=gDDqDl+lZHccN9rQ+REThR23xaSu229i4WkzZHMxWiYeRqS/7uETIVAV0Y+5J7cgRr
         yNsqdpgErXM69IsP1oJSBgggKxywtIqO/2ENY2oMewgz36ghTE/slSkKzsZyYT2naMRj
         k3unN3g2wmLr9ecTTfmOZ07lpQPcNH+darFAi5wmDTmcs6RzsQEKmUyV2HA4TMSP4WHK
         DtWmx033KkUoKOeJJbo378b6twM3ry/Yw8LypA6XXjwapPTFHZwmqlbjGAMDIgSkp511
         AXo9U4qtbOeOXJNbf0DV6OPCDSx6NZSr9ta7lhPIOltsAGxaF1XAAxDGQ1bSz7rDakmM
         pZrg==
X-Forwarded-Encrypted: i=1; AKwUvBzXWX9ZGU5/3CcgusKzEbq9/7ylRPMbWH6ZUeCDwbNg2MFaLwabQx8HtXoOGB8By58mrfrB3GM4f6Kd@vger.kernel.org
X-Gm-Message-State: AFq9FYL0EEo4sfgnUDlU2eTt7ygPbn5gaeD5gENajF9XocBSi6hwVYHy
	4c0mtRcsPbBUeA6if3zDzlyGpCffQHMOiH27xqiukwpKy5q9OQcip8naS3zrTLbM
X-Gm-Gg: AYBFou3ZS6CqcnePvrRsBnpnPGb49MjOmZiIdJS8dcCLXI3Fk8/1jbXksoIf8/iYySm
	QD+FIf72vTVTYbp7weWsXxPYvXIY0TXwB7FLxkVHAuMFE/S7svOx4Kk2U5WlKQcID+MIO0OrhLH
	kI2zZSGGlR8jb77YY1zTaLtV0wl/uYSl5SWGEpxB5OdszktACc27sf96P22jDOUvtIv5DAo0k5h
	y7afC9fDJXfh8lF5lOZT/GxeyYZxi3vvFIszhFSnebRuli6hX6Ht319ITXwHDWM2e6GFtk3v25W
	l1HwkQvZaNXvAiVfUTx69IbJf+wU0QeJU+00/b8lVAlNzZi1I0WbK/72zokcxI3gvqQwm/kfjug
	j2W10Z1/GwETjUSsAvPcuEdVIGIQ75+ErXVDU5c8kYbni+f6muysVnPyeNF+lvMuP/MNrI0vFWE
	zJLYaFL8ZeicR0raWX7RQUFg54HSjFMrCxlrf4dFL/kvsKAwOtbnHafO23AMrGc97FTMYLynD1W
	imImoYAYDsluVzcQdaHKQMLwuE/syDYwlKIGg==
X-Received: by 2002:a05:6102:570d:b0:7a7:198b:674b with SMTP id ada2fe7eead31-7af1f0f34admr4859657137.32.1790601600765;
        Mon, 28 Sep 2026 06:20:00 -0700 (PDT)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com. [74.125.226.235])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39640471csm9522118137.0.2026.09.28.06.20.00
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:20:00 -0700 (PDT)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9851d513a70so2343449241.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 06:20:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxQ/Tx1q+2an3hqqG8XD5ZG41x5BKNGwTI5KXwTAUAbRpb9gXQl8BG4vvjvUHUDeBqQWa6KSErYo/UY@vger.kernel.org
X-Received: by 2002:a05:6102:32c3:b0:7b5:b51:63ae with SMTP id
 ada2fe7eead31-7b50b51701fmr1113412137.26.1790601600212; Mon, 28 Sep 2026
 06:20:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924111856.622898-1-yaojiale02@163.com> <20260924111856.622898-3-yaojiale02@163.com>
In-Reply-To: <20260924111856.622898-3-yaojiale02@163.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 15:19:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUaPuhy==YAKxUsBTCddCu9pEixPckkYYgoy=LXprnYog@mail.gmail.com>
X-Gm-Features: AclHuK8pd1CvWEg6B7NRMA57BAKjQ57ly0DPVmCMPxitEFLoUXEoVyNz-CP3Fng
Message-ID: <CAMuHMdUaPuhy==YAKxUsBTCddCu9pEixPckkYYgoy=LXprnYog@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: renesas: rzn1: free maps on DT map failure
To: Jiale Yao <yaojiale02@163.com>
Cc: Linus Walleij <linusw@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jiale,

On Thu, 24 Sept 2026 at 13:19, Jiale Yao <yaojiale02@163.com> wrote:
> rzn1_dt_node_to_map_one() appends mappings for each DT node.  If a
> node fails after map storage has been reserved, the top-level callback
> returns without releasing mappings built for the current and previous
> nodes.
>
> Free the accumulated map and clear the output parameters on every error
> path.
>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
> @@ -411,15 +411,21 @@ static int rzn1_dt_node_to_map(struct pinctrl_dev *pctldev,
>
>         ret = rzn1_dt_node_to_map_one(pctldev, np, map, num_maps);
>         if (ret < 0)
> -               return ret;
> +               goto err_free_map;
>
>         for_each_child_of_node_scoped(np, child) {
>                 ret = rzn1_dt_node_to_map_one(pctldev, child, map, num_maps);
>                 if (ret < 0)
> -                       return ret;
> +                       goto err_free_map;
>         }
>
>         return 0;
> +
> +err_free_map:
> +       pinctrl_utils_free_map(pctldev, *map, *num_maps);

Nice catch!

> +       *map = NULL;
> +       *num_maps = 0;

Is the resetting actually needed?
Only pinctrl-generic.c, pinctrl-sprd.c, and pinctrl-tegra-xusb.c seem
to do that.

> +       return ret;
>  }
>
>  static const struct pinctrl_ops rzn1_pctrl_ops = {

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
