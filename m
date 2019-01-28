From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: Re: [PATCH RESEND 1/4] Pinctrl: Ingenic: Fix bugs caused by
 differences between JZ4770 and JZ4780.
Date: Mon, 28 Jan 2019 22:42:49 +0800
Message-ID: <5C4F14E9.7030203@zoho.com>
References: <1548410393-6981-1-git-send-email-zhouyanjie@zoho.com>
 <1548410393-6981-2-git-send-email-zhouyanjie@zoho.com>
 <CACRpkdYe2NsBFC-KBQXhmsSJ-S7wN9cZZuEPKHSfQe4HZUXTPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYe2NsBFC-KBQXhmsSJ-S7wN9cZZuEPKHSfQe4HZUXTPg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mips@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Burton <paul.burton@mips.com>, Paul Cercueil <paul@crapouillou.net>, syq@debian.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 772753199@qq.com
List-Id: linux-gpio@vger.kernel.org

Thank you for your reply. I am working on v2, and I have removed the=20
fourth patch in v2,
so there will be no warnings at compile time. But this will cause some=20
warning messages
when checkpatch, I am confused whether I can ignore these warnings.

On 2019=E5=B9=B401=E6=9C=8828=E6=97=A5 21:59, Linus Walleij wrote:
> This series looks good to me, but it would be nice if you could
> fix the warning pointed out by Paul, and I would also
> like some ACK from Paul C on the patches so I know this is
> fine with him.
>
> Yours,
> Linus Walleij
