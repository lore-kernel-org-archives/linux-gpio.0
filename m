From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/2] ACPI / gpio: Add irq_type when a gpio is used as
 an interrupt
Date: Thu, 10 Dec 2015 18:00:05 +0100
Message-ID: <CACRpkdbKSj31Jn-BZYHY1OLt9-okV0AXpdJXJXy-DU6PR54GKQ@mail.gmail.com>
References: <1448923673-2582-1-git-send-email-christophe-h.ricard@st.com>
	<1448923673-2582-3-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:34301 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751688AbbLJRAG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 12:00:06 -0500
Received: by obciw8 with SMTP id iw8so63484561obc.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 09:00:06 -0800 (PST)
In-Reply-To: <1448923673-2582-3-git-send-email-christophe-h.ricard@st.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Christophe Ricard <christophe.ricard@gmail.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Christophe Ricard <christophe-h.ricard@st.com>

On Mon, Nov 30, 2015 at 11:47 PM, Christophe Ricard
<christophe.ricard@gmail.com> wrote:

> When a gpio is used as an interrupt, the irq_type was not available for
> device driver. It is not align with devicetree probing.
>
> Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Rafael you can merge this into the ACPI tree.

Yours,
Linus Walleij
