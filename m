From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: crystalcove: use handle_nested_irq
Date: Wed, 14 Jan 2015 14:09:21 +0100
Message-ID: <CACRpkdYc7qfY863zMq+M0LyXfWF5miG1hW1n6RUaU1SoB0iSWw@mail.gmail.com>
References: <54B32CDC.4050407@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f176.google.com ([209.85.213.176]:59109 "EHLO
	mail-ig0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751583AbbANNJW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jan 2015 08:09:22 -0500
Received: by mail-ig0-f176.google.com with SMTP id b16so6692099igk.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2015 05:09:21 -0800 (PST)
In-Reply-To: <54B32CDC.4050407@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Aaron Lu <aaron.lu@intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Zhu, Lejun" <lejun.zhu@linux.intel.com>

On Mon, Jan 12, 2015 at 3:09 AM, Aaron Lu <aaron.lu@intel.com> wrote:

> The CrystalCove GPIO chip has can_sleep set so its demultiplexed irqs
> will have IRQ_NESTED_THREAD flag set, thus we should use the nested
> version handle_nested_irq in CrystalCove's irq handler instead of
> handle_generic_irq, or the following warning will be hit and the
> functionality is lost:

Good catch. Patch applied for fixes.

Yours,
Linus Walleij
