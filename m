From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: baytrail: Fix mingled clock pins
Date: Thu, 23 Jun 2016 11:05:50 +0200
Message-ID: <CACRpkdaEiGJ4vqOhfbwk1Piqd9yzCQzJxX1jvvbAOg98BBLoLw@mail.gmail.com>
References: <1466594239-10988-1-git-send-email-cristina.ciocan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:33791 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751159AbcFWJFv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2016 05:05:51 -0400
Received: by mail-oi0-f46.google.com with SMTP id u201so60805923oie.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2016 02:05:51 -0700 (PDT)
In-Reply-To: <1466594239-10988-1-git-send-email-cristina.ciocan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Cristina Ciocan <cristina.ciocan@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Irina Tirdea <irina.tirdea@intel.com>

On Wed, Jun 22, 2016 at 1:17 PM, Cristina Ciocan
<cristina.ciocan@intel.com> wrote:

> Fix plt clock 3, 4 and 5 pins, which were not in the proper order.
>
> Signed-off-by: Cristina Ciocan <cristina.ciocan@intel.com>

Patch applied for fixes with Mika's ACK.

Yours,
Linus Walleij
