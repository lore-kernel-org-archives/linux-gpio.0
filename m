From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: nomadik: fix possible object reference leak
Date: Wed, 20 Feb 2019 10:53:03 +0100
Message-ID: <CACRpkdbt6VSrzLNWEGSY2OnR8=DovhTVpsuUPGC17YtmWmVnyQ@mail.gmail.com>
References: <1550217696-3006-1-git-send-email-wdjjwb@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550217696-3006-1-git-send-email-wdjjwb@163.com>
Sender: linux-kernel-owner@vger.kernel.org
To: WangBo <wdjjwb@163.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, wang.bo116@zte.com.cn
List-Id: linux-gpio@vger.kernel.org

On Fri, Feb 15, 2019 at 9:01 AM WangBo <wdjjwb@163.com> wrote:

> The of_find_device_by_node takes a reference to the struct device
> when find the match device ,we should release it when fail.
>
> Signed-off-by: WangBo <wang.bo116@zte.com.cn>

Patch applied!

Yours,
Linus Walleij
