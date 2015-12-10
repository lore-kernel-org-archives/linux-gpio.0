From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/3] gpio support for Broadcom NSP
Date: Thu, 10 Dec 2015 18:47:01 +0100
Message-ID: <CACRpkdbnj1NCtPkMsaCQPb5cKXqz7D3dqF7vNf08NoK1sY_B5Q@mail.gmail.com>
References: <1449248981-12102-1-git-send-email-yrdreddy@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:33209 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752152AbbLJRrB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 12:47:01 -0500
Received: by obbsd4 with SMTP id sd4so14714015obb.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 09:47:01 -0800 (PST)
In-Reply-To: <1449248981-12102-1-git-send-email-yrdreddy@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>

On Fri, Dec 4, 2015 at 6:09 PM, Yendapally Reddy Dhananjaya Reddy
<yrdreddy@broadcom.com> wrote:

> This is the second iteration in the series.
>
> Changes in v2:
> Addressed the review comments on device tree bindings and
> the device tree file.

I've merged this on a special branch so I can also pull it into the GPIO
tree for pending refactorings.

Yours,
Linus Walleij
