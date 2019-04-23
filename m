From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/5] pinctrl: st: fix leaked of_node references
Date: Tue, 23 Apr 2019 11:02:03 +0200
Message-ID: <CACRpkdY1Mjg8aL0i5rgrUBpnbhc5sMSsumgogRmSMgSWDvEkoA@mail.gmail.com>
References: <1555048943-39589-1-git-send-email-wen.yang99@zte.com.cn> <1555048943-39589-4-git-send-email-wen.yang99@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555048943-39589-4-git-send-email-wen.yang99@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: Wen Yang <wen.yang99@zte.com.cn>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, wang.yi59@zte.com.cn, Patrice Chotard <patrice.chotard@st.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Apr 12, 2019 at 8:01 AM Wen Yang <wen.yang99@zte.com.cn> wrote:

> The call to of_get_child_by_name returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.
>
> Detected by coccinelle with the following warnings:
> ./drivers/pinctrl/pinctrl-st.c:1188:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 1175, but without a corresponding object release within this function.
> ./drivers/pinctrl/pinctrl-st.c:1188:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 1175, but without a corresponding object release within this function.
> ./drivers/pinctrl/pinctrl-st.c:1199:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 1175, but without a corresponding object release within this function.
> ./drivers/pinctrl/pinctrl-st.c:1199:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 1175, but without a corresponding object release within this function.
>
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org (open list)

Patch applied with Patrice's review tag.

Yours,
Linus Walleij
