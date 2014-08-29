From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] RFT: gpio: adnp: switch to use irqchip helpers
Date: Fri, 29 Aug 2014 14:32:26 +0200
Message-ID: <CACRpkdbgCWv5xQXAB1H=5P45hVfZ8YVzj6yzEOYfFYkw-nFk8w@mail.gmail.com>
References: <1401715347-24996-1-git-send-email-linus.walleij@linaro.org>
	<20140604143825.GG28484@ulmo>
	<CACRpkdYamxVh5RhRk5dQxD2PSnjTWcdf4rvV50mmd844GeeN4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:61749 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752551AbaH2Mc1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Aug 2014 08:32:27 -0400
Received: by mail-oa0-f51.google.com with SMTP id n16so1717216oag.10
        for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2014 05:32:26 -0700 (PDT)
In-Reply-To: <CACRpkdYamxVh5RhRk5dQxD2PSnjTWcdf4rvV50mmd844GeeN4w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thierry Reding <thierry.reding@avionic-design.de>, Lars Poeschel <poeschel@lemonage.de>, Alexandre Courbot <acourbot@nvidia.com>, Roland Stigge <stigge@antcom.de>, Julian Scheel <julian.scheel@avionic-design.de>, Alban Bedel <alban.bedel@avionic-design.de>

On Thu, Jun 12, 2014 at 10:21 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Wed, Jun 4, 2014 at 4:38 PM, Thierry Reding <thierry.reding@gmail.com> wrote:
>
>> Adding a few more people from Avionic Design who might be able to test
>> this. I no longer have access to hardware with this controller.
>
> Always keep a copy of everything you ever work on ;-)
>
> If nothing happens I'll just apply the patch and see if that merits
> a reaction.

OK applied this now.

Yours,
Linus Walleij
