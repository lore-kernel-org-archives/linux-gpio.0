From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFT][PATCH v2 3/3] gpio: mpc8xxx: Slightly update the code for
 better readability
Date: Wed, 9 Mar 2016 10:44:41 +0700
Message-ID: <CACRpkdbg3aoXFp=dbsf842zBVkUdEJFqD76+hopxwG5D1R8Avw@mail.gmail.com>
References: <1456125772.27297.0.camel@ingics.com>
	<1456125894.27297.2.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:35837 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750863AbcCIDom (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2016 22:44:42 -0500
Received: by mail-oi0-f44.google.com with SMTP id c203so26431518oia.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2016 19:44:41 -0800 (PST)
In-Reply-To: <1456125894.27297.2.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Liu Gang <Gang.Liu@nxp.com>, Alexandre Courbot <gnurou@gmail.com>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Alexander Stein <alexander.stein@systec-electronic.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Feb 22, 2016 at 2:24 PM, Axel Lin <axel.lin@ingics.com> wrote:

> Setting gc->direction_output to gc->direction_output looks strange.
> I think this change makes the intention more clear.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied.

Yours,
Linus Walleij
