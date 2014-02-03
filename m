From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4] ARM/serial: at91: switch atmel serial to use gpiolib
Date: Mon, 3 Feb 2014 09:34:31 +0100
Message-ID: <CACRpkdbHNo1bLxKaCCuOBiRq+JEpEPXdmQpr4BKAiORcb2snfw@mail.gmail.com>
References: <1383816355-2956-1-git-send-email-linus.walleij@linaro.org>
	<CACRpkdZNe0L+yZnqrY51Oeg+k5NHXebJAiqxi+p5Scy-BQ2+1w@mail.gmail.com>
	<52EBBB84.9050705@gmail.com>
	<20140131231618.GC11138@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:54406 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750716AbaBCIeb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Feb 2014 03:34:31 -0500
Received: by mail-ob0-f173.google.com with SMTP id vb8so7572228obc.18
        for <linux-gpio@vger.kernel.org>; Mon, 03 Feb 2014 00:34:31 -0800 (PST)
In-Reply-To: <20140131231618.GC11138@quad.lixom.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Richard Genoud <richard.genoud@gmail.com>, "arm@kernel.org" <arm@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Andrew Victor <linux@maxim.org.za>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Sat, Feb 1, 2014 at 12:16 AM, Olof Johansson <olof@lixom.net> wrote:
> On Fri, Jan 31, 2014 at 04:04:36PM +0100, Richard Genoud wrote:

>> I can't find this patch in linux-next, did I missed something ?
>
> Yeah, looks like we dropped the ball on it. We'll queue it up for 3.15 as soon
> as -rc1 is out.

OK it's out now ;-)

Yours,
Linus Walleij
