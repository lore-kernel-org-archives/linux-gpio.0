From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH] Pinctrl: mvebu - Fix possible NULL derefrence.
Date: Mon, 30 Jan 2017 09:24:00 +0100
Message-ID: <20170130092400.589f6a93@free-electrons.com>
References: <CGME20170130045153epcas3p37f0c1815f13d6701dd4da3c50c54b35a@epcas3p3.samsung.com>
        <1485751903-29284-1-git-send-email-shailendra.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:42175 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751988AbdA3Ib4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 03:31:56 -0500
In-Reply-To: <1485751903-29284-1-git-send-email-shailendra.v@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shailendra Verma <shailendra.v@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Andreas Klinger <ak@it-klinger.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Jamie Lentin <jm@lentin.co.uk>, Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, p.shailesh@samsung.com, ashish.kalra@samsung.com, Shailendra Verma <shailendra.capricorn@gmail.com>

Hello,

On Mon, 30 Jan 2017 10:21:43 +0530, Shailendra Verma wrote:
> of_match_device could return NULL, and so can cause a NULL
> pointer dereference later.
> 
> Signed-off-by: Shailendra Verma <shailendra.v@samsung.com>

In practice, I don't see how of_match_device() can return NULL here.
Indeed, those drivers only support Device Tree based probing, so
of_match_device() will always return a non-NULL value.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
