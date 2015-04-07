From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: at91: convert __raw to endian agnostic IO
Date: Tue, 7 Apr 2015 11:06:50 +0200
Message-ID: <CACRpkdY26txvV92SePv02EdX6TOcTBn9uWPX08gC2oAi7XGs0A@mail.gmail.com>
References: <1427372329-26005-1-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f180.google.com ([209.85.213.180]:34257 "EHLO
	mail-ig0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752916AbbDGJGu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2015 05:06:50 -0400
Received: by iget9 with SMTP id t9so5380940ige.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2015 02:06:50 -0700 (PDT)
In-Reply-To: <1427372329-26005-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, "moderated list:PIN CONTROLLER -..." <linux-arm-kernel@lists.infradead.org>, "open list:PIN CONTROL SUBSY..." <linux-gpio@vger.kernel.org>, Andrew Victor <linux@maxim.org.za>, Nicolas Ferre <nicolas.ferre@atmel.com>

On Thu, Mar 26, 2015 at 1:18 PM, Ben Dooks <ben.dooks@codethink.co.uk> wrote:

> Use endian agnostic _relaxed IO accessors instead of the __raw ones.
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Uncontroversial. Applied with Nicolas' ACK.

Yours,
Linus Walleij
