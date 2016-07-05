From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] gpio: be more careful when forcing IRQ line to input
Date: Tue, 5 Jul 2016 20:36:01 +0300
Message-ID: <d16661e9-3a6f-7118-c7d7-d6b501ce4120@cogentembedded.com>
References: <1467728126-26131-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1467728126-26131-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hello.

On 07/05/2016 05:15 PM, Linus Walleij wrote:

> We need to convince the IRQ line to become input unless there
> is a reason for. Also fixes up reference counting on the

    For what?

> errorpath.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Geert: does this solve the problem you saw in the RCAR
> in "gpio: convince line to become input in irq helper"?
[...]

MBR, Sergei
