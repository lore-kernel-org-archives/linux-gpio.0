Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DF04E01E7
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 14:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606414; cv=none; b=k4NsKzNvgvoBxCvQlYUI9tR8jTkdkVDKj/uRqH36EFwr7RzZ/EVXV7QYoWzyOuq5k8TZ1JN9NoZcEVsj5xqzjTwyJKFfVOx4UApaUh07OtoxWUz4WAp6Aq73uZCvkoWxK/EgvOYuXt3cvP5iW9+S3Sd9E2CI5ukFjCFSeg2oFHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606414; c=relaxed/simple;
	bh=ll5jxnO1LxSP6VOdbTEMyX5P1KDm9LihOkdaoeyDm7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lecFvRw+EziQdkx4QQ6f8ctiA6FsYxhKyKBc6eeddAEUJgrN10knu5AzkgpgHd6AEDpf5ZRBiEUG5mC+f0+LUA4tcBf6ChA59U4Z4BWJPLAumxq2Ai3aH9znBWT0vGFjJ0JPTzo4xyrXX7OTk8+rvDmRVQbZe/5LmzqhnlynstY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-81ad35a4608so92839a34.1
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 07:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606398; x=1791211198;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/3m9boaHoB6pESjCzvTfI8L4swM5eZahhrdnO03H/Os=;
        b=exJ1InHeSudVny75xqWHqvhNZA/QWllHsAwHyIw8KtXNL2hWByrI3zoZCV2ii2gc20
         a+jXXv6ZJXO6Ys1arH1HTeZHnir3ot2GAAVOR2cgMBOyLOZMDNh7ytYJfe7qZrshuxpK
         AMYGRt6u+Qi1j0gEIrE0iArmHmUL4T2e+z0BhejOiu0QqFqDQ0m8TvUHMNO7oPfnFZDq
         1idXV22IJFOs+mZFpsJmabgMbKsOur0OcGBTHlYSbaewyeswpeI3aeYmKwQsOe4zKbFz
         P/sFnA60BylefH2ZGy6ANXEUDrYwKrOOuHmU7y5j/qP0uT1aKgdEfoOM/5+utR8xEkSh
         ogcQ==
X-Forwarded-Encrypted: i=1; AKwUvByBWN0QNjOj7ibO3BibJ7GAV0HiZ3vR5JUBu4hMO77YnMQrp/yHErOzIZTQtQ9EwqrsyJG7AeA6xs+X@vger.kernel.org
X-Gm-Message-State: AFuF++lJpIfB4iep8WmDkERSK/ytb1vAtjwQiIz0oWSqGqZ/+2wTm70g
	VvbaTbblJ+Euth7JS1AlLFevlkET5/baOIuLdFEfbCRe+rr2WgErVcZwjW6ldUlm
X-Gm-Gg: AYBFou2n5zt12sdvo/SuPBdBGEoqxjhxnzz9oTZz0AiWoZ1C7I7aLd0NBFnw9aI1Z21
	PdYXRL0yVUVgCiLCnt4wSMyUpubnjbCwHrfvFhh7ta5je/tI4ouu0N5pJdLuODlaCgCrpZNlyrd
	QOKFymQCRgIQQrcHE8FHx2v1tRrUvEkdPkKlqdTk3MWHrIOU7kW+GXJkSNLOoll2RqrH9m1DcL4
	KxbiqtI9dsMGz1AbMHz74XsGUggFd6ZZUnw7bhteGY/D+CUIpg5y+XBOj9hAqETC4bsTPTzWxQY
	dRjtBy50lMs4ZZYMNR6GCu44QnlkjntUbKstQQ5K8y68qtrctiknzgktTe/wqPYRu7Mp6dYspkb
	w5sYd2q/zdjL9uK+1AqvuQePma2tfuB8P56xhI3u/8PWBLq1X8pCI35ZHuz0i4nJroCRx6dRLb6
	uL2p4d+d1AhiaL+is4Mkyh7by0Z0xx6VmSeGsWNHymuebvihgXgkbB+mPPXdoOa7NPiFcgq+YDb
	jgShEdqLVFwc0Qtkm7YvxbYpdSkny0/cJB3
