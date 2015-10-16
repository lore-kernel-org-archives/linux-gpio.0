From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: ssbi: fix compilation with DEBUG_FS=n
Date: Fri, 16 Oct 2015 22:36:52 +0200
Message-ID: <CACRpkdYonJtzEYhbTNB6npNfWV7oBM_72+F9tQbCysODPOWyrA@mail.gmail.com>
References: <1444577971-17705-1-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:35229 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751904AbbJPUgw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2015 16:36:52 -0400
Received: by oiev17 with SMTP id v17so23209346oie.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2015 13:36:52 -0700 (PDT)
In-Reply-To: <1444577971-17705-1-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, David Brown <davidb@codeaurora.org>

On Sun, Oct 11, 2015 at 5:39 PM, Jonas Gorski <jogo@openwrt.org> wrote:

> The DEBUG_FS=3Dn #defines for the dbg_show functions were missed when
> renaming the driver from msm_ to pm8xxx_, causing it to break the bui=
ld
> when DEBUG_FS isn't enabled:
>
>   CC [M]  drivers/pinctrl/qcom/pinctrl-ssbi-gpio.o
> drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:597:14: error: =E2=80=98pm8x=
xx_gpio_dbg_show=E2=80=99 undeclared here (not in a function)
>   .dbg_show =3D pm8xxx_gpio_dbg_show,
>
> Fix this by renaming them correctly.
>
> Fixes: b4c45fe974bc ("pinctrl: qcom: ssbi: Family A gpio & mpp driver=
s")
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>

Patch applied with Bj=C3=B6rn's ACK.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
