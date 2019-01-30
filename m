From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] Pinctrl: Ingenic: Add missing parts for JZ4770 and JZ4780.
Date: Wed, 30 Jan 2019 10:30:04 +0100
Message-ID: <CACRpkdZ08riGsySXzKsPgRxdTJL0UPLYSd95y54AP6KeUchR1A@mail.gmail.com>
References: <1548410393-6981-1-git-send-email-zhouyanjie@zoho.com>
 <1548688799-129840-1-git-send-email-zhouyanjie@zoho.com> <1548688799-129840-3-git-send-email-zhouyanjie@zoho.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548688799-129840-3-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhou Yanjie <zhouyanjie@zoho.com>
Cc: linux-mips@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Burton <paul.burton@mips.com>, Paul Cercueil <paul@crapouillou.net>, syq@debian.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 772753199@qq.com, Zhou Yanjie <zhouyanjie@cduestc.edu.cn>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 28, 2019 at 4:28 PM Zhou Yanjie <zhouyanjie@zoho.com> wrote:

> From: Zhou Yanjie <zhouyanjie@cduestc.edu.cn>
>
> Add mmc2 for JZ4770 and JZ4780:
> According to the datasheet, both JZ4770 and JZ4780 have mmc2. But this
> part of the original code is missing. It is worth noting that JZ4770's
> mmc2 supports 8bit mode while JZ4780's does not, so we added the
> corresponding code for both models.
>
> Add nemc-wait for JZ4770 and JZ4780:
> Both JZ4770 and JZ4780 have a nemc-wait pin. But this part of the
> original code is missing.
>
> Add mac for JZ4770:
> JZ4770 have a mac. But this part of the original code is missing.
>
> Signed-off-by: Zhou Yanjie <zhouyanjie@cduestc.edu.cn>

Patch applied with Paul's ACK!

Yours,
Linus Walleij
