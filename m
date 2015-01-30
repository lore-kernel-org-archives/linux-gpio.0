From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: qcom: enable generic pinconf
Date: Fri, 30 Jan 2015 14:39:01 +0100
Message-ID: <CACRpkdYqGBigqfuYgBQTji2-tJR7avtgMxLQZAmMzP8zkp-0EA@mail.gmail.com>
References: <1422613644-13060-1-git-send-email-svarbanov@mm-sol.com>
	<1422613644-13060-3-git-send-email-svarbanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:45014 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752866AbbA3NjC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jan 2015 08:39:02 -0500
Received: by mail-ie0-f171.google.com with SMTP id tr6so3388982ieb.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2015 05:39:01 -0800 (PST)
In-Reply-To: <1422613644-13060-3-git-send-email-svarbanov@mm-sol.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Stephen Boyd <sboyd@codeaurora.org>

On Fri, Jan 30, 2015 at 11:27 AM, Stanimir Varbanov
<svarbanov@mm-sol.com> wrote:

> This makes the pinctrl driver to use the generic pinconf
> interface. Mainly it gives us a way to use debugfs to dump
> group configurations.
>
> Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>

Nice! Looking for Bj=C3=B6rn's review though.

> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -197,7 +197,6 @@ static int msm_config_reg(struct msm_pinctrl *pct=
rl,
>                 *mask =3D 1;
>                 break;
>         default:
> -               dev_err(pctrl->dev, "Invalid config param %04x\n", pa=
ram);
>                 return -ENOTSUPP;
>         }
>
> @@ -262,8 +261,6 @@ static int msm_config_group_get(struct pinctrl_de=
v *pctldev,
>                 arg =3D !!(val & BIT(g->in_bit));
>                 break;
>         default:
> -               dev_err(pctrl->dev, "Unsupported config parameter: %x=
\n",
> -                       param);
>                 return -EINVAL;

Please change this one to -ENOTSUPP as well in this patch.

Apart from that it looks good to me.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
