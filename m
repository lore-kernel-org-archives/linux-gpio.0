From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] driver: base: pinctrl: return error from, pinctrl_bind_pins()
Date: Wed, 14 Sep 2016 14:39:57 +0200
Message-ID: <CACRpkdYea=YwY_m1zjYZDj8mp_PHP3+5LkDe+jBBq7r0=VWELA@mail.gmail.com>
References: <57D8EF6A.2050200@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57D8EF6A.2050200@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Deepak Das <deepak_das@mentor.com>
Cc: vzapolsk <Vladimir_Zapolskiy@mentor.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Sep 14, 2016 at 8:34 AM, Deepak Das <deepak_das@mentor.com> wrote:

> Changes from v1 to v2:
> * Modified the comment to indicate return error in case of
>   invalid pin requests

I already applied something similar, the semantics should be the
same. (Your patch, just edited around with it.)

Yours,
Linus Walleij
