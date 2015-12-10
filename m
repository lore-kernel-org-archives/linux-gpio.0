From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl:Convert the composition of devm_request_mem_region
 and devm_ioremap to a single call
Date: Thu, 10 Dec 2015 19:17:01 +0100
Message-ID: <CACRpkdZFw=tbRmh1_qUeRvVKokMqYd35FEO+NPbp+=gwSE6yDA@mail.gmail.com>
References: <1446191478-22714-1-git-send-email-sanjeev_sharma@mentor.com>
	<CACRpkdZFhseQDbXvJg1CP3+WRsw_dPivx0w8730-9FV3fwjUGQ@mail.gmail.com>
	<20151203214415.GC23396@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151203214415.GC23396@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Sanjeev Sharma <sanjeev_sharma@mentor.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Dec 3, 2015 at 10:44 PM, Tony Lindgren <tony@atomide.com> wrote:
> * Linus Walleij <linus.walleij@linaro.org> [151030 12:54]:
>> Please run posts like this by the maintainers. Tony Lindgren is one
>> user, Haojian is another.
>
> I think we need to add ourselves to MAINTAINERS for this driver,
> otherwise we'll keep on missing emails.

Good idea! Patches accepted.

> This won't work, we're using the physical address from pcs->res in the
> code at least in pcs_add_pin.

Dropping this patch for now.

Yours,
Linus Walleij
