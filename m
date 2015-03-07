From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] pinctrl: tegra: support nvidia,io-hv DT property
Date: Sat, 7 Mar 2015 21:10:31 +0100
Message-ID: <CACRpkdYtUZOjEZYdOJt2NjtDBuo=Brp0babpRZVYdhic+US0Pg@mail.gmail.com>
References: <1424811651-18660-1-git-send-email-swarren@wwwdotorg.org>
	<1424811651-18660-3-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:41279 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752446AbbCGUKb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Mar 2015 15:10:31 -0500
Received: by obcva8 with SMTP id va8so15665438obc.8
        for <linux-gpio@vger.kernel.org>; Sat, 07 Mar 2015 12:10:31 -0800 (PST)
In-Reply-To: <1424811651-18660-3-git-send-email-swarren@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>

On Tue, Feb 24, 2015 at 10:00 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:

> From: Stephen Warren <swarren@nvidia.com>
>
> Both nvidia,io-hv and nvidia,rcv-sel represent the fact that a particular
> pin's IO buffers are configured to accept "high voltage" input signals.
> The TRM for different chips names the register field rcv-sel on older
> SoCs and io_hv on newer SoCs. Add the new naming option into the pinctrl
> driver so that DT files can use naming consistent with the TRM.
>
> This new property name will be documented in the patch that adds support
> for the new SoC.
>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>

Patch applied.

Yours,
Linus Walleij
