From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] gpio: Convert two Intel GPIO drivers to use irqchip helpers
Date: Mon, 28 Jul 2014 12:22:44 +0200
Message-ID: <CACRpkdakZcDMRPzgemu8r93EdaQU+rO1SovzBHNYAq_1=p5n4Q@mail.gmail.com>
References: <1406271288-15995-1-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:46003 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751102AbaG1KWo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Jul 2014 06:22:44 -0400
Received: by mail-oa0-f52.google.com with SMTP id o6so8470848oag.11
        for <linux-gpio@vger.kernel.org>; Mon, 28 Jul 2014 03:22:44 -0700 (PDT)
In-Reply-To: <1406271288-15995-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Zhu Lejun <lejun.zhu@linux.intel.com>, Yang Bin <bin.yang@intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jul 25, 2014 at 8:54 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> This series converts the Intel Lynxpoint and Baytrail GPIO drivers to use
> the new irqchip helper functions and then moves ACPI event registration to
> happen in the helpers as well.

Excellent patch set and irresistable to merge.

Applied patches 1 & 3 to the GPIO tree and patch 2 to the pinctrl tree.

Yours,
Linus Walleij
