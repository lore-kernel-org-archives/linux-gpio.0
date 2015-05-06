From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: zynq: configure SPI SSx pins separately
Date: Wed, 6 May 2015 15:27:41 +0200
Message-ID: <CACRpkdZg1+fzOxVV6_GQms1wJ5OsK_G+QoNTCpuNh7ZK6EqfYQ@mail.gmail.com>
References: <1430040767-26299-1-git-send-email-helmut.buchsbaum@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:36454 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752465AbbEFN1l convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 May 2015 09:27:41 -0400
Received: by obbkp3 with SMTP id kp3so6723886obb.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2015 06:27:41 -0700 (PDT)
In-Reply-To: <1430040767-26299-1-git-send-email-helmut.buchsbaum@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Helmut Buchsbaum <helmut.buchsbaum@gmail.com>
Cc: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Apr 26, 2015 at 11:32 AM, Helmut Buchsbaum
<helmut.buchsbaum@gmail.com> wrote:

> Since SCLK, MISO and MOSI are the only mandatory signals at Zynq's SP=
I
> interfaces, SS0, SS1 and SS2 have to be configured separately as they=
 may
> be used as simple GPIO lines.
>
> This, of course, has to be considered in the devicetree, so pin contr=
oller
> configuration for e.g. an SPI0 using SS0 and SS1 only might look like=
 the
> following snippet (derived from the example of chapter "17.5.3
> MIO/EMIO" Routing of Zynq-7000 TRM UG585). So MIO20 can now be used
> as GPIO instead of being occupied by SPI0 SS2 function. Note the sepa=
rate
> pinmux function for the slave select signals:

This v2 patch applied with S=C3=B6ren's ACK.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
