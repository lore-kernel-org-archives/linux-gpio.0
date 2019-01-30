From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] Pinctrl: Ingenic: Unify the function name prefix
 to "ingenic_gpio_".
Date: Wed, 30 Jan 2019 10:31:10 +0100
Message-ID: <CACRpkdYgj-Ng-b4PVWdZx3knR9ac6srp6uxeu72K=4KyMj2VGw@mail.gmail.com>
References: <1548410393-6981-1-git-send-email-zhouyanjie@zoho.com>
 <1548688799-129840-1-git-send-email-zhouyanjie@zoho.com> <1548688799-129840-4-git-send-email-zhouyanjie@zoho.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548688799-129840-4-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhou Yanjie <zhouyanjie@zoho.com>
Cc: linux-mips@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Burton <paul.burton@mips.com>, Paul Cercueil <paul@crapouillou.net>, syq@debian.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 772753199@qq.com, Zhou Yanjie <zhouyanjie@cduestc.edu.cn>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 28, 2019 at 4:29 PM Zhou Yanjie <zhouyanjie@zoho.com> wrote:

> From: Zhou Yanjie <zhouyanjie@cduestc.edu.cn>
>
> In the original code, some function names begin with "ingenic_gpio_",
> and some with "gpio_ingenic_". For the sake of uniform style,
> all of them are changed to the beginning of "ingenic_gpio_".
>
> Signed-off-by: Zhou Yanjie <zhouyanjie@cduestc.edu.cn>

Patch applied with Paul's ACK!

Yours,
Linus Walleij
