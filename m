From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND 0/6] Intel Atom C2000 series GPIO support
Date: Fri, 14 Feb 2014 14:27:34 +0000
Message-ID: <20140214142734.GE13293@lee--X1>
References: <1392386518-11025-1-git-send-email-vdonnefort@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:34077 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751199AbaBNO1k (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Feb 2014 09:27:40 -0500
Received: by mail-wg0-f45.google.com with SMTP id l18so434604wgh.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2014 06:27:39 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1392386518-11025-1-git-send-email-vdonnefort@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vincent Donnefort <vdonnefort@gmail.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, sameo@linux.intel.com, asierra@xes-inc.com

> This patch set is a resend which adds Lee Jones, MFD maintainer into =
the
> thread and Aaron Sierra lpc_ich author, forgotten during the first se=
nd.
>=20
> The purpose of this patch-set is to add support for GPIOs found on th=
e Intel
> Atom C2000 series (Avoton/Rangeley)
>=20
> Vincent Donnefort (6):
>   mfd: lpc_ich: Convert ICH GPIOs IDs to enum
>   mfd: lpc_ich: Add support for Intel Avoton GPIOs
>   gpio: ich: Add blink capability option
>   gpio: ich: Add support for multiple register addresses
>   gpio: ich: Add output levels cache support
>   gpio: ich: Add support for Intel Avoton
>=20
>  drivers/gpio/gpio-ich.c     | 96 +++++++++++++++++++++++++++++++++++=
+++-------
>  drivers/mfd/lpc_ich.c       |  1 +
>  include/linux/mfd/lpc_ich.h | 17 ++++----
>  3 files changed, 93 insertions(+), 21 deletions(-)

I'm fine with the MFD patches in this set.

Linus,
  Do you want me to create an immutable branch for you to pull from?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
