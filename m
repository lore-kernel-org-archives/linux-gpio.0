From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH linux-next] gpio: fix meaningless return expression
Date: Sun, 29 Jul 2018 23:35:43 +0200
Message-ID: <CACRpkda3NDLcmf=_6fp5fKwFQ2ybMODdkwtKs0t=FoRWRnoJUA@mail.gmail.com>
References: <1532433463-42508-1-git-send-email-zhongjiang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1532433463-42508-1-git-send-email-zhongjiang@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: zhongjiang@huawei.com
Cc: Alban Bedel <albeu@free.fr>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 24, 2018 at 2:09 PM zhong jiang <zhongjiang@huawei.com> wrote:

> Fix the following sparse error:
>
> drivers/gpio/gpio-ath79.c:54:16: error: return expression in void function
>
> Signed-off-by: zhong jiang <zhongjiang@huawei.com>

Patch applied with Alban's ACK.

Yours,
Linus Walleij
