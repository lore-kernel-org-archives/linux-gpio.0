From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: ath79: Fix potential NULL dereference in ath79_gpio_probe()
Date: Tue, 27 Mar 2018 15:43:00 +0200
Message-ID: <CACRpkdaqeOccK_a0foGRwLbi_ATaRrD7eA=wGcV3QUZarRfGCw@mail.gmail.com>
References: <1521934848-5674-1-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521934848-5674-1-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Alban Bedel <albeu@free.fr>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Mar 25, 2018 at 12:40 AM, Alban Bedel <albeu@free.fr> wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> platform_get_resource() may return NULL, add proper
> check to avoid potential NULL dereferencing.
>
> This is detected by Coccinelle semantic patch.
>
> @@
> expression pdev, res, n, t, e, e1, e2;
> @@
>
> res = platform_get_resource(pdev, t, n);
> + if (!res)
> +   return -EINVAL;
> ... when != res == NULL
> e = devm_ioremap(e1, res->start, e2);
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> [albeu@free.fr: Fixed patch to apply on current tree]
> Signed-off-by: Alban Bedel <albeu@free.fr>

Patch applied.

Yours,
Linus Walleij
