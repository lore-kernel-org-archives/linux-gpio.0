From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/5] pinctrl: zte: fix leaked of_node references
Date: Tue, 23 Apr 2019 12:53:38 +0200
Message-ID: <CACRpkdZiaTq_uo7=qKkwXy+yuahJjUxs4wVP=UJwOGQ=jHPe=Q@mail.gmail.com>
References: <1555048943-39589-1-git-send-email-wen.yang99@zte.com.cn> <1555048943-39589-6-git-send-email-wen.yang99@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555048943-39589-6-git-send-email-wen.yang99@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: Wen Yang <wen.yang99@zte.com.cn>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, wang.yi59@zte.com.cn, Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Apr 12, 2019 at 8:01 AM Wen Yang <wen.yang99@zte.com.cn> wrote:

> The call to of_parse_phandle returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.
>
> Detected by coccinelle with the following warnings:
> ./drivers/pinctrl/zte/pinctrl-zx.c:415:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 407, but without a corresponding object release within this function.
> ./drivers/pinctrl/zte/pinctrl-zx.c:422:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 407, but without a corresponding object release within this function.
> ./drivers/pinctrl/zte/pinctrl-zx.c:436:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 407, but without a corresponding object release within this function.
> ./drivers/pinctrl/zte/pinctrl-zx.c:444:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 407, but without a corresponding object release within this function.
> ./drivers/pinctrl/zte/pinctrl-zx.c:448:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 407, but without a corresponding object release within this function.
>
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Jun Nie <jun.nie@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Patch applied with Shawn's ACK.

Yours,
Linus Walleij
