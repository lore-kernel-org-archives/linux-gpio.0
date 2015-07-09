From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 1/7] pinctrl: UniPhier: add UniPhier pinctrl core support
Date: Thu, 09 Jul 2015 10:32:46 +0200
Message-ID: <1436430766.20619.91.camel@tiscali.nl>
References: <1436185763-4308-1-git-send-email-yamada.masahiro@socionext.com>
	 <1436185763-4308-2-git-send-email-yamada.masahiro@socionext.com>
	 <1436260472.20057.121.camel@tiscali.nl>
	 <CAK7LNASnaN47cPHyyH-DTrF4pE4XqhgUdZLuOspuqHtKoDxmRQ@mail.gmail.com>
	 <1436387996.20619.54.camel@tiscali.nl>
	 <CAK7LNARqsxrFhSEOiZw7TYSyFR8vhaZYcK6KbuG84mP2eM5NJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lb3-smtp-cloud3.xs4all.net ([194.109.24.30]:49557 "EHLO
	lb3-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750936AbbGIIcv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2015 04:32:51 -0400
In-Reply-To: <CAK7LNARqsxrFhSEOiZw7TYSyFR8vhaZYcK6KbuG84mP2eM5NJw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi Masahiro,

On do, 2015-07-09 at 14:32 +0900, Masahiro Yamada wrote:
> After I read your references and thought a bit more,
> I am now considering to change the bool into tristate.
> 
> [...]
> 
> Is this OK with you?

Whether this should be bool or tristate is up to you and the maintainer
(Linus?). I just prefer if you'd be consistent with that choice (ie, you
should not use module specific code in a built-in only driver).

Thanks,


Paul Bolle
