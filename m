From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: remove unneeded assignation
Date: Thu, 16 Jul 2015 15:51:00 +0200
Message-ID: <CACRpkdYbBYjp-=R985HpXCeV_a7vQQLV3h6j8ZXAazhibpjLtQ@mail.gmail.com>
References: <1436300535-1230-1-git-send-email-laurent.navet@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:34670 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752068AbbGPNvB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 09:51:01 -0400
Received: by obre1 with SMTP id e1so47192129obr.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 06:51:00 -0700 (PDT)
In-Reply-To: <1436300535-1230-1-git-send-email-laurent.navet@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Navet <laurent.navet@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jul 7, 2015 at 10:22 PM, Laurent Navet <laurent.navet@gmail.com> wrote:

> ret is assigned value from of_property_read_string_index but is
> overwritten before being used so remove it.
> Also fix coverity CID 1309759
>
> Signed-off-by: Laurent Navet <laurent.navet@gmail.com>

Patch applied with Alex' suggested Reported-by tag.

Yours,
Linus Walleij
