From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RESEND 1/4] Pinctrl: Ingenic: Fix bugs caused by
 differences between JZ4770 and JZ4780.
Date: Mon, 28 Jan 2019 15:47:27 +0100
Message-ID: <CACRpkdbG5Abcp0wzgyVpr06n-f=Djs_zzRxwgMX1xCxwEnUSog@mail.gmail.com>
References: <1548410393-6981-1-git-send-email-zhouyanjie@zoho.com>
 <1548410393-6981-2-git-send-email-zhouyanjie@zoho.com> <CACRpkdYe2NsBFC-KBQXhmsSJ-S7wN9cZZuEPKHSfQe4HZUXTPg@mail.gmail.com>
 <5C4F14E9.7030203@zoho.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5C4F14E9.7030203@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhou Yanjie <zhouyanjie@zoho.com>
Cc: linux-mips@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Burton <paul.burton@mips.com>, Paul Cercueil <paul@crapouillou.net>, syq@debian.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 772753199@qq.com
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 28, 2019 at 3:43 PM Zhou Yanjie <zhouyanjie@zoho.com> wrote:

> Thank you for your reply. I am working on v2, and I have removed the
> fourth patch in v2,
> so there will be no warnings at compile time. But this will cause some
> warning messages
> when checkpatch, I am confused whether I can ignore these warnings.

I don't care super much about checkpatch warnings, compiler
warnings for const correctness is more important.

Yours,
Linus Walleij
