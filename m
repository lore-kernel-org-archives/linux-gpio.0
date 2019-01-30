From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] Pinctrl: Ingenic: Fix bugs caused by differences
 between JZ4770 and JZ4780.
Date: Wed, 30 Jan 2019 10:28:38 +0100
Message-ID: <CACRpkdZHxB=iTZQvdjG7npLtEXz1x9iZfiPOpHMWXTJup3ubxg@mail.gmail.com>
References: <1548410393-6981-1-git-send-email-zhouyanjie@zoho.com>
 <1548688799-129840-1-git-send-email-zhouyanjie@zoho.com> <1548688799-129840-2-git-send-email-zhouyanjie@zoho.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548688799-129840-2-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhou Yanjie <zhouyanjie@zoho.com>
Cc: linux-mips@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Burton <paul.burton@mips.com>, Paul Cercueil <paul@crapouillou.net>, syq@debian.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 772753199@qq.com, Zhou Yanjie <zhouyanjie@cduestc.edu.cn>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 28, 2019 at 4:28 PM Zhou Yanjie <zhouyanjie@zoho.com> wrote:

> From: Zhou Yanjie <zhouyanjie@cduestc.edu.cn>
>
> Delete uart4 and i2c3/4 from JZ4770:
> According to the datasheet, only JZ4780 have uart4 and i2c3/4. So we
> remove it from the JZ4770 code and add a section corresponding the JZ4780.
>
> Fix bugs in i2c0/1:
> The pin number was wrong in the original code.
>
> Fix bugs in uart2:
> JZ4770 and JZ4780 have different uart2 pins. So the original section JZ4770
> has been modified and the corresponding section of JZ4780 has been added.
>
> Fix bugs in mmc0:
> JZ4770 and JZ4780 assigned different pins to mmc0's 4~7 data lines. So the
> original section JZ4770 has been modified and the corresponding section of
> JZ4780 has been added.
>
> Fix bugs in mmc1:
> JZ4770's mmc1 has 8bit mode, while JZ4780 doesn't. So the original
> section JZ4770 has been modified and the corresponding section of
> JZ4780 has been added.
>
> Fix bugs in nemc:
> JZ4770's nemc has 16bit mode, while JZ4780 doesn't. So the original section
> JZ4770 has been modified and the corresponding section of JZ4780 has been
> added. And add missing cs2~5 groups for JZ4770 and JZ4780.
>
> Fix bugs in cim:
> JZ4770's cim has 12bit mode, while JZ4780 doesn't. So the original
> section JZ4770 has been modified and the corresponding section of
> JZ4780 has been added.
>
> Fix bugs in lcd:
> Both JZ4770 and JZ4780 lcd should be 24bit instead of 32bit.
>
> Signed-off-by: Zhou Yanjie <zhouyanjie@cduestc.edu.cn>

Patch applied for v5.1 with Paul's review tag.

Yours,
Linus Walleij
