From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a7791: Remove non existing GPIO pins
Date: Fri, 6 Mar 2015 11:27:38 +0100
Message-ID: <CACRpkdYOoMC23294uzrNAzwT7uTYmu1hr+UKDdj375tqu59Mpg@mail.gmail.com>
References: <1424115661-21928-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
	<1424115661-21928-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:44502 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932661AbbCFK1j (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Mar 2015 05:27:39 -0500
Received: by oifu20 with SMTP id u20so16879340oif.11
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2015 02:27:38 -0800 (PST)
In-Reply-To: <1424115661-21928-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Feb 16, 2015 at 8:41 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:

> GPIO banks 1 and 7 are missing pins 26 to 31. Remove them.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Patch applied with Geert's ACK.

Yours,
Linus Walleij
