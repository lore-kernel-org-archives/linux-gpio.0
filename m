From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: intel: Make offset to interrupt status
 register configurable
Date: Tue, 31 Oct 2017 10:10:57 +0100
Message-ID: <CACRpkdanAyamae8kT5Tqp0Kjgo4OuG+jUHvPCEG=z5f=aYj-BA@mail.gmail.com>
References: <20171023124026.48996-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:54645 "EHLO
        mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750848AbdJaJK6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Oct 2017 05:10:58 -0400
Received: by mail-io0-f181.google.com with SMTP id e89so33406922ioi.11
        for <linux-gpio@vger.kernel.org>; Tue, 31 Oct 2017 02:10:58 -0700 (PDT)
In-Reply-To: <20171023124026.48996-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Oct 23, 2017 at 2:40 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> Some GPIO blocks have the interrupt status (GPI_IS) offset different
> than it normally is, so make it configurable. If no offset is specified
> we use the default.
>
> While there remove two unused constants from the core driver.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
