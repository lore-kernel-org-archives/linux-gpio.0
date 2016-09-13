From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] driver: base: pinctrl: return error from pinctrl_bind_pins()
Date: Tue, 13 Sep 2016 13:59:51 +0200
Message-ID: <CACRpkdandEmr5PTfhUt39wMezMpbE9wEHDTR=jMidzUZY2Cn7A@mail.gmail.com>
References: <57D7A700.8080402@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57D7A700.8080402@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Deepak <deepak_das@mentor.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, vzapolsk <Vladimir_Zapolskiy@mentor.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 13, 2016 at 9:13 AM, Deepak <deepak_das@mentor.com> wrote:

> strict pin controller returns -EINVAL in case of pin request which
> is already claimed by somebody else.
> Following is the sequence of calling pin_request() from
> pinctrl_bind_pins():-
> pinctrl_bind_pins()->pinctrl_select_state()->pinmux_enable_setting()->
> pin_request()
>
> But pinctrl_bind_pins() only returns -EPROBE_DEFER which makes device
> driver probe successful even if the pin request is rejected by the pin
> controller subsystem.
>
> This commit modifies pinctrl_bind_pins() to return error if the pin is
> rejected by pin control subsystem.
>
> Signed-off-by: Deepak Das <deepak_das@mentor.com>

Aha

>      /* Only return deferrals */
> -    if (ret != -EPROBE_DEFER)
> +    if ((ret != -EPROBE_DEFER) && (ret != -EINVAL))
>          ret = 0;

I rewrote this when applying, like this:

-       /* Only return deferrals */
-       if (ret != -EPROBE_DEFER)
-               ret = 0;
+       /* Return deferrals */
+       if (ret == -EPROBE_DEFER)
+               return ret;
+       if (ret == -EINVAL) {
+               dev_err(dev, "could not initialize pin control state\n");
+               return ret;
+       }
+       /* We ignore errors like -ENOENT meaning no pinctrl state */

-       return ret;
+       return 0;

Can you confim that this works for you too?

Yours,
Linus Walleij
