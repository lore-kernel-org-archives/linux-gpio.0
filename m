From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/7] dt-binding: Add ngpios property to GPIO controller node
Date: Mon, 30 Nov 2015 09:34:19 +0100
Message-ID: <CACRpkdYxaccZDPkmxXe2EwqoJ_U3DU6AzmsizECrd=5=1J5ipw@mail.gmail.com>
References: <1447905139-16002-1-git-send-email-pramodku@broadcom.com>
	<1447905139-16002-2-git-send-email-pramodku@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:36104 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753512AbbK3IeU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 03:34:20 -0500
Received: by obdgf3 with SMTP id gf3so122557495obd.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2015 00:34:19 -0800 (PST)
In-Reply-To: <1447905139-16002-2-git-send-email-pramodku@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Pramod Kumar <pramodku@broadcom.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Jason Uy <jasonuy@broadcom.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Gorski <jogo@openwrt.org>

On Thu, Nov 19, 2015 at 4:52 AM, Pramod Kumar <pramodku@broadcom.com> wrote:

> Add ngpios property to the gpio controller's DT node so that controller
> driver extracts total number of in-use gpio lines from DT and removes
> dependency on driver.
>
> Signed-off-by: Pramod Kumar <pramodku@broadcom.com>
> Reviewed-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>

Patch applied with Rob's ACK.

Yours,
Linus Walleij
