From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl/amd: Use regular interrupt instead of chained
Date: Wed, 21 Jun 2017 18:37:09 +0200
Message-ID: <CACRpkdahw=4h9Dp4TMcfiquO0=BOZGCpNizdgyef2vC3wUmMTg@mail.gmail.com>
References: <alpine.DEB.2.20.1705232307330.2409@nanos> <CACRpkdbkEnLpZtLKz+x6FLQZTdsyxKsFexFa_UQwNxgZJGDExQ@mail.gmail.com>
 <20170620122802.vddn3grn3aesmfrs@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170620122802.vddn3grn3aesmfrs@pd.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Ken Xue <Ken.Xue@amd.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 20, 2017 at 2:28 PM, Borislav Petkov <bp@alien8.de> wrote:
> On Mon, May 29, 2017 at 01:55:57PM +0200, Linus Walleij wrote:
>> Patch applied for fixes.
>
> Btw, any chance you can add the CC:stable tag to it or would you prefer
> for me to backport it once it hits mainline?

This is sent to Torvalds, but you can simply suggest to Greg to pick
this for stable according to the process in:
Documentation/process/stable-kernel-rules.rst

Yours,
Linus Walleij
