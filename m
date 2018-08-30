From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] Preventive patch in the pin control subsystem to
 handle NULL check.
Date: Thu, 30 Aug 2018 11:03:23 +0200
Message-ID: <CACRpkdZm8ZOmn0j3ksaaCjKQt+pY032JzR==9V62Lo9+N9FWVA@mail.gmail.com>
References: <CGME20180827083916epcas1p43a3fc8570269411de215254ce0ae4b37@epcas1p4.samsung.com>
 <1535359139-6264-1-git-send-email-srikanth.h@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1535359139-6264-1-git-send-email-srikanth.h@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: srikanth.h@samsung.com
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Srikanth, thanks for your patch!

On Mon, Aug 27, 2018 at 10:39 AM Srikanth K H <srikanth.h@samsung.com> wrote:

 @@ -269,8 +269,9 @@ void pinconf_show_setting(struct seq_file *s,

>                 desc = pin_desc_get(setting->pctldev,
>                                     setting->data.configs.group_or_pin);
> -               seq_printf(s, "pin %s (%d)", desc->name,
> -                          setting->data.configs.group_or_pin);
> +               if (desc)
> +                       seq_printf(s, "pin %s (%d)", desc->name,
> +                                  setting->data.configs.group_or_pin);

Under what circumstances do you expect this to happen?
Did you provoke it with a real usecase during development?

We do not sprinkle NULL or error handling over code that
will not derail, and since this is in debugfs we are even more
lax.

If it annoys users (which would then be developers using
debugfs during development), then we need to look into it.

Yours,
Linus Walleij
