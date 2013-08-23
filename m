From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] gpio: pcf857x: Sort headers alphabetically
Date: Fri, 23 Aug 2013 19:49:23 +0200
Message-ID: <CACRpkdaXa5TGpLYdA_on9QV0igb7NvWc9G87XD30hEqqqMgTwA@mail.gmail.com>
References: <1376953494-9684-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
	<1376953494-9684-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:63975 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755706Ab3HWRtY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2013 13:49:24 -0400
Received: by mail-ob0-f180.google.com with SMTP id v19so987739obq.11
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2013 10:49:23 -0700 (PDT)
In-Reply-To: <1376953494-9684-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Tue, Aug 20, 2013 at 1:04 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:

> This makes checking for duplicates when adding a new #include easier.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

And I'm dreaming of patching all the GPIO drivers to have
the header includes in inverted christmas tree order. ;-)

Okay, applied anyway.

Yours,
Linus Walleij
