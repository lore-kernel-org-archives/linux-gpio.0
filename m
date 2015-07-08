From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 1/7] pinctrl: UniPhier: add UniPhier pinctrl core support
Date: Wed, 08 Jul 2015 22:39:56 +0200
Message-ID: <1436387996.20619.54.camel@tiscali.nl>
References: <1436185763-4308-1-git-send-email-yamada.masahiro@socionext.com>
	 <1436185763-4308-2-git-send-email-yamada.masahiro@socionext.com>
	 <1436260472.20057.121.camel@tiscali.nl>
	 <CAK7LNASnaN47cPHyyH-DTrF4pE4XqhgUdZLuOspuqHtKoDxmRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNASnaN47cPHyyH-DTrF4pE4XqhgUdZLuOspuqHtKoDxmRQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

Hi Masahiro,

On wo, 2015-07-08 at 14:01 +0900, Masahiro Yamada wrote:
> Actually, most of pinctrl drivers are boolean, but most of them
> conventionally have MODULE_AUTHOR, THIS_MODULE, etc.
> 
> I do not think it looks so weird.  Thought?

It's a rather common pattern, but I think it's an anti-pattern
nevertheless. See the discussion that Shobhit Kumar, Paul Gortmaker, and
I had starting in https://lkml.org/lkml/2015/6/20/63 .

Please let me know if you're unconvinced by the arguments brought
forward by both Pauls in that discussion.

Thanks,


Paul Bolle