X-Received: by 2002:a05:6102:818b:10b0:7ab:9152:1c6e with SMTP id ada2fe7eead31-7af1eae9c71mr3594026137.27.1790605905783;
        Mon, 28 Sep 2026 07:31:45 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-988b77590bbsm288162241.5.2026.09.28.07.31.43
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 07:31:43 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9809ce25a29so1955408241.1
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 07:31:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByEv1pkmV8PmpsPVa9R5ubEDq5JDO4kZm7dMlS98cvbnf997BvpSzR+yzkSKxpZU28bWRFSZszZaOng@vger.kernel.org
X-Received: by 2002:a05:6102:1a02:20b0:7af:efe6:2bbe with SMTP id
 ada2fe7eead31-7afefe63c7fmr2495728137.16.1790605902970; Mon, 28 Sep 2026
 07:31:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com>
 <20260904-rzg2-sr-boards-v8-4-94c4674927e8@solid-run.com> <CAMuHMdUGOLr6TQvfS9i2W1ihBWUUuTG0=TcfyZ-Seb02+XW_3w@mail.gmail.com>
 <133af08e-be3d-4eb5-aa64-63090aef6e97@solid-run.com>
In-Reply-To: <133af08e-be3d-4eb5-aa64-63090aef6e97@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 16:31:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW9NTOgPR_Xd+YVOZzd8V=uOnwjoJxRPL_-wy3i_n45mg@mail.gmail.com>
X-Gm-Features: AclHuK_hO01Uu8W5tQcoOhC1vcw0bnPcJI__NCNgulHZI0GJtePof15Jh2gc_yQ
Message-ID: <CAMuHMdW9NTOgPR_Xd+YVOZzd8V=uOnwjoJxRPL_-wy3i_n45mg@mail.gmail.com>
Subject: Re: [PATCH v8 04/11] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Mon, 28 Sept 2026 at 16:11, Josua Mayer <josua@solid-run.com> wrote:
> Am 23.09.26 um 16:37 schrieb Geert Uytterhoeven:
> > On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> >> Add support for the SolidRun RZ/G2L SoM [1] on HummingBoard IIoT [2].
> >>
> >> The SoM features:
> >> - 2x 1Gbps Ethernet with PHY
> >> - eMMC
> >> - 1/2GB DDR
> >> - WiFi + Bluetooth
> >> - SDHI Mux switching between eMMC and Carrier Board
> >>
> >> The HummingBoard IIoT features:
> >> - 3x USB-2.0 Type A connector
> >> - 2x 1Gbps RJ45 Ethernet
> >> - USB Type-C Console Port
> >> - microSD connector
> >> - RTC with backup battery
> >> - RGB Status LED
> >> - 1x M.2 B-Key connector with USB-2.0 + SIM card holder
> >> - 1x DSI Display Connector
> >> - GPIO header
> >> - 2x RS232/RS485 ports (configurable)
> >> - 2x CAN
> >>
> >> Descriptions for eMMC, microSD and RS485 are provided as overlays due to
> >> their dependency on configurable mux states.
> >>
> >> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> >> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
> >>
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> > Thanks for your patch!
> >
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi
> >> +       aliases {
> >> +               gpio1 = &tca6408_u48;
> >> +               gpio2 = &tca6408_u37;
> >> +               gpio3 = &tca6416_u20;
> >> +               gpio4 = &tca6416_u21;
> > The TCA64xx driver does not seem to support gpio aliases,
> I have confirmed this now. My expectation was that setting gpio aliases
> helps make /dev/gpiochip numbering predictable, however this does
> not currently work.
> > so please
> > drop these.
> Is this a good reason to drop the aliases, or better to define them
> regardless?

Yes please.  Aliases are meant to identify labeled (numbered) connectors
on a device, e.g. first serial port is serial0.
A GPIO expander usually doesn't have such a connector, and the various
GPIOs are typically routed to a variety of places.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
