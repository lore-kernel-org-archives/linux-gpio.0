Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D901F4499B3
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 10:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887069; cv=none; b=Z+32giluyexGxQ+cnIKZj+5FrIsJZ4c+Hhp23mdwhj1MhwLe5CZUApeIjeq9PR3oZHVH/ykF+qBkHykuWf9xPnEL0+YseWlcrqEdO0rXrsjytsuaVpANUs/6aAMQGBsxw/WyfR63sA68qbRQex5RdanbtqmXDwxlmXhkDBK02ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887069; c=relaxed/simple;
	bh=km1G/HHhK4mc4byWSgOHYVTFBTlTfLPGrUqU5+gvS1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tUpxm1oJ05eb2b60VmxsOj2+Wh4vR6XKenx3FpMKyZM8jQivRHwzfaJR4TPfsHsAW6++Zn4PDQTHGFdslxuPB2u8VrXt9qRZAVnmw/BRuXoXHRHASOKY9kdtYLG7rj4qHSzsGWqLIqXmgTzxRLB2irrlnC11aimR4lH93ZdLpo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-988d33f8fc1so1341025241.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 03:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887067; x=1792491867;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mGQ/GpRO6vnxq7fb84hh6aj2KXsZIXY1TgeovdND5Hc=;
        b=FuFnUoBY55U8STnCQFpP1EiYfPnifGtfq1VeLv4hTvzojVmuWxCJemqRMWl97srtCb
         qeKOh5/yrJUHWjyniQNA/x+VEqmi3CwAorlBbn+aHbzQzpGc5QYtPiss+Ya5aK4E3qMQ
         VgatIDna6p7wMn4lpGYTK9JMAp/oTfuTVgsyDaG5JMsJjhk5+jE6COO9DqAqcE4nGsj+
         9y20bkIvcUOl7v+urXpsOuSUAihbqynghuXNceI8AP8BIBc2TU2dkJn6PZDqiW1U8oGq
         GBIzY+dCbHbCKiXsStaFt5CIW5/JSZaLwQYUlAKFp0RJmTQc4PYSh6cweU0SInsWsNLg
         FSbQ==
X-Forwarded-Encrypted: i=1; AKwUvBytqAIjbCOe/AYHNH7dOwKrKnHUObFepvJJPPHbfSM8r2MF6ikoeWmU4vlD8z6E2HBptAQv9A91Pmwn@vger.kernel.org
X-Gm-Message-State: AFq9FYLIvWRVIpLa8BWI5VdgrCElhpdKnyedDd/FQfmwMZ4dMwzx+QjG
	WdWYvqNk8sm1gn9mWKWmYR8u9WWaNMXyuseCqyR8UEYGtYbYW4xXVtsS9h7BEAiZ
X-Gm-Gg: AYBFou1N/ydHooGVVhlFerk6PoSgoXss9vbBZjPiiLIZ7FJDUEjj2UryedAmlCJda4W
	b9CCTHTLrgnVKwxd+tS7/lXTn4XdyT64JqfFdI8x8AqDZDoHiXj0G9EYi/uctL8Q59YJVMPLVuh
	uN178PB3GSqxChBxthN0EPlAvhyboIMBwIUhcBnIlj3VqSHas9wUy5Tqx8gtwcYNN+V43ZHki8k
	BrSCEvdgXig3P/iepWIRU18aLGArpjija8+HHCP5xITaT/F+8JTsNtMSY6u8IZj26LsMmXLrpuZ
	5Iczfh4jTIK1cog6yqvfofebhYDg4rWTvuKZSkVxe60RJs3PTLVx6VXpt332Tzmll60gqmhZ691
	FfVIdMdhW8IQ3/ATGXFotuB1gQ9khqcdBgy1jnzil7o4ZN3KGAQBhNOABQWqIh+AlLVHk7L8gSX
	g4IpJtS31th3WQRIU50eK5sFSAgllM/0cRc3PQRqHP+HUsc0eqH0gfDxLIEPvPcV5EdHTa0rnAr
	YeLLXx7ip/3FZwFplRfJ/kAXO4SG2Nsq7HUVT1YbaqZchI=
X-Received: by 2002:a05:6102:418c:b0:7c8:3b8c:82b8 with SMTP id ada2fe7eead31-7cb3730ba80mr3521804137.17.1791887066690;
        Tue, 13 Oct 2026 03:24:26 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb35391722sm8302989137.4.2026.10.13.03.24.25
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:24:26 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7c3b75caad1so1703138137.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 03:24:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByeQEx64wQYwKve2lV2Z/pmS2yVnv7UhJxJI5YPVf8BPn9EQjezakYRj43QgU9pyTxQZ7z/atfMhmA6@vger.kernel.org
X-Received: by 2002:a05:6102:149d:b0:7a7:ad9f:53e2 with SMTP id
 ada2fe7eead31-7cb36987a53mr4125862137.1.1791887065725; Tue, 13 Oct 2026
 03:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250718152500.2656391-1-demonsingur@gmail.com> <20250718152500.2656391-22-demonsingur@gmail.com>
In-Reply-To: <20250718152500.2656391-22-demonsingur@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Oct 2026 12:24:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXA83Dm=Mf9MFdGNH+-J6dPrZJGS0R_6hPNgC0x1suBHw@mail.gmail.com>
X-Gm-Features: AclHuK9EzHrMNGZ9VqEt7mZlsF4wljWQ4a5mjitwSzx9DSYBvOK99D8Xhx8xmLo
Message-ID: <CAMuHMdXA83Dm=Mf9MFdGNH+-J6dPrZJGS0R_6hPNgC0x1suBHw@mail.gmail.com>
Subject: Re: [PATCH v7 21/24] arm64: defconfig: disable deprecated MAX96712 driver
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Fri, 18 Jul 2025 at 17:33, Cosmin Tanislav <demonsingur@gmail.com> wrote:
> The staging MAX96712 driver will be removed as its functionality has
> been moved to the MAX96724 driver which makes use of the Maxim
> GMSL2/3 deserializer framework.
>
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>

Thanks for your patch, which is now commit e8d5a57e6d0ce827 ("arm64:
defconfig: disable deprecated MAX96712 driver") in media/master.

> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1300,7 +1300,6 @@ CONFIG_GREYBUS=m
>  CONFIG_GREYBUS_BEAGLEPLAY=m
>  CONFIG_STAGING=y
>  CONFIG_STAGING_MEDIA=y
> -CONFIG_VIDEO_MAX96712=m

As Niklas has already pointed out in a reply to v5, you forgot to enable
the replacement CONFIG_VIDEO_MAX96724, thus breaking operation.

>  CONFIG_VIDEO_MESON_VDEC=m
>  CONFIG_SND_BCM2835=m
>  CONFIG_CHROME_PLATFORMS=y

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
