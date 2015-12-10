From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/3] gpio support for Broadcom NSP
Date: Thu, 10 Dec 2015 19:04:38 +0100
Message-ID: <CACRpkdYcYaG3J13gomnCtPzXcqE9SbTP_jWmyTE4Bgx4piELeg@mail.gmail.com>
References: <1449248981-12102-1-git-send-email-yrdreddy@broadcom.com>
	<CACRpkdbnj1NCtPkMsaCQPb5cKXqz7D3dqF7vNf08NoK1sY_B5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:33152 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755102AbbLJSEj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 13:04:39 -0500
Received: by oixx65 with SMTP id x65so50887880oix.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 10:04:38 -0800 (PST)
In-Reply-To: <CACRpkdbnj1NCtPkMsaCQPb5cKXqz7D3dqF7vNf08NoK1sY_B5Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>

On Thu, Dec 10, 2015 at 6:47 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Dec 4, 2015 at 6:09 PM, Yendapally Reddy Dhananjaya Reddy
> <yrdreddy@broadcom.com> wrote:
>
>> This is the second iteration in the series.
>>
>> Changes in v2:
>> Addressed the review comments on device tree bindings and
>> the device tree file.
>
> I've merged this on a special branch so I can also pull it into the GPIO
> tree for pending refactorings.

Now generated two patches on top of this: one to chane .dev to .parent
and one for dealing with gpiochip_get_data()/gpiochip_add_data() from
my recent refactoring patch set.

Yours,
Linus Walleij
