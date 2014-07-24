From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 2/3] gpio: zynq: Clear pending interrupt when enabling a IRQ
Date: Thu, 24 Jul 2014 09:08:12 +0900
Message-ID: <CAAVeFuL44c6MEg4pgEF5s=wPf597znujXmHf6EJbS1QR9bqfcg@mail.gmail.com>
References: <1405677133-8706-1-git-send-email-lars@metafoo.de>
 <1405677133-8706-2-git-send-email-lars@metafoo.de> <CACRpkda3p3v7o2itkTPRPr6KFhrUO3M8fvn_2S8oYsd_2oaXaw@mail.gmail.com>
 <c1290e0f-b2db-48fb-bc32-aabe1e4ce9ff@BN1BFFO11FD023.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:62279 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756000AbaGXAId convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Jul 2014 20:08:33 -0400
Received: by mail-ie0-f171.google.com with SMTP id at1so1659793iec.16
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2014 17:08:33 -0700 (PDT)
In-Reply-To: <c1290e0f-b2db-48fb-bc32-aabe1e4ce9ff@BN1BFFO11FD023.protection.gbl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, Harini Katakam <harinik@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Jul 24, 2014 at 2:42 AM, S=C3=B6ren Brinkmann
<soren.brinkmann@xilinx.com> wrote:
> Since I'm not subscribed to linux-gpio, I don't have the proper patch=
es
> in my mailbox, is there a patchworks instance for linux-gpio? I could=
n't
> find any :(

Not yet, but it would be nice to have one. Does anyone knows the
procedure to add a project to http://patchwork.ozlabs.org/ ?
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
